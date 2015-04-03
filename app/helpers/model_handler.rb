class ModelHandler

  def initialize(model)
    @model = model
  end

  def update(id, changed_values)
    instance = @model.find id
    instance.update_attributes!(changed_values)
    instance
  end

  def destroy(id)
    instance = @model.find id
    instance.destroy
    instance
  end

end
