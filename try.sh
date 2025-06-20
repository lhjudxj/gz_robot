#!/bin/bash

# 发送 geometry_msgs/PoseWithCovarianceStamped 消息
initial_pose() {
    rostopic pub -1 /your_topic_name geometry_msgs/PoseWithCovarianceStamped "
    header:
    seq: 0
    stamp:
        secs: 0
        nsecs: 0
    frame_id: ''
    pose:
    pose:
        position:
        x: 0.143
        y: -1.108
        z: 0.000
        orientation:
        x: 0.000
        y: 0.000
        z: 0.597
        w: 0.802
    covariance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
    "
}


# 启动ROS节点的函数，每个节点在独立的终端标签页中启动
start_nodes() {
    # 在这里启动你的ROS节点
    gnome-terminal --tab --title="rplidar" -- bash -c "roslaunch rplidar_ros rplidar_s2.launch"
    sleep 2
    gnome-terminal --tab --title="rplidar_filter" -- bash -c "rosrun rplidar_ros low_lidar.py"
    sleep 2
    gnome-terminal --tab --title="tf_broadcast" -- bash -c "rosrun robot_setup_tf_tutorial tf_broadcaster"
    sleep 2
    gnome-terminal --tab --title="ranger_ros" -- bash -c "roslaunch ranger_base ranger_mini_v2.launch"
    sleep 2
    gnome-terminal --tab --title="robot_voice" -- bash -c "rosrun robot_voice robot_voice_node"
    sleep 2
    gnome-terminal --tab --title="navigation" -- bash -c "roslaunch my_robot_name_2dnav robot_navigation.launch"
    sleep 5
    gnome-terminal --tab --title="rviz_visual" -- bash -c "rviz -d /home/hnu/hnu/robot/gz_robot/gz_robot_rviz.rviz"
    sleep 2
    initial_pose
    sleep 2
    # gnome-terminal --tab --title="main_controller" -- bash -c "rosrun my_robot_name_2dnav exploring_slam.py"
    # 根据需要添加更多节点
}

# 用于处理用户输入的信号捕获函数
trap_ctrlc() {
    echo "正在终止ROS节点并退出..."
    
    # 终止ROS节点
    # 根据实际情况修改匹配你的ROS节点进程名
    rosnode kill -a
    
    exit 2
}

# 设置捕获 Ctrl-C 信号的陷阱
trap trap_ctrlc INT

# 启动ROS节点
start_nodes

# 等待用户输入（按下 'q' 键）
echo "按 'q' 键以停止ROS节点并退出"
while true; do
    read -n 1 input
    if [[ $input == "q" ]]; then
        trap_ctrlc
    fi
done

# #!/bin/bash

# declare -a terminals=()  # 存储终端进程的PID

# # 启动ROS节点函数，并将节点启动命令添加到终端数组
# start_ros_node_in_terminal() {
#     terminal_name="$1"
#     ros_node_command="$2"

#     # 打开新终端，并执行节点启动命令
#     gnome-terminal -- bash -c "$ros_node_command; exec bash" &
#     terminals+=($!)  # 将终端进程的PID添加到数组中
# }

# # 关闭所有ROS节点和终端函数
# shutdown_ros_nodes_and_terminals() {
#     for terminal_pid in "${terminals[@]}"; do
#         # 使用终端进程的PID来关闭终端
#         kill -9 $terminal_pid
#     done
#     terminals=()  # 清空终端PID数组
# }

# # 启动多个ROS节点
# start_ros_nodes() {
#     # 启动第一个节点
#     start_ros_node_in_terminal "Terminal 1" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash  && roslaunch my_robot_name_2dnav my_robot_configuration.launch"
#     sleep 5

#     # 可以根据需要添加更多节点启动命令，每个节点对应一个终端
#     start_ros_node_in_terminal "Terminal 2" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash && roslaunch my_robot_name_2dnav robot_navigation.launch"
#     sleep 4

#     start_ros_node_in_terminal "Terminal 3" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash && rviz -d /home/hnu/hnu/robot/gz_robot/gz_robot_rviz.rviz"
#     sleep 2
# }

# # 启动多个ROS节点
# start_ros_nodes

# # 循环接受键盘输入
# while true; do
#     read -p "输入 'q' 关闭所有ROS节点和终端: " input
#     if [[ $input == "q" ]]; then
#         shutdown_ros_nodes_and_terminals
#         break
#     else
#         echo "未识别的输入，请输入 'q' 关闭节点。"
#     fi
# done
