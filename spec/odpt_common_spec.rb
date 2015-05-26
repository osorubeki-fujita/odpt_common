require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.2.4"

describe OdptCommon do
  it "has a version number \'#{ version }\'" do
    expect( ::OdptCommon::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::OdptCommon::VERSION , spec_filename ) ).to eq( true )
  end
end

describe String , "coverted by \"OdptCommon::StringExt\"" do

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

  it "is converted by method \'process_train_operation_text\'" do
    # 2015-05-25 14:28

    str_before_1 = "14時28分頃、地震のため、遅れが出ています。只今、東京メトロ線、都営地下鉄線、JR線、東急線、東武線、小田急線、京王線、西武線で振替輸送を実施しています。詳しくは駅係員にお尋ねください。"
    str_after_1 = "14時28分頃発生した地震のため、遅れが出ています。\n只今、東京メトロ線、都営地下鉄線、JR線、東急線、東武線、小田急線、京王線、西武線で振替輸送を実施しています。\n詳しくは駅係員にお尋ねください。"
    expect( str_before_1.process_train_operation_text ).to eq( str_after_1 )

    str_before_2 = "14時28分頃、地震のため、一部の列車に遅れが出ています。 只今、東京メトロ線、都営地下鉄線、JR線、東武線、西武線、りんかい線、ゆりかもめ線で振替輸送を実施しています。 詳しくは駅係員にお尋ねください。"
    str_after_2 = "14時28分頃発生した地震のため、一部の列車に遅れが出ています。\n只今、東京メトロ線、都営地下鉄線、JR線、東武線、西武線、りんかい線、ゆりかもめで振替輸送を実施しています。\n詳しくは駅係員にお尋ねください。"
    expect( str_before_2.process_train_operation_text ).to eq( str_after_2 )

    str_before_3 = "14時28分頃、地震のため、遅れが出ています。 只今、東京メトロ線、都営地下鉄線、JR線、東急線、東武線、京成線、小田急線、京王線、つくばエクスプレス線で振替輸送を実施しています。 詳しくは駅係員にお尋ねください。"
    str_after_3 = "14時28分頃発生した地震のため、遅れが出ています。\n只今、東京メトロ線、都営地下鉄線、JR線、東急線、東武線、京成線、小田急線、京王線、つくばエクスプレスで振替輸送を実施しています。\n詳しくは駅係員にお尋ねください。"
    expect( str_before_3.process_train_operation_text ).to eq( str_after_3 )
    
    str_before_4 = "東急田園都市線内での東急線内遅延により、一部の列車に遅れが出ています。"
    str_after_4 = "東急田園都市線内での遅延により、一部の列車に遅れが出ています。"
    expect( str_before_4.process_train_operation_text ).to eq( str_after_4 )
  end

end
