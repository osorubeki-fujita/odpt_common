require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.2.0"

describe OdptCommon do
  it "has a version number \'#{ version }\'" do
    expect( ::OdptCommon::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::OdptCommon::VERSION , spec_filename ) ).to eq( true )
  end
end

describe String do

  it "is converted by method \'process_machine_dependent_character\'" do
    expect( "池袋".process_machine_dependent_character ).to eq( "池袋" )
    expect( "渋谷".process_machine_dependent_character ).to eq( "渋谷" )
    expect( "明治神宮前〈原宿〉".process_machine_dependent_character ).to eq( "明治神宮前〈原宿〉" )
    expect( "押上〈スカイツリー前〉".process_machine_dependent_character ).to eq( "押上〈スカイツリー前〉" )
  end

  it "is converted by method \'revive_machine_dependent_character\'" do
    expect( "池袋".revive_machine_dependent_character ).to eq( "池袋" )
    expect( "渋谷".revive_machine_dependent_character ).to eq( "渋谷" )
    expect( "明治神宮前〈原宿〉".revive_machine_dependent_character ).to eq( "明治神宮前〈原宿〉" )
    expect( "押上〈スカイツリー前〉".revive_machine_dependent_character ).to eq( "押上〈スカイツリー前〉" )
  end

end
