# TUM_Computer_Vision
It is the repository of the final challenge project for Computer Vision (SS22) at Technical University Munich.

Lecturer: Prof. Dr.-Ing. Klaus Diepold


Team Member:
- Qiwen Xu,
- Xiangyu Fu, 
- Xiaodong Lei, 
- Yunyu Chen, 
- Yuntian Yan.


---

## Introduction
"Tout Into the Picture" allows users to observe the scene through a virtual camera by building a 3D scene to achieve the effect of a tour in the picture[1].

We develop a Matlab app. In this app, users can observe the scene presented by the selected picture from different perspectives, initially achieving the same effect as the paper.


Here is a exmaple of our project,

![2022-07-18-23-56-09 mp4_20220718_235809](https://user-images.githubusercontent.com/54738414/179624820-d967b2c8-0bb4-4b87-90b6-52e957b53e38.gif)

---
## GUI Environment 

![cover](https://user-images.githubusercontent.com/54738414/179618055-30bd906c-3b9b-4ab3-862b-0db71db1aab5.png)


> :computer: : should work both for **WINDOWS** and **MAC**
>
> :rocket: MATLAB Version: at least **MATLAB R2022b**
> 
> :keyboard: GUI develop kit: **APP designer**
---
## How to use our GUI
### Step 1
First, open the `mian.m` and click the run botton,
![image](https://user-images.githubusercontent.com/54738414/179616204-4ed17295-c91a-41c9-be86-8ec6d0a424f0.png)

Then the GUI will be opened like this,
![1658177597339](https://user-images.githubusercontent.com/54738414/179615738-1deb7040-b58d-4d1a-aa7f-992406d7e5f0.png)

Click the `Select Dataset here` button and select the folder which you store your images.
![image](https://user-images.githubusercontent.com/54738414/179615911-84dbf7dd-df1d-4fa8-8747-3c58bbbba886.png)

Here we use the example dataset as the input folder and we select the `simple_room.jpg` as our Image Tour example.Once you selceted the image, the `next step` will occur. After that you can begin your tour of image!:smile:
![image](https://user-images.githubusercontent.com/54738414/179616000-dc1bc94b-2f28-42ca-8f3f-ec4eeeb3aea5.png)

### Step 2
In the second step, you will be taken to the foreground selection page. Please note that if you do not have a foreground in your image, please skip this step directly using the `Nest Step` button.
![image](https://user-images.githubusercontent.com/54738414/179616340-bdb42037-2e01-4265-a233-2505a4dbdccc.png)

 If there exist some foregrounds in your selected iamge, please click the `Select Foreground` button and mark the area in the foreground of the image. Our GUI allows you to select multiple foregrounds. 
![image](https://user-images.githubusercontent.com/54738414/179616394-5971bde4-06d8-4f40-9fa3-dcffcc1bc70d.png)

Depending on the size of the image, the processing of the image takes different amounts of time. After the process, you will see the image showing like this. Then you can click the `Next Setp` button to continue your tour.
![image](https://user-images.githubusercontent.com/54738414/179616419-40c52abf-abb8-4e55-bdfe-c052ab33a97e.png)

### Step 3
In this Step, Please sclect the Vanishing point and the rear wall to help our algorithm to build the 3d coordinates, please use `Select Vanishing point` and `Select rear wall` seperately.
![image](https://user-images.githubusercontent.com/54738414/179616452-cc934242-0159-489c-81df-3187bc3134b9.png)
Our GUI will display vanishing points and vanishing lines to help you check if your selection is correct. If it is not correct, you are free to reselect the vanishing point or the rear wall; if you think there is nothing wrong, then please use the `Next Step` button to enter the picture tour.
![image](https://user-images.githubusercontent.com/54738414/179616482-62a2271e-04c0-4a2d-a45f-57bf29b28e7c.png)

### Step 4 : Tour into the image
In this page, you can begin your room tour. Please use the slides in the right-hand side to move you position. Have fun! If you want to try a new image, please use the `Select a new iamge` button.
![image tour](https://user-images.githubusercontent.com/54738414/179622553-d0a570da-5f51-429c-aef3-5e603c0f07c4.gif)
