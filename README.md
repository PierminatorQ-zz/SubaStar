# README

<p align="center"><img width=5.5% src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/100_STAR_COLOR.png"></p>
<p align="center"><img width=40% src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/250X83_COLOR.png"></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div align="center">

![Ruby](https://img.shields.io/badge/Ruby-2.6.0-red)
![Rails](https://img.shields.io/badge/Rails-5.2.4-blue)
![Dependencies](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

</div>

## Basic Overview

Aplicacion creada como Proyecto final para la Carrera de Full Stack RoR en DesafioLatam que permite la creacion de subastas para productos artisticos, aunque puede ser aplicado a cualquier tipo de productos.
<p align="center"><img width=95% src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/screen.png"></p>

<br>


<div align="center"><a name="menu"></a>
  <h4>
    <a href="https://github.com/PierminatorQ/SubaStar#diagrama">
      Diagrama
    </a>
    <span> | </span>
    <a href="https://github.com/PierminatorQ/SubaStar#gemas">
      Gemas
    </a>
    <span> | </span>
    <a href="https://github.com/PierminatorQ/SubaStar#funcion">
      Funcionalidades
    </a>
    <span> | </span>
    <a href="https://github.com/PierminatorQ/SubaStar#mapa">
      Mapa del Sitio
    </a>
    <span> | </span>
    <a href="https://github.com/PierminatorQ/SubaStar#historias">
      Historias
    </a>
    <span> | </span>
    <a href="https://github.com/PierminatorQ/SubaStar#instalacion">
      Instalaciòn
    </a>
    
  </h4>
</div>
<p align="center"><img width=70% src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/show_capture.jpg"></p>

<br>
<br>
<br>

## DiAGRAMA <a name="diagrama" href="https://github.com/PierminatorQ/SubaStar#diagrama"><img border="0" src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/diagram.png"> </a>

<br>
<br>
<br>

## GEMAS <a name="gemas" href="https://github.com/PierminatorQ/SubaStar#gemas"> </a>

<br>


  - Devise: autenticacion y registro de usuarios nuevos
  - Redis: servidor para funcionalidad de pujas en tiempo real atravès de ActionCable
  - aasm: Maquinas de estaados para modelos de Auction y Order.
  - Minimagick: Imagenes adjuntas para cada producto.
  - Act as votable: funcionalidad de me gusta a las subastas.
  - Chartkick, highcharts: graficos implementados en Dashboard de Admin User
  - toastr-rails: mejorar apariencia de alertas en Rails.
  - oauth:funcionalidad de autenticacion a travès de google.
  - Letter_opener:Funcionalidad para mostrar los emails enviados por el sistema en el navegador.


#### LIBRERIAS
<br>

  - iconos :lineicons.com
  - owl-carousel:funcionalidad de subastas destacadas desplegadas en forma de carrusel.
  - hover.css:animaciones de botones e links en navbar.

<br>
<br>
<br>

## FUNCIONALIDADES <a name="funcion" href="https://github.com/PierminatorQ/SubaStar#funcion"> </a>
<br>

  - Pujas en Tiempo real
  - Categories de productos
  - Imágenes en productos 
  - Autenticación con google
  - Buscador de subastas en Index
  - Envío de emails a ganadores
  - Carrito de compras

<br>
<br>
<br>

## MAPA DEL SITIO <a name="funcion" href="https://github.com/PierminatorQ/SubaStar#mapa"> <img border="0" src="https://github.com/PierminatorQ/SubaStar/blob/master/app/assets/images/mapa.png"></a>

<br>
<br>
<br>

## HISTORIAS <a name="historias" href="https://docs.google.com/document/d/1OolPagsF3NSGn9wPgWXN_Uw3KW1yJwYYU_m0b63iBLw/edit?usp=sharing"> Link</a>

<br>
<br>
<br>

## INSTALACION <a name="instalacion" href="https://github.com/PierminatorQ/SubaStar#instalacion"></a>
<br>
  * en Consola 

```
git clone git@github.com:PierminatorQ/SubaStar.git
```

  * input: 

```
cd Subastar
```

  * Input: 

```
bundle install
```

  * input: 

```
rails db:migrate
```
  * input: 

```
rails s 
```

  * this will start the server on localhost:3000

<br>
<br>
<br>

## Status
  Pendiente Deploy: Pendiente realizar el deploy en Heroku.

<br>

## Contact
  Creado por [Pierre Quintero](https://www.linkedin.com/in/pierre-quintero/) 
 
