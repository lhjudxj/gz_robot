#!/bin/bash

declare -a terminals=()  # 存储终端进程的PID

# 启动ROS节点函数，并将节点启动命令添加到终端数组
start_ros_node_in_terminal() {
    terminal_name="$1"
    ros_node_command="$2"

    # 打开新终端，并执行节点启动命令
    gnome-terminal -- bash -c "$ros_node_command; exec bash" &
    terminals+=($!)  # 将终端进程的PID添加到数组中
}

# 关闭所有ROS节点和终端函数
shutdown_ros_nodes_and_terminals() {
    for terminal_pid in "${terminals[@]}"; do
        # 使用终端进程的PID来关闭终端
        kill -9 $terminal_pid
    done
    terminals=()  # 清空终端PID数组
}

# 启动多个ROS节点
start_ros_nodes() {
    # 启动第一个节点
    start_ros_node_in_terminal "Terminal 1" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash && roslaunch gazebo_pkg gazebo.launch"
    sleep 5

    # 可以根据需要添加更多节点启动命令，每个节点对应一个终端
    start_ros_node_in_terminal "Terminal 2" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash && roslaunch simulation_gazebo robot_navigation.launch"
    sleep 4

    start_ros_node_in_terminal "Terminal 3" "source /home/hnu/hnu/robot/gz_robot/devel/setup.bash && rviz -d /home/hnu/hnu/robot/gz_robot_rviz.rviz"
    sleep 2
}

# 启动多个ROS节点
start_ros_nodes

# 循环接受键盘输入
while true; do
    read -p "输入 'q' 关闭所有ROS节点和终端: " input
    if [[ $input == "q" ]]; then
        kill -9 "Terminal 1"
        kill -9 "Terminal 2"
        kill -9 "Terminal 3"
        break
    else
        echo "未识别的输入，请输入 'q' 关闭节点。"
    fi
done