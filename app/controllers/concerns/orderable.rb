module Orderable
	extend ActiveSupport::Concern

	module ClassMethods
	end

	def ordering_params(params)
		ordering = {}
		sort_order = { '+' => :asc, '-' => :desc }

		if params[:sort]
			sorted_params = params[:sort].split(',')
			sorted_params.each do |field|
				sort_sign = (field =~ /\A[+-]/) ? field.slice!(0) : '+'
				model = controller_name.classify.titlecase.singularize.constantize
				if model.attribute_names.include?(field)
					ordering[field] = sort_order[sort_sign]
				end
			end
		else
			ordering['created_at'] = sort_order['-']
		end

		return ordering
	end

end