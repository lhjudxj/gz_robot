;; Auto-generated. Do not edit!


(when (boundp 'ranger_msgs::MotorState)
  (if (not (find-package "RANGER_MSGS"))
    (make-package "RANGER_MSGS"))
  (shadow 'MotorState (find-package "RANGER_MSGS")))
(unless (find-package "RANGER_MSGS::MOTORSTATE")
  (make-package "RANGER_MSGS::MOTORSTATE"))

(in-package "ROS")
;;//! \htmlinclude MotorState.msg.html


(defclass ranger_msgs::MotorState
  :super ros::object
  :slots (_rpm _current _pulse_count ))

(defmethod ranger_msgs::MotorState
  (:init
   (&key
    ((:rpm __rpm) 0)
    ((:current __current) 0.0)
    ((:pulse_count __pulse_count) 0)
    )
   (send-super :init)
   (setq _rpm (round __rpm))
   (setq _current (float __current))
   (setq _pulse_count (round __pulse_count))
   self)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:pulse_count
   (&optional __pulse_count)
   (if __pulse_count (setq _pulse_count __pulse_count)) _pulse_count)
  (:serialization-length
   ()
   (+
    ;; int32 _rpm
    4
    ;; float32 _current
    4
    ;; int32 _pulse_count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _rpm
       (write-long _rpm s)
     ;; float32 _current
       (sys::poke _current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _pulse_count
       (write-long _pulse_count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _rpm
     (setq _rpm (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _current
     (setq _current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _pulse_count
     (setq _pulse_count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ranger_msgs::MotorState :md5sum-) "4f0afbdb08d903468630312c9e20a600")
(setf (get ranger_msgs::MotorState :datatype-) "ranger_msgs/MotorState")
(setf (get ranger_msgs::MotorState :definition-)
      "int32 rpm
float32 current
int32 pulse_count
")



(provide :ranger_msgs/MotorState "4f0afbdb08d903468630312c9e20a600")


