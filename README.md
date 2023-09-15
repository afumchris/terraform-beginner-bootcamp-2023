# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`
# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner

## Install the Terraform CLI

### Points to keep in mind regarding alterations in the Terraform CLI

The installation instructions for the Terraform CLI have been modified owing to adjustments in the gpg keyring. As a result, we must consult the most up-to-date CLI installation instructions found in the Terraform Documentation and update our installation scripting accordingly.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Linux Distribution Considerations

This project is designed for Ubuntu. Please ensure that you check your Linux distribution and make any necessary adjustments to align with the requirements of your distribution

[How To Check OS Version in Linux](
https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Run this command to check OS Version:
```
cat /etc/os-release
```

### Refactoring into Bash Scripts

While addressing the Terraform CLI gpg depreciation concerns, we observed that the bash script steps contained a substantial amount of code. Consequently, we've created a bash script for Terraform CLI installation, located at [./bin/install_terraform_cli]([./bin/install_terraform_cli](https://github.com/afumchris/terraform-beginner-bootcamp-2023/blob/1-refactor-terraform-cli/bin/install_terraform_cli)). 

Edit the [.gitpod.yml]([.gitpod.yml](https://github.com/afumchris/terraform-beginner-bootcamp-2023/blob/1-refactor-terraform-cli/.gitpod.yml)) to install Terraform CLI at the start of a new environment. This simplifies debugging, enables manual Terraform CLI installation, and enhances portability for other projects requiring Terraform CLI installation.

#### Execution Considerations

When running the bash script, you can utilize the shorthand notation `./` for execution
eg. `./bin/install_terraform_cli`

When using a script in .gitpod.yml, it's important to specify the program needed to interpret and execute the script.

eg. `source ./bin/install_terraform_cli`


#### Linux Permissions Considerations

To enable the execution of our bash scripts, we must modify the Linux permissions to make them executable in user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:

```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (Before, Init, Command)

Caution is required when using the "Init" process, as it won't rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks