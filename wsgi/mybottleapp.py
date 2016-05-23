#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import route,default_app,request,template,static_file
from lxml import etree
import requests
  
@route('/')
def index():
	
	return template("index.tpl")

@route('/estadio',method='POST')
def estadio():
    clave="AIzaSyBiVmIZCcnp0vMtBJoIIOPt1HZPhZ9xgos"
    pos=request.forms.get('ubicacion')
    radio=request.forms.get('radio')
    url_base="https://maps.googleapis.com/maps/api/"
    diccionario={"address":pos,"sensor":"false"}
    r1=requests.get(url_base+"geocode/xml",params=diccionario)
    if r1.status_code == 200:
		arbol=etree.fromstring(r1.text.encode("utf-8"))
		latitud=arbol.find("result/geometry/location/lat").text
		longitud=arbol.find("result/geometry/location/lng").text
		lat_long=str(latitud)+","+str(longitud)
		diccionario2={"location":lat_long,"language":"es","radius":radio,"types":"stadium","sensor":"false","key":clave}
		r2=requests.get(url_base+"place/nearbysearch/xml",params=diccionario2)
		if r2.status_code == 200:
			arbol2=etree.fromstring(r2.text.encode("utf-8"))
			resultados=arbol2.findall("result")
			estadios=[]
			for estadio in resultados:
				local=[]
				nombre=estadio.find("name").text
				latitud_establecimiento=float(estadio.find("geometry/location/lat").text)
				longitud_establecimiento=float(estadio.find("geometry/location/lng").text)
				local.append(str(nombre.encode('utf-8')))
				local.append(latitud_establecimiento)
				local.append(longitud_establecimiento)
				estadios.append(local)
		return template("estadio.tpl",latitud=float(latitud) ,longitud=float(longitud), estadios=estadios)

@route('/mapa',method='POST')
def estadio():
    clave="AIzaSyBiVmIZCcnp0vMtBJoIIOPt1HZPhZ9xgos"
    campo=unicode(request.forms.get('estadios'),'utf-8')
    lugar=request.forms.get('lugar')
    radio=request.forms.get('radio')
    url_base="https://maps.googleapis.com/maps/api/"
    diccionario={"address":campo,"sensor":"false"}
    print type(diccionario["address"])
    r1=requests.get(url_base+"geocode/xml",params=diccionario)
    print r1.url
    if r1.status_code == 200:
		arbol=etree.fromstring(r1.text.encode("utf-8"))
		latitud=arbol.find("result/geometry/location/lat").text
		longitud=arbol.find("result/geometry/location/lng").text
		lat_long=str(latitud)+","+str(longitud)
		diccionario2={"location":lat_long,"language":"es","radius":radio,"types":lugar,"sensor":"false","key":clave}
		r2=requests.get(url_base+"place/nearbysearch/xml",params=diccionario2)
		print r2.url
		if r2.status_code == 200:
			arbol2=etree.fromstring(r2.text.encode("utf-8"))
			resultados=arbol2.findall("result")
			establecimientos=[]
			for establecimiento in resultados:
				local=[]
				nombre=establecimiento.find("name").text
				latitud_establecimiento=float(establecimiento.find("geometry/location/lat").text)
				longitud_establecimiento=float(establecimiento.find("geometry/location/lng").text)
				local.append(str(nombre.encode('utf-8')))
				local.append(latitud_establecimiento)
				local.append(longitud_establecimiento)
				establecimientos.append(local)
		return template("mapa.tpl",lat=float(latitud) ,lon=float(longitud), loc=establecimientos)

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=os.environ['OPENSHIFT_REPO_DIR']+'static/')
# This must be added in order to do correct path lookups for the views
import os
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], 'wsgi/views/'))
application=default_app()

