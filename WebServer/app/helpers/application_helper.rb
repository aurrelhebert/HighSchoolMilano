module ApplicationHelper
  def titre
    base_titre = "73 High School Beh"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end
end
