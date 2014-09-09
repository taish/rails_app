# @abstract class
class BaseService
  include Errors

  def self.execute(args={})
    service = self.new(options)
    service.execute
  end

  # must be overrode
  def initialize(args={})
    raise "initialize method is not impliment"
  end

  def execute
    begin
      run
    rescue AccessError => e
      dump_log e
    rescue LackOfArgsError => e
      dump_log e

    # TODO twitter gemのエラー処理を書く
    end
  end

  # must be overrode
  def run
    raise "run method is not impliment"
  end

  def dump_log(e)
    Rails.logger.error("#{e}")
  end
end