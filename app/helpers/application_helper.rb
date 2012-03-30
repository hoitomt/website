module ApplicationHelper
  def title
    t = @title || "Profile"
    return "Michael Hoitomt - #{t}"
  end
  
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end
  
  def phone
    return '(715) 835-7765'
  end

  def email
    return 'amy@hoitomt.com'
  end

  def website
    return 'www.hoitomt.com/garage_sale'
  end
end
