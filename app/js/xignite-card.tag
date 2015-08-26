<xignite-card>
  <div class="flip-container" ontouchstart="this.classList.toggle('hover');">
    <div class="flipper">
      <div class="front">
        <!-- front content -->
        <div class="demo-card-square mdl-card mdl-shadow--2dp">  
          <div class="mdl-card__title mdl-card--expand">    
            <h1 class={midClassName} id="mid-{rate.Symbol}">{rate.Mid}</h1>
          </div>
          <div class="mdl-card__title">
              <h4 class="mdl-card__title-text">{rate.BaseCurrency} / {rate.QuoteCurrency}</h4>
          </div>
          <div class="mdl-card__supporting-text" style="text-align: right; color: rgb(3, 169, 244);">
            {rate.Date} {rate.Time}
          </div>
          <div class="mdl-card__supporting-text">
            {rate.Text}
          </div>
        </div>
      </div>
      <div class="back">
         <div class="demo-card-square mdl-card mdl-shadow--2dp">  
          <div class="mdl-card__title mdl-card--expand">    
            <h3>{rate.BaseCurrency} / {rate.QuoteCurrency}</h3>
          </div>
          <div class="mdl-card__supporting-text">    
            <div class="mdl-card__supporting-text-back">
              Bid: <b>{rate.Bid}</b><br/>
              Mid: <b>{rate.Mid}</b><br/>
              Ask: <b>{rate.Ask}</b> <br/>
              Spread: <b>{rate.Spread}</b><br/>
          </div>
            <span style="font-size: 70%; font-style: italic;">Source: {rate.Source}</span>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>

  <script>
    var self = this; 

    opts.bus.on(opts.currency, function(rate) {
      self.rate = rate;

      var oldMid = $("#mid-"+rate.Symbol).html();
      self.midClassName = (oldMid < rate.Mid)?"greenflash":"redflash";
      $("#mid-"+rate.Symbol).addTempClass(self.midClassName, 2000);

      self.update();
    });

    opts.bus.on("errorQuoteEvent", function(error) {
      console.log("Error: " + error);
    });
    
    /* Extend JQuery to remove temporarely a given class from element after duration */
    $.fn.addTempClass = function(tempClass, duration){
      if( !tempClass )
          return this;

      return this.each(function(){
          var $elm = $(this);

          $elm.addClass(tempClass);
          setTimeout(function(){
              $elm.removeClass(tempClass);
          }, duration || 100);
      });
    }
  </script>
</xignite-card>