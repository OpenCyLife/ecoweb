		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
      <div class="container">
      	<div id="contact">
      		<img src="/images/contact.svg" class="contactIcons"/> 
      		<a href="https://www.open-cy.life/" target=_blank style="text-decoration:none; outline: none">Contact</a>
      	</div>
        <p class="muted credit">&copy; 2019 | Mixed with <a href="http://getbootstrap.com/">Bootstrap v3.1.1</a> | Baked with <a href="http://jbake.org">JBake ${version}</a></p>
      </div>
    </div>
    
    <!-- Javascript here load faster -->
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery-1.11.1.min.js"></script>
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/bootstrap.min.js"></script>
  </body>
</html>