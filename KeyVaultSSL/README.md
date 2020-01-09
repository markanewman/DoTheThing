# Auto Renewing SSL certs

This walkthrough is intended to allow [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/) to auto renewing SSL certs on [Azure App Services](https://docs.microsoft.com/en-us/azure/app-service/)

## Similar paths

[Add an SSL certificate in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/configure-ssl-certificate)
* The certificate created in this walkthrough has less options available.

## Prerequisites

* An App Service configured to use a [custom domain](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-domain)
* An account on one of the two integrated CAs: [DigiCert](https://www.digicert.com/azure-key-vault/) or [GlobalSign](https://www.globalsign.com/en/lp/certificates-for-azure-key-vault/)
  I use GlobalSign.

## Steps

1. [Generate your cert](#generate-cert)
   * Go to your key vault.
     Select "Certificates".
	 Select "Generate/Import".
	* Fill out the "Certificate Name" and "Subject" fields
	* Select "Certificate issued by in integrated CA"
	  * The first time you select this option, you will need to [configure the CA](#configure-ca).	    
	* The "DNS Names" field is used to add in Subject Alternitive Names (SANs).
	  This allows you to have a single certificate for multipule related sites i.e. www + api.
	  This is a feature not available in the basic walkthrough above.
	* Make sure you are on one of the "Automatically renew" options.
	* [Organization validation](https://en.wikipedia.org/wiki/Public_key_certificate#Organization_validation) and [Extended validation](https://en.wikipedia.org/wiki/Extended_Validation_Certificate) certs are available in the "Advanced Configuration" selector
2. Run the ARM template to link key vault to the app service
   * Gather the below names
     * Subscription name
       **Note**: The key vault and the app service _must_ be in the same subscription.
	 * The resource group name for the key vault
	 * The key vault name
	 * The certficate name
	 * The [resource group name](#app-service-names) for the app service
	 * The service plan name.
   * Run the PowerShell script
   ```{ps1}
   Login-AzureRmAccount
   Set-AzureRmContext -SubscriptionName "{{subscription name}}"
   
   New-AzureRMResourceGroupDeployment `	
	-Name 'Link_SSL_From_KV' `
	-Mode 'Incremental' `
	-TemplateFile './template.json' `
	-keyVaultResourceGroupName '{{key vault resource group name}}' `
	-keyVaultName '{{key vault name}}' `
	-certName '{{cert name}}' `	
	-ResourceGroupName '{{app service resource group name}}' `
	-appServicePlanName '{{app service plan name}}' `
	-verbose
   ```
3. Make sure [thumbprints match](#thumbprints-match) between key vault and app services and web site

## Images

<a name="generate-cert" />
Generate your cert

![Generate your cert 1 of 2](generate-cert-1.jpg?raw=true)

![Generate your cert 2 of 2](generate-cert-2.jpg?raw=true)

<a name="configure-ca" />
Configure your certificate authority

![Configure your certificate authority](configure-ca.jpg?raw=true)

<a name="app-service-names" />
App Service Names

![App Service Names](app-service-names.jpg?raw=true)

<a name="thumbprints-match" />
Thumbprints match

![Thumbprints match](thumbprints-match.jpg?raw=true)

