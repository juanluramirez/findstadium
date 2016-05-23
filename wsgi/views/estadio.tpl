% #!/usr/bin/env python
% # -*- coding: utf-8 -*-

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FindStadium</title>


<link rel="stylesheet" href="./static/css/reset.css" type="text/css" />
<link rel="stylesheet" href="./static/css/styles.css" type="text/css" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">


<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<script type="text/javascript" src="./static/js/jquery.js"></script>
<script type="text/javascript" src="./static/js/slider.js"></script>
<script type="text/javascript" src="./static/js/superfish.js"></script>

<script type="text/javascript" src="./static/js/custom.js"></script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

<!--
deiform, a free CSS web template by ZyPOP (zypopwebtemplates.com/)

Download: http://zypopwebtemplates.com/

License: Creative Commons Attribution0
//-->
<link rel="shortcut icon" type="image/png" href="/static/images/Find-Stadium-M.png" />
</head>
<body>
<div id="container" class="width">

    <header> 
  <div class="width">

        <h1><a href="/">Pagina principal</a></h1>

  </div>

  <div class="clear"></div>

       
    </header>


    <div id="intro">

  <div class="width">
              
    <img src="./static/images/Find-Stadium-XXL.png" border="0" width="1520" height="820">
    <div class="intro-content">
          <ul class="actions">
                    <li>
                        <a href="#Formulario" class="button big">FindStadium</a>
                    </li>
            </ul>
                 

        </div>
                
    </div>
            

  </div>
    <div id="body" class="width">


    <div class="width">
        <section id="Formulario" class="two-column with-right-sidebar">
                <div class="container">
                    <header class="major">
                        <h2>FindStadium</h2>
                        <p>Seleccione el estadio</p>
                    </header>
                    <div>
                        <form action="mapa" method="post">
                            <label class="estadio">Estadios:</label>
                            <select name="estadios">
                                  % for estadio in estadios:
                                    <option value="{{estadio[0].decode('utf-8')}}">{{estadio[0]}}</option>
                                  % end
                            </select></br>
                            <label class="lugar">Lugar:</label>
                            <select name="lugar">
                                <option value="restaurant">Restaurante</option>
                                <option value="hospital">Hospital</option>
                                <option value="hoteles">Hoteles</option>
                                <option value="bar">Bares</option>
                            </select></br>
                            <label class="estadio">Radio(Metros):</label> <input name="radio" type="text" /></br>
                            <input value="Enviar" type="submit" />
                        </form>
                    </div>
                </div>
            </section>
       
    <footer>
        <div class="footer-content width">
        
            <ul class="endfooter">
              <li><h4>Contacto</h4></li>
                <li>Os dejo las redes sociales en las que me podeis encontrar. <br /><br />

<div class="social-icons">

<a href="#"><i class="fa fa-facebook fa-2x"></i></a>

<a href="#"><i class="fa fa-twitter fa-2x"></i></a>

<a href="#"><i class="fa fa-youtube fa-2x"></i></a>

<a href="#"><i class="fa fa-instagram fa-2x"></i></a>

</div>

</li>
            </ul>
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; FindStadium <a href="http://zypopwebtemplates.com/">FindStadium</a> by Juanlu Ramirez</p>
         </div>
    </footer>
</body>
</html>