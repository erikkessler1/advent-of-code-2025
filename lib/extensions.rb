# frozen_string_literal: true

class Object
  def map
    yield self
  end

  def non_nil?
    true
  end
end

class NilClass
  def map; end

  def non_nil?
    false
  end
end
