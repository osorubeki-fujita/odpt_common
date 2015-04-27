require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.11"

describe OdptCommon do
  it "has a version number \'#{ version }\'" do
    expect( ::OdptCommon::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::OdptCommon::VERSION , spec_filename ) ).to eq( true )
  end
end

describe String do
  it "is converted by method \'station_name_in_title\'" do
    expect( "池袋".station_name_in_title ).to eq( "池袋" )
    expect( "渋谷".station_name_in_title ).to eq( "渋谷" )
    expect( "明治神宮前〈原宿〉".station_name_in_title ).to eq( "明治神宮前" )
    expect( "押上〈スカイツリー前〉".station_name_in_title ).to eq( "押上" )
  end
end