Rich.I18n = (function() {
  return {
    version: "1.4.0",
    beforeEdit: function(inputs, selector, specs, identifier) {
      var translated_keys = $("<input name='content_item[derivative_keys]' type='hidden'/>");

      translated_keys.val($(identifier).map(function() {
                            return $(this).attr("data-derivative_key");
                          }).toArray().join(";"));

      inputs.append(translated_keys);
    },
    afterUpdate: function(form, response, selector, specs, identifier) {
      $.each(response.translations, function(key, value) {
        $(".i18n" + identifier + "[data-derivative_key=" + key + "]")            .attr("data-value", response.value).html(              value);
        $(".i18n" + identifier + "[data-derivative_key=" + key + "][value]")     .attr("data-value", response.value).attr("value"     , value);
        $(".i18n" + identifier + "[data-derivative_key=" + key + "][seatholder]").attr("data-value", response.value).attr("seatholder", value);
      });
      SeatHolder.rebind();
    }
  };
}());