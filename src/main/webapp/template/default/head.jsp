<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- sec:csrfMetaTags -->
    <sec:csrfMetaTags />
    <!-- /sec:csrfMetaTags -->
    <title>${nomeSistema}</title>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-124345784-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
    
      gtag('config', 'UA-124345784-1');
    </script>



	<!-- livereload -->
    <!--
	<script>
        document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')  
    </script> 
    -->
    
    <!-- Favicon -->
    <!-- <link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico" /> -->
    <link href="data:image/x-icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAACcTAAAnEwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkROcAJETnACRE5zQkROfRJETn/yRE5/8kROfRJETnNCRE5wAkROcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJETnACRE5wAkROeWJETn/yRE5/8kROf/JETn/yRE55YkROcAJETnAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACRE5wAkROcEJETnsCRE5/8kROf/JETn/yRE5/8kROewJETnBCRE5wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkROcAJETnBCRE57AkROf/JETn/yRE5/8kROf/JETnsCRE5wQkROcAAAAAAAAAAAAAAAAAJETnACRE5wEkROcEJETnBCRE5wgkROexJETn/yJC5/8iQuf/JETn/yRE57EkROcIJETnBCRE5wQkROcBJETnACRE5zQkROeWJETnsCRE57AkROexI0Pn5iZG5/9rhO3+a4Tt/iZG5/8jQ+fmJETnsSRE57AkROewJETnliRE5zQkROfRJETn/yRE5/8kROf/JETn/yZG5/94j+7+3ur2/97q9v94j+7+Jkbn/yRE5/8kROf/JETn/yRE5/8kROfRJETn/iRE5/8kROf/JETn/yJC5/9he+z+3Oj2/ufy9//n8vf/3Oj2/mF77P4iQuf/JETn/yRE5/8kROf/JETn/iRE5/4kROf/JETn/yRE5/8kROf/nrHx/uv19//n8vf/5/L3/+v19/+esfH+JETn/yRE5/8kROf/JETn/yRE5/4kROfRJETn/yRE5/8kROf/I0Pn/3SL7v7Y5Pb+0+D1/tPg9f7Y5Pb+dIvu/iND5/8kROf/JETn/yRE5/8kROfRJETnNCRE55YkROewJETnsCNE57EpSOfmR2Pq/0Jf6v5CX+r+R2Pq/ylI5+YjROexJETnsCRE57AkROeWJETnNCRE5wAkROcBJETnBCRE5wQlRecIJETnsSJC5/8iQuf/IkLn/yJC5/8kROexJUXnCCRE5wQkROcEJETnASRE5wAAAAAAAAAAAAAAAAAkROcAJETnBCRE57AkROf/JETn/yRE5/8kROf/JETnsCRE5wQkROcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJETnACRE5wQkROewJETn/yRE5/8kROf/JETn/yRE57AkROcEJETnAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACRE5wAkROcAJETnliRE5/8kROf/JETn/yRE5/8kROeWJETnACRE5wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkROcAJETnACRE5zQkROfRJETn/yRE5/8kROfRJETnNCRE5wAkROcAAAAAAAAAAAAAAAAA+B8AAPgfAADwDwAA8A8AAIABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAQAA8A8AAPAPAAD4HwAA+B8AAA==" rel="icon" type="image/x-icon" />
    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="/resources/static/libs/bootstrap/4.1.1/css/bootstrap.min.css" /> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <!-- 
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script> -->
    <script type="text/javascript" src="/resources/static/libs/bootstrap/4.1.1/js/bootstrap.min.js"></script>


    <!-- Select2 - Multiselect lib - https://select2.org -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css" integrity="sha256-nbyata2PJRjImhByQzik2ot6gSHSU4Cqdz5bNYL2zcU=" crossorigin="anonymous" />
    
    <!-- Local pelos acentos -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/i18n/pt-BR.js" integrity="sha256-SYr7ePu2amNnWuiooknttfQaa6jBNCy1hUAZnPS6SMw=" crossorigin="anonymous"></script> -->
    <script src="/resources/static/libs/select2/4.0.5/js/i18n/pt-BR.js" integrity="sha256-SYr7ePu2amNnWuiooknttfQaa6jBNCy1hUAZnPS6SMw=" crossorigin="anonymous"></script>

	<!-- Bootstrap Toggle -->
    <!-- 
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    -->
    <link href="/resources/static/libs/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="/resources/static/libs/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


    <!-- Number format -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" /> -->
    <!-- Font Awesome Animation -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome-animation/0.1.0/font-awesome-animation.min.css" integrity="sha256-+sCZ753q9SetjnSvO1VJ9zsVpbPdDEINkNZTylzQALE=" crossorigin="anonymous" />
     

	<!-- Data Tables -->
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />

    <!-- Moment.js --> 
    <!-- utilizado pelo Fullcalendar.io -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js" integrity="sha256-CutOzxCRucUsn6C6TcEYsauvvYilEniTXldPa6/wu0k=" crossorigin="anonymous"></script>
 
    <!-- Fullcalendar.io -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js" integrity="sha256-QvhPq+evNjd8JyxSOU5KL3jPYTD7+gWVev1OH763SL0=" crossorigin="anonymous"></script>
    
    <!-- Local pelos acentos -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/locale/pt-br.js" integrity="sha256-rabcxeR5J1HbX7EW0+8xSsgMI9JObfd05KGPrYShA7s=" crossorigin="anonymous"></script> -->   
    <script src="/resources/static/libs/fullcalendar/3.9.0/locale/pt-br.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" integrity="sha256-Tu3DN+5kwrhzlzhNUMuGht2h7cR6ARgKcYemB9u5SzA=" crossorigin="anonymous" />
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.min.css" integrity="sha256-wrdOlXzdxeFmQyeCnv1suX42fhtiEBrcKg1IY2cAwiI=" crossorigin="anonymous" /> -->
    
 <!-- 
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/cr-1.4.1/fh-3.1.3/r-2.2.1/rr-1.2.3/sc-1.4.4/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/cr-1.4.1/fh-3.1.3/r-2.2.1/rr-1.2.3/sc-1.4.4/datatables.min.js"></script>
 -->

    <!-- JS Local -->
    <script type="text/javascript" src="/resources/static/js/clinica.js"></script>

    <!-- CSS local -->
    <link rel="stylesheet" href="/resources/static/css/clinica.css" />    
    
 
 
    <style type="text/css">
        .table-sm{
            //font-size: 14px;
            border-spacing: 1px;
            border-collapse: separate;
        }
        
        .table-fit {
            width: 1px;
        }
    </style>