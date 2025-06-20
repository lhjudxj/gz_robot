; Auto-generated. Do not edit!


(cl:in-package ranger_msgs-msg)


;//! \htmlinclude ActuatorState.msg.html

(cl:defclass <ActuatorState> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (motor
    :reader motor
    :initarg :motor
    :type ranger_msgs-msg:MotorState
    :initform (cl:make-instance 'ranger_msgs-msg:MotorState))
   (driver
    :reader driver
    :initarg :driver
    :type ranger_msgs-msg:DriverState
    :initform (cl:make-instance 'ranger_msgs-msg:DriverState)))
)

(cl:defclass ActuatorState (<ActuatorState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ranger_msgs-msg:<ActuatorState> is deprecated: use ranger_msgs-msg:ActuatorState instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:id-val is deprecated.  Use ranger_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'motor-val :lambda-list '(m))
(cl:defmethod motor-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:motor-val is deprecated.  Use ranger_msgs-msg:motor instead.")
  (motor m))

(cl:ensure-generic-function 'driver-val :lambda-list '(m))
(cl:defmethod driver-val ((m <ActuatorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:driver-val is deprecated.  Use ranger_msgs-msg:driver instead.")
  (driver m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorState>) ostream)
  "Serializes a message object of type '<ActuatorState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'driver) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorState>) istream)
  "Deserializes a message object of type '<ActuatorState>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'driver) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorState>)))
  "Returns string type for a message object of type '<ActuatorState>"
  "ranger_msgs/ActuatorState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorState)))
  "Returns string type for a message object of type 'ActuatorState"
  "ranger_msgs/ActuatorState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorState>)))
  "Returns md5sum for a message object of type '<ActuatorState>"
  "ac625266ba0e0f3a4c2bd178030b5daf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorState)))
  "Returns md5sum for a message object of type 'ActuatorState"
  "ac625266ba0e0f3a4c2bd178030b5daf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorState>)))
  "Returns full string definition for message of type '<ActuatorState>"
  (cl:format cl:nil "uint32 id~%MotorState motor~%DriverState driver~%~%================================================================================~%MSG: ranger_msgs/MotorState~%int32 rpm~%float32 current~%int32 pulse_count~%================================================================================~%MSG: ranger_msgs/DriverState~%float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorState)))
  "Returns full string definition for message of type 'ActuatorState"
  (cl:format cl:nil "uint32 id~%MotorState motor~%DriverState driver~%~%================================================================================~%MSG: ranger_msgs/MotorState~%int32 rpm~%float32 current~%int32 pulse_count~%================================================================================~%MSG: ranger_msgs/DriverState~%float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorState>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'driver))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorState>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorState
    (cl:cons ':id (id msg))
    (cl:cons ':motor (motor msg))
    (cl:cons ':driver (driver msg))
))
