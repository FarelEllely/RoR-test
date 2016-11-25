class Category < ApplicationRecord
	has_many :articles
	
	#def category_list
		#Category.sort_by{ |e| e.downcase }
	#end 
end
