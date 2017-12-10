function error=imageBuildingObjective(string)

        newxCoordinate=string(1:1/2*length(string));
        newyCoordinate=string(1/2*length(string)+1:end);

        for j=1:numOfPolygons
            set(polygonHandles(j),'Vertices',...
                [[newxCoordinate(j)-halfWidth(j) newxCoordinate(j)-halfWidth(j) newxCoordinate(j)+halfWidth(j) newxCoordinate(j)+halfWidth(j)]'...
                ,[newyCoordinate(j)-halfHeight(j) newyCoordinate(j)+halfHeight(j) newyCoordinate(j)+halfHeight(j) newyCoordinate(j)-halfHeight(j)]']);
        end

        newImage=getframe(ax2);



        error=sqrt(sum((original(:)-newImage.cdata(:)).^2))/1000;

end
