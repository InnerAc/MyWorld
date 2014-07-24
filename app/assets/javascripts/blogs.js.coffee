# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 $(document).on 'page:load', ->
    if $('blog_content').length > 0
      KindEditor.create 'blog_content', "width":"80%", "height":600, "allowFileManager":true, "uploadJson":"/kindeditor/upload", "fileManagerJson":"/kindeditor/filemanager"