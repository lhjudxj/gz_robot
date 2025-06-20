// Auto-generated. Do not edit!

// (in-package ranger_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DriverState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.driver_voltage = null;
      this.driver_temperature = null;
      this.motor_temperature = null;
      this.driver_state = null;
    }
    else {
      if (initObj.hasOwnProperty('driver_voltage')) {
        this.driver_voltage = initObj.driver_voltage
      }
      else {
        this.driver_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('driver_temperature')) {
        this.driver_temperature = initObj.driver_temperature
      }
      else {
        this.driver_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('motor_temperature')) {
        this.motor_temperature = initObj.motor_temperature
      }
      else {
        this.motor_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('driver_state')) {
        this.driver_state = initObj.driver_state
      }
      else {
        this.driver_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriverState
    // Serialize message field [driver_voltage]
    bufferOffset = _serializer.float32(obj.driver_voltage, buffer, bufferOffset);
    // Serialize message field [driver_temperature]
    bufferOffset = _serializer.float32(obj.driver_temperature, buffer, bufferOffset);
    // Serialize message field [motor_temperature]
    bufferOffset = _serializer.float32(obj.motor_temperature, buffer, bufferOffset);
    // Serialize message field [driver_state]
    bufferOffset = _serializer.uint32(obj.driver_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriverState
    let len;
    let data = new DriverState(null);
    // Deserialize message field [driver_voltage]
    data.driver_voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [driver_temperature]
    data.driver_temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [motor_temperature]
    data.motor_temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [driver_state]
    data.driver_state = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ranger_msgs/DriverState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5e7f5fd1e7cc0bd7398225868b7037f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 driver_voltage
    float32 driver_temperature
    float32 motor_temperature
    uint32 driver_state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriverState(null);
    if (msg.driver_voltage !== undefined) {
      resolved.driver_voltage = msg.driver_voltage;
    }
    else {
      resolved.driver_voltage = 0.0
    }

    if (msg.driver_temperature !== undefined) {
      resolved.driver_temperature = msg.driver_temperature;
    }
    else {
      resolved.driver_temperature = 0.0
    }

    if (msg.motor_temperature !== undefined) {
      resolved.motor_temperature = msg.motor_temperature;
    }
    else {
      resolved.motor_temperature = 0.0
    }

    if (msg.driver_state !== undefined) {
      resolved.driver_state = msg.driver_state;
    }
    else {
      resolved.driver_state = 0
    }

    return resolved;
    }
};

module.exports = DriverState;
