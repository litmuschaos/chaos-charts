# SECURITY

## Reporting a Vulnerability

We are extremely grateful for security researchers and users that report vulnerabilities to the LitmusChaos Open Source Community. All reports are thoroughly investigated by a set of community members.

To report a vulnerability in this repository, either:

1. **Report it on GitHub directly.** Navigate to the *Security* tab on this repository, click *Advisories*, then *Report a vulnerability*.

2. **Send an email** to `litmuschaos@gmail.com` detailing the issue and steps to reproduce.

Please do not open a public issue for security problems.

The reporter(s) can expect a response within 24 hours acknowledging the issue was received. If a response is not received within 24 hours, please reach out to any committer directly to confirm receipt of the issue.

### When Should I Report a Vulnerability?

- You think you discovered a problem in a published chaos experiment definition — for example an experiment manifest requesting broader RBAC permissions than the experiment needs, or a ServiceAccount with more access than its blast radius requires.
- You found credentials, tokens, or other sensitive material committed to this repository.
- You found credentials, tokens, or other sensitive material committed to this repository.
- You are unsure how a vulnerability affects this project.
- You think you discovered a vulnerability in another project that this repository depends on. For projects with their own vulnerability reporting and disclosure process, please report it directly there.

### When Should I NOT Report a Vulnerability?

- You need help tuning LitmusChaos components for security — please discuss this in the various LitmusChaos community channels.
- You need help applying security-related updates.
- A chaos experiment caused the disruption it was designed to cause. Injecting failure is the intended behaviour of this project, not a vulnerability.
- An experiment manifest fails to apply or render. That is a regular bug — please open an issue.
- Your issue is not security-related.

## Review Process

Once a committer has confirmed the relevance of the report, a draft security advisory will be created on GitHub. The draft advisory will be used to discuss the issue with committers, the reporter(s), and LitmusChaos's security advisors. If the reporter(s) wishes to participate in this discussion, then provide the reporter GitHub username(s) to be invited to the discussion.

## Security Vulnerability Response

Each report is acknowledged and analyzed by the security contacts within 5 working days.

Any vulnerability information shared with the LitmusChaos security contacts stays within the LitmusChaos project and will not be disseminated to other projects unless it is necessary to get the issue fixed.

## Public Disclosure Timing

A public disclosure date is negotiated by the LitmusChaos Security Committee and the bug submitter. We prefer to fully disclose the bug as soon as possible once a user mitigation is available. It is reasonable to delay disclosure when the bug or the fix is not yet fully understood, the solution is not well-tested, or for vendor coordination. For a vulnerability with a straightforward mitigation, we expect report date to disclosure date to be on the order of 7 days. The LitmusChaos Security Committee holds the final say when setting a disclosure date.

## Security Contacts

Defined below are the security contacts for this repository. In case you identify any security issue, please reach out to all of the security contacts.

- @ksatchit (Karthik Satchitanand, karthik.s@harness.io)
- @rajdas98 (Raj Babu Das, raj.das@harness.io)

The full LitmusChaos security policy is maintained at [litmuschaos/litmus](https://github.com/litmuschaos/litmus/blob/master/SECURITY.md).
