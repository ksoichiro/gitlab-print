$(function() {
  // Remove top padding
  $("body")[0].style.paddingTop = "0px";

  // Hide header
  var headers = $(".header-expanded");
  if (headers && 0 < headers.length) {
    headers[0].style.display = "none";
  }

  // Hide side bar
  var sidebars = $(".sidebar-wrapper");
  if (sidebars && 0 < sidebars.length) {
    sidebars[0].style.display = "none";
  }

  // Remove side paddings
  var containers = $(".page-sidebar-expanded");
  if (containers && 0 < containers.length) {
    var container = containers[0];
    container.style.paddingLeft = "0px";
    container.style.paddingRight = "0px";
  }

  // Hide right side bar
  var rightSidebars = $(".right-sidebar.right-sidebar-expanded");
  if (rightSidebars && 0 < rightSidebars.length) {
    rightSidebars[0].style.display = "none";
  }

  // Hide new note form
  var newNotes = $(".new_note");
  if (newNotes && 0 < newNotes.length) {
    newNotes[0].style.display = "none";
  }

  // Remove redundant space below the notes
  var issuableDiscussions = $(".issuable-discussion");
  if (issuableDiscussions && 0 < issuableDiscussions.length) {
    issuableDiscussions[0].style.height = '';
  }

  // Wrap codes
  codes = $("pre code");
  if (codes) {
    codes.each(function(i) {
      this.style.whiteSpace = "pre-wrap";
    });
  }

  // Show guide
  if ($("#gitlab-print-style").length === 0) {
    var printStyle =
      '<style type="text/css" id="gitlab-print-style">' +
      '@media print { ' +
      '  #gitlab-print-guide { ' +
      '    display: none; ' +
      '  } ' +
      '} ' +
      '@media screen { ' +
      '  #gitlab-print-guide { ' +
      '    height: 48px; ' +
      '    color: #fff; ' +
      '    background-color: #900; ' +
      '    text-align: center; ' +
      '    padding-top: 12px; ' +
      '    font-size: 1.1em; ' +
      '  } ' +
      '} ' +
      '</style>';
    $("head").append(printStyle);
    var guide = '<div id="gitlab-print-guide">Page content is coverted for printing. After printing, please reload the page to revert it.</div>';
    $("body").prepend(guide);
  }
});
