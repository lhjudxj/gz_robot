; Auto-generated. Do not edit!


(cl:in-package ranger_msgs-msg)


;//! \htmlinclude ActuatorStateArray.msg.html

(cl:defclass <ActuatorStateArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (states
    :reader states
    :initarg :states
    :type (cl:vector ranger_msgs-msg:ActuatorState)
   :initform (cl:make-array 0 :element-type 'ranger_msgs-msg:ActuatorState :initial-element (cl:make-instance 'ranger_msgs-msg:ActuatorState))))
)

(cl:defclass ActuatorStateArray (<ActuatorStateArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorStateArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorStateArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ranger_msgs-msg:<ActuatorStateArray> is deprecated: use ranger_msgs-msg:ActuatorStateArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ActuatorStateArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:header-val is deprecated.  Use ranger_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <ActuatorStateArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:states-val is deprecated.  Use ranger_msgs-msg:states instead.")
  (states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorStateArray>) ostream)
  "Serializes a message object of type '<ActuatorStateArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorStateArray>) istream)
  "Deserializes a message object of type '<ActuatorStateArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ranger_msgs-msg:ActuatorState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorStateArray>)))
  "Returns string type for a message object of type '<ActuatorStateArray>"
  "ranger_msgs/ActuatorStateArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorStateArray)))
  "Returns string type for a message object of type 'ActuatorStateArray"
  "ranger_msgs/ActuatorStateArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorStateArray>)))
  "Returns md5sum for a message object of type '<ActuatorStateArray>"
  "c27e592efdd1087f3e73e2d4f7935864")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorStateArray)))
  "Returns md5sum for a message object of type 'ActuatorStateArray"
  "c27e592efdd1087f3e73e2d4f7935864")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorStateArray>)))
  "Returns full string definition for message of type '<ActuatorStateArray>"
  (cl:format cl:nil "Header header~%~%ActuatorState[] states~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ranger_msgs/ActuatorState~%uint32 id~%MotorState motor~%DriverState driver~%~%================================================================================~%MSG: ranger_msgs/MotorState~%int32 rpm~%float32 current~%int32 pulse_count~%================================================================================~%MSG: ranger_msgs/DriverState~%float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorStateArray)))
  "Returns full string definition for message of type 'ActuatorStateArray"
  (cl:format cl:nil "Header header~%~%ActuatorState[] states~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ranger_msgs/ActuatorState~%uint32 id~%MotorState motor~%DriverState driver~%~%================================================================================~%MSG: ranger_msgs/MotorState~%int32 rpm~%float32 current~%int32 pulse_count~%================================================================================~%MSG: ranger_msgs/DriverState~%float32 driver_voltage~%float32 driver_temperature~%float32 motor_temperature~%uint32 driver_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorStateArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorStateArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorStateArray
    (cl:cons ':header (header msg))
    (cl:cons ':states (states msg))
))
