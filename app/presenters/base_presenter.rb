class BasePresenter < SimpleDelegator
  def initialize(model, view)
    @view, @model = view, model
    super(model)
  end

  def h
    @view
  end
end
