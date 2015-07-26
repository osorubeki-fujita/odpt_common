class OdptCommon::Required::All::Factory::Decorate < OdptCommon::Required

  def self.other_files
    ::File.join( top_file , "current_path" )
  end

end
