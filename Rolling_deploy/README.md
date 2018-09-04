# Rolling_deployment
This directory is used to create rolling deployment of auto scaling groups. Any changes made to the luanch configuration will trigger the deployment. 

This process is stable and in case if the new deoployment fails the health check the older succesfull deployment is restored. And also it will destroy the newer deployment.
