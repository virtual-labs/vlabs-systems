**Introduction:**
- Before deploying any lab, it is crucial to verify which phase the lab belongs to. The lab's phase is important for capturing accurate analytics and ensuring smooth deployment.

## Motivation
- Following the steps outlined in this document enables hosting engineers to validate the lab phase, ensuring that the proper phase-specific analytics are captured.

## Prerequisites
- Ensure that you have the following before proceeding:
  - A GitHub account with access to the [Virtual Labs GitHub Organisation](https://github.com/virtual-labs).
  - Access to [Virtual Labs GA4 Looker Studio](https://lookerstudio.google.com/) for viewing lab analytics.

## Target Audience
- This document is intended for Systems Engineers, DevOps Engineers, and other Virtual Labs team members responsible for deploying labs to AWS cloud infrastructure.

## Process Overview
- This process applies to all lab phases and ensures that labs are deployed into the correct phase, based on their current status.

## Steps for Lab Hosting:

1.  **Confirm the Phase while Creating the Experiment Repository:**
   - While creating the experiment repository for the lab, ensure that the correct phase is documented and confirmed with the developer. This ensures consistency throughout the lab's lifecycle.

2. **Verify the Lab Phase:**
   - Before deploying a lab, confirm which phase it belongs to and ensure it's being hosted in the same phase.
   
3. **Check the Hosting Request Issue:**
   - Review the hosting request issue in the engineer forum repository on GitHub. The phase of the lab should be indicated by the developer.
   
4. **For New Labs (First-Time Hosting):**
   - If it's a new lab being hosted for the first time, ensure that the approval email from IIT Delhi is attached to the GitHub issue.

5. **For Rehosting (UI or Other Updates):**
   - For rehosting an existing lab, verify its phase by checking the [2020-02-07-AWS-Hosted-Labs](https://docs.google.com/spreadsheets/d/1WXJA_1QkLg-5S0YYBRKyhEXwOgTSbKvm972Fy-thCUc/edit?usp=sharing) Google Sheet. Ensure the lab appears in the correct phase.

6. **Confirming Lab Phase in Google Analytics:**
   - If the lab is not listed in the 2020-02-07-AWS-Hosted-Labs google sheet, confirm the phase by checking its data in the [GA4 Looker Studio](https://lookerstudio.google.com/u/3/reporting/b40ac724-41f1-4b46-ba1b-c83f65284092/page/sh3VB).

7. **Clarify with the Developer:**
   - If the lab's phase differs from the expected one, confirm this with the lab's developer before deploying. Correct phase assignment is crucial for accurate phase-based analytics.



## Important Note
- Deploying a lab in the wrong phase will result in inaccurate analytics, which may affect data-driven decisions. Always ensure that the phase is correctly identified before deployment.
