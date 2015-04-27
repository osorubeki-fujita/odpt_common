require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.10"

describe OdptCommon do
  it "has a version number \'#{ version }\'" do
    expect( ::OdptCommon::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::OdptCommon::VERSION , spec_filename ) ).to eq( true )
  end
end