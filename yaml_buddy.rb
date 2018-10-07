# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  require 'yaml'

  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  rescue StandardError => e
  raise e.message
end

def to_yaml
    @data = @data.to_yaml
  rescue StandardError => e
    raise e.message
  end
  end