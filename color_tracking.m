clc
clear all
close all
warning off
c=webcam;
while true
e=c.snapshot;
mkdir=createMask(e);
mkdir=imfill(mkdir,'holes');
mkdir=bwareaopen(mkdir,20);
labeledImage = bwlabel(mkdir);
measurements = regionprops(labeledImage, 'BoundingBox', 'Area');
subplot(1,2,1);
imshow(e);
subplot(1,2,2);
imshow(e);
hold on;
for k = 1 : length(measurements)
  thisBB = measurements(k).BoundingBox;
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],'EdgeColor','b','LineWidth',5 )
end
drawnow;
hold off;
end
