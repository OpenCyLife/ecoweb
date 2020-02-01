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
          
          <#-- Create IMDB URL -->
<#function seq_containsOne aSequence lookupItems>
	<#assign found=false>
	<#list lookupItems as item>
		<#if (!found)>
			<#assign found = aSequence?seq_contains(item) >
		</#if>
	</#list>
	
	<#return found>
</#function>
          
          
			<#if (config.site_menu_includeBlock == "true")>
				<#list org_openCiLife_blocks?sort_by("order") as block_menu>
					
					<#if (config.site_menu_tags_include?is_string)?then(block_menu.tags?seq_contains(config.site_menu_tags_include), seq_containsOne(block_menu.tags, config.site_menu_tags_include))>
	          
						<#if (block_menu.anchorId)??>
							<li><a href="/#${block_menu.anchorId}"style="text-decoration:none; outline: none; color:black">${block_menu.title}</a></li>
						<#else></#if>
					</#if>
				</#list>
			</#if>
            <!-- <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>/">Home</a></li> -->
            
           <!--
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