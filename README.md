Bottle on OpenShift
===================

This git repository helps you get up and running quickly w/ a Bottle installation
on the Red Hat OpenShift PaaS.


Running on OpenShift
----------------------------

Create an account at https://www.openshift.com/

Create a python application based on the code in this repository

    rhc app create bottle python-2.6 --from-code https://github.com/openshift-quickstart/bottle-openshift-quickstart.git

That's it, you can now checkout your application at:

    http://bottle-$yournamespace.rhcloud.com
