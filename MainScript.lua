local library = (function()
    local a = {windowCount = 0, flags = {}}
local b = {}
setmetatable(
    b,
    {__index = function(c, d)
            return game:GetService(d)
        end, __newindex = function(e, f)
            e[f] = nil
            return
        end}
)
local g
local h = b.Players.LocalPlayer:GetMouse()
function Drag(i, j)
    if g then
        g.ZIndex = -2
    end
    g = i
    g.ZIndex = -1
    if not j then
        j = i
    end
    local k
    local l
    local m
    local n
    local function o(p)
        local q = p.Position - m
        i.Position = UDim2.new(n.X.Scale, n.X.Offset + q.X, n.Y.Scale, n.Y.Offset + q.Y)
    end
    j.InputBegan:Connect(
        function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                k = true
                m = p.Position
                n = i.Position
                p.Changed:Connect(
                    function()
                        if p.UserInputState == Enum.UserInputState.End then
                            k = false
                        end
                    end
                )
            end
        end
    )
    i.InputChanged:Connect(
        function(p)
            if p.UserInputType == Enum.UserInputType.MouseMovement then
                l = p
            end
        end
    )
    game:service("UserInputService").InputChanged:Connect(
        function(p)
            if p == l and k then
                o(p)
            end
        end
    )
end
function ClickEffect(r)
    spawn(
        function()
            if r.ClipsDescendants ~= true then
                r.ClipsDescendants = true
            end
            local s = Instance.new("ImageLabel")
            s.Name = "Ripple"
            s.Parent = r
            s.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            s.BackgroundTransparency = 1.000
            s.ZIndex = 8
            s.Image = "rbxassetid://2708891598"
            s.ImageTransparency = 0.800
            s.ScaleType = Enum.ScaleType.Fit
            s.ImageColor3 = Color3.fromRGB(131, 132, 255)
            s.Position =
                UDim2.new(
                (h.X - s.AbsolutePosition.X) / r.AbsoluteSize.X,
                0,
                (h.Y - s.AbsolutePosition.Y) / r.AbsoluteSize.Y,
                0
            )
            b.TweenService:Create(
                s,
                TweenInfo.new(1),
                {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}
            ):Play()
            wait(0.25)
            b.TweenService:Create(s, TweenInfo.new(.5), {ImageTransparency = 1}):Play()
            repeat
                wait()
            until s.ImageTransparency == 1
            s:Destroy()
        end
    )
end
local t = Instance.new("ScreenGui")
t.Name = b.HttpService:GenerateGUID()
t.Parent = b.RunService:IsStudio() and b.Players.LocalPlayer:WaitForChild("PlayerGui") or b.CoreGui
b.UserInputService.InputBegan:Connect(
    function(u, v)
        if u.KeyCode == Enum.KeyCode.LeftControl and not v then
            t.Enabled = not t.Enabled
        end
    end
)
function a:Window(w, pos)
    local x = false
    a.windowCount = a.windowCount + 1
    local y = Instance.new("Frame")
    local z = Instance.new("Frame")
    local A = Instance.new("UIGradient")
    local B = Instance.new("TextLabel")
    local C = Instance.new("TextButton")
    local D = Instance.new("ImageLabel")
    local E = Instance.new("Frame")
    local F = Instance.new("UIListLayout")
    local G = Instance.new("Frame")
    y.Name = "Top"
    y.Parent = t
    y.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    y.BorderSizePixel = 0
    y.Position = pos or UDim2.new(0, 25, 0, -30 + 36 * a.windowCount + 6 * a.windowCount)
    y.Size = UDim2.new(0, 212, 0, 36)
    Drag(y)
    z.Name = "WindowLine"
    z.Parent = y
    z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    z.BorderSizePixel = 0
    z.Position = UDim2.new(0, 0, 0, 34)
    z.Size = UDim2.new(0, 212, 0, 2)
    A.Color =
        ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(43, 43, 43)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(43, 43, 43)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(131, 132, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(43, 43, 43)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(43, 43, 43))
    }
    A.Name = "WindowLineGradient"
    A.Parent = z
    B.Name = "Header"
    B.Parent = y
    B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    B.BackgroundTransparency = 1.000
    B.BorderSizePixel = 0
    B.Size = UDim2.new(0, 54, 0, 34)
    B.Font = Enum.Font.GothamSemibold
    B.Text = "   " .. tostring(w) or ""
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.TextSize = 14.000
    B.TextXAlignment = Enum.TextXAlignment.Left
    C.Name = "WindowToggle"
    C.Parent = y
    C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    C.BackgroundTransparency = 1.000
    C.BorderSizePixel = 0
    C.Position = UDim2.new(0.835270762, 0, 0, 0)
    C.Size = UDim2.new(0, 34, 0, 34)
    C.Font = Enum.Font.SourceSans
    C.Text = ""
    C.TextColor3 = Color3.fromRGB(0, 0, 0)
    C.TextSize = 14.000
    D.Name = "WindowToggleImg"
    D.Parent = C
    D.AnchorPoint = Vector2.new(0.5, 0.5)
    D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    D.BackgroundTransparency = 1.000
    D.BorderSizePixel = 0
    D.Position = UDim2.new(0.5, 0, 0.5, 0)
    D.Size = UDim2.new(0, 18, 0, 18)
    D.Image = "rbxassetid://3926305904"
    D.ImageRectOffset = Vector2.new(524, 764)
    D.ImageRectSize = Vector2.new(36, 36)
    D.Rotation = 180
    E.Name = "Bottom"
    E.Parent = y
    E.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    E.BorderSizePixel = 0
    E.ClipsDescendants = true
    E.Position = UDim2.new(0, 0, 1, 0)
    E.Size = UDim2.new(0, 212, 0, 0)
    F.Name = "BottomLayout"
    F.Parent = E
    F.HorizontalAlignment = Enum.HorizontalAlignment.Center
    F.SortOrder = Enum.SortOrder.LayoutOrder
    F.Padding = UDim.new(0, 4)
    G.Name = "PaddingThing"
    G.Parent = E
    G.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    G.BorderSizePixel = 0
    G.Position = UDim2.new(0.263033181, 0, 0, 0)
    G.Size = UDim2.new(0, 100, 0, 0)
    local H = false
    local function I()
        if H then
            return
        end
        x = not x
        local H = true
        b.TweenService:Create(
            E,
            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 212, 0, x and F.AbsoluteContentSize.Y + 4 or 0)}
        ):Play()
        b.TweenService:Create(
            D,
            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Rotation = x and 0 or 180}
        ):Play()
        wait(.25)
        H = false
    end
    local function J()
        if H or not x then
            return
        end
        E.Size.Y.Offset = F.AbsoluteContentSize.Y + 4
    end
    F:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(J)
    C.MouseButton1Click:Connect(I)
    
    local K = {}
    function K:Open() I() end
    function K:Label(L)
        local M = Instance.new("TextButton")
        M.Name = "Label"
        M.Parent = E
        M.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        M.BorderSizePixel = 0
        M.Position = UDim2.new(0.0212264154, 0, 0.71676302, 0)
        M.Size = UDim2.new(0, 203, 0, 26)
        M.AutoButtonColor = false
        M.Font = Enum.Font.GothamSemibold
        M.Text = tostring(L) or ""
        M.TextColor3 = Color3.fromRGB(255, 255, 255)
        M.TextSize = 14.000
        return M
    end
    function K:Button(L, N)
        local O = Instance.new("Frame")
        local P = Instance.new("TextButton")
        local N = N or function()
            end
        O.Name = "ButtonObj"
        O.Parent = E
        O.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        O.BorderSizePixel = 0
        O.Position = UDim2.new(0, 0, 0.0172413792, 0)
        O.Size = UDim2.new(0, 203, 0, 36)
        P.Name = "Button"
        P.Parent = O
        P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        P.BackgroundTransparency = 1.000
        P.BorderSizePixel = 0
        P.Size = UDim2.new(0, 203, 0, 36)
        P.Font = Enum.Font.Gotham
        P.Text = "  " .. tostring(L) or ""
        P.TextColor3 = Color3.fromRGB(255, 255, 255)
        P.TextSize = 14.000
        P.TextXAlignment = Enum.TextXAlignment.Left
        P.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    O,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}
                ):Play()
            end
        )
        P.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    O,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}
                ):Play()
            end
        )
        P.MouseButton1Click:Connect(
            function()
                spawn(
                    function()
                        ClickEffect(P)
                    end
                )
                N()
            end
        )
    end
    function K:Toggle(Q, R, S, N, T)
        local T = T or a.flags
        local R = R or b.HttpService:GenerateGUID()
        local S = S or false
        local N = N or function()
            end
        T[R] = S
        local U = Instance.new("Frame")
        local V = Instance.new("TextButton")
        local W = Instance.new("Frame")
        local X = Instance.new("UICorner")
        U.Name = "ToggleObj"
        U.Parent = E
        U.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        U.BorderSizePixel = 0
        U.Position = UDim2.new(0, 0, 0.0172413792, 0)
        U.Size = UDim2.new(0, 203, 0, 36)
        V.Name = "ToggleText"
        V.Parent = U
        V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        V.BackgroundTransparency = 1.000
        V.BorderSizePixel = 0
        V.Size = UDim2.new(0, 203, 0, 36)
        V.Font = Enum.Font.Gotham
        V.Text = "  " .. tostring(Q) or ""
        V.TextColor3 = Color3.fromRGB(255, 255, 255)
        V.TextSize = 14.000
        V.TextXAlignment = Enum.TextXAlignment.Left
        W.Name = "ToggleStatus"
        W.Parent = U
        W.AnchorPoint = Vector2.new(0, 0.5)
        W.BackgroundColor3 = S and Color3.fromRGB(14, 255, 110) or Color3.fromRGB(255, 44, 44)
        W.BorderSizePixel = 0
        W.Position = UDim2.new(0.847443342, 0, 0.5, 0)
        W.Size = UDim2.new(0, 24, 0, 24)
        X.CornerRadius = UDim.new(0, 4)
        X.Name = "ToggleStatusRound"
        X.Parent = W
        if S then
            N(true)
        end
        V.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    U,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}
                ):Play()
            end
        )
        V.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    U,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}
                ):Play()
            end
        )
        V.MouseButton1Click:Connect(
            function()
                T[R] = not T[R]
                spawn(
                    function()
                        b.TweenService:Create(
                            W,
                            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                            {BackgroundColor3 = T[R] and Color3.fromRGB(14, 255, 110) or Color3.fromRGB(255, 44, 44)}
                        ):Play()
                    end
                )
                spawn(
                    function()
                        ClickEffect(V)
                    end
                )
                N(T[R])
            end
        )
    end
    function K:Slider(Y, Z, _, a0, N, S, T)
        local a1 = _ or 0
        local a2 = a0 or 100
        local a3 = Z or b.HttpService:GenerateGUID()
        local N = N or function()
            end
        local T = T or a.flags
        local k = false
        T[a3] = S or a1
        local a4 = Instance.new("Frame")
        local a5 = Instance.new("TextButton")
        local a6 = Instance.new("Frame")
        local a7 = Instance.new("UICorner")
        local a8 = Instance.new("Frame")
        local a9 = Instance.new("UICorner")
        local aa = Instance.new("TextLabel")
        a4.Name = "SliderObj"
        a4.Parent = E
        a4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        a4.BorderSizePixel = 0
        a4.Position = UDim2.new(0, 0, 0.0172413792, 0)
        a4.Size = UDim2.new(0, 203, 0, 36)
        a5.Name = "SliderText"
        a5.Parent = a4
        a5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a5.BackgroundTransparency = 1.000
        a5.BorderSizePixel = 0
        a5.Size = UDim2.new(0, 203, 0, 36)
        a5.Font = Enum.Font.Gotham
        a5.Text = "  " .. tostring(Y) or ""
        a5.TextColor3 = Color3.fromRGB(255, 255, 255)
        a5.TextSize = 14.000
        a5.TextXAlignment = Enum.TextXAlignment.Left
        a6.Name = "SliderBack"
        a6.Parent = a4
        a6.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
        a6.BorderSizePixel = 0
        a6.Position = UDim2.new(0.57099998, 0, 0.680000007, 0)
        a6.Size = UDim2.new(0, 80, 0, 7)
        a7.CornerRadius = UDim.new(0, 4)
        a7.Name = "SliderBackRound"
        a7.Parent = a6
        a8.Name = "SliderPart"
        a8.Parent = a6
        a8.BackgroundColor3 = Color3.fromRGB(131, 133, 255)
        a8.BorderSizePixel = 0
        a8.Size = UDim2.new((S or 0) / a2, 0, 1, 0)
        a9.CornerRadius = UDim.new(0, 4)
        a9.Name = "SliderPartRound"
        a9.Parent = a8
        aa.Name = "SliderValue"
        aa.Parent = a4
        aa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aa.BackgroundTransparency = 1.000
        aa.BorderSizePixel = 0
        aa.Position = UDim2.new(0.571428597, 0, 0.166666672, 0)
        aa.Size = UDim2.new(0, 80, 0, 16)
        aa.Font = Enum.Font.Code
        aa.Text = S or a1
        aa.TextColor3 = Color3.fromRGB(255, 255, 255)
        aa.TextSize = 14.000
        if S and S ~= a1 then
            N(S)
        end
        local function ab(p)
            local ac = UDim2.new(math.clamp((p.Position.X - a6.AbsolutePosition.X) / a6.AbsoluteSize.X, 0, 1), 0, 1, 0)
            a8:TweenSize(ac, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.05, true)
            local ad = math.floor(ac.X.Scale * a2 / a2 * (a2 - a1) + a1)
            aa.Text = tostring(ad)
            T[a3] = ad
            N(ad)
        end
        a5.InputBegan:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                a8,
                                TweenInfo.new(0.15),
                                {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
                            ):Play()
                        end
                    )
                    ab(p)
                    k = true
                end
            end
        )
        a5.InputEnded:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                a8,
                                TweenInfo.new(0.15),
                                {BackgroundColor3 = Color3.fromRGB(131, 133, 255)}
                            ):Play()
                        end
                    )
                    k = false
                end
            end
        )
        b.UserInputService.InputChanged:Connect(
            function(p)
                if k and p.UserInputType == Enum.UserInputType.MouseMovement then
                    ab(p)
                end
            end
        )
    end
    return K
end
return a
end)()
local COW = workspace:GetChildren()
local Start = tick()
local Range = 12
local _G = setmetatable(_G, {})
_G.UnlockAll = function(script)
	-- Decompiled with the Synapse X Luau decompiler.

	local l__Parent__1 = script.Parent;
	function UnlockAll()
		local l__next__1 = next;
		local v2, v3 = l__Parent__1:GetDescendants();
		while true do
			local v4, v5 = l__next__1(v2, v3);
			if v4 then

			else
				break;
			end;
			v3 = v4;
			if v5:IsA("GuiButton") then
				if v5:FindFirstChild("Lock") then
					v5.Lock:Destroy();
					v5.ImageTransparency = 0;
				end;
			end;	
		end;
		l__Parent__1.CosmeticsPurchase.Visible = false;
	end;--ld("UnlockAdvancedCosmetics").OnClientEvent:connect(UnlockAll);
	UnlockAll()
end
        for i, v in pairs(game.CoreGui:GetChildren()) do
            if v:FindFirstChild("Top") then
                v:Destroy()
            end
        end
local HitboxScale = 2
local SpeedWalk = 0.2
_G.UnlockAll(game.Players.LocalPlayer.PlayerGui.SpawnGui:FindFirstChild("Unlocker",true))
local w1 = library:Window("AZURE | V2.3", UDim2.new(0, 15, 0, 459)) delay(.5,function()w1:Open()end)
local w3 = library:Window("AZURE | EXT", UDim2.new(0, 15*17, 0, 459)) delay(.5,function()w3:Open()end)
local w2 = library:Window("AZURE | KITS", UDim2.new(0, 2330, 0, 460)) delay(.5,function()w2:Open()end)
local kits = {
	arch = {
		fake = "Cyborg Shard Item",
		subName = "Archangel",
		Strings = {
			"Greaves",
			"Chestplate",
			"Halo",
			"Axe",
			"Pick"
		}
	},
	demon = {
		fake = "Cyborg Shard Item",
		subName = "Demon",
		Strings = {
			"Greaves",
			"Chestplate",
			"Halo",
			"Axe",
			"Pick"
		}
	},
	food = {
		fake = "Bloodfruit Item",
		subName = "Cooked",
		Strings = {
			"Meat","Morsel","Meat","Morsel","Meat","Morsel","Meat","Morsel","Meat","Morsel",
		}
	},
	god = {
		fake = "Cyborg Shard Item",
		subName = "God",
		Strings = {
			"Legs",
			"Chestplate",
			"Halo",
			"Axe",
			"Pick",
			"Rock",
			"Gold",
		}
	},
	admin = {
		fake = "Cyborg Shard Item",
		subName = "Admin",
		Strings = {
			"Bag","Blade"
		}
	},
	coin = {
		fake = "Bloodfruit Item",
		subName = "Coin",
		Strings = {
			"Stack",
			"Stack",
			"Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack","Stack",
		}
	}
}
if getrenv().Toggles then

end
local Toggles = {
	ItemESP = false,
	EssenceESP = false,
	PlayerESP = false,
	OreESP = false,

TPAura = false,
	AutoPickup = false,
	AimAssist = false,
	JumpFly = false,
	WalkSpeed = false,
	HitboxExpander = false,
	Flight = false,
	KillAura = false,

	BoatFly = false,
	BoatSpeed = false,
}
getrenv().Toggles = Toggles
w3:Label("AIM")
w3:Toggle(
	"TP Aura",
	"frz",
	false,
	function(toggled)
		Toggles.TPAura = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Label("ESP")
w1:Toggle(
	"Items",
	"frz",
	false,
	function(toggled)
		Toggles.ItemESP = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Toggle(
	"Ore",
	"frz",
	false,
	function(toggled)
		Toggles.OreESP = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Toggle(
	"Players",
	"frz",
	false,
	function(toggled)
		Toggles.PlayerESP = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Label("Self")
w1:Toggle(
	'Flight',
	"frz",
	false,
	function(toggled)
		Toggles.Flight = toggled
	end
) -- Text, Callback
w1:Toggle(
	"JumpFly",
	"frz",
	false,
	function(toggled)
		Toggles.JumpFly = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Toggle(
	"WalkSpeed",
	"frz",
	false,
	function(toggled)
		Toggles.WalkSpeed = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Slider(
	"Speed",
	"JP",
	.1,
	4,
	function(value)
		SpeedWalk = value
	end,
	.3
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)
w1:Toggle(
	"Auto Pickup",
	"frz",
	false,
	function(toggled)
		Toggles.AutoPickup = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Toggle(
	"Aim Assist",
	"frz",
	false,
	function(toggled)
		Toggles.AimAssist = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Toggle(
	"Kill Aura",
	"frz",
	false,
	function(toggled)
		Toggles.KillAura = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Slider(
	"Range",
	"JP",
	6,
	21,
	function(value)
		Range = value
	end,
	12
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)
w1:Label("Vehicle")
w1:Toggle(
	"Boat Speed",
	"frz",
	false,
	function(toggled)
		Toggles.BoatSpeed = toggled
	end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)
w1:Label("Teleports")
w1:Button(
	"Random Spawn",
	function()
		game:GetService("ReplicatedStorage").Events.SpawnFirst:FireServer()
	end
) -- Text, Callback
for name, data in pairs(kits) do
	local idk = (function(x,y)
		local fakeItem = data.fake
		local subName,Strings = data.subName, data.Strings
		for _,purchaseItem in pairs(Strings) do
			game:GetService("ReplicatedStorage").Events.PurchaseFromShop:FireServer(fakeItem, subName.. " "..purchaseItem)
		end
	end)
	w2:Button(
		name,
		idk
	) -- Text, Callback
end
w1:Label("Hitbox")
w1:Toggle(
	'Hitbox Expander',
	"frz",
	false,
	function(toggled)
		Toggles.HitboxExpander = toggled
	end
) -- Text, Callback
w1:Slider(
	"Hitbox Scale",
	"JP",
	2,
	42,
	function(value)
		HitboxScale = value
	end,
	2
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)

w1:Label("Others")
w1:Button(
	'Hide Armor',
	function(toggled)
		for _, acc in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if acc:IsA("Accessory") and acc:FindFirstChildOfClass'BoolValue' then acc.Handle:BreakJoints() end end
	end
) -- Text, Callback
local ItemNametags = {}
local PlayerNametags = {}
local function GetPositionOnScreen(vector3)
	local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(vector3);
	return {Vector2.new(vector.X, vector.Y), onScreen, vector.Z};
end
function Find(x,v)
	local f = false 
	for _,b in pairs(x) do
		if b[2] == v then
			f = true 
		end
	end
	return f
end
coroutine.wrap(function()
	while task.wait() do
		if Toggles.AutoPickup then
			for _,v in pairs(workspace:GetChildren()) do
				if (v:FindFirstChild("Draggable") or v:FindFirstChild("Pickup")) and v:IsA("BasePart") and (v.Position - workspace.CurrentCamera.Focus.Position).Magnitude<=10 then
					game:GetService("ReplicatedStorage").Events.Pickkup:FireServer(v)
				end
			end end
	end
end)()
local function getMousePos()
	return game:GetService("UserInputService"):GetMouseLocation() - Vector2.new(0, 36);
end
local function worldToScreen(pos)
	return workspace.CurrentCamera:WorldToScreenPoint(pos);
end
local function aimAtCallback(target)
	if target:IsA("Player") then
		return worldToScreen(target.Character.Head.Position);
	elseif target:IsA("Model") then
		return worldToScreen(target:GetPivot().p);
	end
end
lastc= tick()
owner= game.Players.LocalPlayer
coroutine.wrap(function()
	while task.wait() and true do
		if Toggles.AimAssist then
			for _,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Character and v ~= game.Players.LocalPlayer then
					local v = v.Character
					local x = game:GetService("Players"):GetPlayerFromCharacter(v)
					if (v:GetPivot().Position-workspace.CurrentCamera.Focus.Position).Magnitude<=12 then
						local aimAt, visible = aimAtCallback(v);
						if aimAt and aimAt.X and aimAt.Y then
							if tick()-lastc > .21 then
								lastc = tick()
								mouse1click()
							end
							mousemoverel(
								(aimAt.X - getMousePos().X) / 2,
								(aimAt.Y - getMousePos().Y) / 2
								- 2);	-- The 2 pixels is just a little bit of bullet compensation (I could not be bothered making a proper system)
						end
					end
				end
			end
			for _,v in pairs(COW) do
				if v:FindFirstChild'Health' and v ~= owner.Character then
					if (v:GetPivot().Position-workspace.CurrentCamera.Focus.Position).Magnitude<=12 then
						local aimAt, visible = aimAtCallback(v);
						if aimAt and aimAt.X and aimAt.Y then
							mousemoverel(
								(aimAt.X - getMousePos().X) / 12,
								(aimAt.Y - getMousePos().Y) / 12
								- 2);	-- The 2 pixels is just a little bit of bullet compensation (I could not be bothered making a proper system)
						end
					end
				end
			end
		end
	end
end)()
coroutine.wrap(function()
	game:GetService("RunService"):BindToRenderStep("2",Enum.RenderPriority.Camera.Value+1,function()
		if Toggles.PlayerESP then else for _,Data in pairs(PlayerNametags) do Data[1]:Remove()
			end PlayerNametags = {} end    if Toggles.PlayerESP then
			for e,Data in pairs(PlayerNametags) do
				local Nametag, v = Data[1],Data[2]
				if not v or v.Parent ~= game:GetService'Players' then
					Nametag:Remove()
					table.remove(PlayerNametags, e)
					-- ItemNametags[e] = {}
				else
					pcall(function()
						local Vector, Visible, ZVector = unpack(GetPositionOnScreen(v.Character.Head.Position+Vector3.new(0,3,0)))
						Nametag.Text = string.format("%s [%s]",tostring(v.Name),math.round((workspace.CurrentCamera.CFrame.Position-v.Character.Head.Position).Magnitude/2))
						Nametag.Size = 27
						Nametag.Color = Color3.fromHSV(tick()%15/15,1,1)
						Nametag.Center = true
						Nametag.Outline = true
						Nametag.Font = 0
						Nametag.Position = Nametag.Position:Lerp(Vector,.98)
						Nametag.Visible = Visible
					end)
				end
			end
			for _,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v:IsA("Player") and not Find(PlayerNametags,v) then
					local Nametag = Drawing.new("Text")
					Nametag.Text = tostring(v.Name)
					Nametag.Center = true
					Nametag.Outline = true
					Nametag.Font = 0
					table.insert(PlayerNametags,{Nametag, v})
				end
			end 
		end
	end)
end)()
coroutine.wrap(function()
	game:GetService("RunService"):BindToRenderStep("2",Enum.RenderPriority.Camera.Value+1,function()
		if Toggles.ItemESP then else for _,Data in pairs(ItemNametags) do Data[1]:Remove()
			end ItemNametags = {} end    if Toggles.ItemESP then
			for e,Data in pairs(ItemNametags) do
				local Nametag, v = Data[1],Data[2]
				if not v or v.Transparency == 1 or v.Parent ~= workspace then
					Nametag:Remove()
					table.remove(ItemNametags, e)
					-- ItemNametags[e] = {}
				else
					local Vector, Visible, ZVector = unpack(GetPositionOnScreen(v.Position))
					Nametag.Text = string.format("%s [%s]",tostring(v.Name),math.round((workspace.CurrentCamera.CFrame.Position-v.Position).Magnitude/2))
					Nametag.Size = 25-math.clamp(math.round((workspace.CurrentCamera.CFrame.Position-v.Position).Magnitude)/100,0,7)
					Nametag.Color = v.Color:Lerp(Color3.new(),.05*math.cos ( (tick()*60)/12) )
					Nametag.Center = true
					Nametag.Outline = true
					Nametag.Font = 0
					Nametag.Position = Nametag.Position:Lerp(Vector,.98)
					Nametag.Visible = Visible
				end
			end
			for _,v in pairs(COW) do
				if (v:FindFirstChild("Draggable") or v:FindFirstChild("Pickup")) and v:IsA("BasePart") and not Find(ItemNametags,v) then
					local Vector, Visible, ZVector = unpack(GetPositionOnScreen(v.Position))
					local Nametag = Drawing.new("Text")
					Nametag.Text = tostring(v.Name)
					Nametag.Size = 25-math.clamp(math.round((workspace.CurrentCamera.CFrame.Position-v.Position).Magnitude)/100,0,15)
					Nametag.Color = v.Color
					Nametag.Center = true
					Nametag.Outline = true
					Nametag.Font = 0
					Nametag.Position = Vector
					Nametag.Visible = Visible
					table.insert(ItemNametags,{Nametag, v})
				end
			end 
		end
	end)
end)()
coroutine.wrap(function()
	OreNametags = {}
	game:GetService("RunService"):BindToRenderStep("2",Enum.RenderPriority.Camera.Value+1,function()
		if Toggles.OreESP then else for _,Data in pairs(OreNametags) do Data[1]:Remove()
			end OreNametags = {} end    if Toggles.OreESP then
			for e,Data in pairs(OreNametags) do
				local Nametag, v = Data[1],Data[2]
				if not v or v.Parent ~= workspace then
					Nametag:Remove()
					table.remove(OreNametags, e)
					-- ItemNametags[e] = {}
				else
					local Vector, Visible, ZVector = unpack(GetPositionOnScreen(v:GetPivot().p))
					Nametag.Text = string.format("%s [%s - %s]",tostring(v.Name),math.round((workspace.CurrentCamera.CFrame.Position-v:GetPivot().p).Magnitude/2),tostring(v.Health.Value))
					Nametag.Size = 25-math.clamp(math.round((workspace.CurrentCamera.CFrame.Position-v:GetPivot().Position).Magnitude)/100,0,7)
					Nametag.Color = Nametag.Color:Lerp(Color3.fromHSV(math.random(),1,1),.2)
					Nametag.Center = true
					Nametag.Outline = true
					Nametag.Font = 0
					Nametag.Position = Nametag.Position:Lerp(Vector,.98)
					Nametag.Visible = Visible
				end
			end
			for _,v in pairs(COW) do
				if (v:FindFirstChild("Health") and (v.Name:match("Rock") or v.Name:match("Ore"))) and v:IsA("Model") and not Find(OreNametags,v) then
					local Vector, Visible, ZVector = unpack(GetPositionOnScreen(v:GetPivot().p))
					local Nametag = Drawing.new("Text")
					Nametag.Text = tostring(v.Name)
					Nametag.Center = true
					Nametag.Outline = true
					Nametag.Font = 0
					Nametag.Position = Vector
					Nametag.Visible = Visible
					table.insert(OreNametags,{Nametag, v})
				end
			end 
		end
	end)
end)()
coroutine.wrap(function()
	game:GetService("RunService"):BindToRenderStep("3",Enum.RenderPriority.Camera.Value+1,function()
		if Toggles.JumpFly then
			local char = game.Players.LocalPlayer.Character
			if char then
				if char.Humanoid.Jump or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
					local test = Instance.new("Part", workspace)
					test.Color = Color3.fromHSV(tick()%3/3,1,1)
					test.Size,test.Anchored,test.Material,test.CFrame = Vector3.new(2,.1,2),true,"Neon",char.HumanoidRootPart.CFrame*CFrame.new(0,-2.7,0)
					game:GetService("Debris"):AddItem(test,.3)
				end
			end
		end
	end)
end)()

coroutine.wrap(function()
	local Keys = {}
	local Mouse = game.Players.LocalPlayer:GetMouse()
	Mouse.KeyDown:Connect(function(Key)
		Keys[Key:upper()] = true
	end)
	Mouse.KeyUp:Connect(function(Key)
		Keys[Key:upper()] = false
	end)
	while task.wait() do
	    if Toggles.KillAura then
	        for _, Player in pairs(game.Players:GetPlayers()) do
	            if Player ~= owner then
	                local Char = Player.Character
	                char=Char
	                if Char ~= nil and (Char:GetPivot().p-workspace.CurrentCamera.Focus.p).Magnitude <= Range then
	                    game.Players.LocalPlayer.Character.Humanoid.Jump = Char.Humanoid.Jump
	                    mouse1click()
	                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Char:GetPivot()*CFrame.new(math.random(-6,6),0,math.random(-6,6)).Position)
	                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity *= 1.032
	                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,Vector3.new(char:GetPivot().X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y,char:GetPivot().Z))
	                   end
	               end
	           end
	    end
       	    if Toggles.TPAura then
	        for _, Player in pairs(game.Players:GetPlayers()) do
	            if Player ~= owner then
	                local Char = Player.Character
	                char=Char
	                if Char ~= nil and (Char:GetPivot().p-workspace.CurrentCamera.Focus.p).Magnitude <= Range then
	                    game.Players.LocalPlayer.Character.Humanoid.Jump = Char.Humanoid.Jump
	                    mouse1click()
	                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Char:GetPivot()*CFrame.new(math.random(-6,6),0,math.random(-6,6)).Position)
	                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame:Lerp(Char.HumanoidRootPart.CFrame*CFrame.new(0,0,-math.random(-3,3)),.4)
	                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,Vector3.new(char:GetPivot().X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y,char:GetPivot().Z))
	                   end
	               end
	           end
	       end
		if Toggles.WalkSpeed or Toggles.Flight then
			pcall(function()
			    local v = game.Players.LocalPlayer.Character.HumanoidRootPart
			if Toggles.Flight then
				v.Velocity = Vector3.new(0,-v.Velocity.Y,0)
				v.CFrame = CFrame.new(v.Position,v.Position+workspace.CurrentCamera.CFrame.LookVector)
			end
			end)
			pcall(function()
				local v = game.Players.LocalPlayer.Character.HumanoidRootPart
				if Keys.W then v:PivotTo(v:GetPivot()*CFrame.new(0,0,-SpeedWalk)) end
				if Keys.S then v:PivotTo(v:GetPivot()*CFrame.new(0,0,SpeedWalk)) end
				if Keys.A then v:PivotTo(v:GetPivot()*CFrame.new(-SpeedWalk,0,0)) end
				if Keys.D then v:PivotTo(v:GetPivot()*CFrame.new(SpeedWalk,0,0)) end
			end)
		end
		if Toggles.BoatSpeed then
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("Seat") then
					if v.Occupant == game.Players.LocalPlayer.Character.Humanoid then
						v.Parent.MainPart.Color = Color3.new(0,100,0)
						v.Parent.Union.Color = Color3.new(0,100,0)
						v:PivotTo(CFrame.new(v:GetPivot().p,workspace.CurrentCamera.CFrame.LookVector+v:GetPivot().p)*CFrame.Angles(0,0,0))
						if Keys.W then v:PivotTo(v:GetPivot()*CFrame.new(0,0,-1)) end
						if Keys.S then v:PivotTo(v:GetPivot()*CFrame.new(0,0,1)) end
						if Keys.A then v:PivotTo(v:GetPivot()*CFrame.new(-1,0,0)) end
						if Keys.D then v:PivotTo(v:GetPivot()*CFrame.new(1,0,0)) end
					end
				end
			end
		end end
end)()
--// Variables

local Players = game:GetService("Players")
local OldNameCall = nil

--// Global Variables

--// Anti Kick Hook
Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
	local NameCallMethod = getnamecallmethod()

	if tostring(string.lower(NameCallMethod)) == "kick" then
		return nil

	elseif tostring(string.lower(NameCallMethod)) == "walkspeed" then
		return 16

	elseif tostring(string.lower(NameCallMethod)) == "position" and Self.Name == "HumanoidRootPart" then
		--	return owner.Character.HumanoidRootPart.Position
	end

	return OldNameCall(Self, ...)
end)
local Old;
Old = hookmetamethod(game, "__index", function(Self,Index)



	return Old(Self, Index)
end)
Invisible = false
game:GetService("UserInputService").InputBegan:Connect(function(Input,GPE)
	if GPE then return end
	if Input.KeyCode == Enum.KeyCode.U then
		Invisible = not Invisible
		if Invisible then
			owner.Character.Humanoid.HipHeight = 4
			workspace.CurrentCamera.CameraSubject = owner.Character.HumanoidRootPart
		else
			owner.Character.Humanoid.HipHeight = 0
			workspace.CurrentCamera.CameraSubject = owner.Character.Humanoid
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(Input,GPE)
	if GPE then return end
	if Input.KeyCode == Enum.KeyCode.X then
		game.Players.LocalPlayer.Character:PivotTo(CFrame.new(owner:GetMouse().Hit.Position)*CFrame.new(0,4,0))
	end
end)
local functionBank = {}
u16 = 0
local l__LocalPlayer__26 = game.Players.LocalPlayer
local l__PlayerGui__30 = l__LocalPlayer__26:WaitForChild("PlayerGui");
local l__MainGui__31 = l__PlayerGui__30:WaitForChild("MainGui");
local v20 = require(game:GetService("ReplicatedStorage").Modules.ColorData);
function functionBank.CreateNotification(p92, p93, p94, p95)
	wait(p95 and 0);
	p94 = p94 and 1;
	if #l__MainGui__31.Subordinates.Notifications:GetChildren() - 2 >= 3 then
		local v363 = nil;
		local v364 = math.huge;
		local l__next__365 = next;
		local v366, v367 = l__MainGui__31.Subordinates.Notifications:GetChildren();
		while true do
			local v368, v369 = l__next__365(v366, v367);
			if not v368 then
				break;
			end;
			v367 = v368;
			if v369:IsA("TextLabel") and v369.LayoutOrder < v364 then
				v363 = v369;
				v364 = v369.LayoutOrder;
			end;		
		end;
		if v363 then
			v363:Destroy();
		end;
	end;
	local v370 = l__MainGui__31.Subordinates.Notifications.Templates.TextLabel:Clone();
	v370.Text = p92;
	v370.TextColor3 = p93[1] or Color3.fromRGB(255, 255, 255);
	v370.LayoutOrder = u16;
	u16 = u16 + 1;
	v370.Parent = l__MainGui__31.Subordinates.Notifications;
	v370.Visible = true;
	game:GetService("Debris"):AddItem(v370, p94 + 2);
	game:GetService("TweenService"):Create(v370, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, p94 and 1), {
		BackgroundTransparency = 1, 
		TextTransparency = 1, 
		TextStrokeTransparency = 1
	}):Play();
end;
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
 
mouse.keyDown:connect(function(key)
if key =="q" then
local A_1 = "Bloodfruit"
local Event = game:GetService("ReplicatedStorage").Events.UseBagItem
Event:FireServer(A_1)
end
game.ReplicatedStorage.UseBagItem:FireServer("Bloodfruit")
end)
task.wait()
--
functionBank.CreateNotification(string.format("AZURE 2.3 (build 7) LOADED || TOOK %s SECONDS", tostring(math.round((tick() - Start)*100000)/100000)), {Color3.fromHSV(math.random(),1,1), Color3.fromHSV(math.random(),1,1)}, 4);
while task.wait(.5) do
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer then
			pcall(function()
				local HitboxExpander = Toggles.HitboxExpander
				v.Character.HumanoidRootPart.Size = HitboxExpander and Vector3.new(HitboxScale,HitboxScale,HitboxScale) or game.Players.LocalPlayer.Character.HumanoidRootPart.Size
				v.Character.HumanoidRootPart.Transparency = HitboxExpander and 0.5 or 1
				v.Character.Head.Size = HitboxExpander and Vector3.new(HitboxScale/2,HitboxScale/2,HitboxScale/2) or game.Players.LocalPlayer.Character.Head.Size
			end)
		end
	end
	COW = workspace:GetChildren()
	COD = workspace:GetDescendants()
end
_G.data.mojoItems["WaterWalker"] = true
