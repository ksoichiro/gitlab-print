chrome.browserAction.onClicked.addListener (tab) ->
  chrome.tabs.executeScript { file: 'lib/jquery.min.js' }, ->
    chrome.tabs.executeScript { file: 'src/edit.js' }
