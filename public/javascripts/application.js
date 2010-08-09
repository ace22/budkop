var Application = {

  setupTooltip: function() {
    $('.tip').tooltip({
      position: 'top center',
      offset: [9, 0],
      effect: 'fade',
      opacity: 0.95,
      tip: '.tooltip'
    })
  },

  setup: function() {
    this.setupTooltip()
  }

};

$(function(){
  Application.setup()
});
