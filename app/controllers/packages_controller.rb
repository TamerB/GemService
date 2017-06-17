class PackagesController < ApplicationController
	def get_deps
		packages = params[:packages]
		os = params[:os]
		pack_type = params[:pack_type]

		@result = Package.get_deps(packages, pack_type, os)
		render json: @result
	end
end
