## octocatalog-diff

Automated build for octocatalog-diff. Provides automated tests for your puppet environment. This build is based on CentOS and uses ruby from the puppet-agent package from puppetlabs.
Currently the "latest" tag is based on CentOS 7, Puppet 5 and the latest available version of octocatalog-diff on rubygems.org.

# Usage

```
# docker run cmon2k/octocatalog-diff /opt/puppetlabs/puppet/bin/octocatalog-diff --help
Usage: catalog-diff -n <hostname> [-f <from environment>] [-t <to environment>]

    -n, --hostname HOSTNAME          Use PuppetDB facts from last run of hostname
        --basedir DIRNAME            Use an alternate base directory (git checkout of puppet repository)
    -f, --from FROM_BRANCH           Branch you are coming from
    -t, --to TO_BRANCH               Branch you are going to
        --from-catalog FILENAME      Use a pre-compiled catalog 'from'
        --to-catalog FILENAME        Use a pre-compiled catalog 'to'
        --bootstrap-script FILENAME  Bootstrap script relative to checkout directory
        --bootstrap-current          Run bootstrap script for the current directory too
        --debug-bootstrap            Print debugging output for bootstrap script
        --bootstrap-environment "key1=val1,key2=val2,..."
                                     Bootstrap script environment variables in key=value format
        --bootstrapped-from-dir DIRNAME
                                     Use a pre-bootstrapped 'from' directory
        --bootstrapped-to-dir DIRNAME
                                     Use a pre-bootstrapped 'to' directory
        --bootstrap-then-exit        Bootstrap from-dir and/or to-dir and then exit
        --[no-]color                 Enable/disable colors in output
    -o, --output-file FILENAME       Output results into FILENAME
        --output-format FORMAT       Output format: text,json,legacy_json
    -d, --[no-]debug                 Print debugging messages to STDERR
    -q, --[no-]quiet                 Quiet (no status messages except errors)
        --ignore "Type1[Title1],Type2[Title2],..."
                                     More resources to ignore in format type[title]
        --[no-]include-tags          Include changes to tags in the diff output
        --fact-file STRING           Override fact globally
        --to-fact-file STRING        Override fact for the to branch
        --from-fact-file STRING      Override fact for the from branch
        --save-catalog STRING        Save intermediate catalogs into files globally
        --to-save-catalog STRING     Save intermediate catalogs into files for the to branch
        --from-save-catalog STRING   Save intermediate catalogs into files for the from branch
        --cached-master-dir PATH     Cache bootstrapped origin/master at this path
        --master-cache-branch BRANCH Branch to cache
        --safe-to-delete-cached-master-dir PATH
                                     OK to delete cached master directory at this path
        --hiera-config STRING        Full or relative path to global Hiera configuration file globally
        --to-hiera-config STRING     Full or relative path to global Hiera configuration file for the to branch
        --from-hiera-config STRING   Full or relative path to global Hiera configuration file for the from branch
        --no-hiera-config            Disable hiera config file installation
        --hiera-path STRING          Path to hiera data directory, relative to top directory of repository globally
        --to-hiera-path STRING       Path to hiera data directory, relative to top directory of repository for the to branch
        --from-hiera-path STRING     Path to hiera data directory, relative to top directory of repository for the from branch
        --no-hiera-path              Do not use any default hiera path settings
        --hiera-path-strip STRING    Path prefix to strip when munging hiera.yaml globally
        --to-hiera-path-strip STRING Path prefix to strip when munging hiera.yaml for the to branch
        --from-hiera-path-strip STRING
                                     Path prefix to strip when munging hiera.yaml for the from branch
        --no-hiera-path-strip        Do not use any default hiera path strip settings
        --ignore-attr "attr1,attr2,..."
                                     Attributes to ignore
        --filters FILTER1[,FILTER2[,...]]
                                     Filters to apply
        --[no-]display-source        Show source file and line for each difference
        --[no-]validate-references "before,require,subscribe,notify"
                                     References to validate
        --[no-]compare-file-text     Compare text, not source location, of file resources
        --[no-]storeconfigs          Enable integration with puppetdb for collected resources
        --retry-failed-catalog N     Retry building a failed catalog N times
        --no-enc                     Disable ENC
        --enc PATH                   Path to ENC script, relative to checkout directory or absolute
        --from-enc PATH              Path to ENC script (for the from catalog only)
        --to-enc PATH                Path to ENC script (for the to catalog only)
        --[no-]display-detail-add    Display parameters and other details for added resources
        --[no-]truncate-details      Truncate details with --display-detail-add
        --no-header                  Do not print a header
        --default-header             Print default header with output
        --header STRING              Specify header for output
        --parser PARSER_NAME         Specify parser (default, future)
        --parser-from PARSER_NAME    Specify parser (default, future)
        --parser-to PARSER_NAME      Specify parser (default, future)
        --[no-]display-datatype-changes
                                     Display changes in data type even when strings match
        --[no-]catalog-only          Only compile the catalog for the "to" branch but do not diff
        --[no-]from-puppetdb         Pull "from" catalog from PuppetDB instead of compiling
        --[no-]parallel              Enable or disable parallel processing
        --puppet-binary STRING       Full path to puppet binary globally
        --to-puppet-binary STRING    Full path to puppet binary for the to branch
        --from-puppet-binary STRING  Full path to puppet binary for the from branch
        --facts-terminus STRING      Facts terminus: one of yaml, facter
        --puppetdb-token TOKEN       Token to access the PuppetDB API
        --puppetdb-token-file PATH   Path containing token for PuppetDB API, relative or absolute
        --puppetdb-url URL           PuppetDB base URL
        --puppetdb-ssl-ca FILENAME   CA certificate that signed the PuppetDB certificate
        --puppetdb-ssl-client-cert FILENAME
                                     SSL client certificate to connect to PuppetDB
        --puppetdb-ssl-client-key FILENAME
                                     SSL client key to connect to PuppetDB
        --puppetdb-ssl-client-password PASSWORD
                                     Password for SSL client key to connect to PuppetDB
        --puppetdb-ssl-client-password-file FILENAME
                                     Read password for SSL client key from a file
        --puppetdb-api-version N     Version of PuppetDB API (3 or 4)
        --fact-override STRING1[,STRING2[,...]]
                                     Override fact globally
        --to-fact-override STRING1[,STRING2[,...]]
                                     Override fact for the to branch
        --from-fact-override STRING1[,STRING2[,...]]
                                     Override fact for the from branch
        --puppet-master STRING       Hostname or Hostname:PortNumber for Puppet Master globally
        --to-puppet-master STRING    Hostname or Hostname:PortNumber for Puppet Master for the to branch
        --from-puppet-master STRING  Hostname or Hostname:PortNumber for Puppet Master for the from branch
        --puppet-master-api-version STRING
                                     Puppet Master API version (2 for Puppet 3.x, 3 for Puppet 4.x) globally
        --to-puppet-master-api-version STRING
                                     Puppet Master API version (2 for Puppet 3.x, 3 for Puppet 4.x) for the to branch
        --from-puppet-master-api-version STRING
                                     Puppet Master API version (2 for Puppet 3.x, 3 for Puppet 4.x) for the from branch
        --puppet-master-ssl-ca STRING
                                     Full path to CA certificate that signed the Puppet Master certificate globally
        --to-puppet-master-ssl-ca STRING
                                     Full path to CA certificate that signed the Puppet Master certificate for the to branch
        --from-puppet-master-ssl-ca STRING
                                     Full path to CA certificate that signed the Puppet Master certificate for the from branch
        --puppet-master-ssl-client-cert STRING
                                     Full path to certificate file for SSL client auth to Puppet Master globally
        --to-puppet-master-ssl-client-cert STRING
                                     Full path to certificate file for SSL client auth to Puppet Master for the to branch
        --from-puppet-master-ssl-client-cert STRING
                                     Full path to certificate file for SSL client auth to Puppet Master for the from branch
        --puppet-master-ssl-client-key STRING
                                     Full path to key file for SSL client auth to Puppet Master globally
        --to-puppet-master-ssl-client-key STRING
                                     Full path to key file for SSL client auth to Puppet Master for the to branch
        --from-puppet-master-ssl-client-key STRING
                                     Full path to key file for SSL client auth to Puppet Master for the from branch
        --enc-override STRING1[,STRING2[,...]]
                                     Override parameter from ENC globally
        --to-enc-override STRING1[,STRING2[,...]]
                                     Override parameter from ENC for the to branch
        --from-enc-override STRING1[,STRING2[,...]]
                                     Override parameter from ENC for the from branch
        --puppet-master-timeout STRING
                                     Puppet Master catalog retrieval timeout in seconds globally
        --to-puppet-master-timeout STRING
                                     Puppet Master catalog retrieval timeout in seconds for the to branch
        --from-puppet-master-timeout STRING
                                     Puppet Master catalog retrieval timeout in seconds for the from branch
        --pe-enc-url URL             Base URL for Puppet Enterprise ENC endpoint
        --pe-enc-token TOKEN         Token to access the Puppet Enterprise ENC API
        --pe-enc-token-file PATH     Path containing token for PE node classifier, relative or absolute
        --pe-enc-ssl-ca FILENAME     CA certificate that signed the ENC API certificate
        --pe-enc-ssl-client-cert FILENAME
                                     SSL client certificate to connect to PE ENC
        --pe-enc-ssl-client-key FILENAME
                                     SSL client key to connect to PE ENC
        --override-script-path DIRNAME
                                     Directory with scripts to override built-ins
        --no-ignore-tags             Disable ignoring based on tags
        --ignore-tags STRING1[,STRING2[,...]]
                                     Specify tags to ignore
        --[no-]preserve-environments Enable or disable environment preservation
        --environment STRING         Environment for catalog compilation globally
        --to-environment STRING      Environment for catalog compilation for the to branch
        --from-environment STRING    Environment for catalog compilation for the from branch
        --create-symlinks STRING1[,STRING2[,...]]
                                     Symlinks to create globally
        --to-create-symlinks STRING1[,STRING2[,...]]
                                     Symlinks to create for the to branch
        --from-create-symlinks STRING1[,STRING2[,...]]
                                     Symlinks to create for the from branch
        --command-line STRING1[,STRING2[,...]]
                                     Command line arguments globally
        --to-command-line STRING1[,STRING2[,...]]
                                     Command line arguments for the to branch
        --from-command-line STRING1[,STRING2[,...]]
                                     Command line arguments for the from branch
        --pass-env-vars VAR1[,VAR2[,...]]
                                     Environment variables to pass
        --[no-]suppress-absent-file-details
                                     Suppress certain attributes of absent files
    -v, --version                    Show version information about this program and quit.

```

# More information

See https://github.com/github/octocatalog-diff
