require File.expand_path("../../test_helper.rb", __FILE__)

require "hpricot"

class ReadmeTest < ActiveSupport::TestCase

  context "The Dutch README examples" do
    setup do
      I18n.locale = ::Rich::I18n::Engine.init :nl
    end

    should "have the correct locale set" do
      assert_equal I18n.locale, :nl
    end

    should "return the expected values" do
      pending do
      [
        ["Man / Vrouw",
         "Male / Female".t],

        [Rich::I18n::EnrichedString,
         "MORE".t.class],

        [{"locale" => :nl, "value" => "meer", "derivative_key" => "MORE", "key" => "word.more"},
         "MORE".t.meta_data],

        ["Meer gebruikers",
         "More users".t],

        [["Meer", " ", "gebruikers"],
         "More users".t.merged_strings],

        [{},
         "More users".t.meta_data],

        [{"locale" => :nl, "value" => "meer", "derivative_key" => "More", "key" => "word.more"},
         "More users".t.merged_strings.first.meta_data],

        [{"locale" => :nl, "value" => "gebruiker", "derivative_key" => "users", "key" => ["word.user", "word.users"]},
         "More users".t.merged_strings.last.meta_data],

        ["één vraag",
         "one".t + " " + "question".t],

        [["één", " ", "vraag"],
         ("one".t + " " + "question".t).merged_strings],

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

        ["Ja / Nee",
         "Yes / No".t]
      ].
      each do |(expectation, result)|
        assert_equal expectation, result
      end
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

      assert_equal({"data-store_key" => "nl:word.more", "data-derivative_key" => "More", "data-i18n_translation" => "Meer", "data-i18n_tag"=>"span", "data-value" => "", "class" => "i18n"},
                   element0.raw_attributes)
      assert_equal " ", element1.to_s
      assert_equal({"data-store_key" => "nl:word.user", "data-derivative_key" => "users", "data-i18n_translation" => "gebruikers", "data-i18n_tag"=>"span", "data-value" => "", "class" => "i18n"},
                   element2.raw_attributes)
    end
  end

end