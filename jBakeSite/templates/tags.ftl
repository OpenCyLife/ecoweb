<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>Tag: <#if tag??>${tag}<#else>No name</#if></h1>
	</div>
	
	<!--<ul>-->
		<#list tagged_documents as post>
		<#if (last_month)??>
			<#if post.date?string("MMMM yyyy") != last_month>
				</ul>
				<h4>${post.date?string("MMMM yyyy")}</h4>
				<ul>
			</#if>
		<#else>
			<h4>${post.date?string("MMMM yyyy")}</h4>
			<ul>
		</#if>
		
		<li>${post.date?string("dd")} - <a href="${ecoWeb.buildRootPathAwareURL(post.uri)}">${post.title}</a>  (${post.type})</li>
		<#assign last_month = post.date?string("MMMM yyyy")>
		</#list>
	</ul>
	
<#include "footer.ftl">