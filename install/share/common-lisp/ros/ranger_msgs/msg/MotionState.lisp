; Auto-generated. Do not edit!


(cl:in-package ranger_msgs-msg)


;//! \htmlinclude MotionState.msg.html

(cl:defclass <MotionState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (motion_mode
    :reader motion_mode
    :initarg :motion_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MotionState (<MotionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ranger_msgs-msg:<MotionState> is deprecated: use ranger_msgs-msg:MotionState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MotionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:header-val is deprecated.  Use ranger_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'motion_mode-val :lambda-list '(m))
(cl:defmethod motion_mode-val ((m <MotionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ranger_msgs-msg:motion_mode-val is deprecated.  Use ranger_msgs-msg:motion_mode instead.")
  (motion_mode m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MotionState>)))
    "Constants for message type '<MotionState>"
  '((:MOTION_MODE_DUAL_ACKERMAN . 0)
    (:MOTION_MODE_PARALLEL . 1)
    (:MOTION_MODE_SPINNING . 2)
    (:MOTION_MODE_SIDE_SLIP . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MotionState)))
    "Constants for message type 'MotionState"
  '((:MOTION_MODE_DUAL_ACKERMAN . 0)
    (:MOTION_MODE_PARALLEL . 1)
    (:MOTION_MODE_SPINNING . 2)
    (:MOTION_MODE_SIDE_SLIP . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionState>) ostream)
  "Serializes a message object of type '<MotionState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motion_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionState>) istream)
  "Deserializes a message object of type '<MotionState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motion_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionState>)))
  "Returns string type for a message object of type '<MotionState>"
  "ranger_msgs/MotionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionState)))
  "Returns string type for a message object of type 'MotionState"
  "ranger_msgs/MotionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionState>)))
  "Returns md5sum for a message object of type '<MotionState>"
  "8c50ce98adac4a6f6ebe0596ac4664be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionState)))
  "Returns md5sum for a message object of type 'MotionState"
  "8c50ce98adac4a6f6ebe0596ac4664be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionState>)))
  "Returns full string definition for message of type '<MotionState>"
  (cl:format cl:nil "uint8 MOTION_MODE_DUAL_ACKERMAN = 0~%uint8 MOTION_MODE_PARALLEL = 1~%uint8 MOTION_MODE_SPINNING = 2~%uint8 MOTION_MODE_SIDE_SLIP = 3~%~%########################################~%~%Header header~%~%# motion state~%uint8 motion_mode~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionState)))
  "Returns full string definition for message of type 'MotionState"
  (cl:format cl:nil "uint8 MOTION_MODE_DUAL_ACKERMAN = 0~%uint8 MOTION_MODE_PARALLEL = 1~%uint8 MOTION_MODE_SPINNING = 2~%uint8 MOTION_MODE_SIDE_SLIP = 3~%~%########################################~%~%Header header~%~%# motion state~%uint8 motion_mode~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionState>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionState
    (cl:cons ':header (header msg))
    (cl:cons ':motion_mode (motion_mode msg))
))
