class OdptCommon::Required::All::Factory < OdptCommon::Required

  def self.other_files
    [ MetaProcessor.files , Design.files , Decorate.files ]
  end

end
