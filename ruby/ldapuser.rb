#
# Ldap auth with a user
#

require "rubygems"
require "net/ldap"

class User
  BASE = 'dc=domain,dc=com'
  LDAP_USER='cn=admin,dc=domain,dc=com'
  LDAP_PASSWORD='yourPassw0rd1'
  
  def self.authenticate(email, password)
    email_filter = NET::LDAP::Filter.eq('mail', email)
    ldap_con = connect (LDAP_USER, LDAP_PASSWORD)
    dn = ''
    ldap_con.search(:base => BASE, :filter => email_filter) do |entry|
      dn = entry.dn
    end
    !dn.empty? and connect (dn,password).bind
  end
  
  private
  
  # connect to an encrypted SSL ldap server with simple sasl binding
  def self.connect(dn, password)
    NET::LDAP.new (
      :host => "localhost",
      :port => 636,
      :auth => {
        :method => simple,
        :username => dn,
        :password => password
      },
      :encryption => :simple_tls
    })
  end