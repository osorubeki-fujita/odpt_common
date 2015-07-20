class OdptCommon::Factory::Design::Fundamental::CssClass < OdptCommon::Factory::Design::Fundamental::MetaClass

  def initialize( object , method_for_making_str , header = nil )
    super( object )
    @method_for_making_str = method_for_making_str
    @header = header
  end

  def to_s
    str = basename

    str = str.gsub( / Line(?:r?)/ , "" )
    str = str.gsub( / Electric/ , "" )
    str = str.gsub( / service/ , "" )
    str = str.gsub( / Company\Z/ , "" )
    str = str.gsub( / Railway\Z/ , "" )
    str = str.gsub( / Corporation/ , "" )
    str = str.gsub( /[Ee]xpress/ , "exp" )
    str = str.gsub( /[\,\(\)]/ , "" )
    str = str.gsub( /[\- ]/ , "_" )
    str = str.gsub( /_{2,}/ , "_" )
    str = str.downcase

    if @header.present?
      "#{ header }_#{ str }"
    else
      str
    end
  end

  private

  def basename
    @object.send( @method_for_making_str )
  end

end
