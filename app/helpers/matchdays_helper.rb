module MatchdaysHelper
  def ranking_color(index)
    case index
    when 0..7
      index.even? ? "bg-green-600" : "bg-green-800"
    when 8..23
      index.even? ? "bg-gray-800" : "bg-gray-600"
    when 24..35
      index.even? ? "bg-red-800" : "bg-red-600"
    end
  end
end
