# DevOps and CI/CD Pipeline

A robust DevOps and [CI/CD pipeline](https://resources.github.com/ci-cd/) is essential for delivering high-quality labs and services while maintaining agility and responsiveness. [Virtual Labs](https://vlead.vlabs.ac.in/) uses tools and processes to manage its codebase, automate deployments, and streamline application delivery.

## Version Control System

Virtual Labs hosts its open-source codebase on [GitHub](https://github.com/virtual-labs) and [GitLab](https://gitlab.com/vlead-projects), the organization's primary version control systems. These platforms enable efficient management of code and configuration files, ensuring that the organization can track and control changes to its applications and services.

## Continuous Integration and Continuous Deployment (CI/CD)

[GitHub CI/CD](https://github.blog/2022-02-02-build-ci-cd-pipeline-github-actions-four-steps/) is the primary automation solution Virtual Labs uses for testing and deploying applications (labs). This tool streamlines the testing deployment process, allowing the organization to deliver new features and improvements while maintaining high-quality standards rapidly.

## Containerization and Orchestration

Virtual Labs is [implementing](https://github.com/virtual-labs/vlabs-infra) containerization and orchestration solutions to enhance its deployment and management capabilities further. These [technologies](https://www.ibm.com/in-en/topics/container-orchestration) will allow the organization to deploy applications and manage resources more effectively.


## Experiment Deployment Script(CI\CD)

- Virtal Lab uses CI\CD to deploy its expiements for testing on GitHub pages. YAML file is used for deploying code to GitHub Pages using a CI/CD pipeline.

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

## Explanation 

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
