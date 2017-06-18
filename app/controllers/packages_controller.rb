class PackagesController < ApplicationController
	def get_deps
		packages = params[:packages]
		os = params[:os]
		pack_type = params[:pack_type]

		@result = Package.get_deps(packages, pack_type, os)
		render json: @result
	end

	def create
		package = params[:package]
		os = params[:os]
		pack_type = params[:pack_type]
		dependencies = params[:dependencies]

		result = Package.new(name: package, pack_type: pack_type)
		dependencies.each do |dep|
			result.dependencies.build(name: dep, os: os)
		end
		result.save!

		render json: result, status: :created
	end	
end
