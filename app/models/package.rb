class Package < ApplicationRecord
	has_many :dependencies

	validates :name, presence: true, uniqueness: { scope: :pack_type }

	def self.get_deps(packages, pack_type, os)

		result = Package.includes(:dependencies).where(name: packages, pack_type: pack_type, dependencies: { os: os})

		unrecognized = packages - result.map(&:name)
		dependencies = result.map do |pack|
			pack.dependencies.map(&:name)
		end.flatten!

		{ dependencies: dependencies, unrecognized: unrecognized}
	end
end
