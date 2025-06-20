;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::ActuatorState)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'ActuatorState (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::ACTUATORSTATE")
  (make-package "RANGER_MSGS::ACTUATORSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActuatorState.msg.html


(defclass ranger_msgs::ActuatorState
  :super ros::object
  :slots (_id _motor _driver ))

(defmethod ranger_msgs::ActuatorState
  (:init
   (&key
    ((:id __id) 0)
    ((:motor __motor) (instance ranger_msgs::MotorState :init))
    ((:driver __driver) (instance ranger_msgs::DriverState :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _motor __motor)
   (setq _driver __driver)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:motor
   (&rest __motor)
   (if (keywordp (car __motor))
       (send* _motor __motor)
     (progn
       (if __motor (setq _motor (car __motor)))
       _motor)))
  (:driver
   (&rest __driver)
   (if (keywordp (car __driver))
       (send* _driver __driver)
     (progn
       (if __driver (setq _driver (car __driver)))
       _driver)))
  (:serialization-length
   ()
   (+
    ;; uint32 _id
    4
    ;; ranger_msgs/MotorState _motor
    (send _motor :serialization-length)
    ;; ranger_msgs/DriverState _driver
    (send _driver :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _id
       (write-long _id s)
     ;; ranger_msgs/MotorState _motor
       (send _motor :serialize s)
     ;; ranger_msgs/DriverState _driver
       (send _driver :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; ranger_msgs/MotorState _motor
     (send _motor :deserialize buf ptr-) (incf ptr- (send _motor :serialization-length))
   ;; ranger_msgs/DriverState _driver
     (send _driver :deserialize buf ptr-) (incf ptr- (send _driver :serialization-length))
   ;;
   self)
  )

(setf (get ranger_msgs::ActuatorState :md5sum-) "ac625266ba0e0f3a4c2bd178030b5daf")
(setf (get ranger_msgs::ActuatorState :datatype-) "ranger_msgs/ActuatorState")
(setf (get ranger_msgs::ActuatorState :definition-)
      "uint32 id
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



(provide :ranger_msgs/ActuatorState "ac625266ba0e0f3a4c2bd178030b5daf")


