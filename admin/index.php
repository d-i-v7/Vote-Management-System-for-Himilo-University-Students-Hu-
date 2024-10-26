<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HuVms</title>
    <?php 
        // Css Links
        include("css_links.php");
    ?>
</head>
<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">
        <!-- Calling SideBar And Header -->
 <?php 
 include("header.php");
 include("sideBar.php");
 ?>
    <div class="content-body">
            <!-- row -->
 <div class="container-fluid">
        <!-- Calling Dashboard file -->
         <?php
        include("dashboard.php");
         ?>
    </div>
    </div>
    </div>

    <!-- Js Links -->
     <?php
        include("js_links.php");
     ?>
</body>
</html>