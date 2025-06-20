;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::DriverState)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'DriverState (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::DRIVERSTATE")
  (make-package "RANGER_MSGS::DRIVERSTATE"))

(in-package "ROS")
;;//! \htmlinclude DriverState.msg.html


(defclass ranger_msgs::DriverState
  :super ros::object
  :slots (_driver_voltage _driver_temperature _motor_temperature _driver_state ))

(defmethod ranger_msgs::DriverState
  (:init
   (&key
    ((:driver_voltage __driver_voltage) 0.0)
    ((:driver_temperature __driver_temperature) 0.0)
    ((:motor_temperature __motor_temperature) 0.0)
    ((:driver_state __driver_state) 0)
    )
   (send-super :init)
   (setq _driver_voltage (float __driver_voltage))
   (setq _driver_temperature (float __driver_temperature))
   (setq _motor_temperature (float __motor_temperature))
   (setq _driver_state (round __driver_state))
   self)
  (:driver_voltage
   (&optional __driver_voltage)
   (if __driver_voltage (setq _driver_voltage __driver_voltage)) _driver_voltage)
  (:driver_temperature
   (&optional __driver_temperature)
   (if __driver_temperature (setq _driver_temperature __driver_temperature)) _driver_temperature)
  (:motor_temperature
   (&optional __motor_temperature)
   (if __motor_temperature (setq _motor_temperature __motor_temperature)) _motor_temperature)
  (:driver_state
   (&optional __driver_state)
   (if __driver_state (setq _driver_state __driver_state)) _driver_state)
  (:serialization-length
   ()
   (+
    ;; float32 _driver_voltage
    4
    ;; float32 _driver_temperature
    4
    ;; float32 _motor_temperature
    4
    ;; uint32 _driver_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _driver_voltage
       (sys::poke _driver_voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _driver_temperature
       (sys::poke _driver_temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _motor_temperature
       (sys::poke _motor_temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _driver_state
       (write-long _driver_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _driver_voltage
     (setq _driver_voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _driver_temperature
     (setq _driver_temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _motor_temperature
     (setq _motor_temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _driver_state
     (setq _driver_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ranger_msgs::DriverState :md5sum-) "e5e7f5fd1e7cc0bd7398225868b7037f")
(setf (get ranger_msgs::DriverState :datatype-) "ranger_msgs/DriverState")
(setf (get ranger_msgs::DriverState :definition-)
      "float32 driver_voltage
float32 driver_temperature
float32 motor_temperature
uint32 driver_state

")



(provide :ranger_msgs/DriverState "e5e7f5fd1e7cc0bd7398225868b7037f")


