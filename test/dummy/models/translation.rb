class Translation < ActiveRecord::Base

  def to_rich_cms_response(params)
    options = {:as => params[:editable_input_type], :capitalize => %w(true 1).include?(params[:capitalize])}
    {:value => value, :translations => Hash[*params[:derivative_keys].split(";").uniq.collect{|x| [x, x.t(options)]}.flatten]}
  end

end