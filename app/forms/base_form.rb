class BaseForm

  def self.form_attributes(*attributes)
    @@form_attributes ||= {}
    @@form_attributes[self.name] ||= attributes
    attr_reader *attributes
  end

  def initialize(params)
    @@form_attributes[self.class.name].each do |attribute|
      instance_variable_set(:"@#{attribute}", params[attribute])
    end
  end
end
