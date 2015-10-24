Drupal.behaviors.myModule = function(context) {
// ADD UPDATED ICONS ON FORUMS CONTROL PANEL PAGES 
  $('.view-myquestions td.views-field-timestamp .marker', context).attr('style', 'display: none;').parent().attr('style', 'background: url(/sites/all/modules/advanced_forum/styles/naked/images/forum-folder-new-posts.png) center 2px no-repeat;');

  $('.view-mycontent td.views-field-timestamp .marker', context).attr('style', 'display: none;').parent().attr('style', 'background: url(/sites/all/modules/advanced_forum/styles/naked/images/forum-folder-new-posts.png) center 2px no-repeat;');

  $('.view-mysubscriptions td.views-field-timestamp .marker', context).attr('style', 'display: none;').parent().attr('style', 'background: url(/sites/all/modules/advanced_forum/styles/naked/images/forum-folder-new-posts.png) center 2px no-repeat;');

// ADD QUESTION ANSWERED ICONS TO MY QUESTIONS
  $('.view-myquestions td.views-field-field-isanswered-value').not(":empty").attr('style', 'background: url("/sites/all/themes/java/images/question-answered.png") no-repeat scroll center 2px transparent;').empty();

// ADD FORUM NAVIGATION
  var forumNavigation = $('.forum-topic-navigation').html();
  var forumNavigationHtml = '<div class="forum-topic-nav">' + forumNavigation + '</div>';
  if (forumNavigation != null) {
    $('#content').prepend(forumNavigationHtml);
  }
}
