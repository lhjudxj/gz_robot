部署方法：
1.在~/.bashrc中修改全局路径
1.设置robot_voice系统搜索动态链接库的路径，路径在install/share/robot_voice/lib
2.修改robot.sh中部分文件的路径，在robot_navigation.launch中修改yalm文件的路径
3.创建地图，在robot_navigation.launch中修改地图路径
4.在robot.sh中设置初始点位置，在exploring_slam.py文件中设置目标点

各个包的介绍：
    cmd_controller:相当一个键盘遥控器，能根据键盘输入，输出cmd_vel消息。
        启动命令：
            rosrun cmd_controller cmd_controller_node
    
    gazebo_car-master:是一个小车的gazebo仿真，提供navigation所有通信接口

    my_robot_name_2dnav:导览机器人导航包的配置文件和启动文件。

    navigation：导航包
        知识点过多，参考以下链接
        参考链接：http://wiki.ros.org/navigation/Tutorials/RobotSetup

    ranger_ros-main:机器人底盘的ros包
        启动命令：
            sudo modprobe gs_usb
            sudo ip link set can0 up type can bitrate 500000
            roslaunch ranger_base ranger_mini_v2.launch

        固件刷新：
            参考用户手册

        查看原始通信数据：
            sudo modprobe gs_usb
            sudo ip link set can0 up type can bitrate 500000
            candump can0
    
    realsense-ros:暂时弃用，改用D455_ros

    robot_voice:能将字符串消息转语音文件并播放
    在配置install时要设置系统搜索动态链接库的路径，路径在install/share/robot_voice/lib
        启动命令：
            rosrun robot_voice robot_voice_node

        订阅的消息话题:/robot/voice

    rplidar_ros:雷达驱动包
        参考链接：http://wiki.ros.org/rplidar
        启动命令：
            roslaunch rplidar_ros rplidar_s2.launch
        若提示USB权限不够：
            sudo chmod 666 /dev/ttyUSB0
    
    simulation_gazebo:仿真小车配套的navigation的配置文件和启动文件

    slam_gmapping-melodic-devel:2D激光建图包
        参考链接：https://wiki.ros.org/slam_gmapping/Tutorials/MappingFromLoggedData
        启动2D激光雷达：
            roslaunch rplidar_ros rplidar_s2.launch

        启动激光雷达滤波，降低采样率和滤波：
            rosrun rplidar_ros scan_low_gmapping.py
	
	启动/tf树
		rosrun robot_setup_tf_tutorial tf_broadcaster	
	
        启动小车，读取里程计信息：
            sudo modprobe gs_usb
            sudo ip link set can0 up type can bitrate 500000
            roslaunch ranger_base ranger_mini_v2.launch

        启动建图节点：
            rosrun gmapping slam_gmapping scan:=scan_low
            可选选项：scan:=you_scan_name _odom_frame:=you_odom_name

        保存地图：
            rosrun map_server map_saver -f <map_name>
        
仿真启动流程：


真实机器人启动流程:
    sudo modprobe gs_usb
    sudo ip link set can0 up type can bitrate 500000
    /home/hnu/hnu/robot/gz_robot/robot.sh
    最后将遥控器打到指令控制模式

仿真机器人启动流程：
    启动仿真机器人：
        roslaunch gazebo_pkg gazebo.launch

    启动导航包：
        roslaunch simulation_gazebo robot_navigation.launch

    启动rviz：#需根据具体情况修改启动路径
        rviz -d /home/hnu/hnu/robot/gz_robot/src/simulation_gazebo/simulation.rviz


    

    
