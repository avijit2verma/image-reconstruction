function imageBuilding(numOfPolygons,numOfGenerations)
clear functions
global ax3 ax4 color halfWidth halfHeight

xCoordinate=rand(2,numOfPolygons);
yCoordinate=rand(2,numOfPolygons);
color=0.3+0.7*rand(3,numOfPolygons);

f=figure('Position',[50,50,1500 800],'Toolbar','figure');
ax1=subplot(2,2,1,'Color','k','Parent',f);
xlim(ax1,[0 1])
ylim(ax1,[0 1])
set(ax1,'xTickMode','manual','yTickMode','manual','xTick',[],'yTick',[]);
title(ax1,'Original polygon distribution');

uicontrol('Style','pushbutton','String','pause','Callback',@buttonPauseContinue);

for i=1:numOfPolygons
    patch([xCoordinate(1,i) xCoordinate(1,i) xCoordinate(2,i),xCoordinate(2,i)],...
        [yCoordinate(1,i) yCoordinate(2,i) yCoordinate(2,i) yCoordinate(1,i)],color(:,i)',...
        'Parent',ax1,'EdgeColor','none');
end

im=getframe(ax1);
original=im.cdata;
halfWidth=abs(diff(xCoordinate)/2);
halfHeight=abs(diff(yCoordinate)/2);


newCenterXCoordinate=(1-2*halfWidth) .*rand(1,numOfPolygons)+halfWidth;
newCenterYCoordinate=(1-2*halfHeight).*rand(1,numOfPolygons)+halfHeight;

ax2=subplot(2,2,2,'Color','k','Parent',f);
set(ax2,'xTickMode','manual','yTickMode','manual','xTick',[],'yTick',[]);
title(ax2,'Polygon combinations');

xlim(ax2,[0 1])
ylim(ax2,[0 1])


polygonHandles=zeros(1,numOfPolygons);
for i=1:numOfPolygons
    polygonHandles(i)=patch([newCenterXCoordinate(i)-halfWidth(i) newCenterXCoordinate(i)-halfWidth(i) newCenterXCoordinate(i)+halfWidth(i) newCenterXCoordinate(i)+halfWidth(i)],...
        [newCenterYCoordinate(i)-halfHeight(i) newCenterYCoordinate(i)+halfHeight(i) newCenterYCoordinate(i)+halfHeight(i) newCenterYCoordinate(i)-halfHeight(i)],...
        color(:,i)','Parent',ax2,'EdgeColor','none');
end

ax3=subplot(2,2,3);

ax4=subplot(2,2,4,'Color','k','Parent',f,'xTickMode','manual','yTickMode','manual',...
    'xTick',[],'yTick',[]);
xlim(ax4,[0 1])
ylim(ax4,[0 1])

title(ax4,'Best polygon combination so far');
lb=[halfWidth halfHeight];
ub=[1-halfWidth 1-halfHeight];
options=gaoptimset('CreationFcn',@create_func,'CrossoverFcn',{@crossoverheuristic,1.2},...
    'Generations',numOfGenerations,'MutationFcn',{@mutationuniform,0.05},...
    'OutputFcns',{@mygaplotbestf,@drawBestSolution},'FitnessLimit',0,...
    'PopulationSize',100,'PopulationType','doubleVector','SelectionFcn',@selectionroulette,...
    'StallGenLimit',Inf,'FitnessScalingFcn',@fitscalingrank,'CrossoverFraction',0.8,...
    'PopInitRange',[lb;ub]);



try
    [x,fval,flag]=ga(@(x)imageBuildingObjective(x),2*numOfPolygons,[],[],[],[],lb,...
        ub,[],options);
    disp(flag);
catch % #ok
    %do nothing
end
end    

    