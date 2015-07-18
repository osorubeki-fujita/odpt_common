class OdptCommon::Required::All < OdptCommon::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    Modules.files
  end

  def self.ignored_files
    top_file
  end

end
