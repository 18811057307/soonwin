<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/shoppica/stylesheet/stylesheet.css" rel="stylesheet">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-left">
        <ul class="list-inline">
        <?php if ($logged) { ?>
        <li><a href="<?php echo $transaction; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $firstname; ?>,当前可用额度<?php echo $availablecredit; ?>（其中包含授信额度<?php echo $credit; ?>）</span></a></li>
        <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span></a></li>
        <li><a href="<?php echo $transaction; ?>" title="<?php echo $text_transaction; ?>"><i class="fa fa-jpy"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_transaction; ?></span></a></li>
        <li><a href="<?php echo $order; ?>" title="<?php echo $text_order; ?>"><i class="fa fa-bars"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_order; ?></span></a></li>
        <?php } ?>
        </ul>
    </div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <?php if ($logged) { ?>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $logout; ?>" title="<?php echo $text_logout; ?>"><i class="fa fa-sign-out"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span></a></li>
        <?php } else { ?>
        <li><a href="<?php echo $login; ?>" title="<?php echo $text_login; ?>"><i class="fa fa-sign-in"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_login; ?></span></a></li>
        <?php } ?>
        <!--
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        -->
      </ul>
    </div>
  </div>
</nav>
<header id="block-header"><div>
  <div class="container">
    <div class="row">
      <div class="col-sm-1">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-11">
        <div class="row" style="padding-top: 5px;">
          <div class="col-md-offset-2 col-sm-5">
              <?php echo $search; ?>
          </div>
          <div class="col-xs-2 col-sm-2"></div>
          <div class="col-xs-3 col-sm-3">
              <?php echo $cart; ?>
          </div>
        </div>
          <div class="row">
              <div class="col-xs-12 col-sm-12">
                  <?php if ($categories) { ?>
                  <nav id="menu" class="navbar menu-dropdown">
                  <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                  </div>
                  <div class="collapse navbar-collapse navbar-ex1-collapse">
                  <ul class="nav navbar-nav">
                  <li class="dropdown level1">
                  <a href="#" class="dropdown-toggle level1" data-toggle="dropdown" role="button" aria-expanded="false"><span>所有商品分类<span class="caret"></span></span></a>
                  <ul class="dropdown-menu level2" role="menu">
                  <?php foreach ($categories as $category) { ?>
                  <li class='level2'><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                  <?php } ?>
                  </ul>
                  </li>

                  <li class="level1"><a class="level1" href="<?php echo $home; ?>"><span>首页</span></a></li>
                  <li class="level1"><a class="level1" href="<?php echo $bp; ?>"><span>业务合作</span></a></li>
                  <li class="level1"><a class="level1" href="<?php echo $contact; ?>"><span>关于我们</span></a></li>
                  <li class="level1"><a class="level1" href="<?php echo $contact; ?>"><span>投诉建议</span></a></li>
                  </ul>
                  </div>
                  </nav>
                  <?php } ?>
              </div>
          </div>
      </div>
    </div>
  </div>
</div></header>

