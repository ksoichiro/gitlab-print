chrome.browserAction.onClicked.addListener(function(tab) {
  chrome.tabs.executeScript({ file: 'lib/jquery.min.js' }, function() {
    chrome.tabs.executeScript({ file: 'src/edit.js' }, function() {
    });
  });
});
