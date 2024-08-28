cd C:\Users\Vector\.ssh
ssh -i atlas.pem ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com "mkdir -p /home/ec2-user/vexio"
ssh -i atlas.pem ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com "mkdir -p /home/ec2-user/vexio/frontend"
ssh -i atlas.pem ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com "mkdir -p /home/ec2-user/vexio/frontend/release"

scp -i atlas.pem -r C:\Users\Vector\Desktop\vexio\frontend\release ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com:\home\ec2-user\vexio\frontend
scp -i atlas.pem C:\Users\Vector\Desktop\vexio\frontend\Release.Dockerfile ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com:\home\ec2-user\vexio\frontend\Release.Dockerfile

scp -i atlas.pem -r C:\Users\Vector\Desktop\vexio\backend ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com:\home\ec2-user\vexio

scp -i atlas.pem -r C:\Users\Vector\Desktop\vexio\docker ec2-user@ec2-44-201-253-119.compute-1.amazonaws.com:\home\ec2-user\vexio