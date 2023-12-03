return function(Toolbar: PluginToolbar, Title: string, Description: string, Icon: string, RecordName: string, CWVH: boolean, Method: () -> (), Arguments: { }?): ()
        local ToolbarButton: PluginToolbarButton = Toolbar:CreateButton(Title, Description, Icon);
        ToolbarButton.ClickableWhenViewportHidden = CWVH; 

        local function ButtonMethod(): any?
                pcall(function(): ()
                        return Arguments and Method(table.unpack(Arguments)) or Method();
                end);

                game:GetService('ChangeHistoryService'):SetWaypoint(RecordName);
        end

        return (ToolbarButton.Click:Connect(ButtonMethod));
end
