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
          <a class="navbar-brand" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>">
          	<img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/common/logo-small.jpg" style="height:35px, margin-bottom : 10px;"></img></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          
			<#if (config.site_menu_includeBlock == "true")>
				<#list org_openCiLife_blocks?sort_by("order") as block_menu>
	          
					<#if (block_menu.anchorId)??>
						<li><a href="/#${block_menu.anchorId}"style="text-decoration:none; outline: none; color:black">${block_menu.title}</a></li>
					<#else></#if>
				</#list>
			</#if>
            <!-- <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>/">Home</a></li> -->
            
           <!--
			<li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>projects.html">Nos projets</a></li>
			<li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>documents.html">La base documentaire</a></li>
			<li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>poles.html">les pôles</a></li>
			
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
        </div><!--/.nav-collapse -->
      </div>
    </div>
    <div class="container">