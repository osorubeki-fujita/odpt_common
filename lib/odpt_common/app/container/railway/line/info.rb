class OdptCommon::App::Container::Railway::Line::Info

  def initialize( obj )
    raise unless obj.instance_of?( ::Railway::Line::Info )
    @object = obj
  end

  attr_reader :object

  def is_branch_railway_line_info?
    ::Railway::Line::Relation.where( branch_railway_line_info_id: @object.id ).present?
  end

  def has_branch_railway_line_infos?
    ::Railway::Line::Relation.where( main_railway_line_info_id: @object.id ).present?
  end

  def ids_of_top_main_railway_line_infos
    _main_railway_line_infos = main_railway_line_infos
    if _main_railway_line_infos.present?
      _main_railway_line_infos.to_a.map { | item |
        item.ids_of_top_main_railway_line_infos
      }.flatten
    else
      [ @object.id ]
    end
  end

  def ids_of_upper_railway_line_infos
    ids_of_connected_infos( __method__ , main_railway_line_infos )
  end

  def ids_of_branch_railway_line_infos
    ids_of_connected_infos( __method__ , branch_railway_line_infos )
  end

  private

  def relation_infos_as_branch_railway_line
    @object.relation_infos_as_branch_railway_line
  end

  def main_railway_line_infos
    @object.main_railway_line_infos
  end

  def branch_railway_line_infos
    @object.branch_railway_line_infos
  end

  def ids_of_connected_infos( method_name , connected_infos )
    if connected_infos.present?
      ary = ::Array.new
      ary << connected_infos.pluck( :id ).sort
      connected_infos.each do | item |
        ary << item.send( method_name )
        ary.flatten!
        ary.sort!
      end
      ary
    else
      []
    end
  end

end
