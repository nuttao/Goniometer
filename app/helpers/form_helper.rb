module FormHelper
	def input_text_field(object, method, options = {})
		begin_html, end_html = wrapping_html(object, method, options)
    	(begin_html + text_field( object, method, options) + end_html).html_safe
  	end
  
  	def input_text_field_required(object, method, options = {})
    	options[:required] = true
    	input_text_field(object, method, options)
 	end
  
  	def input_password_field(object, method, options = {})
	    begin_html, end_html = wrapping_html(object, method, options)
	    (begin_html + password_field( object, method, options) + end_html).html_safe
  	end
  
  	def input_password_field_required(object, method, options = {})
	    options[:required] = true
	    input_password_field(object, method, options)
  	end
  
  	def input_select(object, method, datas, select_options = {}, options = {})
	    begin_html, end_html = wrapping_html(object, method, options)
	    (begin_html + select(object, method, datas, select_options, options) + end_html).html_safe
  	end
  
  	def input_select_required(object, method, datas, select_options = {}, options = {})
    	options[:required] = true
    	input_select(object, method, datas, select_options, options)
  	end

  	def input_text_area(object, method, options = {})
	    begin_html, end_html = wrapping_html(object, method, options)
	    (begin_html + text_area( object, method, options) + end_html).html_safe
	end
  
  	def input_text_area_required(object, method, options = {})
  		options[:required] = true
    	input_text_area(object, method, options)
  	end

  	def input_number_field(object, method, options = {})
  		begin_html, end_html = wrapping_html(object, method, options)
    	(begin_html + number_field( object, method, options) + end_html).html_safe
    end

    def input_number_field_required(object, method, options = {})
    	options[:required] = true
  		input_number_field(object, method, options)
    end
  	
  	def input_datetime_select(object, method, options = {}) 
  		begin_html, end_html = wrapping_html(object, method, options)
    	(begin_html + datetime_select(object, method, options) + end_html).html_safe
  	end

  	def input_datetime_select_required(object, method, options = {})
  		options[:required] = true
    	input_number_field(object, method, options)
  	end

  	private

  	def wrapping_html( object, method, options)
	    id = "#{object}_#{method}"
	    label = options[:label_name] ? options.delete(:label_name) : method.to_s.humanize 
	    options[:class] ||= "form-control"
	    
	    is_required = options[:required]
	    if options[:required] then
	      	error = label_error(object, method)
	      	options.delete(:required)
	    else
	      	error = ""
	    end
	    error.blank? ? is_error = false : is_error = true

	    generated_begin_html = ""
	    generated_begin_html << %{<div class='form-group has-feedback #{ is_error ? 'has-error' : ''}'>}
	    generated_begin_html << %{<label class='col-lg-3 control-label' for=#{id}>}
	    generated_begin_html << %{<abbr title='Required' class="initialism">*</abbr> } if is_required
	    generated_begin_html << label unless label == ""
	    generated_begin_html << %{</label>}
	    generated_begin_html << %{<div class='col-lg-5'>}
	    
	    
	    generated_end_html = ""
	    generated_end_html << %{<i class='form-control-feedback glyphicon glyphicon-remove' data-bv-field='password'></i>} if is_error
	    generated_end_html << %{<small class="help-block">}
	    generated_end_html << error unless error == ""
	    generated_end_html << %{</small>}
	    generated_end_html << %{</div>}
	    generated_end_html << %{</div>}
	    
	    return generated_begin_html, generated_end_html
  	end
  
  	def label_error(object,method)
    	%{#{eval("@#{object}.errors[:#{method}].class.to_s == 'Array' ? @#{object}.errors[:#{method}].first : @#{object}.errors[:#{method}]")}}
  	end
end