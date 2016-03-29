converted = () -> $("#gitlab-print-style").length isnt 0

change = (target, key, value) ->
  $(target).attr "data-original-#{key}", $(target).css key
  $(target).css key, value

restore = (target, key) ->
  $(target).css key, $(target).attr "data-original-#{key}"
  $(target).removeAttr "data-original-#{key}"

hide = (target) -> change target, "display", "none"

show = (target) -> restore target, "display"

@toggle = ->
  if converted()
    restore "body", "padding-top"
    show ".header-expanded"
    show ".sidebar-wrapper"
    restore ".page-sidebar-expanded", "padding-left"
    restore ".page-sidebar-expanded", "padding-right"
    show ".right-sidebar.right-sidebar-expanded"
    show ".new_note.js-main-target-form"
    restore ".issuable-discussion", "height"
    restore "pre code", "white-space"

    $("#gitlab-print-style").remove()
    $("#gitlab-print-guide").remove()
    $("#gitlab-print-toggle").remove()
  else
    # Remove top padding
    change "body", "padding-top", "0px"

    # Hide header
    hide ".header-expanded"

    # Hide side bar
    hide ".sidebar-wrapper"

    # Remove side paddings
    change ".page-sidebar-expanded", "padding-left", "0px"
    change ".page-sidebar-expanded", "padding-right", "0px"

    # Hide right side bar
    hide ".right-sidebar.right-sidebar-expanded"

    # Hide new note form
    hide ".new_note.js-main-target-form"

    # Remove redundant space below the notes
    change ".issuable-discussion", "height", ""

    # Wrap codes
    change "pre code", "white-space", "pre-wrap"

    # Show guide
    $ '<link/>',
      id: "gitlab-print-style"
      rel: "stylesheet"
      type: "text/css"
      href: chrome.extension.getURL 'src/style.css'
    .appendTo "head"

    $ '<script></script>',
      id: "gitlab-print-toggle"
      type: "text/javascript"
      src: chrome.extension.getURL 'src/toggle.js'
    .appendTo "head"

    $ '<div/>',
      id: "gitlab-print-guide"
    .text "Page content is coverted for printing."
    .prependTo "body"

    $ '<a/>',
      href: "javascript:gitlabPrintToggle();"
    .text "Revert"
    .appendTo "#gitlab-print-guide"

# Add handler to invoke toggle(), only once
if !@.gitlabPrintToggleHandler
  @.gitlabPrintToggleHandler = (data) ->
    chrome.runtime.sendMessage "toggle"
  document.addEventListener "gitlab-print-toggle", @.gitlabPrintToggleHandler
