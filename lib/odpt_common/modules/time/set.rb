module OdptCommon::Modules::Time::Set

  TYPES = [ :start_on , :end_on ]

  private

  def set_time_of( t , type: nil )
    if t.nil?
      return nil
    end

    raise "Error" unless ::OdptCommon::Modules::Time::Set::TYPES.include?( type )

    if t.instance_of?( ::Time ) or t.instance_of?( ::DateTime ) or t.nil?
      return t
    end

    if t.instance_of?( ::String ) and /\A(\d{4})\.(\d{1,2})\.(\d{2})\Z/ =~ t
      y , m , d = $1.to_i , $2.to_i , $3.to_i
      t = ::DateTime.new( y , m , d , ::TokyoMetro::DATE_CHANGING_HOUR )
      if type == :end_on
        t = t.tomorrow
      end

      return t
    end

    raise "Error: \'#{ t }\' (Class: #{ t.class.name }) is not valid."
  end

end
