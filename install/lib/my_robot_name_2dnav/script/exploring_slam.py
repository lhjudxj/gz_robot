#!/usr/bin/env python3
# -*- coding: utf-8 -*-
 
import roslib;
import rospy  
import actionlib  
from actionlib_msgs.msg import *  
from geometry_msgs.msg import Pose, PoseWithCovarianceStamped, Point, Quaternion, Twist  
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal  
from random import sample  
from math import pow, sqrt  
from std_msgs.msg import String
import time

class NavTest():  
    def __init__(self):  
        rospy.init_node('exploring_slam', anonymous=True)  
        rospy.on_shutdown(self.shutdown)  

        # 在每个目标位置暂停的时间 (单位：s)
        self.rest_time = rospy.get_param("~rest_time", 2)  

        # 是否仿真？  
        self.fake_test = rospy.get_param("~fake_test", True)  

        # 到达目标的状态  
        goal_states = ['PENDING', 'ACTIVE', 'PREEMPTED',   
                       'SUCCEEDED', 'ABORTED', 'REJECTED',  
                       'PREEMPTING', 'RECALLING', 'RECALLED',  
                       'LOST']  

        self.broadcast_pub=rospy.Publisher("/robot/voice",String,queue_size=10)
        # 设置目标点的位置  
        # 在rviz中点击 2D Nav Goal 按键，然后单击地图中一点  
        # 在终端中就会看到该点的坐标信息  
        locations = dict()  
        
        #locations['1'] = Pose(Point(5.516, 2.631, 0.000),  Quaternion(0.000, 0.000, 0.619, 0.785))  
        #locations['2'] = Pose(Point(2.860, 2.321, 0.000), Quaternion(0.000, 0.000, 0.622, 0.783))  
        #locations['3'] = Pose(Point(3.341, -1.039, 0.000), Quaternion(0.000, 0.000, -0.096, 0.995))  
        #locations['4'] = Pose(Point(1.377, -1.570, 0.000), Quaternion(0.000, 0.000, 0.989, 0.145))  
        #locations['5'] = Pose(Point(-2.689, 4.029, 0.000),   Quaternion(0.000, 0.000, 0.613, 0.790)) 
        #locations['6'] = Pose(Point(-6.525, 5.476, 0.000),   Quaternion(0.000, 0.000, 0.613, 0.790)) 
        #locations['7'] = Pose(Point(-0.254, -1.993, 0.000),  Quaternion(0.000, 0.000, -0.136, 0.991))  

        locations['1'] = Pose(Point(3.803, -0.146, 0.000),  Quaternion(0.000, 0.000, -0.008, 1.000))  
        locations['2'] = Pose(Point(-5.034, 4.375, 0.000), Quaternion(0.000, 0.000, -0.698, 0.716))  
        locations['3'] = Pose(Point(-5.181, -0.187, 0.000), Quaternion(0.000, 0.000, -0.708, 0.706))  
        locations['4'] = Pose(Point(-6.796, -0.136, 0.000), Quaternion(0.000, 0.000, -0.708, 0.707))  
        locations['5'] = Pose(Point(-6.619, -6.453, 0.000),   Quaternion(0.000, 0.000, 0.706, 0.708)) 
        locations['6'] = Pose(Point(-6.653, -0.136, 0.000),   Quaternion(0.000, 0.000, 0.707, 0.707)) 
        locations['7'] = Pose(Point(-4.370, 2.234, 0.000),  Quaternion(0.000, 0.000, -0.008, 1.000))  
        locations['8'] = Pose(Point(-0.339, -0.861, 0.000),  Quaternion(0.000, 0.000, -0.001, 1.000))  

        
        
        broadcast_content = dict()  

        #broadcast_content['1'] = "激光打标是一种高精度、高速度的标记和刻印技术，其原理是利用激光束对工件进行精确的加工。激光打标广泛应用于工业生产和制造领域，用于标记文字、图像、条形码、序列号等信息，以及在各种材料上进行刻痕、雕刻和切割。\
        #                        激光打标具有非接触式加工、永久性标记、高精度、高效率、无污染等优点，适用于金属、塑料、陶瓷、玻璃等多种材料。\
        #                        激光打标可以实现精细的图案、复杂的几何形状和微小的字符，广泛应用于汽车制造、电子产品、医疗器械、航空航天等行业。\
        #                        通过激光打标，企业可以提高生产效率、增加产品附加值，并确保产品追溯和防伪。"  
        
        #broadcast_content['2'] = "结构光是一种用于三维重建和扫描的技术，通过投射特殊编码的光纹到目标物体上，然后根据光纹在物体表面的形变来获取物体的几何信息。这项技术广泛应用于计算机视觉、虚拟现实、增强现实等领域。\
        #                        结构光的原理是利用发射器发出结构光，并由摄像机捕获反射或散射的光线。通过计算光线传播的路径和相位差异，可以重建出物体表面的三维坐标信息。结构光具有非接触式测量、高精度、快速扫描等优点，适用于各种物体，包括工业制造品、文物艺术品、人体等。\
        #                        使用结构光技术可以进行三维建模、尺寸测量、表面质量检查等应用。在工业制造中，结构光可用于检测产品缺陷、配准组件和控制自动化过程。在文化遗产保护方面，结构光可以帮助记录珍贵文物的几何形状和纹理信息。"
        
        #broadcast_content['3'] = "无人机是一种能够在没有人操控的情况下飞行的飞行器，也被称为无人驾驶飞行器（UAV）。它使用先进的航空技术和自主控制系统，具有多种用途和广泛的应用领域。\
        #                        无人机拥有各种规模和类型，包括迷你型、中型和大型。它们可以配备高清摄像头、传感器、激光雷达等设备，用于航空摄影、地理测绘、环境监测、农业作业、快递配送、搜索救援等任务。\
        #                        无人机的自主飞行能力是通过先进的导航系统和自动控制算法实现的。它们能够根据预设的任务路线或遥控指令进行飞行，并能够实时感知周围环境，做出相应的飞行调整和避障动作。\
        #                        无人机的优势在于它们可以飞行到人类难以到达或危险的区域，执行复杂的任务。同时，与有人飞行器相比，无人机具有更低的成本和更高的效率。它们可以大幅提高工作效率，减少人力资源和时间成本。"
        
        #broadcast_content['4'] = "6D位姿估计是指对物体在六个自由度（三个平移自由度和三个旋转自由度）上的姿态进行准确估计的技术。当将6D位姿估计与机械臂配合使用时，可以实现高度精确的物体定位、抓取和操作。\
        #                        通过使用传感器（如相机、深度摄像头、惯性测量单元等），结合先进的算法和模型，可以实时获取物体的位置和姿态信息。这些信息可以被应用于机械臂的路径规划、抓取计划和实时控制中。\
        #                        6D位姿估计与机械臂的配合可以应用于工业自动化、机器人视觉和智能制造等领域。例如，在装配线上，机械臂可以根据物体的准确位置和姿态进行精准抓取和组装；在仓储物流中，机械臂可以根据物体的位姿信息进行快速而有效的搬运和分拣。\
        #                        这种配合还可以提高生产线的灵活性和适应性。通过实时获取物体姿态，机械臂可以根据不同物体的位置和姿态进行自适应调整，实现自动化生产的高效率和高质量。"
        
        #broadcast_content['5'] = "WiFi定位是一种利用无线网络信号（即WiFi信号）进行定位的技术。它通过分析WiFi信号的强度、延迟和其他特征，确定设备所处的位置信息。\
        #                        WiFi定位技术广泛应用于室内定位、导航服务、智能城市和安全监控等领域。通过在建筑物内部布置WiFi接入点，并结合WiFi定位算法，可以实现在室内环境中对移动设备进行精准定位。这对于商场导航、室内定位服务以及应急救援等场景非常有用。\
        #                        WiFi定位与GPS定位相比，具有一些独特的优势。首先，WiFi信号在室内环境中的覆盖更好，可以提供更准确的定位结果。其次，WiFi定位不受建筑物遮挡的影响，适用于密集建筑群和深层楼宇。此外，WiFi设备已经普及，大多数人都携带着可用的WiFi接收器，使得WiFi定位技术更容易被应用。"
        
        #broadcast_content['6'] = "双目视觉是一种仿照人类双眼视觉系统的技术，利用两个摄像头模拟左右眼，从而实现对物体深度信息的获取和三维重建。通过计算两个摄像头之间的视差，可以准确地测量物体与相机的距离，从而还原真实世界的三维结构。\
        #                        双目视觉技术在机器人、自动驾驶、虚拟现实和医学影像等领域有广泛应用。例如，在机器人领域中，双目视觉可以帮助机器人感知周围环境、进行障碍物检测和路径规划。在自动驾驶领域中，利用双目视觉可以实现对车辆和行人的精准检测与跟踪。在医学影像领域，双目视觉可以辅助医生进行病灶识别和手术导航。\
        #                        双目视觉技术的优势在于能够获取丰富的深度信息，并且对于复杂场景和光照变化具有较好的适应性。此外，与其他三维重建方法相比，双目视觉具有较低的成本和实时性，使其成为实际应用中的重要选择。"

        #broadcast_content['7'] = "双目视觉是一种仿照人类双眼视觉系统的技术，利用两个摄像头模拟左右眼，从而实现对物体深度信息的获取和三维重建。通过计算两个摄像头之间的视差，可以准确地测量物体与相机的距离，从而还原真实世界的三维结构。\
        #                        双目视觉技术在机器人、自动驾驶、虚拟现实和医学影像等领域有广泛应用。例如，在机器人领域中，双目视觉可以帮助机器人感知周围环境、进行障碍物检测和路径规划。在自动驾驶领域中，利用双目视觉可以实现对车辆和行人的精准检测与跟踪。在医学影像领域，双目视觉可以辅助医生进行病灶识别和手术导航。\
        #                        双目视觉技术的优势在于能够获取丰富的深度信息，并且对于复杂场景和光照变化具有较好的适应性。此外，与其他三维重建方法相比，双目视觉具有较低的成本和实时性，使其成为实际应用中的重要选择。"

        broadcast_time = dict()  

        broadcast_time['1'] = 2
        broadcast_time['2'] = 2
        broadcast_time['3'] = 2
        broadcast_time['4'] = 2
        broadcast_time['5'] = 2
        broadcast_time['6'] = 2
        broadcast_time['7'] = 2
        broadcast_time['8'] = 2
        # 发布控制机器人的消息  
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=5)  

        # 订阅move_base服务器的消息  
        self.move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)  

        rospy.loginfo("Waiting for move_base action server...")  

        # 60s等待时间限制  
        self.move_base.wait_for_server(rospy.Duration(60))  
        rospy.loginfo("Connected to move base server")  
  
        # 保存机器人的在rviz中的初始位置  
        initial_pose = PoseWithCovarianceStamped()  

        # 保存成功率、运行时间、和距离的变量  
        n_locations = len(locations)  
        n_goals = 0  
        n_successes = 0  
        i = 0  
        distance_traveled = 0  
        start_time = rospy.Time.now()  
        running_time = 0  
        location = ""  
        last_location = ""    
 
        # 确保有初始位置  
        while initial_pose.header.stamp == "":  
            rospy.sleep(1)  

        rospy.loginfo("Starting navigation test")  
        sequence = list(locations)
        # 开始主循环，随机导航  
        while not rospy.is_shutdown():  
            # 如果已经走完了所有点，再重新开始排序  
            if i == n_locations:  
                while 1:
                    time.sleep(1)
                i = 0  
                # sequence = sample(list(locations), n_locations)  
                
                # 如果最后一个点和第一个点相同，则跳过  
                if sequence[0] == last_location:  
                    i = 1  

            # 在当前的排序中获取下一个目标点  
            location = sequence[i]  

            # 跟踪行驶距离  
            # 使用更新的初始位置  
            if initial_pose.header.stamp == "":  
                distance = sqrt(pow(locations[location].position.x -   
                                    locations[last_location].position.x, 2) +  
                                pow(locations[location].position.y -   
                                    locations[last_location].position.y, 2))  
            else:  
                rospy.loginfo("Updating current pose.")  
                distance = sqrt(pow(locations[location].position.x -   
                                    initial_pose.pose.pose.position.x, 2) +  
                                pow(locations[location].position.y -   
                                    initial_pose.pose.pose.position.y, 2))  
                initial_pose.header.stamp = ""  

            # 存储上一次的位置，计算距离  
            last_location = location  

            # 计数器加1  
            i += 1  
            n_goals += 1  

            # 设定下一个目标点  
            self.goal = MoveBaseGoal()  
            self.goal.target_pose.pose = locations[location]  
            self.goal.target_pose.header.frame_id = 'map'  
            self.goal.target_pose.header.stamp = rospy.Time.now()  

            # 让用户知道下一个位置  
            rospy.loginfo("Going to: " + str(location))  

            # 向下一个位置进发  
            self.move_base.send_goal(self.goal)  

            # 五分钟时间限制  
            finished_within_time = self.move_base.wait_for_result(rospy.Duration(300))   

            # 查看是否成功到达  
            if not finished_within_time:  
                self.move_base.cancel_goal()  
                rospy.loginfo("Timed out achieving goal")  
            else:  
                state = self.move_base.get_state()  
                if state == GoalStatus.SUCCEEDED:  
                    rospy.loginfo("Goal succeeded!")  
                    n_successes += 1  
                    distance_traveled += distance  
                    rospy.loginfo("State:" + str(state))
                    #self.broadcast_pub.publish(broadcast_content[location])
                    time.sleep(broadcast_time[location])
                    
                else:  
                  rospy.loginfo("Goal failed with error code: " + str(goal_states[state]))  

            # 运行所用时间  
            running_time = rospy.Time.now() - start_time  
            running_time = running_time.secs / 60.0  

            # 输出本次导航的所有信息  
            rospy.loginfo("Success so far: " + str(n_successes) + "/" +   
                          str(n_goals) + " = " +   
                          str(100 * n_successes/n_goals) + "%")  

            rospy.loginfo("Running time: " + str(trunc(running_time, 1)) +   
                          " min Distance: " + str(trunc(distance_traveled, 1)) + " m")  

            rospy.sleep(self.rest_time)  

    def update_initial_pose(self, initial_pose):  
        self.initial_pose = initial_pose  

    def shutdown(self):  
        rospy.loginfo("Stopping the robot...")  
        self.move_base.cancel_goal()  
        rospy.sleep(2)  
        self.cmd_vel_pub.publish(Twist())  
        rospy.sleep(1)  

def trunc(f, n):  
    slen = len('%.*f' % (n, f))  

    return float(str(f)[:slen])  

if __name__ == '__main__':  
    try:  
        NavTest()  
        rospy.spin()  

    except rospy.ROSInterruptException:  
        rospy.loginfo("Exploring SLAM finished.")
