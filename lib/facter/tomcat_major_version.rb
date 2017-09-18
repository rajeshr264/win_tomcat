Facter.add(:tomcat_major_version) do
  setcode do
    Facter.value(:tomcat_version).split('.')[0] unless tomcat_version.nil?
  end
end
