function [state,options,optchanged]=drawBestSolution(options,state,~)
optchanged=false;

[best,bestIdx] = min(state.Score);
bestPopulation=state.Population(bestIdx,:);
newxCoordinate=bestPopulation(1:1/2*length(bestPopulation));
newyCoordinate=bestPopulation(1/2*length(bestPopulation)+1:end);
global color ax4 halfWidth halfHeight
persistent fitest
if isempty(fitest)
    fitest=1e9;
end

if fitest>best
    fitest=best;
    
    delete(get(ax4,'Children'))
    for j=1:length(bestPopulation)/2
        patch([newxCoordinate(j)-halfWidth(j) newxCoordinate(j)-halfWidth(j) newxCoordinate(j)+halfWidth(j) newxCoordinate(j)+halfWidth(j)],...
            [newyCoordinate(j)-halfHeight(j) newyCoordinate(j)+halfHeight(j) newyCoordinate(j)+halfHeight(j) newyCoordinate(j)-halfHeight(j)],...
            color(:,j)','Parent' ,ax4,'EdgeColor','none');
    end
    
end
