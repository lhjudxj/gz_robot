; Auto-generated. Do not edit!


(cl:in-package ranger_msgs-msg)


;//! \htmlinclude DriverState.msg.html

(cl:defclass <DriverState> (roslisp-msg-protocol:ros-message)
  ((driver_voltage
    :reader driver_voltage
    :initarg :driver_voltage
    :type cl:float
    :initform 0.0)
   (driver_temperature
    :reader driver_temperature
    :initarg :driver_temperature
    :type cl:float
    :initform 0.0)
   (motor_temperature
    :reader motor_temperature
    :initarg :motor_temperature
    :type cl:float
    :initform 0.0)
   (driver_state
    :reader driver_state
    :initarg :driver_state
    :type cl:integer
    :initform 0))
)

(cl:defclass DriverState (<DriverState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriverState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriverState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ranger_msgs-msg:<DriverState> is deprecated: use ranger_msgs-msg:DriverState instead.")))

(cl:ensure-generic-function 'driver_voltage-val :lambda-list '(m))
(cl:defmethod driver_voltage-val ((m <DriverState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:driver_voltage-val is deprecated.  Use ranger_msgs-msg:driver_voltage instead.")
  (driver_voltage m))

(cl:ensure-generic-function 'driver_temperature-val :lambda-list '(m))
(cl:defmethod driver_temperature-val ((m <DriverState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:driver_temperature-val is deprecated.  Use ranger_msgs-msg:driver_temperature instead.")
  (driver_temperature m))

(cl:ensure-generic-function 'motor_temperature-val :lambda-list '(m))
(cl:defmethod motor_temperature-val ((m <DriverState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:motor_temperature-val is deprecated.  Use ranger_msgs-msg:motor_temperature instead.")
  (motor_temperature m))

(cl:ensure-generic-function 'driver_state-val :lambda-list '(m))
(cl:defmethod driver_state-val ((m <DriverState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:driver_state-val is deprecated.  Use ranger_msgs-msg:driver_state instead.")
  (driver_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriverState>) ostream)
  "Serializes a message object of type '<DriverState>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'driver_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'driver_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motor_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'driver_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'driver_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'driver_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'driver_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriverState>) istream)
  "Deserializes a message object of type '<DriverState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'driver_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'driver_temperature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_temperature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'driver_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'driver_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'driver_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'driver_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriverState>)))
  "Returns string type for a message object of type '<DriverState>"
  "ranger_msgs/DriverState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriverState)))
  "Returns string type for a message object of type 'DriverState"
  "ranger_msgs/DriverState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriverState>)))
  "Returns md5sum for a message object of type '<DriverState>"
  "e5e7f5fd1e7cc0bd7398225868b7037f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriverState)))
  "Returns md5sum for a message object of type 'DriverState"
  "e5e7f5fd1e7cc0bd7398225868b7037f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriverState>)))
  "Returns full string definition for message of type '<DriverState>"
  (cl:format cl:nil "float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriverState)))
  "Returns full string definition for message of type 'DriverState"
  (cl:format cl:nil "float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriverState>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriverState>))
  "Converts a ROS message object to a list"
  (cl:list 'DriverState
    (cl:cons ':driver_voltage (driver_voltage msg))
    (cl:cons ':driver_temperature (driver_temperature msg))
    (cl:cons ':motor_temperature (motor_temperature msg))
    (cl:cons ':driver_state (driver_state msg))
))
