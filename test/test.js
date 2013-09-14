(function() {
  var counter = 0;

  $(function() {
    $('#button').click(function() {
      var spinnerHelper = new SpinnerHelper($(this));

      setTimeout(function() {
        spinnerHelper.destroy();

        $('#output').text(counter);
        counter++;
      }, 1000);
    });
  });
})();
