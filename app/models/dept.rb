class Dept < ApplicationRecord
    
    #adding custom validations
    def check_name
        if name.blank?
            errors.add(:base, 'name cannot be blank')
        end
    end
    validate :check_name

    def change_name
        name == 'navya'
    end
    validates :students,presence: true , unless: :change_name
    validates :staff, presence: true, if: Proc.new{ |a| a.books.blank?}
    #after_initialize :method_after_intialization
    after_find :method_after_find
    after_touch :method_after_touch
    #before_save :method_before_save
    #after_save  :method_after_save
    around_save :method_around_save
    after_commit :method_after_commit, on: [:create]
    private
    def method_after_intialization
        puts "calling after intialization"
    end
    def method_after_find
        puts "calling after find method"
    end
    def method_after_touch
        puts "calling after touch method"
    end
    #def method_before_save
        #puts "calling before save"
    #end
    def method_after_save
        puts "calling after save"
    end
    def method_around_save
        puts "calling before save"
        yield
        puts "calling after save"
    end
    def method_after_commit
        puts "calling after commit"
    end
    has_one_attached :main_image
end
