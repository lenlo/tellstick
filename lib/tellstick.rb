require 'tellstick/version'

require 'ffi'
require 'tellstick/ffi_mapping'
require 'tellstick/device'

module TellStick
  def self.devices
    devices = []
    RawAPI.number_of_devices.times do |i|
      devices << Device.new(RawAPI.device_id_for_index(i))
    end
    devices
  end 
end
