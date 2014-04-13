module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | MvpSmokeTester"      
    end
  end
end
