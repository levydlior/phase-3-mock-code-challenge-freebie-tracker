class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def recived_one?(item_name)
    bolo = self.freebies.find do |freeb|
      freeb.item_name == item_name
    end
    if bolo
      true
    else
      false
    end
  end

  def give_away(dev, freebie)
    self.freebies.each do |freeb|
      if (freeb.item_name == freebie.item_name)
        freebie.update(dev_id: dev.id)
      else
        nil
      end
    end
  end
end
