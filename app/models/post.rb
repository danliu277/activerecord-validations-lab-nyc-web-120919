class Post < ActiveRecord::Base
    validates :title, presence:true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :click_bait

    def click_bait
        keyword = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        valid = false
        if(title)
            keyword.each do |word|
                if(title.include?(word))
                    valid = true
                end
            end
        end
        if(!valid)
            errors.add(:title, "Not click bait")
        end
    end
end
