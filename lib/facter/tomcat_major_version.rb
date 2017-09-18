Facter.add(:tomcat_major_version) do
  setcode do
    tomcat_version = Facter.value(:tomcat_version)
    major_version = tomcat_version.split('.')[0] unless tomcat_version.nil?
  end
end
