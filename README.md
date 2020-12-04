# Template Guide

There are some differences, if this is a wrapper-role for an appliance, or if it is a standalone role.

## Appliance

* Add your variables to `defaults` and `vars`, but keep the variables already in there. (You can change the value if needed.)
* Add your `files` & `templates` to the folders
* Update your `handlers`, you can delete the ones in there. Those are just examples
* Update the `meta` file. The minimum required are `role_name` and `description`
* Create your tasks files in a subfolder of `tasks`. Don't use the root-folder.
* Add your tasks files to the variable `role_include_files` in `vars/main.yml`
* Update the `shared/pre_dependencies.yml`, but keep the 3 default includes in there.
* Update the `shared/post_dependencies.yml`, you can delete the ones in there. There just as an example.
* Update the variables in `setup.sh` and `setup_1.sh`. Graylog was used as an example, to make it more clear.
* Replace this file with `README_TEMPLATE.md` and edit it as needed
* Remove `files/README.md` and `templates/README.md`

## Standalone

* Add your variables to `defaults` and `vars`. You can delete the ones in there.
* Add your `files` & `templates` to the folders
* Update your `handlers`, you can delete the ones in there. Those are just examples.
* Update the `meta` file. The minimum required are `role_name` and `description`
* Create your tasks files in a subfolder of `tasks`. Don't use the root-folder.
* Add your tasks files to the variable `role_include_files` in `vars/main.yml`
* Delete the files in `tasks/shared`, and update the `tasks/main.yml` to not include these anymore
* Replace this file with `README_TEMPLATE.md` and edit it as needed
* Remove `files/README.md` and `templates/README.md`
