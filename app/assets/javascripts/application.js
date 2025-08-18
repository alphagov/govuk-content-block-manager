//= require govuk_publishing_components/dependencies
//= require govuk_publishing_components/components/add-another
//= require govuk_publishing_components/components/copy-to-clipboard
//= require govuk_publishing_components/components/govspeak
//= require govuk_publishing_components/lib/cookie-functions

'use strict'
window.GOVUK.approveAllCookieTypes()
window.GOVUK.cookie('cookies_preferences_set', 'true', { days: 365 })
