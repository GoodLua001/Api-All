getgenv().Rip = function()
    local url = 'https://donebell.vercel.app/api/Rip'
    local chooses
    local foundServers = game:GetService('HttpService'):JSONDecode(game:HttpGet(url))
    for i, v in foundServers do
        if v.jobId ~= game.JobId then
            chooses = v
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(4442272183, chooses.jobId, game.Players.LocalPlayer)
end

function CheckRip()
    return game.Workspace._WorldOrigin.Locations:FindFirstChild("Error")
end

spawn(function()
    while task.wait(3) do
        pcall(function()
            if not CheckRip() then
                return Rip()
            end
        end)
    end
end)
