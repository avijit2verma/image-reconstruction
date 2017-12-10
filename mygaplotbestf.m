function [state,options,optchanged] = mygaplotbestf(options,state,flag)
% Plots the best score and the mean score.

if size(state.Score,2) > 1
    title('Best Fitness Plot: not available','interp','none');
    return;
end
global ax3
switch flag
    case 'init'
        hold(ax3,'on');
        set(ax3,'xlim',[0,options.Generations]);
        xlabel(ax3,'Generation','interp','none');
        ylabel(ax3,'Fitness value','interp','none');
        plotBest = plot(ax3,state.Generation,min(state.Score),'.k');
        set(plotBest,'Tag','gaplotbestf');
        plotMean = plot(ax3,state.Generation,meanf(state.Score),'.b');
        set(plotMean,'Tag','gaplotmean');
        title(ax3,['Best: ',' Mean: '],'interp','none')
    case 'iter'
        best = min(state.Score);
        m    = meanf(state.Score);
        plotBest = findobj(get(ax3,'Children'),'Tag','gaplotbestf');
        plotMean = findobj(get(ax3,'Children'),'Tag','gaplotmean');
        newX = [get(plotBest,'Xdata') state.Generation];
        newY = [get(plotBest,'Ydata') best];
        set(plotBest,'Xdata',newX, 'Ydata',newY);
        newY = [get(plotMean,'Ydata') m];
        set(plotMean,'Xdata',newX, 'Ydata',newY);
        set(get(ax3,'Title'),'String',sprintf('Best: %g Mean: %g',best,m));
    case 'done'
        legend(ax3,'Best fitness','Mean fitness','FontSize',8);
        hold(ax3,'off');
end
optchanged=false;
