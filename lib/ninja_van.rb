require "http"
require "ninja_van/version"
require "ninja_van/error"
require "ninja_van/config"
require "ninja_van/types"
require "ninja_van/flexible_params"
require "ninja_van/request"
require "ninja_van/access_token"
require "ninja_van/validations/order_validation"
require "ninja_van/order"

module NinjaVan

  def self.setup
    @config ||= NinjaVan::Config.new
    yield @config if block_given?
    @config
  end

  def self.is_blank?(object)
    case object
    when NilClass, FalseClass
      return true
    when TrueClass, Numeric, Fixnum
      return false
    when Array, Hash
      return object.empty?
    when String
      return object.empty? || !object.match(/\A[[:space:]]*\z/).nil?
    else
      return object.respond_to?(:empty?) ? !!object.empty? : !object
    end
  end

end
