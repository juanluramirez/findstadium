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

Aplicacion hecha en python, que utiliza las api's de google maps.
Introduciendo una cuidad y un radio en metros, vamos a observar una lista de todos los estadios de esa cuidad, al seleccionar uno de ellos, seleccionamos un lugar(Restaurante, bar, Hoteles, Hospitales) y un radio y nos marcara todos los Restaurante, bar, Hoteles, Hospitales(Segun eligamos) que estan en un radio que tu tienes que meter por teclado (en metros).