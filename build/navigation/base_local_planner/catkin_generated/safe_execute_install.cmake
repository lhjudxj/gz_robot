execute_process(COMMAND "/home/hnu/gz_robot/build/navigation/base_local_planner/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hnu/gz_robot/build/navigation/base_local_planner/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
