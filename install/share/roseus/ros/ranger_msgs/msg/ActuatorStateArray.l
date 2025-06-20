;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::ActuatorStateArray)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'ActuatorStateArray (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::ACTUATORSTATEARRAY")
  (make-package "RANGER_MSGS::ACTUATORSTATEARRAY"))

(in-package "ROS")
;;//! \htmlinclude ActuatorStateArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ranger_msgs::ActuatorStateArray
  :super ros::object
  :slots (_header _states ))

(defmethod ranger_msgs::ActuatorStateArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:states __states) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _states __states)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:states
   (&rest __states)
   (if (keywordp (car __states))
       (send* _states __states)
     (progn
       (if __states (setq _states (car __states)))
       _states)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ranger_msgs/ActuatorState[] _states
    (apply #'+ (send-all _states :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ranger_msgs/ActuatorState[] _states
     (write-long (length _states) s)
     (dolist (elem _states)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ranger_msgs/ActuatorState[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (let (r) (dotimes (i n) (push (instance ranger_msgs::ActuatorState :init) r)) r))
     (dolist (elem- _states)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ranger_msgs::ActuatorStateArray :md5sum-) "c27e592efdd1087f3e73e2d4f7935864")
(setf (get ranger_msgs::ActuatorStateArray :datatype-) "ranger_msgs/ActuatorStateArray")
(setf (get ranger_msgs::ActuatorStateArray :definition-)
      "Header header

ActuatorState[] states
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ranger_msgs/ActuatorState
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

")



(provide :ranger_msgs/ActuatorStateArray "c27e592efdd1087f3e73e2d4f7935864")


