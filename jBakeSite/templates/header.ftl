<#if (config.site_locale)??>
	<#setting locale=config.site_locale>
<#else>
	<#if (site.header.lang)??>
		<#if (site.header.lang == "fr")>
			<#setting locale="fr_FR">
		<#else>
			<#setting locale="en_EN">
		</#if>
	</#if>
</#if>
<#import "tools/org_openCiLife_ecoweb-marcos.ftl" as ecoWeb>
<!DOCTYPE html>
<html lang="${config.site_header_lang}">
  <head>
    <meta charset="utf-8"/>
    <title><#if (content.title)??><#escape x as x?xml>${content.title}</#escape><#else>${ecoWeb.displayConfigText(config.site_header_title)}</#if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${ecoWeb.displayConfigText(config.site_header_description)}">
    <meta name="author" content="${ecoWeb.displayConfigText(config.site_header_author)}">
    <meta name="keywords" content="${ecoWeb.displayConfigText(config.site_header_keyword)}">
    <meta name="generator" content="JBake">
    <#-- Le styles -->
    <link href="${ecoWeb.buildRootPathAwareURL("org_openCiLife_ecoWeb/css/bootstrap.min.css")}" rel="stylesheet">
    <link href="${ecoWeb.buildRootPathAwareURL("org_openCiLife_ecoWeb/css/base.css")}" rel="stylesheet">
    <link href="${ecoWeb.buildRootPathAwareURL("org_openCiLife_ecoWeb/css/style.css")}" rel="stylesheet">
    <link href="${ecoWeb.buildRootPathAwareURL("css/style-ext.css")}" rel="stylesheet">
	
	<#-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"> -->

    <#-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="${ecoWeb.buildRootPathAwareURL("org_openCiLife_ecoWeb/js/html5shiv.min.js")}"></script>
    <![endif]-->

    <#-- Fav and touch icons -->
    <#--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
    <link rel="shortcut icon" href="${ecoWeb.buildRootPathAwareURL(config.site_header_iconShortcut)}">
  </head>
  <body class="${content.type}">
    <div id="wrap">
    	<div id="up" class="header">
			<div id="pageTitle">
				<a href="/index.html"><img src="${ecoWeb.buildRootPathAwareURL(config.site_logoLeft_file)}" alt="${ecoWeb.displayConfigText(config.site_logoLeft_description)}" id="logoLeft"/></a>
				<h1 id="headerTitle">${ecoWeb.displayConfigText(config.site_headline)}</h1>
				<img src="${ecoWeb.buildRootPathAwareURL(config.site_logoRight_file)}" alt="${ecoWeb.displayConfigText(config.site_logoRight_description)}" id="logoRight"/>
			</div>
		</div>