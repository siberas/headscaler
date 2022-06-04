class String
  def camelcase
    self.strip.gsub(/[^[a-zA-Z\-_]]/, "").gsub("-", "_").split("_").map { |s| s.downcase.capitalize }.join
  end

  def snakecase
    self.gsub(/([A-Z])([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr("-", "_").downcase
  end
end