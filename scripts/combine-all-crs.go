package main

import (
	"bytes"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"strings"

	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/runtime/serializer/yaml"
)

func main() {

	directories, err := GetAllSubDirectories("./charts")
	if err != nil {
		log.Fatalf("unable to get chart categories details, err: %v", err)
	}
	for _, directory := range directories {

		CRNames := []string{}

		// set path of combined CR file path
		filePath := directory + "/experiments.yaml"

		// initialize the empty file
		if err := InitializeFile(filePath); err != nil {
			log.Fatalf("unable to initialize %v file, err: %v", filePath, err)
		}

		// get the list of all sub-directories
		subDirectories, err := GetAllSubDirectories(directory)
		if err != nil {
			log.Fatalf("unable to get experiment details, err: %v", err)
		}

		for _, subdirectory := range subDirectories {
			isFileExist := IsFileExist(subdirectory + "/experiment.yaml")
			if isFileExist {

				CRName, err := GetCRName(subdirectory + "/experiment.yaml")
				if err != nil || CRName == "" {
					log.Fatalf("unable to extract the CR name, err: %v", err)
				}

				if !Contains(CRName, CRNames) {
					if err := CopyData(filePath, subdirectory+"/experiment.yaml"); err != nil {
						log.Fatalf("unable to copy data for %v experiment, err: %v", subdirectory, err)
					}
					CRNames = append(CRNames, CRName)
				}
			}
		}

		log.Printf("validating combined charts for: %v", directory)
		command := exec.Command("cat", directory+"/experiments.yaml")
		data, _ := ExecuteCommand(command)
		log.Printf("data: %v\n", data)

	}

}

// IsFileExist check for the existance of given file/path
func IsFileExist(path string) bool {
	_, err := os.Stat(path)

	if os.IsNotExist(err) {
		return false
	}
	return true
}

// CopyData copy the file data from source file to destination file
func CopyData(destination, source string) error {

	in, err := os.Open(source)
	if err != nil {
		return err
	}
	out, err := os.OpenFile(destination, os.O_APPEND|os.O_WRONLY, 0600)
	if err != nil {
		return err
	}

	io.Copy(out, in)
	out.WriteString("\n---\n")
	return nil
}

// GetAllSubDirectories return the list of all available sub-directories
func GetAllSubDirectories(parent string) ([]string, error) {
	command := exec.Command("find", parent, "-maxdepth", "1", "-mindepth", "1", "-type", "d")
	out, err := ExecuteCommand(command)
	if err != nil {
		return nil, err
	}
	directories := strings.Split(out, "\n")
	return directories, err
}

// ExecuteCommand execute the shell commands
func ExecuteCommand(command *exec.Cmd) (string, error) {
	var out, stderr bytes.Buffer
	command.Stdout = &out
	command.Stderr = &stderr
	if err := command.Run(); err != nil {
		log.Printf("Error String: %v", stderr.String())
		return "", fmt.Errorf("Unable to execute command, err: %v", stderr.String())
	}
	return strings.TrimSpace(out.String()), nil
}

// InitializeFile create an empty file and initialise it with concat string
func InitializeFile(filePath string) error {
	initializeFile, err := os.OpenFile(filePath, os.O_TRUNC, 0600)
	if err != nil {
		return err
	}
	initializeFile.WriteString("\n---\n")
	return nil
}

// GetCRName return the name of cr from the manifest
func GetCRName(from string) (string, error) {
	decUnstructured := yaml.NewDecodingSerializer(unstructured.UnstructuredJSONScheme)
	// Decode YAML manifest into unstructured.Unstructured
	child := &unstructured.Unstructured{}
	childData, err := ioutil.ReadFile(from)
	if err != nil {
		return "", err
	}

	_, _, err = decUnstructured.Decode(childData, nil, child)
	if err != nil {
		return "", err
	}

	return child.GetName(), nil
}

// Contains check for the existance of elemennt inside slice
func Contains(element string, slice []string) bool {

	for index := range slice {
		if slice[index] == element {
			return true
		}
	}
	return false
}
