# 路線名などを取得するためのメソッドを提供するモジュール
module OdptCommon::Modules::Name::Static::Fundamental::ForInspection

  [ :ja , :hira , :en ].each do | name_attr |
    eval <<-DEF
      def name_#{ name_attr }_inspect
        name_for_inspection( @name_#{ name_attr } )
      end
    DEF
  end

  private

  def name_for_inspection( var , arrow_nil: false )
    if var.instance_of?( ::Array )
      var.join( "/" )
    elsif var.instance_of?( ::String )
      var
    else
      str = var.try( :to_s )
      if str.present?
        str
      elsif arrow_nil
        nil
      else
        ""
      end
    end
  end

end
