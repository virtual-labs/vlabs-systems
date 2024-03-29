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

#### Q) Pipeline worked in the last iteration but not working in this iteration. Why? (JSON) 
    - Verify that your workflow file ([`.github/workflows/deployment-script.yml`](https://github.com/virtual-labs/exp-bubble-sort-iiith/blob/main/.github/workflows/deployment-script.yml) or a similar name) is correctly set up and has no syntax errors. Ensure the file structure, event triggers, job steps, and actions are adequately defined.
    - Go to the Actions tab in your GitHub repository to check the status of your GitHub Actions. Look for failed or errored workflows, and select the specific run to view more details. 
    - GitHub Actions provides logs for each workflow run. These logs contain detailed information about the execution of each step in your workflow. Examine the logs to identify any errors or warnings, which can help you pinpoint the cause of the issue.
    - Most of the issues are due to syntax issues in JSON files(Expecting the audience to know JSON).
    - Identify the JSON file and report to the developer to fix the syntax. 

#### Q) GitHub pages not working. Why? (Pages not working)
    - This happens when GitHub pages are not configured properly.
    - Check if GitHub Pages are set up for the experiment repository.
    - Go to the experiment repository's main page on GitHub.
    - Look for the "Settings" button near the top right corner of the page and click on it. 
    - Scroll down to the "GitHub Pages" section. 
    - If GitHub Pages are set up for the repository, you should see a message that says, "Your site is published at [experiment site URL]." This indicates that the GitHub page is live and can be accessed via the URL provided.


#### Q) Everything has been setup properly but why is still CI\CD pipeline failed to execute? (Errored Workflow)
    - By default, GitHub provides 2,000 pipeline Minutes (per month) and 500 MB Storage, sufficient for 100+ active repositories.
    - Workflow will fail to execute due to software and hardware issues from GitHub
    - Go to the Actions tab in your GitHub repository to check the status of your GitHub Actions. Look for failed or errored workflows, and select the specific run to view more details. 
    - Re-run the errored workflow to start the deployment of pages.

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
