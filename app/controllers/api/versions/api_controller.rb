# base class in versions api
class Api::Versions::ApiController < Api::ApiController
# todo oauth2にあとで対応すること。
  private

    def specific_assigned_version_process(method, options = {})
      version =  assign_version(options)
      return head(401) if version.nil?

      original_class_name = self.class.name.to_s.sub(/^Api::Versions::/, "")
      class_name = "Api::Versions::Peculiar" + "::" + version + "::" + original_class_name

      begin
        specific_class = class_name.constantize
      rescue NameError
        return nil
      end
      ## メソッドなくてエラーでる可能性あり
      specific_class.new(options).send(method)
    end

    def assign_version(options)
      case options[:versions]
      when '1'
        "V1"
      else
        nil
      end
    end
end
