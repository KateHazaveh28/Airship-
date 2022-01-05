a1=15; % semi-major axis of one semi-ellispe
a2=5; % semi-major axis of the other semi-ellipse
b=2.5; % semi-minor axis
n=12; % number of gores
index=1;
sz=.001; % step size
data1=(0:sz:a1)'; % y-coord (distance along major axis) of ellipse of
 revolution
data1=[data1 zeros(length(data1),3)];
data1(1,2:4)=[b 0 pi*b/n];
for y=sz:sz:a1
 index=index+1;
 data1(index,2)=(b/a1)*(a1^2-y^2)^.5; % correspond x-coord
 data1(index,3)=((((data1(index,1)-
data1(index-1,1))^2)+((data1(index,2)-
data1(index-1,2))^2))^.5)+data1(index-1,3); % Y-coord of gore
 data1(index,4)=pi*data1(index,2)/n;
end
plot([data1(:,4) -data1(:,4)],[data1(:,3) data1(:,3)],'r-')
hold on
index=1;
data2=(0:sz:a2)'; % y-coord (distance along major axis) of ellipse of
 revolution
data2=[data2 zeros(length(data2),3)];
data2(1,2:4)=[b 0 pi*b/n];
for y=sz:sz:a2
 index=index+1;
 data2(index,2)=(b/a2)*(a2^2-y^2)^.5; % correspond x-coord
 data2(index,3)=-((((data2(index,1)-
data2(index-1,1))^2)+((data2(index,2)-
data2(index-1,2))^2))^.5)+data2(index-1,3); % Y-coord of gore
 data2(index,4)=pi*data2(index,2)/n;
end
plot([data2(:,4) -data2(:,4)],[data2(:,3) data2(:,3)],'r-')
axis equal
DATA=[data1;data2];
title(['Gore Template for ' num2str(n) ' Gores'])