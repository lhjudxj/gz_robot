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

pose_x = pose_y = 0

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
        
        # self.feedback_sub = rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, pos_prt_cb)
        self.feedback_sub = rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, pos_prt_cb, queue_size=1)
        self.broadcast_pub=rospy.Publisher("/robot/voice",String,queue_size=10)
        # 设置目标点的位置  
        # 在rviz中点击 2D Nav Goal 按键，然后单击地图中一点  
        # 在终端中就会看到该点的坐标信息  
        locations = dict()  
        
        locations['1'] = Pose(Point(3.136, 4.539, 0.000), Quaternion(0.000, 0.000, -0.004, 1.000))
        #locations['2'] = Pose(Point(3.666, 4.200, 0.000), Quaternion(0.000, 0.000, -0.730, 0.683))
        locations['2'] = Pose(Point(2.950, 0.602, 0.000),  Quaternion(0.000, 0.000, -0.004, 1.000))  
        locations['3'] = Pose(Point(-1.442, 4.987, 0.000), Quaternion(0.000, 0.000, 0.703, 0.711))  
        # locations['4'] = Pose(Point(-3.891, 4.500, 0.000), Quaternion(0.000, 0.000, -0.018, 1.000))  
        locations['4'] = Pose(Point(-4.760, 4.827, 0.000), Quaternion(0.000, 0.000, 0.703, 0.711))  
        # locations['5'] = Pose(Point(2.000, -0.170, 0.000), Quaternion(0.000, 0.000, 0.020, 1.000))  
        locations['5'] = Pose(Point(-0.030, -0.170, 0.000), Quaternion(0.000, 0.000, 0.020, 1.000))  
        
        
        broadcast_content = dict()
        init_broad = dict()
           
        #broadcast_content['1'] = "我是湖南大学机器人智能技术研发中心导览机器人，接下来将由我来给各位介绍实验室的相关设备" 

        #broadcast_content['2'] = "这是视觉激光打标系统，我实验室拥有相关专利三项，软著一项，可以雕刻精细的图案、复杂的几何形状和微小的字符。"                        
        
        #broadcast_content['3'] = "这是智能装配系统，我实验室已完成整套产品立库进出库配系统的设计，同时研发自动智能码垛党员共4台，每台设备可替代3名熟练工人"
        
        #broadcast_content['4'] = "这是三维识别系统，该系统识别范围广，京都高，抗干扰性强，我实验室拥有完全自主产权"
        
        #broadcast_content['5'] = "至此，本次实验室导览结束,感谢各位参观。"
        
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

        broadcast_time['1'] = 1
        broadcast_time['2'] = 1
        broadcast_time['3'] = 1
        broadcast_time['4'] = 1
        broadcast_time['5'] = 1
        # broadcast_time['6'] = 1
        #broadcast_time['7'] = 2
        #broadcast_time['8'] = 2
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
            rospy.sleep(2)  

        rospy.loginfo("Starting navigation test")  
        sequence = list(locations)
        # 开始主循环，随机导航  
        while not rospy.is_shutdown():  
            # 如果已经走完了所有点，再重新开始排序  
            if i == n_locations:  
                # while 1:
                #     time.sleep(1)
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
                    with open("/home/hnu/points.txt","a") as file:
                        file.write(str(pose_x)+"\t"+str(pose_y)+"\n")

                    #播报文字
                    #self.broadcast_pub.publish(broadcast_content[location])
                    # print(self.move_base.action_client.ActionFeedback)
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

# def pos_prt_cb(pose):
#     with open("/home/hnu/points.txt","a") as file:
#         pose_x = pose.pose.pose.position.x
#         pose_y = pose.pose.pose.position.y
#         file.write(str(pose_x)+"\t"+str(pose_y)+"\n")
def pos_prt_cb(pose):
    global pose_x, pose_y 
    pose_x = pose.pose.pose.position.x
    pose_y = pose.pose.pose.position.y

def trunc(f, n):  
    slen = len('%.*f' % (n, f))  

    return float(str(f)[:slen])  

if __name__ == '__main__':  
    try:  
        NavTest()  
        rospy.spin()  

    except rospy.ROSInterruptException:  
        rospy.loginfo("Exploring SLAM finished.")
