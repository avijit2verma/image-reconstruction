function buttonPauseContinue(hObj,~)
        % Determine the length of stack. If length is one then we don't need to
        % perform the callback action
        callStack = dbstack;
        if length(callStack) == 1
            return;
        end
        if isempty(getappdata(0,'gadsSolverState'))
            setappdata(0,'gadsSolverState','pause');
            set(hObj,'String','Resume');
            % Wait for hObj to change its String property
            waitfor(hObj,'String');
            if isempty(findobj(0,'Type','uicontrol','string','Pause')) % Figure is deleted
                setappdata(0,'gadsSolverState','');
            end
        else
            setappdata(0,'gadsSolverState','');
            set(hObj,'String','Pause');
        end
end