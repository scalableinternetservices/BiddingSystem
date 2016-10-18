module ApplicationHelper
    
    # Extend form_for to emit Bootstrap form code
    # http://stackoverflow.com/questions/18840947/how-to-get-class-form-control-in-input-fields-by-default-rails-form-helper
    
    module BootstrapExtension
    	FORM_CONTROL_CLASS = "form-control"
    
    	# Override the 'text_field' method defined in FormHelper
    	# https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_tag_helper.rb
    	
    	def text_field(name, value = nil, options = {})
    		class_name = options[:class]
    		if class_name.nil?
    			# Add 'form-control' as the only class if no class was provided
    			options[:class] = FORM_CONTROL_CLASS
    		else
    			# Add 'form-control' to the class if it doesn't already exist
    			options[:class] << " #{FORM_CONTROL_CLASS}" if
    			" #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
    		end
    
    		# Call the original 'text_field' method to do the real work
    		super
    	end
    	
    	# Override the 'select' method defined in FormOptionsHelper
    	# https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_options_helper.rb
    	
    	def select(object, method, choices = nil, options = {}, html_options = {}, &block)
    		class_name = options[:class]
    		if class_name.nil?
    			# Add 'form-control' as the only class if no class was provided
    			html_options[:class] = FORM_CONTROL_CLASS
    		else
    			# Add 'form-control' to the class if it doesn't already exist
    			html_options[:class] << " #{FORM_CONTROL_CLASS}" if
    			" #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
    		end
    
    		# Call the original 'select' method to do the real work
    		super
    	end
    end
    
    # Add the modified method to ApplicationHelper
    include BootstrapExtension
  
end
