jQuery(document).ready(function() {
	jQuery(".slideshow").responsiveSlides({
		  auto: true,             // Boolean: Animate automatically, true or false
		  speed: 400,            // Integer: Speed of the transition, in milliseconds
		  timeout: 2500,          // Integer: Time between slide transitions, in milliseconds
		  pager: true,           // Boolean: Show pager, true or false
		  nav: false,             // Boolean: Show navigation, true or false
		  random: true,          // Boolean: Randomize the order of the slides, true or false
		  pause: true,           // Boolean: Pause on hover, true or false
		  pauseControls: true,    // Boolean: Pause when hovering controls, true or false
		  prevText: "Précédent",   // String: Text for the "previous" button
		  nextText: "Suivant",       // String: Text for the "next" button
		  maxwidth: "",           // Integer: Max-width of the slideshow, in pixels
		  navContainer: "",       // Selector: Where controls should be appended to, default is after the 'ul'
		  manualControls: "",     // Selector: Declare custom pager navigation
		  namespace: "rslides",   // String: Change the default namespace used
		  before: function(){},   // Function: Before callback
		  after: function(){}     // Function: After callback
	});
});
