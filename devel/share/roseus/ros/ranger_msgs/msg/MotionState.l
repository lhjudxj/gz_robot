;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::MotionState)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'MotionState (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::MOTIONSTATE")
  (make-package "RANGER_MSGS::MOTIONSTATE"))

(in-package "ROS")
;;//! \htmlinclude MotionState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*MOTION_MODE_DUAL_ACKERMAN*" (find-package "RANGER_MSGS::MOTIONSTATE"))
(shadow '*MOTION_MODE_DUAL_ACKERMAN* (find-package "RANGER_MSGS::MOTIONSTATE"))
(defconstant ranger_msgs::MotionState::*MOTION_MODE_DUAL_ACKERMAN* 0)
(intern "*MOTION_MODE_PARALLEL*" (find-package "RANGER_MSGS::MOTIONSTATE"))
(shadow '*MOTION_MODE_PARALLEL* (find-package "RANGER_MSGS::MOTIONSTATE"))
(defconstant ranger_msgs::MotionState::*MOTION_MODE_PARALLEL* 1)
(intern "*MOTION_MODE_SPINNING*" (find-package "RANGER_MSGS::MOTIONSTATE"))
(shadow '*MOTION_MODE_SPINNING* (find-package "RANGER_MSGS::MOTIONSTATE"))
(defconstant ranger_msgs::MotionState::*MOTION_MODE_SPINNING* 2)
(intern "*MOTION_MODE_SIDE_SLIP*" (find-package "RANGER_MSGS::MOTIONSTATE"))
(shadow '*MOTION_MODE_SIDE_SLIP* (find-package "RANGER_MSGS::MOTIONSTATE"))
(defconstant ranger_msgs::MotionState::*MOTION_MODE_SIDE_SLIP* 3)

(defun ranger_msgs::MotionState-to-symbol (const)
  (cond
        ((= const 0) 'ranger_msgs::MotionState::*MOTION_MODE_DUAL_ACKERMAN*)
        ((= const 1) 'ranger_msgs::MotionState::*MOTION_MODE_PARALLEL*)
        ((= const 2) 'ranger_msgs::MotionState::*MOTION_MODE_SPINNING*)
        ((= const 3) 'ranger_msgs::MotionState::*MOTION_MODE_SIDE_SLIP*)
        (t nil)))

(defclass ranger_msgs::MotionState
  :super ros::object
  :slots (_header _motion_mode ))

(defmethod ranger_msgs::MotionState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:motion_mode __motion_mode) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _motion_mode (round __motion_mode))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:motion_mode
   (&optional __motion_mode)
   (if __motion_mode (setq _motion_mode __motion_mode)) _motion_mode)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _motion_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _motion_mode
       (write-byte _motion_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _motion_mode
     (setq _motion_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ranger_msgs::MotionState :md5sum-) "8c50ce98adac4a6f6ebe0596ac4664be")
(setf (get ranger_msgs::MotionState :datatype-) "ranger_msgs/MotionState")
(setf (get ranger_msgs::MotionState :definition-)
      "uint8 MOTION_MODE_DUAL_ACKERMAN = 0
uint8 MOTION_MODE_PARALLEL = 1
uint8 MOTION_MODE_SPINNING = 2
uint8 MOTION_MODE_SIDE_SLIP = 3

########################################

Header header

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



(provide :ranger_msgs/MotionState "8c50ce98adac4a6f6ebe0596ac4664be")


