$ ->
  # Remove top padding
  $("body").css "padding-top", "0px"

  # Hide header
  $(".header-expanded").css "display", "none"

  # Hide side bar
  $(".sidebar-wrapper").css "display", "none"

  # Remove side paddings
  $(".page-sidebar-expanded").css
    "padding-left": "0px"
    "padding-right": "0px"

  # Hide right side bar
  $(".right-sidebar.right-sidebar-expanded").css "display", "none"

  # Hide new note form
  $(".new_note").css "display", "none"

  # Remove redundant space below the notes
  $(".issuable-discussion").css "height", ""

  # Wrap codes
  $("pre code").css "white-space", "pre-wrap"

  # Show guide
  if $("#gitlab-print-style").length is 0
    $ '<link/>',
      id: "gitlab-print-style"
      rel: "stylesheet"
      type: "text/css"
      href: chrome.extension.getURL 'src/style.css'
    .appendTo "head"

    guide = '<div id="gitlab-print-guide">Page content is coverted for printing. After printing, please reload the page to revert it.</div>'
    $("body").prepend guide
