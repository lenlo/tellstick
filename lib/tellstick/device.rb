module TellStick
  class Device
    attr_reader :id

    def initialize(device_id)
      @id = device_id
    end

    def name
      read_string RawAPI.device_name(id)
    end

    def name=(name)
      RawAPI.set_device_name(id, name)
    end

    def model
      read_string RawAPI.device_model(id)
    end

    def protocol
      read_string RawAPI.protocol(id)
    end      

    def supported_commands
      methods = RawAPI.device_methods(id, RawAPI.all_supported_methods_int)
      RawAPI.supported_methods.select { |k,v| (methods & v) != 0 }.keys
    end
  
    def has_command?(command)
      supported_commands.include? command
    end

    def last_command
      cmd = RawAPI.last_sent_commmand(id, RawAPI.all_supported_methods_int)
      RawAPI.supported_methods.key cmd
    end

    # def dim_value
    #   value = read_string RawAPI.last_sent_value(id)
    #   value == '' ? nil : value
    # end

    def learn
      RawAPI.learn(id)
    end

    def turn_on
      RawAPI.turn_on(id)
     end

    def turn_off
      RawAPI.turn_off(id)
    end

    def sound_bell
      RawAPI.sound_bell(id)
    end

    private

    def read_string(pointer)
      RawAPI.read_string pointer
    end
  end
end