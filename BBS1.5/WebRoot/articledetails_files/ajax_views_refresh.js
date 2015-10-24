// $Id$

/**
 * Ajax glue Plugin
 *
 * @see http://drupal.org/project/ajax
 * @see irc://freenode.net/#drupy
 * @depends Drupal 6
 * @author jide
 *
 */

/**
 * Ajax Forms plugin
 * 
 * @param {String} hook
 * @param {Object} args
 * @return {Bool}
 */
Drupal.Ajax.plugins.ajax_views_refresh = function(hook, args) {
  if (hook === 'complete') {
    if (args.options.views_refresh === true) {
      if (Drupal.settings && Drupal.settings.views && Drupal.settings.views.ajaxViews) {
        var ajax_path = Drupal.settings.views.ajax_path;
        if (ajax_path.constructor.toString().indexOf("Array") != -1) {
          ajax_path = ajax_path[0];
        }
        $.each(Drupal.settings.views.ajaxViews, function(i, settings) {
          var view = '.view-dom-id-' + settings.view_dom_id;
          if (!$(view).size()) {
            view = '.view-id-' + settings.view_name + '.view-display-id-' + settings.view_display_id;
          }
            
          $(view).filter(function() {
              return !$(this).parents('.view').size();
            })
            .each(function() {
              var target = this;
              
              // Just use default settings
              $.ajax({
                url: ajax_path,
                type: 'GET',
                data: settings,
                success: function(response) {
                  if (response.__callbacks) {
                    $.each(response.__callbacks, function(i, callback) {
                     // Temporary remove the ajax-form class to avoid behavior to be attached twice (or the form would be sent twice).
                     $('.ajax-form').removeClass('ajax-form').addClass('ajax-form-temp');
                      eval(callback)(target, response);
                      $('.ajax-form-temp').addClass('ajax-form');
                    });
                  }
                },
                error: function() { alert(Drupal.t("An error occurred at @path.", {'@path': ajax_path})); },
                dataType: 'json'
              });
          });
        });
      }
    }
  }
}