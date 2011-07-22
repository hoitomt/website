module ApplicationHelper
  def title
    t = @title || "Profile"
    return "Michael Hoitomt - #{t}"
  end
  
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end
end
