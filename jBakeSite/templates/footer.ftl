		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
      <div class="container">
            <p class="poleTitle">Si vous voulez nous soutenir</p>
            <div class="centerFooter">
              <div class="donate">
                <img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/donation.svg" alt="donation" class="iconsPartners">
                  <div class="don">
                    <a href="https://www.helloasso.com/associations/open-cylife/adhesions/open-cylife-adhesion"
                      target="blank">Donation</a>
                    <a href="https://www.helloasso.com/associations/open-cylife/formulaires/1" target="blank">Pour faire un don,
                      c'est par ici</a>
                  </div>
              </div>
              <div class="donate">
                <img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>images/contact.svg" alt="Logo Contact" class="contactIcons"/> 
                <a class="don" href="mailto:frederic@open-cy.life" target=_blank style="text-decoration:none; outline: none">Contact</a>
              </div>
            </div>
      	
   
        <p class="muted credit">&copy; 2019 | Mixed with <a href="http://getbootstrap.com/">Bootstrap v3.1.1</a> | Baked with <a href="http://jbake.org">JBake ${version}</a></p>
      </div>
    </div>
    
    <!-- Javascript here load faster -->
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery-1.11.1.min.js"></script>
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/bootstrap.min.js"></script>
  </body>
</html>