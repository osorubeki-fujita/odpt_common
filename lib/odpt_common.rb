require "odpt_common/version"

require "positive_support"

require "odpt_common/calc_time"
require "odpt_common/string_ext"

module OdptCommon

  extend ::ActiveSupport::Concern

  LIB_DIR = ::File.expand_path( ::File.dirname( __FILE__ ) )

  # Gem のトップディレクトリ
  # @note "#{ ::Rails.root }" とはしない
  TOP_DIR = ::File.expand_path( "#{ LIB_DIR }/.." )

  def self.init
    require_files
    set_standard_class_ext
  end

  class << self

    private

    def require_files
      required_files.each do | filename |
        require filename
      end
    end

    def required_files
      require_relative "odpt_common/required.rb"
      require_relative "odpt_common/required/all.rb"

      ::Dir.glob( "#{ ::OdptCommon::LIB_DIR }/odpt_common/required/all/**/**.rb" ).sort.each do | filename |
        require ::File.expand_path( filename )
      end

      ::OdptCommon::Required::All.files
    end

    def set_standard_class_ext

      [ :String ].each do | class_name |
        eval <<-INCLUDE
          ::#{ class_name }.class_eval do
            include ::OdptCommon::Modules::ClassExt::#{ class_name }Ext
          end
        INCLUDE
      end

    end

  end

end

include OdptCommon.init
