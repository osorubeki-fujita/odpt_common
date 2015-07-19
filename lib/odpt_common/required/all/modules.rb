class OdptCommon::Required::All::Modules < OdptCommon::Required

  def self.other_files
    [
      MethodMissing.files ,
      Time.files ,
      #
      Dictionary.files ,
      Decision.files ,
      ToFactory.files
      #
      # Fundamental.files
    ]
  end

end
