Drupal.behaviors.javaSearch = function (context) {

// Search Kenai  
  $('#search-theme-form').submit(function() {
    var searchValue = $('#search-theme-form .form-text').val().split(" ").join("+");
    var kenaiPeopleUri = 'https://beta.java.net/people?search_text=' + searchValue + '&commit=search';
    var kenaiProjectUri = 'https://beta.java.net/projects?q=' + searchValue + '&commit=search';
    $('#search-theme-form #edit-people:checked').parents('#search-theme-form').attr('action', kenaiPeopleUri);    
    $('#search-theme-form #edit-projects:checked').parents('#search-theme-form').attr('action', kenaiProjectUri);    
  });

  $('#project-search-form').submit(function() {
    var kenaiProjectSectionValue = $('#project-search-form .form-text').val().split(" ").join("+");
    var kenaiProjectSectionStr = 'https://beta.java.net/projects?q=' + kenaiProjectSectionValue + '&commit=search';
    $('#project-search-form').attr('action', kenaiProjectSectionStr);
  });

// Force Single-Selection of Radios
  $('#search-theme-form .checks input').click(function() {
    $(this).parent().siblings().children('input').attr('checked', false);
  });

// Change search field value
  $('#search-theme-form .checks input[value="forum"]').click(function() {
    if($('#edit-search-theme-form-1').attr('value')=='Search Forums') {
      $('#edit-search-theme-form-1').attr('value', 'Search All');      
    } else {
      $('#edit-search-theme-form-1').attr('value', 'Search Forums')
    };
  });
  $('#search-theme-form .checks input[value="blog"]').click(function() {
    if($('#edit-search-theme-form-1').attr('value')=='Search Blogs') {
      $('#edit-search-theme-form-1').attr('value', 'Search All');
    } else {
      $('#edit-search-theme-form-1').attr('value', 'Search Blogs');
    }
  });
  $('#search-theme-form .checks input[value="project"]').click(function() {
    if($('#edit-search-theme-form-1').attr('value')=='Search Projects') {
      $('#edit-search-theme-form-1').attr('value', 'Search All');
    } else {
      $('#edit-search-theme-form-1').attr('value', 'Search Projects');
    };
  });
  $('#search-theme-form .checks input[value="people"]').click(function() {
    if($('#edit-search-theme-form-1').attr('value')=='Search People') {
      $('#edit-search-theme-form-1').attr('value', 'Search All');
    } else {
      $('#edit-search-theme-form-1').attr('value', 'Search People');
    };
  }); 
}
