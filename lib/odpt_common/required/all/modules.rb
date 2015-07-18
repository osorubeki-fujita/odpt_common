class OdptCommon::Required::All::Modules < OdptCommon::Required

  def self.other_files
    [
      MethodMissing.files ,
      Time.files ,
      #
      ToFactory.files
    ]
  end

end
