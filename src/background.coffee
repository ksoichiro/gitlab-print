injectScripts = (tab, cb) ->
  id = "#{tab.id}"
  if @.gitlabPrintScriptsInjected?[id]
    cb()
  else
    @.gitlabPrintScriptsInjected = {}
    if tab.id isnt -1
      @.gitlabPrintScriptsInjected[id] = true
    chrome.tabs.executeScript { file: 'lib/jquery.min.js' }, ->
      chrome.tabs.executeScript { file: 'src/edit.js' }, -> cb()

toggle = -> chrome.tabs.executeScript { code: 'toggle();' }

chrome.browserAction.onClicked.addListener (tab) ->
  injectScripts tab, toggle

chrome.runtime.onMessage.addListener (message, sender, sendResponse) ->
  toggle() if message is 'toggle'
