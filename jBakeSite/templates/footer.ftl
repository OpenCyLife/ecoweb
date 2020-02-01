		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
     <div class="container">
	     <div class="footer_blocks">
			<#list org_openCiLife_blocks?sort_by("order") as block>
				<#assign blockTags = block.tags>
				<#if (blockTags?seq_contains("footer"))>
					<div class="footer_block">
			            <img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${block.contentImage}">
			            <div class="footer_block_text">
			            	${block.body}
			            </div>
			        </div>
				</#if>
			</#list>
	     </div>
      </div>
      <p class="muted credit">&copy; 2019 | Mixed with <a href="http://getbootstrap.com/">Bootstrap v3.1.1</a> | Baked with <a href="http://jbake.org">JBake ${version}</a> with recipe from <a href ="https://github.com/OpenCyLife/ecoweb">EcoWeb by OpenCi.life</a></p>
    </div>
    
    <!-- Javascript here load faster -->
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery-1.11.1.min.js"></script>
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/bootstrap.min.js"></script>
  </body>
</html>