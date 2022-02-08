for exp in app-stats random-kill-app-instance stop-all-apps stop-apps unbind-apps
do
  cp -r kill-app-instance $exp
  find ./$exp -type f -exec sed -i "s#kill-app-instance#${exp}#g" {} \;
  mv ${exp}/kill-app-instance.chartserviceversion.yaml ${exp}/${exp}.chartserviceversion.yaml
done
