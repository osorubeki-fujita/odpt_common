class OdptCommon::Required < RequiredFiles::MetaClass

  class << self

    private

    def settings_for_auto_loading
      {
        namespace: ::OdptCommon::Required::All ,
        filename: ::File.join( ::OdptCommon::LIB_DIR , "odpt_common" )
      }
    end

  end

end
