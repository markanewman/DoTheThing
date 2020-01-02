# Excel to Azure SQL via Azure Active Directory

1. Make sure the server is configured for [AAD access](#aad-not-configured).
2. Make sure the firewall is set to allow access to [your IP](#ip-not-configured).
3. Validate that [SSMS][ssms] (v17.3+ required) can connect using [SQL credentials](#ssms-sql-auth).
4. Validate that [SSMS][ssms] (v17.3+ required) can connect using [Azure AD credentials](#ssms-aad-auth).
    * master DB: CREATE USER [AAD Group] FROM EXTERNAL PROVIDER;
    * user DB: CREATE USER [AAD Group] FROM EXTERNAL PROVIDER;
    * user DB: exec sp_addrolemember 'db_datareader', 'AAD Group'
5. Validate that [Excel][excel] can [connect](#excel-connection) using [SQL credentials](#excel-sql-auth).
6. Connect using [Excel][excel] using [Azure AD credentials](#excel-aad-auth).

# Images

<a name="aad-not-configured" />

![Not Configured](no-aad-configured.jpg?raw=true)
Azure AD _not_ configured

<a name="ip-not-configured" />

![Not Configured](no-ip-configured.jpg?raw=true)
IP _not_ configured

<a name="ssms-sql-auth" />

![Not Configured](ssms-sql-auth.jpg?raw=true)
Sql Auth to Azure SQL in [SSMS][ssms]

<a name="ssms-aad-auth" />

![Not Configured](ssms-aad-auth.jpg?raw=true)
AAD Auth to Azure SQL in [SSMS][ssms]

<a name="excel-connection" />

![Not Configured](excel-connection-1.jpg?raw=true)
![Not Configured](excel-connection-2.jpg?raw=true)
Connection path to the right screen.

<a name="excel-sql-auth" />

![Not Configured](excel-sql-auth.jpg?raw=true)
Sql Auth to Azure SQL in [Excel][excel]

<a name="excel-aad-auth" />

![Not Configured](excel-aad-auth.jpg?raw=true)
AAD Auth to Azure SQL in [Excel][excel]

[ssms]: https://docs.microsoft.com/en-us/sql/ssms/sql-server-management-studio-changelog-ssms?view=sql-server-2017
[excel]: https://products.office.com/en-us/compare-all-microsoft-office-products-b
