module OTX
  #
  # Pulse Indicator of Compromise (IoC) records
  #
  # @attr [String] id IoC record ID value
  # @attr [String] _id IoC record ID value
  # @attr [String] indicator Value of the indicator type
  # @attr [String] type Type of IoC
  # @attr [String] description Description associated with the IoC
  # @attr [String] title
  # @attr [String] content
  # @attr [String] is_active value 0 or 1 if active
  # @attr [String] role
  # @attr [String] observations
  # @attr [String] created Date record was created
  # @attr [String] expiration
  # @attr [Array] access_groups
  # @attr [String] access_reason
  # @attr [String] access_type
  #
  # Indicator of Compromise types:
  #   IPv4 - An IPv4 address indicating the online location of a server or other computer.
  #   IPv6 - An IPv6 address indicating the online location of a server or other computer.
  #   domain - A domain name for a website or server. Domains encompass a series of hostnames.
  #   hostname - The hostname for a server located within a domain.
  #   email - An email associated with suspicious activity.
  #   URL - Uniform Resource Location (URL) summarizing the online location of a file or resource.
  #   URI - Uniform Resource Indicator (URI) describing the explicit path to a file hosted online.
  #   FileHash-MD5 - A MD5-format hash that summarizes the architecture and content of a file.
  #   FileHash-SHA1 - A SHA-format hash that summarizes the architecture and content of a file.
  #   FileHash-SHA256 - A SHA-256-format hash that summarizes the architecture and content of a file.
  #   FileHash-PEHASH - A PEPHASH-format hash that summarizes the architecture and content of a file.
  #   FileHash-IMPHASH - An IMPHASH-format hash that summarizes the architecture and content of a file.
  #   CIDR - Classless Inter-Domain Routing (CIDR) address, which describes both a server's IP address and the network architecture (routing path) surrounding that server.
  #   FilePath - A unique location in a file system.
  #   Mutex - The name of a mutex resource describing the execution architecture of a file.
  #   CVE - Common Vulnerability and Exposure (CVE) entry describing a software vulnerability that can be exploited to engage in malicious activity.
  #
  class Indicators < OTX::Type::Base
    attr_accessor :id, :_id, :indicator, :type, :description, :title, :content, :is_active, :access_reason, :access_type, :access_groups,
    :expiration, :observations, :role, :created
  end
end
