# Vulnerability Reporting and Security Policy

## Introduction

Reaper Technologies welcomes feedback from security researchers and the general public to help improve our security. If you believe you have discovered a vulnerability, privacy issue, exposed data, or other security issues in any of our assets, we want to hear from you. This policy outlines steps for reporting vulnerabilities to us, what we expect, what you can expect from us.

## Supported Releases

Reaper Technologies code is typically deployed in a SaaS manner, as such support is limited to the release currently in our production environments, for those deployments.

For code that access is provided by other means and is available for use as a dependency or similar, we follow the following support model.

We will normally use Semantic Versioning (https://semver.org/) for release labelling, as a result when considering support we support the current MAJOR.MINOR release irrespective of PATCH as first priority.

We support the current MAJOR.MINOR minus one MINOR release irrespective of PATCH. For example if a current release is 1.10.111 then we will support releases 1.9.100 and 1.9.90. However, we will not support 1.8.60 directly unless an issue affects the 1.9.100/1.9.90 and/or 1.10.111 releases.

## Systems, Services and Software in Scope

This policy applies to any digital assets owned, operated, or maintained by Reaper Technologies.

## Out of Scope

- Assets or other equipment not owned by parties participating in this policy.

Vulnerabilities discovered or suspected in out-of-scope systems should be reported to the appropriate vendor or applicable authority.

## Reporting a Vulnerability (Official Channels)

For vulnerability reporting and disclosure, we operate under Coordinated Vulnerability Disclosure (CVD) principles as detailed in:

- [ISO/IEC 29147:2018 on Vulnerability Disclosure](https://www.iso.org/standard/72311.html)
- [The CERT Guide to Coordinated Vulnerability Disclosure](https://resources.sei.cmu.edu/asset_files/SpecialReport/2017_003_001_503340.pdf)

Where possible vulnerabilities should be reported to secops@reapertech.com in the first instance for any Reaper Technologies product or service. As we are a small team, please allow 14 days for an initial response to a mail to the SecOps mail box. We will normally in the response outline our expected next steps and our assessment of any issue.

For publicly available code posted to GitHub, vulnerabilities should also be reported to the project issue tracker and be tagged as 'SECURITY' with a issue label as well as in the Issue title along side a mail to the SecOps mailbox. Likewise we will endeavour to provide an initial response within 14 days.

When reporting any issue please provide as much detail as possible in the report to enable us to identify an issue, replicate the issue and suggestions for ways to address any issue are welcomed.

For our open source releases if a report is provided with a PR for a fix, we will generally review and merge any fix and update the repository and any associated release as applicable.

Other channels may be made available on a individual service or product basis such as through a Bug Bounty Scheme, requirements for those will be published alongside the product or service.

## Our Commitments

When working with us, according to this policy, you can expect us to:

- Respond to your report promptly (please allow us 14 days), and work with you to understand and validate your report;
- Strive to keep you informed about the progress of a vulnerability as it is processed;
- Work to remediate discovered vulnerabilities in a timely manner, within our operational constraints; and
- Extend Safe Harbour for your vulnerability research that is related to this policy.

## Our Expectations

In participating in our vulnerability disclosure program in good faith, we ask that you:

- Play by the rules, including following this policy and any other relevant agreements. If there is any inconsistency between this policy and any other applicable terms, the terms of this policy will prevail;
- Report any vulnerability you’ve discovered promptly;
- Avoid violating the privacy of others, disrupting our systems, destroying data, and/or harming user experience;
- Use only the Official Channels to discuss vulnerability information with us;
- Provide us a reasonable amount of time (at least 120 days from the initial report) to resolve the issue before you disclose it publicly;
- Perform testing only on in-scope systems, and respect systems and activities which are out-of-scope;
- If a vulnerability provides unintended access to data: Limit the amount of data you access to the minimum required for effectively demonstrating a Proof of Concept; and cease testing and submit a report immediately if you encounter any user data during testing, such as Personally Identifiable Information (PII), Personal Healthcare Information (PHI), credit card data, or proprietary information;
- You should only interact with test accounts you own or with explicit permission from the account holder; and
- Do not engage in extortion.

## Safe Harbour

When conducting vulnerability research, according to this policy, we consider this research conducted under this policy to be:

- Authorized concerning any applicable anti-hacking laws, and we will not initiate or support legal action against you for accidental, good-faith violations of this policy;
- Authorized concerning any relevant anti-circumvention laws, and we will not bring a claim against you for circumvention of technology controls;
- Exempt from restrictions in our Terms of Service (TOS) and/or Acceptable Usage Policy (AUP) that would interfere with conducting security research, and we waive those restrictions on a limited basis; and
- Lawful, helpful to the overall security of the Internet, and conducted in good faith.

You are expected, as always, to comply with all applicable laws. If legal action is initiated by a third party against you and you have complied with this policy, we will take steps to make it known that your actions were conducted in compliance with this policy.

If at any time you have concerns or are uncertain whether your security research is consistent with this policy, please submit a report through one of our Official Channels before going any further.

> Note that the Safe Harbour applies only to legal claims under the control of the organization participating in this policy, and that the policy does not bind independent third parties.
