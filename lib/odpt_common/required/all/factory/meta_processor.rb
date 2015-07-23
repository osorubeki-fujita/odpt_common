class OdptCommon::Required::All::Factory::MetaProcessor < OdptCommon::Required

  def self.other_files
    ::File.join( top_file , "for_process" )
  end

end
