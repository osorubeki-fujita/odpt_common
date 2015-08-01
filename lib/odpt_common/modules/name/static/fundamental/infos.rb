module OdptCommon::Modules::Name::Static::Fundamental::Infos

  extend ::ActiveSupport::Concern

  module ClassMethods

    def instance_variable_names
      raise "The class method '#{ __method__ }' is not defined yet."
    end

  end

  def to_a
    self.class.instance_variable_names.map { | instance_variable_name | send( instance_variable_name ) }
  end

  def to_h
    h = ::Hash.new
    self.class.instance_variable_names.each do | instance_variable_name |
      h[ instance_variable_name ] = send( instance_variable_name )
    end
    h
  end

end
