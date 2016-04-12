class Bill < ActiveRecord::Base
    def self.search(search)
        if search
            where('description LIKE ?', "%#{search}%")
        else
            where(nil)
        end
    end
end
