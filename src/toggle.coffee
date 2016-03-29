# This script will be injected from background.coffee
# and invoked from revert button in the page
@gitlabPrintToggle = ->
  event = document.createEvent 'Event'
  event.initEvent 'gitlab-print-toggle'
  document.dispatchEvent event
