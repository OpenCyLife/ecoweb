	<!-- Fixed navbar -->
    <div class="container">
    <div class="navbar navbar-light bg-white" role="navigation">
              <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<#-- <li><a href="${ecoWeb.buildRootPathAwareURL("index.html")}">Home</a></li> -->
			<#if (config.site_menu_includeBlock == "true")>
				<#list org_openCiLife_blocks?sort_by("order") as block_menu>
					<#if   (ecoWeb.seq_containsOne(block_menu.category, config.site_menu_tags_include))>
						<#if (block_menu.anchorId)??>
							<li><a href="${ecoWeb.buildRootPathAwareURL("index.html#"+block_menu.anchorId)}">${block_menu.title}</a></li>
						<#else></#if>
					</#if>
				</#list>
			</#if>
			<#if (config.site_menu_includeCategories)??>
				<#list org_openCiLife_posts?sort_by("order") as blog_menu>
					<#if   (ecoWeb.seq_containsOne(blog_menu.category, config.site_menu_includeCategories))>
						<#if (blog_menu.uri)?? && blog_menu.status == "published">
							<li><a href="${ecoWeb.buildRootPathAwareURL(blog_menu.uri)}">${blog_menu.title}</a></li>
						<#else></#if>
					</#if>
				</#list>
			</#if>
           <#--
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
            -->
          </ul>
        </div><#--/.nav-collapse -->
      </div>
    </div>
    <div class="container">