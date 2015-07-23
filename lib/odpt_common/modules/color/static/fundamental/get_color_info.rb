module OdptCommon::Modules::Color::Static::Fundamental::GetColorInfo

  private

  def get_hex_color_of( var )
    var.hex_color
  end

  def get_rgb_color_in_parentheses_of( var )
    var.to_s_rgb_color_in_parentheses
  end

  [ :red , :green , :blue ].each do | color_element |
    eval <<-DEF
      def get_#{ color_element }_element_of( var )
        var.#{ color_element }
      end
    DEF
  end

end
