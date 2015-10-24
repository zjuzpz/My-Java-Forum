Drupal.behaviors.javaCustom = function(context) {

// Add jsenabled body class
  $('body').addClass('jsenabled');

// set lightframe height
  var wheight = $(window).height();
  var lbheight = wheight - 155;
  $('.section-jugs a.lightbox-processed').attr('rel', 'lightframe[group|width: 900px; height: ' + lbheight + 'px;]');

// Remove link items with no class (array)
/*  $('ul.links li').each(function() {
    if($(this).attr('class')=='') {
      $(this).css('display', 'none');
    };
  });
*/
// Add class to input text fields if no class set
  $('input[type="text"]').each(function() {
    if($(this).attr('class')=='') {
      $(this).addClass('form-text');
    };
  });

// Project form modifications
  $('.article-type-project #node-form select#edit-field-license-value option:not(:selected)').remove(); 
  $('.article-type-project #node-form select#edit-field-license-value').css({'background' : '#f3f3f3', 'border-color' : '#ccc'});
  $('.article-type-project #node-form #edit-title-wrapper input, .article-type-project #node-form #edit-field-parentproject-0-value-wrapper input, .article-type-project #node-form #edit-field-short-description-0-value-wrapper textarea, .article-type-project #node-form #edit-taxonomy-tags-10-wrapper input').attr('readonly', 'readonly').css({'background' : '#f3f3f3', 'border-color' : '#ccc'});
  if($('#edit-field-parentproject-0-value-wrapper input').attr('value')=='') {
    $('#edit-field-parentproject-0-value-wrapper input').attr('value', 'no parent');
  } 

// Projects workflow radios
  $('#edit-workflow-6-wrapper').append('<div class="description">This is the default state for newly created projects.  Pending projects are not visible in the project catalog.</div>');
  $('#edit-workflow-13-wrapper').append('<div class="description">The “staging” state is used to temporarily “hide” projects from public view.  Though the project is hidden, if a user knows the URL they can access the project space.</div>');
  $('#edit-workflow-8-wrapper').append('<div class="description">Some communities use an incubation system.  Projects placed in “incubator” are visible to the public and annotated as incubating.  The owner is sent an email when you place a project in an incubator.</div>');
  $('#edit-workflow-9-wrapper').append('<div class="description">Published projects are the standard state on Java.net.  This means the project is visible in the catalog.  Changing state to “published” will generate an email to the owner congratulating them.  If a project is moved from “incubating” to “published” a special email message will be sent congratulating them for “graduating”.</div>');
  $('#edit-workflow-10-wrapper').append('<div class="description">Archived projects are visible to the public.  They are a special categorization of projects that are no longer active, but that might be of use to the general public.</div>');
  $('#edit-workflow-12-wrapper').append('<div class="description">Projects marked for deletion are hidden from public view.  Eventually the project catalog entry and the associated project will be deleted from the site.</div>');

// Calendar: add "has-events" class to week and day view
  $('.week-view .calendar-agenda-items .view-item, .day-view .calendar-agenda-items .view-item').parents('td.calendar-agenda-items').addClass('has-events');  

// Community Trigger
  $('.community-info-trigger img').click(function() {
    $(this).parent().siblings('.description').toggle('fast');
  }).parent().parent().mouseleave(function() {
    $(this).children('.description').hide('fast');
  });

// Community Toolbar Show/Hide
  $('.hide-toolbar span').click(function() {
    $(this).parent('.hide-toolbar').hide('fast');
    $('.show-toolbar').show('fast');
    $('#community-nav').slideUp('800');
    $('#columns').attr('style', 'margin-top: 13px;');
  });
  $('.show-toolbar span').click(function() {
    $(this).parent('.show-toolbar').hide('fast');
    $('.hide-toolbar').show('fast');
    $('#community-nav').slideDown('800');
    $('#columns').attr('style', 'margin-top: 0;');
  });
 $('.hide-toolbar span').hover(function() { 
   $(this).css('cursor','pointer'); 
  }, function() { 
  $(this).css('cursor','auto'); 
 }); 
 $('.show-toolbar span').hover(function() { 
   $(this).css('cursor','pointer'); 
  }, function() { 
  $(this).css('cursor','auto'); 
 });

// Community Show More/Less
  $(function() {     
    $(".moreLess").hide();
     
    $(".moreLessSwitch").toggle(function() {             
        $(this).html("<span class=\"showLessLink\">[-] Show Less</span>");            
        $(this).prevAll(".moreLess").slideDown();         
    }, function() {            
        $(this).html("<span class=\"showMoreLink\">[+] Show More</span>");            
        $(this).prevAll(".moreLess").slideUp();        
    }); 
  });
  $('.showLessLink').css('cursor', 'pointer');
  $('.showMoreLink').css('cursor', 'pointer');

// Count chars
$('#edit-submitted-javaone-2013-comunity-theme')
  .on('focus', function(){
    var count = max - document.getElementById(edit-submitted-javaone-2013-comunity-theme).value.length;
    if (count < 0) {
      document.getElementById(counter).innerHTML = "<span style=\"color: red;\">" + count + "</span>";
    } else { 
      document.getElementById(counter).innerHTML = count;
    }
  })
  .on('blur', function(){
    var count = max - document.getElementById(edit-submitted-javaone-2013-comunity-theme).value.length;
    if (count < 0) {
      document.getElementById(counter).innerHTML = "<span style=\"color: red;\">" + count + "</span>";
    } else { 
      document.getElementById(counter).innerHTML = count;
    }
  });


        $.fn.textareaCount = function(options, fn) {
                var defaults = {
                        maxCharacterSize: -1,
                        originalStyle: 'originalTextareaInfo',
                        warningStyle: 'warningTextareaInfo',
                        warningNumber: 20,
                        displayFormat: '#input characters | #words words'
                };
                var options = $.extend(defaults, options);

                var container = $(this);

                $("<div class='charleft'>&nbsp;</div>").insertAfter(container);

                //create charleft css
                var charLeftCss = {
                        'width' : container.width()
                };

                var charLeftInfo = getNextCharLeftInformation(container);
                charLeftInfo.addClass(options.originalStyle);
                charLeftInfo.css(charLeftCss);

                var numInput = 0;
                var maxCharacters = options.maxCharacterSize;
                var numLeft = 0;
                var numWords = 0;

                container.bind('keyup', function(event){limitTextAreaByCharacterCount();})
                                 .bind('mouseover', function(event){setTimeout(function(){limitTextAreaByCharacterCount();}, 10);})
                                 .bind('paste', function(event){setTimeout(function(){limitTextAreaByCharacterCount();}, 10);});

                function limitTextAreaByCharacterCount(){
                        charLeftInfo.html(countByCharacters());
                        //function call back
                        if(typeof fn != 'undefined'){
                                fn.call(this, getInfo());
                        }
                        return true;
                }

                function countByCharacters(){
                        var content = container.val();
                        var contentLength = content.length;

                        //Start Cut
                        if(options.maxCharacterSize > 0){
                                //If copied content is already more than maxCharacterSize, chop it to maxCharacterSize.
                                if(contentLength >= options.maxCharacterSize) {
                                        content = content.substring(0, options.maxCharacterSize);
                                }

                                var newlineCount = getNewlineCount(content);

                                // newlineCount new line character. For windows, it occupies 2 characters
                                var systemmaxCharacterSize = options.maxCharacterSize - newlineCount;
                                if (!isWin()){
                                         systemmaxCharacterSize = options.maxCharacterSize
                                }
                                if(contentLength > systemmaxCharacterSize){
                                        //avoid scroll bar moving
                                        var originalScrollTopPosition = this.scrollTop;
                                        container.val(content.substring(0, systemmaxCharacterSize));
                                        this.scrollTop = originalScrollTopPosition;
                                }
                                charLeftInfo.removeClass(options.warningStyle);
                                if(systemmaxCharacterSize - contentLength <= options.warningNumber){
                                        charLeftInfo.addClass(options.warningStyle);
                                }

                                numInput = container.val().length + newlineCount;
                                if(!isWin()){
                                        numInput = container.val().length;
                                }

                                numWords = countWord(getCleanedWordString(container.val()));

                                numLeft = maxCharacters - numInput;
                        } else {
                                //normal count, no cut
                                var newlineCount = getNewlineCount(content);
                                numInput = container.val().length + newlineCount;
                                if(!isWin()){
                                        numInput = container.val().length;
                                }
                                numWords = countWord(getCleanedWordString(container.val()));
                        }

                        return formatDisplayInfo();
                }

                function formatDisplayInfo(){
                        var format = options.displayFormat;
                        format = format.replace('#input', numInput);
                        format = format.replace('#words', numWords);
                        //When maxCharacters <= 0, #max, #left cannot be substituted.
                        if(maxCharacters > 0){
                                format = format.replace('#max', maxCharacters);
                                format = format.replace('#left', numLeft);
                        }
                        return format;
                }

                function getInfo(){
                        var info = {
                                input: numInput,
                                max: maxCharacters,
                                left: numLeft,
                                words: numWords
                        };
                        return info;
                }

                function getNextCharLeftInformation(container){
                                return container.next('.charleft');
                }

                function isWin(){
                        var strOS = navigator.appVersion;
                        if (strOS.toLowerCase().indexOf('win') != -1){
                                return true;
                        }
                        return false;
                }

                function getNewlineCount(content){
                        var newlineCount = 0;
                        for(var i=0; i<content.length;i++){
                                if(content.charAt(i) == '\n'){
                                        newlineCount++;
                                }
                        }
                        return newlineCount;
                }

                function getCleanedWordString(content){
                        var fullStr = content + " ";
                        var initial_whitespace_rExp = /^[^A-Za-z0-9]+/gi;
                        var left_trimmedStr = fullStr.replace(initial_whitespace_rExp, "");
                        var non_alphanumerics_rExp = rExp = /[^A-Za-z0-9]+/gi;
                        var cleanedStr = left_trimmedStr.replace(non_alphanumerics_rExp, " ");
                        var splitString = cleanedStr.split(" ");
                        return splitString;
                }

                function countWord(cleanedWordString){
                        var word_count = cleanedWordString.length-1;
                        return word_count;
                }
        }

}


