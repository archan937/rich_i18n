require File.expand_path("../../test_helper.rb", __FILE__)

require "hpricot"

class ReadmeTest < ActiveSupport::TestCase

  context "The Dutch README examples" do
    setup do
      I18n.locale = Engine.init :nl
    end

    should "have the correct locale set" do
      assert_equal I18n.locale, :nl
    end

    should "return the expected values" do
      [
        ["Man / Vrouw",
         "Male / Female".t],

        [Rich::I18n::Core::EnrichedString,
         "MORE".t.class],

        [{:locale => :nl, :value => "meer", :derivative_key => "MORE", :key => "word.more"}.stringify_keys,
         "MORE".t.meta_data],

        ["Meer gebruikers",
         "More users".t],

        [["Meer", " ", "gebruikers"],
         "More users".t.merged_strings],

        [{},
         "More users".t.meta_data],

        [{:locale => :nl, :value => "meer", :derivative_key => "More", :key => "word.more"}.stringify_keys,
         "More users".t.merged_strings.first.meta_data],

        [{:locale => :nl, :value => "gebruiker", :derivative_key => "users", :key => ["word.user", "word.users"]}.stringify_keys,
         "More users".t.merged_strings.last.meta_data],

        ["één vraag",
         "One".t + " " + "question".t],

        [["één", " ", "vraag"],
         ("One".t + " " + "question".t).merged_strings],

        [true,
         Rich::I18n::Engine.enable_enriched_output = true],

        ["huis",
         "house".t],

        ["BRIEF",
         "LETTER".t],

        ["Welcome to our site",
         "application.index.Welcome_to_our_site".t],

        ["Teken",
          "Sign".t],

        ["MEER GEBRUIKERS",
         "MORE USERS".t],

        # Pending
        # ["Ja / Nee",
        #  "Yes / No".t]
      ].
      each do |(expectation, result)|
        assert_equal expectation, result
      end
    end

    should "return the expected i18n tag" do
      tag = Hpricot "More users".t.to_s

      assert_equal 3, tag.children.size

      [Hpricot::Elem, Hpricot::Text, Hpricot::Elem].each_with_index do |x, i|
        assert_equal x, tag.children[i].class
      end

      element0 = tag.children[0]
      element1 = tag.children[1]
      element2 = tag.children[2]

      assert_equal " ", element1.to_s
      assert_equal({:"data-locale" => "nl", :"data-editable_input_type" => "", :"data-i18n_translation" => "Meer"      , :"data-value" => "meer"     , :"data-derivative_key" => "More" , :"data-key" => "word.more"}.stringify_keys,
                   element0.raw_attributes)
      assert_equal({:"data-locale" => "nl", :"data-editable_input_type" => "", :"data-i18n_translation" => "gebruikers", :"data-value" => "gebruiker", :"data-derivative_key" => "users", :"data-key" => "word.user, word.users"}.stringify_keys,
                   element2.raw_attributes)
    end
  end

end