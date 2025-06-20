;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::SystemState)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'SystemState (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::SYSTEMSTATE")
  (make-package "RANGER_MSGS::SYSTEMSTATE"))

(in-package "ROS")
;;//! \htmlinclude SystemState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*VEHICLE_STATE_NORMAL*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*VEHICLE_STATE_NORMAL* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*VEHICLE_STATE_NORMAL* 0)
(intern "*VEHICLE_STATE_ESTOP*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*VEHICLE_STATE_ESTOP* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*VEHICLE_STATE_ESTOP* 1)
(intern "*VEHICLE_STATE_EXCEPTION*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*VEHICLE_STATE_EXCEPTION* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*VEHICLE_STATE_EXCEPTION* 2)
(intern "*CONTROL_MODE_RC*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*CONTROL_MODE_RC* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*CONTROL_MODE_RC* 0)
(intern "*CONTROL_MODE_CAN*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*CONTROL_MODE_CAN* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*CONTROL_MODE_CAN* 1)
(intern "*MOTION_MODE_DUAL_ACKERMAN*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*MOTION_MODE_DUAL_ACKERMAN* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*MOTION_MODE_DUAL_ACKERMAN* 0)
(intern "*MOTION_MODE_PARALLEL*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*MOTION_MODE_PARALLEL* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*MOTION_MODE_PARALLEL* 1)
(intern "*MOTION_MODE_SPINNING*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*MOTION_MODE_SPINNING* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*MOTION_MODE_SPINNING* 2)
(intern "*MOTION_MODE_SIDE_SLIP*" (find-package "RANGER_MSGS::SYSTEMSTATE"))
(shadow '*MOTION_MODE_SIDE_SLIP* (find-package "RANGER_MSGS::SYSTEMSTATE"))
(defconstant ranger_msgs::SystemState::*MOTION_MODE_SIDE_SLIP* 3)

(defun ranger_msgs::SystemState-to-symbol (const)
  (cond
        ((= const 0) 'ranger_msgs::SystemState::*VEHICLE_STATE_NORMAL*)
        ((= const 1) 'ranger_msgs::SystemState::*VEHICLE_STATE_ESTOP*)
        ((= const 2) 'ranger_msgs::SystemState::*VEHICLE_STATE_EXCEPTION*)
        ((= const 0) 'ranger_msgs::SystemState::*CONTROL_MODE_RC*)
        ((= const 1) 'ranger_msgs::SystemState::*CONTROL_MODE_CAN*)
        ((= const 0) 'ranger_msgs::SystemState::*MOTION_MODE_DUAL_ACKERMAN*)
        ((= const 1) 'ranger_msgs::SystemState::*MOTION_MODE_PARALLEL*)
        ((= const 2) 'ranger_msgs::SystemState::*MOTION_MODE_SPINNING*)
        ((= const 3) 'ranger_msgs::SystemState::*MOTION_MODE_SIDE_SLIP*)
        (t nil)))

(defclass ranger_msgs::SystemState
  :super ros::object
  :slots (_header _vehicle_state _control_mode _error_code _battery_voltage _motion_mode ))

(defmethod ranger_msgs::SystemState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vehicle_state __vehicle_state) 0)
    ((:control_mode __control_mode) 0)
    ((:error_code __error_code) 0)
    ((:battery_voltage __battery_voltage) 0.0)
    ((:motion_mode __motion_mode) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vehicle_state (round __vehicle_state))
   (setq _control_mode (round __control_mode))
   (setq _error_code (round __error_code))
   (setq _battery_voltage (float __battery_voltage))
   (setq _motion_mode (round __motion_mode))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vehicle_state
   (&optional __vehicle_state)
   (if __vehicle_state (setq _vehicle_state __vehicle_state)) _vehicle_state)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:battery_voltage
   (&optional __battery_voltage)
   (if __battery_voltage (setq _battery_voltage __battery_voltage)) _battery_voltage)
  (:motion_mode
   (&optional __motion_mode)
   (if __motion_mode (setq _motion_mode __motion_mode)) _motion_mode)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _vehicle_state
    1
    ;; uint8 _control_mode
    1
    ;; uint16 _error_code
    2
    ;; float64 _battery_voltage
    8
    ;; uint8 _motion_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _vehicle_state
       (write-byte _vehicle_state s)
     ;; uint8 _control_mode
       (write-byte _control_mode s)
     ;; uint16 _error_code
       (write-word _error_code s)
     ;; float64 _battery_voltage
       (sys::poke _battery_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _motion_mode
       (write-byte _motion_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _vehicle_state
     (setq _vehicle_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _control_mode
     (setq _control_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _error_code
     (setq _error_code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _battery_voltage
     (setq _battery_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _motion_mode
     (setq _motion_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ranger_msgs::SystemState :md5sum-) "20ba1ae77a53f0eefe981d2eb2b0fed2")
(setf (get ranger_msgs::SystemState :datatype-) "ranger_msgs/SystemState")
(setf (get ranger_msgs::SystemState :definition-)
      "uint8 VEHICLE_STATE_NORMAL = 0
uint8 VEHICLE_STATE_ESTOP = 1
uint8 VEHICLE_STATE_EXCEPTION = 2

uint8 CONTROL_MODE_RC = 0
uint8 CONTROL_MODE_CAN = 1

uint8 MOTION_MODE_DUAL_ACKERMAN = 0
uint8 MOTION_MODE_PARALLEL = 1
uint8 MOTION_MODE_SPINNING = 2
uint8 MOTION_MODE_SIDE_SLIP = 3

########################################

Header header

# system state
uint8 vehicle_state
uint8 control_mode
uint16 error_code
float64 battery_voltage

# motion state
uint8 motion_mode

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

")



(provide :ranger_msgs/SystemState "20ba1ae77a53f0eefe981d2eb2b0fed2")


