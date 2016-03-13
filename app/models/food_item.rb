class FoodItem < ActiveRecord::Base
	has_many :orders
	def image_url_or_auto
		if image_url.present?
			image_url
		else
			"http://loremflickr.com/240/180/#{name}"
		end
	end
	def image_url_or_auto_show
		if image_url.present?
			image_url.sub! '240', '480'
			image_url.sub! '180', '360'
		else
			"http://loremflickr.com/480/360/#{name}"
		end
	end
	def self.filter_by_section(section)
		where("section ILIKE ?", "%#{section}%")
	end
end
