$(document).ready(function() {
  var numberOfQuestions = 1;

  $('.new_choice').on("click", function() {
    var last_choice = $('.choice')[$('.choice').length - 1];
    var numberOfChoices = $(last_choice).parent().find('input').length;
    $(last_choice).append('<input type="text" name="question'+numberOfQuestions+'[choice'+(numberOfChoices)+']" placeholder="enter choice"><br>');
  });

  $('#new_question').on("click", function() {
    numberOfQuestions++;
    $('#form').append('<div class="question"><input type="text" name="question'+(numberOfQuestions)+'" placeholder="enter question"><br><br><div class="choice"><input type="text" name="question'+(numberOfQuestions)+'[choice1]" placeholder="enter choice"><br></div><br></div>');
  });
});
