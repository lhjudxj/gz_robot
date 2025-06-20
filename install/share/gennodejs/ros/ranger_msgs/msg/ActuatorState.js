// Auto-generated. Do not edit!

// (in-package ranger_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MotorState = require('./MotorState.js');
let DriverState = require('./DriverState.js');

//-----------------------------------------------------------

class ActuatorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.motor = null;
      this.driver = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('motor')) {
        this.motor = initObj.motor
      }
      else {
        this.motor = new MotorState();
      }
      if (initObj.hasOwnProperty('driver')) {
        this.driver = initObj.driver
      }
      else {
        this.driver = new DriverState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorState
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [motor]
    bufferOffset = MotorState.serialize(obj.motor, buffer, bufferOffset);
    // Serialize message field [driver]
    bufferOffset = DriverState.serialize(obj.driver, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorState
    let len;
    let data = new ActuatorState(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [motor]
    data.motor = MotorState.deserialize(buffer, bufferOffset);
    // Deserialize message field [driver]
    data.driver = DriverState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ranger_msgs/ActuatorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac625266ba0e0f3a4c2bd178030b5daf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 id
    MotorState motor
    DriverState driver
    
    ================================================================================
    MSG: ranger_msgs/MotorState
    int32 rpm
    float32 current
    int32 pulse_count
    ================================================================================
    MSG: ranger_msgs/DriverState
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
    const resolved = new ActuatorState(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.motor !== undefined) {
      resolved.motor = MotorState.Resolve(msg.motor)
    }
    else {
      resolved.motor = new MotorState()
    }

    if (msg.driver !== undefined) {
      resolved.driver = DriverState.Resolve(msg.driver)
    }
    else {
      resolved.driver = new DriverState()
    }

    return resolved;
    }
};

module.exports = ActuatorState;
