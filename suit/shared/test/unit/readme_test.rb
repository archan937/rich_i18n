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
      [

        ["Man / Vrouw",
         "Male / Female".t],

        ["huis",
         :house.t],

        ["save",
         "save".t],

        ["header",
         "homepage.header".t],

        ["Welcome to our site",
         "application.index.Welcome_to_our_site".t],

        ["Meer gebruikers",
         "More users".t],

        ["Meer",
         "More".t],

        [Translation,
         "More".t.class],

        [{:derivative_key   => "More",
          :derivative_value => "Meer",
          :pluralized       => false,
          :store_key        => "nl:word.more",
          :store_value      => nil,
          :i18n_locale      => "nl",
          :i18n_key         => "word.more",
          :i18n_value       => "meer"},
         "More".t.meta_data],

        ["Meer gebruikers",
         "More users".t],

        [["Meer", " ", "gebruikers"],
         "More users".t.merged_strings],

        [[Translation, String, Translation],
         "More users".t.merged_strings.collect(&:class)],

        [{:derivative_key   => "users",
          :derivative_value => "gebruikers",
          :pluralized       => true,
          :store_key        => "nl:word.user",
          :store_value      => nil,
          :i18n_locale      => "nl",
          :i18n_key         => "word.user",
          :i18n_value       => "gebruiker"},
         "More users".t.merged_strings.last.meta_data],

        ["<i18n class=\"i18n\" data-store_key=\"nl:word.user\" data-store_value=\"\" data-derivative_key=\"Users\" data-i18n_tag=\"span\" data-i18n_translation=\"Gebruikers\"></i18n>",
         "Users".t.to_tag],

        ["<span data-store_key=\"nl:word.user\" class=\"i18n\" data-store_value=\"\" data-derivative_key=\"Users\">Gebruikers</span>",
         Rich::I18n::Actionpack::ActionView::Sanitizor.sanitize_html("Users".t.to_tag)],

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

    should "return the expected i18n tag" do
      tag = Hpricot "More users".t.to_s

      assert_equal 3, tag.children.size

      [Hpricot::Elem, Hpricot::Text, Hpricot::Elem].each_with_index do |x, i|
        assert_equal x, tag.children[i].class
      end

      element0 = tag.children[0]
      element1 = tag.children[1]
      element2 = tag.children[2]

      assert_equal({"data-store_key" => "nl:word.more", "data-derivative_key" => "More", "data-i18n_translation" => "Meer", "data-i18n_tag"=>"span", "data-store_value" => "", "class" => "i18n"},
                   element0.raw_attributes)
      assert_equal " ", element1.to_s
      assert_equal({"data-store_key" => "nl:word.user", "data-derivative_key" => "users", "data-i18n_translation" => "gebruikers", "data-i18n_tag"=>"span", "data-store_value" => "", "class" => "i18n"},
                   element2.raw_attributes)
    end
  end

end