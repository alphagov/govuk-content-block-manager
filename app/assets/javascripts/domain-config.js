'use strict'
window.GOVUK = window.GOVUK || {}
window.GOVUK.vars = window.GOVUK.vars || {}
window.GOVUK.vars.extraDomains = [
  {
    name: 'production',
    domains: ['content-block-manager.publishing.service.gov.uk'],
    initialiseGA4: true,
    id: 'GTM-xxx',
    gaProperty: 'UA-xxx'
  },
  {
    name: 'staging',
    domains: ['content-block-manager.staging.publishing.service.gov.uk'],
    initialiseGA4: false
  },
  {
    name: 'integration',
    domains: ['content-block-manager.integration.publishing.service.gov.uk'],
    initialiseGA4: true,
    id: 'GTM-xxx',
    auth: 'xxxx',
    preview: 'env-50'
  }
]
