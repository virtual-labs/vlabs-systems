# CI/CD Pipeline

## Introduction
- Virtual Lab uses CI\CD to deploy its experiments for testing on GitHub pages. [YAML](https://github.com/virtual-labs/ph3-exp-template/blob/main/.github/workflows/deployment-script.yml) file is used for deploying code to GitHub Pages using a CI/CD pipeline.

## Motivation
- Using the CI\CD pipeline to deploy experiments for testing on GitHub pages will help developers increase productivity and enhance confidence in releases.

## Prerequisites
- Before we start, you will need a GitHub account and access to [Virtual Labs](https://www.vlab.co.in/) Github [Organisation](https://github.com/virtual-labs) and knowledge on [GitHub CI/CD](https://resources.github.com/ci-cd/) pipeline.

## Target Audience 
- This document is intended for Systems Engineers, DevOps Engineers, and other team members at Virtual Labs responsible for creating and managing CI\CD Pipelines organization. Also, this document expects the intended audience to have basic knowledge of CI\CD Pipelines. 

## Source Repo
- Following is the location of the deployment script - [Link](https://github.com/virtual-labs/ph3-exp-template/blob/main/.github/workflows/deployment-script.yml). This script resides in [ph3-exp-template](https://github.com/virtual-labs/ph3-exp-template) repository. 
- If changes are made to the experiment template script, they will need to be updated in each experiment repository to reflect the changes. This ensures that all experiments are built and deployed consistently using the updated template and scripts. It is suggested to make changes only to [ph3-lab-mgmt](https://github.com/virtual-labs/ph3-lab-mgmt) script.

## Usage
- The CI/CD pipeline is used to build and deploy experiments from the `testing` branch to GitHub Pages, enabling developers to test their code changes before merging them into the main branch and deploying them to the production environment on AWS.

## Experiment Deployment Script Des(CI\CD)
- Following is the CI\CD code that is being used for deploying experiments, 

```
# This workflow is used to build the experiment and push it to github pages

name: Deploy Testing Branch
on:
  push:
# mentioning which branch should be used to build the experimnet
    branches: 
      - testing
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Setup node
      uses: actions/setup-node@v2
      with:
            node-version: '16'
            check-latest: true
    - run: |
        git clone --depth=1 https://github.com/virtual-labs/ph3-lab-mgmt
        cd ph3-lab-mgmt
        npm install
        npm run build-exp
        cd ../
        git config --local user.email "admin@vlabs.ac.in"
        git config --local user.name "vleadadmin"
        git checkout --orphan gh-pages
        git reset
        git add build/* -f
        git mv build/* ./ -f
        git commit -m "https://virtual-labs.github.io/${{ github.repository }} click on the link to test your code."
    - uses: ad-m/github-push-action@master
      with:
        github_token: ${{ secrets.ORG_OWNER_GITHUB_TOKEN }}
        force: true
        branch: gh-pages
 # Reference : https://github.com/marketplace/actions/github-push
```

## Experiment Deployment Script Explanation 
This workflow builds the experiment from the `testing` branch and deploys it to GitHub Pages.

```
# This workflow is used to build the experiment and push it to github pages
name: Deploy Testing Branch
```

The workflow is triggered whenever there is a push event on the `testing` branch:

```
on:
  push:
    branches: 
      - testing
```

The workflow consists of a single job called `build`. This job runs on the latest version of the Ubuntu operating system:

```
jobs:
  build:
    runs-on: ubuntu-latest
```

The `build` job contains several steps to set up the environment, build the experiment, and deploy it to GitHub Pages:

1. Check out the repository using the `actions/checkout@v2` action:

```
    steps:
    - uses: actions/checkout@v2
```

2. Set up the Node.js environment using the `actions/setup-node@v2` action. This step configures Node.js version 16 and checks for the latest version:

```
    - name: Setup node
      uses: actions/setup-node@v2
      with:
            node-version: '16'
            check-latest: true
```

3. Run a series of shell commands to build the experiment and prepare it for deployment:

   - Clone the `ph3-lab-mgmt` repository.
   - Change the working directory to `ph3-lab-mgmt`.
   - Install npm dependencies and run the build process for the experiment.
   - Set up Git user information for the commit.
   - Create a new orphan branch called `gh-pages`.
   - Reset the Git staging area.
   - Add the built experiment files to the staging area.
   - Move the files from the `build` directory to the root directory.
   - Commit the changes with a message containing a link to the deployed experiment.

```
    - run: |
        git clone --depth=1 https://github.com/virtual-labs/ph3-lab-mgmt
        cd ph3-lab-mgmt
        npm install
        npm run build-exp
        cd ../
        git config --local user.email "admin@vlabs.ac.in"
        git config --local user.name "vleadadmin"
        git checkout --orphan gh-pages
        git reset
        git add build/* -f
        git mv build/* ./ -f
        git commit -m "https://virtual-labs.github.io/${{ github.repository }} click on the link to test your code."
```

4. Use the `ad-m/github-push-action@master` action to push the `gh-pages` branch to the remote repository. This step uses the `ORG_OWNER_GITHUB_TOKEN` secret to authenticate the push:

```
    - uses: ad-m/github-push-action@master
      with:
        github_token: ${{ secrets.ORG_OWNER_GITHUB_TOKEN }}
        force: true
        branch: gh-pages
```

The workflow's reference link points to the GitHub Marketplace page for the `github-push-action`:

```
 # Reference : https://github.com/marketplace/actions/github-push
```

In summary, this YAML file describes a GitHub Actions workflow that builds an experiment from the `testing` branch and deploys it to GitHub Pages whenever there is a push event on the `testing` branch.

## Troubleshooting Experiment Deployment Script
- This section briefly discusses managing or troubleshooting GitHub Actions for deploying code to GitHub Pages.

#### 1) "MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 31 finish listeners added to [PassThrough]. Use emitter.setMaxListeners() to increase limit". How to troubleshoot this error?

- **Problem**:  
  During the lab deployment, several experiments failed to build. Out of 10 experiments, only 5 were successfully built, and the remaining experiments were skipped. This inconsistency in the deployment workflow needs to be addressed to ensure all experiments are processed correctly.

- **Error Description**:  
  Upon reviewing the GitHub Actions workflow logs, an error message appeared during the build process:  
  **"MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 31 finish listeners added to [PassThrough]. Use emitter.setMaxListeners() to increase limit."**  
  Although this warning did not completely halt the deployment, it caused the build process for certain experiments to stop while allowing the rest of the deployment to continue. This resulted in only a subset of the experiments being built.

- **Root Cause**:  
  The root cause of this issue stems from **invalid JSON files** within some of the experiments. If a particular experiment contains an invalid or malformed JSON file, the build process for that experiment is terminated, leading to the warning message. In this case, if the invalid file occurs in the 6th experiment, the first 5 experiments will build successfully, and the error will manifest when the system tries to process the faulty experiment.

- **Solution/Fix**:
  1. **Identify the problematic experiment**: Review the GitHub Actions workflow logs to find the point where the deployment stops building. The last successfully built experiment will help pinpoint where the error occurred.
  2. **Locate the invalid JSON file**: Navigate to the repository for the experiment immediately following the last successful build. Check the JSON files in that experiment, as they are likely the source of the issue.
  3. **Validate the JSON files**: Use a JSON validator, such as [JSONLint](https://jsonlint.com/), to identify and correct any syntax errors in the JSON files. This may include missing commas, incorrect brackets, or invalid data types.
  4. **Rebuild the lab**: After correcting the invalid JSON files, trigger the lab deployment again. Verify that all experiments, including those previously skipped, are built successfully.

- **Post-Fix Verification**:  
  After applying the fix, re-run the GitHub Actions workflow and ensure that all experiments, including the previously skipped ones, are built without any errors or warnings in the logs. Confirm that the `MaxListenersExceededWarning` no longer appears and that the full deployment process completes successfully


#### 2) "Warning: Could not find remote branch v1.0.0 to clone." "fatal: Remote branch v1.0.0 not found in upstream origin" How to troubleshoot this?

- **Problem**:  
  During the lab deployment, several experiments failed to build. Out of 10 experiments, only 5 were successfully built, and the remaining experiments were skipped. This issue needs to be fixed to ensure all experiments are properly processed.

- **Error Description**:  
  While checking the GitHub Actions workflow logs, the following error messages appeared:  
  **"warning: Could not find remote branch v1.0.0 to clone."**  
  **"fatal: Remote branch v1.0.0 not found in upstream origin."**  
  These warnings didn’t stop the entire deployment, but they caused some experiments to fail to build, resulting in only a few experiments being processed while the rest were skipped.

- **Root Cause**:  
  The main cause of this issue is **incorrect or missing tags** in the experiment repositories. Either the experiment was not tagged, or the tag in the `descriptor.json` file does not match the actual tag in the GitHub repository. Additionally, tags must follow a specific format:  
  - No uppercase letters.
  - Tags should follow the format `v1.0.0`, with a total length of 6 characters.

- **Solution/Fix**:
  1. **Verify tags**: Check that the tags in the `descriptor.json` file and the experiment’s GitHub repository are the same.
  2. **Correct the tags**: If the tags don’t match, contact the developer to correct and update the tags in the GitHub repository to match the format `v1.0.0`. Ensure that the tags contain no uppercase letters and adhere to the 6-character length.
  3. **Update the lab descriptor**: Once the correct tag is confirmed, update the `descriptor.json` file with the proper tag information.
  4. **Redeploy the lab**: After updating the tag, redeploy the lab to verify that all experiments now build successfully.

- **Post-Fix Verification**:  
  After applying the fix, re-run the deployment process in GitHub Actions and verify that all experiments are built without errors. Ensure that the warning and fatal error regarding missing branches no longer appear in the logs.

- **Lessons Learned**:  
  1. Ensure that tags are properly defined and formatted before deployment to prevent build failures.
  2. Consistently check and verify that `descriptor.json` files are up to date with the correct tag information from the repositories.
  3. Avoid using uppercase letters or incorrect tag formats to minimize deployment issues.


#### 3) "FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory" error when building a lab on AWS using npm labgen. How can I fix this?

- **Problem**:  
  While building a lab on AWS using `npm labgen`, the process fails with a fatal error related to memory allocation. The error message indicates that the JavaScript heap size is insufficient.

- **Error Description**:  
  The build process fails with the following error:  
  **"FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory."**  
  This error occurs when the default memory limit for Node.js is exceeded, especially when working with large projects.

- **Root Cause**:  
  Node.js has a default memory limit that can be too low for certain large projects. When the lab generation process requires more memory than the default allocation, the JavaScript engine runs out of heap space, causing the build to fail.
  
- **Solution/Fix**:  
  Increase the memory allocation for Node.js by setting the `NODE_OPTIONS` environment variable:
  
  1. Open the terminal.
  2. Enter the following command to increase the maximum old space size (memory) to 4 GB:
  
  ```
  export NODE_OPTIONS=--max_old_space_size=4096

- **Post-Fix Verification:**:
  After increasing the memory limit, rebuild the lab on AWS using npm labgen and verify that the build completes without any memory-related errors.


#### 4) Why is GitHub Pages site not loading or displaying properly?

- **Problem**:  
  GitHub Pages for an experiment repository are not working or the site is not accessible.

- **Error Description**:  
  The GitHub Pages site is not loading, which typically happens when GitHub Pages is not configured properly for the repository.

- **Root Cause**:  
  GitHub Pages may not be set up correctly for the repository, or there might be a misconfiguration that prevents the page from being published or accessed.

- **Steps to Fix**:  
  1. **Check if GitHub Pages is set up**:  
     Go to the experiment repository’s main page on GitHub.
  2. **Access repository settings**:  
     Click the "Settings" button located near the top-right corner of the page.
  3. **Scroll to GitHub Pages section**:  
     Scroll down the settings page to find the "Pages" section.
  4. **Verify publication**:  
     If GitHub Pages is set up correctly, you should see a message that says, _"Your site is published at [experiment site URL]._  
     This message confirms that the site is live and can be accessed via the provided URL.

- **Solution/Fix**:
  1. If GitHub Pages is not set up or the site is not live, configure the GitHub Pages settings:
     - Choose the correct source branch (gh-pages) for your Pages site.
     - Save the settings.
  2. Once the page is published, recheck the "GitHub Pages" section for the confirmation message and the live URL.

- **Post-Fix Verification**:  
  After configuring GitHub Pages, visit the published URL to confirm that the site is working as expected.


#### 5) Why does the build process exit with code 128?

- **Problem**:  
  The build process for the experiment exits unexpectedly with an error code 128.

- **Error Description**:  
  This error typically indicates that there are unexpected or extra files present in the repository that interfere with the build process.

- **Root Cause**:  
  The primary cause of this error is the presence of extra files outside the designated simulation folder of the experiment. Any files that are not part of the expected structure can lead to the build failing and returning an exit code of 128.

- **Solution/Fix**:  
  1. **Check for extra files**: Inspect the repository to identify any files that are not located in the designated simulation folder.
  2. **Move or remove extra files**: 
     - Move any extra files into the simulation folder if they are needed for the experiment.
     - If certain files are not necessary, remove them from the repository entirely.
  3. **Re-run the build process**: After ensuring that all files are correctly placed, attempt to build the experiment again.

- **Post-Fix Verification**:  
  Once the extra files are addressed, re-run the build process and verify that it completes successfully without exiting with code 128.

- **Lessons Learned**:  
  1. Do not add any other files in the repository.
  2. Maintain a clean repository by regularly checking for and organizing files to prevent build issues.
  3. Establish clear guidelines for file organization within the experiment to avoid similar errors in the future.
## 6) Why do I get a "404" error when trying to access a Virtual Labs experiment after pushing a code change?

- **Problem**:  
  After pushing a code change, attempting to access a Virtual Labs experiment results in a "404" error.

- **Error Description**:  
  A "404" error indicates that the requested resource could not be found. This typically occurs if the build process failed or if there are issues in the code that prevent the experiment from being served correctly.

- **Solution/Fix**:  
  There are a few possible solutions for this error:

  1. **Check the deploy branch**:
     - Go to the "Settings" section of the experiment repository.  
     - Scroll down to the "GitHub Pages" section.
     - Ensure that the deploy branch is set to **`gh-pages`**.  
     - If the deploy branch is incorrectly configured, update it to `gh-pages` and save the settings.

  2. **Check the `gh-pages` branch**:  
   - Go to the `gh-pages` branch of the repository.  
   - Check if it contains a directory with the experiment name.  
   - If the experiment folder exists in the `gh-pages` branch, this indicates the build has failed. You will need to verify the build status and troubleshoot further.

  3. **Verify the build status**:  
     Navigate to the latest commit in the GitHub repository and check if the build ran successfully. If the build failed, further investigation is required. If someone has renamed a file in the repository, the build will fail and show the following errors:
  
     ```
     ENOENT: no such file or directory, open '/home/runner/work/exp-kronig-penney-model-dei/exp-kronig-penney-model-dei/build/exp-kronig-penney-model-dei/simulation/index.html'
     ```
     - This error occurs because the build process is unable to find the file `index.html`. Ensure the file is correctly named as `index.html` to                resolve the issue.

  4. **Other possible error**
    ```
     LaTeX-incompatible input and strict mode is set to 'warn': Unrecognized Unicode character "�" (55349) [unknownSymbol]
    ```
      - This error typically occurs when one of the files contains an unrecognized or invalid Unicode character (such as "�"). Since LaTeX strict mode           is enabled, such characters are not tolerated and cause the experiment build to fail. 

  5. **Investigate the Build Directory**:  
     - Examine the directory `home/build/repo_name` for any built or unbuilt sources. Identify and address any build errors to ensure that the build process completes successfully.
     - if the error is of unrecognized unicode character then Navigate to the GitHub repository of the experiment showing the error.
     - Click on the "Actions" tab. Look for the most recent workflow run related to the merge (typically titled Merge pull request from virtual-labs/dev).
     - Select the failed workflow run.
     - Expand the steps and go to Step 4: Run git clone --depth=1 https://github.com/virtual-labs/ph3-lab-mgmt.

  6. **Check for the Errors**:  
     - **For Json Errors:** Many issues arise from errors in JSON files. Use a JSON validator to check and resolve any syntax or structural issues in the JSON files that may be causing the build to fail.
     - **For Latex Errors:** Carefully examine the output to identify which file is causing the error.Look for lines referencing Unicode errors or LaTeX issues.

- **Post-Fix Verification**:  
  - After addressing any build errors and resolving JSON issues, re-run the build process. Once it completes successfully, attempt to access the Virtual Labs experiment again to confirm that the "404" error is resolved.
  - Open the identified file in a UTF-8-compatible editor. Locate and remove or replace the invalid character. Save the file with UTF-8 encoding to avoid future issues.
  - Once the file is corrected, push the changes and let the build process run again to verify the fix.

- **Lessons Learned**:  
  1. Regularly monitor build statuses after code changes to catch errors early.
  2. Validate JSON files before pushing code to minimize issues related to malformed files.
  3. Do not rename the `index.html` file.

#### 7) Pipeline worked in the last iteration but not working in this iteration. Why? (JSON)
  - Verify that your workflow file ([`.github/workflows/deployment-script.yml`](https://github.com/virtual-labs/exp-bubble-sort-iiith/blob/main/.github/workflows/deployment-script.yml) or a similar name) is correctly set up and has no syntax errors. Ensure the file structure, event triggers, job steps, and actions are adequately defined.
  - Go to the Actions tab in your GitHub repository to check the status of your GitHub Actions. Look for failed or errored workflows, and select the specific run to view more details. 
  - GitHub Actions provides logs for each workflow run. These logs contain detailed information about the execution of each step in your workflow. Examine the logs to identify any errors or warnings, which can help you pinpoint the cause of the issue.
  - Most of the issues are due to syntax issues in JSON files(Expecting the audience to know JSON).
  - Identify the JSON file and report to the developer to fix the syntax. 


#### 8) Everything has been setup properly but why is still CI\CD pipeline failed to execute? (Errored Workflow)
  - By default, GitHub provides 2,000 pipeline Minutes (per month) and 500 MB Storage, sufficient for 100+ active repositories.
  - Workflow will fail to execute due to software and hardware issues from GitHub
  - Go to the Actions tab in your GitHub repository to check the status of your GitHub Actions. Look for failed or errored workflows, and select the specific run to view more details. 
  - Re-run the errored workflow to start the deployment of pages.
    
#### 9) Hosted virtual lab experiments are not working as expected. Why?
  - Verify Tag Consistency: Ensure that the tags used in the lab descriptor file match the actual tags in your codebase. Inconsistencies can lead to unexpected behavior.
  - Confirm Code Merge: Verify that the code for the malfunctioning experiment(s) has been successfully merged from the testing branch into the main branch. Unmerged code changes won't be reflected in the hosted lab.
  - Error Logs: If the above steps don't resolve the issue, consult the error logs associated with the virtual lab environment. These logs can provide valuable clues about the specific cause of the problem.

### 10) Why do I get the error "uncaughtException: Cannot find module '.../experiment-descriptor.json'" during the build process?

- **Problem**:  
  During the build process, an uncaught exception error is encountered, stating that the `experiment-descriptor.json` file cannot be found.

- **Error Description**:  
  The error message typically looks like this:
  error: uncaughtException: Cannot find module '/home/runner/work/lab-basic-electronics-virtual-laboratory-iitkgp/lab-basic-electronics-virtual-laboratory-iitkgp/ph3-lab-mgmt/lab_build/exprepos/ohm-law/experiment-descriptor.json'

- **Root Cause**:  
This error occurs because the build process is unable to locate the `experiment-descriptor.json` file for the specified experiment.
This issue usually happens when the experiment tag mentioned in the repository or configuration file does not exist or is incorrect.

- **Solution/Fix**:  
1. **Check the experiment with the error**:  
   Identify the specific experiment mentioned in the error (in this case, the "ohm-law" experiment) and verify its configuration.
   
2. **Verify the tags**:  
   Ensure that the tag referenced for the experiment in the build files or descriptor is correct and exists in the repository. If the tag is missing or incorrect, update the tag to match the correct one.

3. **Update the experiment configuration**:  
   After verifying the correct tag, update the relevant experiment configuration files and ensure the `experiment-descriptor.json` file is accessible for the build.

- **Post-Fix Verification**:  
Once the tag and file path are corrected, re-run the build process. If the build completes successfully, the error should no longer appear.

- **Lessons Learned**:  
1. Double-check experiment tags and ensure they are correct and consistent across configuration files.
2. Ensure all necessary files, including `experiment-descriptor.json`, are properly referenced in the build process.

  
## 11) Why does the lab build stop at one experiment with the error "MaxListenersExceededWarning: Possible EventEmitter memory leak detected"?

- **Problem**:  
  When triggering the lab build process, it stops at one experiment, and the following error is displayed:
(node:1864) MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 31 finish listeners added to [PassThrough]. Use emitter.setMaxListeners() to increase limit (Use node --trace-warnings ... to show where the warning was created)


- **Error Description**:  
This error is typically related to an issue in one of the experiments within the lab. It indicates that too many event listeners are being created, which suggests that a specific experiment is missing necessary files or directories.

- **Root Cause**:  
The root cause of this issue is often that one of the experiments in the repository does not have the required files or directories needed for the build process to complete successfully. This missing file or folder is causing the build to halt and trigger the warning.

- **Solution/Fix**:  
1. **Identify the experiment**:  
   Look into the logs or identify the specific experiment where the build process stopped.
   
2. **Check for missing files or directories**:  
   Navigate to the experiment's repository and verify if it has all the necessary files and directories. In particular, ensure that critical files like `experiment-descriptor.json`, `index.html`, or other required build components are present.

3. **Add the missing files**:  
   If any files or directories are missing, add them to the experiment's repository. Ensure that all the files required for the build are included.

- **Post-Fix Verification**:  
After adding the missing files, re-run the build process. Once the build completes without any warnings or errors, the issue should be resolved.

- **Lessons Learned**:  
1. Ensure that each experiment in the repository has the required files and directories to avoid build interruptions.
2. Regularly review logs during the build process to catch and resolve errors early.
3. Consider increasing the limit for event listeners in Node.js using `emitter.setMaxListeners()` if the issue persists in certain workflows.

## 12) Why are some experiments in the lab showing up as empty templates after deployment?
**Problem:**  
While building the lab with all experiments, a few experiments appeared as template experiments without any actual content.

**Error Description:**  
Some experiments in the deployed lab do not display their expected content and instead show default or placeholder/template structures.

**Root Cause:**  
The tags for the experiments were created *before* the latest changes were pushed to the repository. As a result, those tagged versions did not include the updated content. Since deployment used the old tag, it did not reflect the latest changes.

**Solution / Fix:**  
Before deploying the lab:
1. Ensure that all changes are pushed to the repository.
2. Only then, create or update the relevant tags.
3. Use the newly created/updated tags for deployment to ensure the latest changes are included.

> Tag **after** pushing changes to ensure updates are reflected in the deployment.


## Why CI/CD
- Virtual Labs employs Continuous Integration (CI) and Continuous Deployment (CD) practices to ensure a smooth and efficient development process. By deploying code to GitHub Pages for testing before moving it to production on AWS, Virtual Labs achieves several vital benefits:
1. **Reduced Error Rates:** CI/CD helps identify and fix errors quickly by automatically building and deploying code changes. This practice minimizes the chances of human errors and results in higher-quality software.
2. **Faster Feedback Loops:** Deploying code to GitHub Pages for testing enables developers to receive immediate feedback on their changes. This allows them to identify and address issues early, leading to faster iterations and improvements.
3. **Increased Productivity:** CI/CD automates repetitive tasks, such as building and deploying code, freeing developers to focus on more value-added activities. This leads to increased productivity and reduced time-to-market for new features and bug fixes.
4. **Improved Collaboration:** The CI/CD pipeline encourages collaboration between developers and operations teams. By working together, these teams can identify and resolve issues more efficiently, leading to a more robust and reliable software product.
5. **Enhanced Confidence in Releases:** When code is automatically tested and deployed to GitHub Pages, developers can gain confidence in their changes before moving them to production on AWS. This ensures that the code is stable and ready for deployment, reducing the risk of downtime or unexpected issues in the production environment.

## Future scope
- In the future, Virtual Labs plans to further optimize the CI/CD pipeline by incorporating additional automated tests, performance monitoring, and security checks. This will help to ensure that code changes are thoroughly tested and validated before deployment, resulting in a more stable and reliable infrastructure for the hosted experiments.

- As Virtual Labs continues to grow and add more repositories, Virtual Labs may need to consider upgrading its GitHub plan to accommodate increased usage. GitHub currently provides 2,000 pipeline minutes per month and 500 MB of storage, sufficient for around 100 active repositories. However, Virtual Labs has 1,900 repositories, and as this number increases, Virtual Labs may need to upgrade to the "Team" plan at $4 per user/month or the "Enterprise" plan at $21 per user/month. The Team plan offers advanced collaboration and support, while the Enterprise plan provides enhanced security and flexible deployment options.

- Alternatively, Virtual Labs may consider setting up a self-hosted GitLab server on its infrastructure. By hosting a GitLab server, Virtual Labs can access many of the premium features offered by GitHub's paid plans without incurring additional costs. This would include features such as unlimited CI/CD minutes, increased storage, and advanced security and collaboration tools. Hosting a self-managed GitLab server would require an initial investment in the ec2 server and maintenance but could provide greater flexibility and cost savings in the long run.
