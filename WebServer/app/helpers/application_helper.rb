module ApplicationHelper
  def titre
    base_titre = "73 High School Beh"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end
  def description
    if @description.nil?
      nil
    else
      @description
    end
  end
end
