# Alfresco share AMPs

Place here your Alfresco module Packages (AMPs) to be installed in the Alfresco
share.

AMP packages should have the `.amp` extension and stick to the Alfresco module
packaging format as described in the [Alfresco
documentation](https://docs.alfresco.com/content-services/latest/develop/extension-packaging/#alfresco-module-package-amp).

The [in-process Alfresco
SDK](https://docs.alfresco.com/content-services/latest/develop/sdk/) provides a
way to build well structured AMPs.

> Note that AMPs are not the recommanded way to extend Alfresco. You should
> prefer using the Alfresco SDK to build your extensions as JARs even better,
> use the [out-of-process Alfresco
> SDK](https://docs.alfresco.com/content-services/latest/develop/oop-sdk/) to
> build Docker images with your extensions.

By default the `scripts/fetch-artifacts.sh` script will fetch the following AMPs from the Alfresco Nexus repository:

* alfresco-googledrive-share

You can replace those, remove them to keep only the ones you need or add more.