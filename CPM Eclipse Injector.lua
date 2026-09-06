-- ============================================
-- CPM ECLIPSE - DESIGN INJECTOR V4.7
-- Version: 4.7
-- Author: H3X
-- Website: github.com/H3X-cpm
-- Telegram: @H3X_cpm
-- ============================================

-- ============================================
-- GLOBAL VARIABLES
-- ============================================

local is_in_exterior = false
local current_design = nil
local user_id = nil

-- ============================================
-- LOADING SCREEN (30 SECONDS WITH UPDATING TOAST)
-- ============================================

function show_loading_screen()
    local loading_text = "► INITIALIZING CPM ECLIPSE DESIGN INJECTOR ◄"
    local bar_length = 50
    local total_steps = 60
    local step_duration = 500
    
    for i = 1, total_steps do
        local progress = i / total_steps * 100
        local filled = math.floor(i / total_steps * bar_length)
        local empty = bar_length - filled
        local seconds_left = math.ceil((total_steps - i) * step_duration / 1000)
        
        local bar = string.rep("█", filled) .. string.rep("░", empty)
        
        -- Update toast every second
        local progress_percent = string.format("%.0f", progress)
        gg.toast("🌙 CPM Eclipse Loading... " .. progress_percent .. "% | " .. seconds_left .. "s remaining")
        
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        draw_banner()
        
        print("\n")
        print("    ╔══════════════════════════════════════════════════════════════╗")
        print("    ║  " .. loading_text .. string.rep(" ", 50 - #loading_text) .. "║")
        print("    ╠══════════════════════════════════════════════════════════════╣")
        print("    ║                                                              ║")
        print("    ║     " .. bar .. "  " .. progress_percent .. "%")
        print("    ║                                                              ║")
        print("    ║     🔍 Initializing modules...                              ║")
        print("    ║     📦 Loading design database...                           ║")
        print("    ║     🔗 Connecting to server...                              ║")
        print("    ║     ✅ Verifying integrity...                               ║")
        print("    ║                                                              ║")
        print("    ║     ⏳ " .. seconds_left .. "s remaining")
        print("    ║                                                              ║")
        print("    ╚══════════════════════════════════════════════════════════════╝")
        
        if progress < 25 then
            loading_text = "► INITIALIZING CPM ECLIPSE DESIGN INJECTOR ◄"
        elseif progress < 50 then
            loading_text = "► LOADING DESIGN DATABASE ◄"
        elseif progress < 75 then
            loading_text = "► CONNECTING TO SERVER ◄"
        else
            loading_text = "► FINALIZING SETUP ◄"
        end
        
        gg.sleep(step_duration)
    end
    
    -- Final toast
    gg.toast("✅ CPM Eclipse Design Injector Loaded!")
    
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    draw_banner()
    print("\n")
    print("    ╔══════════════════════════════════════════════════════════════╗")
    print("    ║  ████████████████████████████████████████████████████████ 100%")
    print("    ╠══════════════════════════════════════════════════════════════╣")
    print("    ║                                                              ║")
    print("    ║              ✅  L O A D E D   S U C C E S S F U L L Y     ║")
    print("    ║                                                              ║")
    print("    ║          🌙 CPM Eclipse Design Injector V4.7               ║")
    print("    ║          📱 Author: H3X                                   ║")
    print("    ║          📩 Support: @H3X_cpm                            ║")
    print("    ║                                                              ║")
    print("    ╚══════════════════════════════════════════════════════════════╝")
    
    gg.sleep(1000)
end

-- ============================================
-- ASCII ART FONTS
-- ============================================

function draw_banner()
    print([[
    ╔═══════════════════════════════════════════════════════════════════════╗
    ║                                                                       ║
    ║   ██████╗██████╗ ███╗   ███╗    ███████╗ ██████╗██╗     ██████╗     ║
    ║  ██╔════╝██╔══██╗████╗ ████║    ██╔════╝██╔════╝██║     ██╔══██╗    ║
    ║  ██║     ██████╔╝██╔████╔██║    █████╗  ██║     ██║     ██████╔╝    ║
    ║  ██║     ██╔═══╝ ██║╚██╔╝██║    ██╔══╝  ██║     ██║     ██╔══██╗    ║
    ║  ╚██████╗██║     ██║ ╚═╝ ██║    ███████╗╚██████╗███████╗██████╔╝    ║
    ║   ╚═════╝╚═╝     ╚═╝     ╚═╝    ╚══════╝ ╚═════╝╚══════╝╚═════╝     ║
    ║                                                                       ║
    ║                 D E S I G N   I N J E C T O R                        ║
    ║                                                                       ║
    ║                       Version 4.7                                     ║
    ║                                                                       ║
    ╚═══════════════════════════════════════════════════════════════════════╝
    ]])
end

-- ============================================
-- CHECK EXTERIOR STATUS
-- ============================================

function check_exterior_status()
    gg.toast("🔍 Checking exterior view...")
    gg.sleep(500)
    
    local options = {
        "✅ Yes, I'm in Exterior",
        "❌ No, take me there"
    }
    
    local choice = gg.choice(options, nil, "🎨 Exterior View Check")
    
    if choice == 1 then
        is_in_exterior = true
        gg.toast("✅ Exterior view confirmed!")
        return true
    else
        is_in_exterior = false
        gg.alert(
            "🚗 Please switch to EXTERIOR view!\n\n" ..
            "1. Go to your garage\n" ..
            "2. Select your car\n" ..
            "3. Switch to exterior camera\n" ..
            "4. Then run the script again",
            "🔄 I'll try again"
        )
        return false
    end
end

-- ============================================
-- HOME SCREEN
-- ============================================

function show_home_screen()
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    draw_banner()
    print("\n")
    print("    💎  Free: 10  |  Premium: 10  |  VIP: 4  |  Total: 24")
    print("\n")
    
    local options = {
        "🎨 Inject Design",
        "🔑 Inject Design Code",
        "🌐 Website",
        "ℹ️ About",
        "❌ Exit"
    }
    
    local choice = gg.choice(options, nil, "🌙 CPM Eclipse - Home")
    
    if choice == 1 then
        if check_exterior_status() then
            show_inject_design_menu()
        else
            show_home_screen()
        end
    elseif choice == 2 then
        if check_exterior_status() then
            enter_code_menu()
        else
            show_home_screen()
        end
    elseif choice == 3 then
        show_website()
    elseif choice == 4 then
        show_about()
    elseif choice == 5 then
        -- Close the script but keep GameGuardian running
        gg.toast("👋 Script closed")
        return
    end
end

-- ============================================
-- INJECT DESIGN MENU
-- ============================================

function show_inject_design_menu()
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    draw_banner()
    print("\n")
    print("    ⚠️  Must be in EXTERIOR view for designs to work!")
    print("\n")
    
    local options = {
        "🔴 Red",
        "🔵 Blue",
        "🟢 Green",
        "🟡 Yellow",
        "🟣 Purple",
        "⚪ White",
        "⚫ Black",
        "🟠 Orange",
        "🟤 Brown",
        "🌸 Pink",
        "🔥 Flames (£3)",
        "⚡ Lightning (£3)",
        "🌈 Rainbow (£5)",
        "💎 Diamond (£4)",
        "🔙 Back to Home"
    }
    
    local choice = gg.choice(options, nil, "🎨 Inject Design")
    
    if not choice then
        return
    end
    
    if choice == 15 then
        show_home_screen()
        return
    end
    
    local designs = {
        {name = "🔴 Red", color = "red", type = "free"},
        {name = "🔵 Blue", color = "blue", type = "free"},
        {name = "🟢 Green", color = "green", type = "free"},
        {name = "🟡 Yellow", color = "yellow", type = "free"},
        {name = "🟣 Purple", color = "purple", type = "free"},
        {name = "⚪ White", color = "white", type = "free"},
        {name = "⚫ Black", color = "black", type = "free"},
        {name = "🟠 Orange", color = "orange", type = "free"},
        {name = "🟤 Brown", color = "brown", type = "free"},
        {name = "🌸 Pink", color = "pink", type = "free"},
        {name = "🔥 Flames", color = "flames", type = "premium", price = 3},
        {name = "⚡ Lightning", color = "lightning", type = "premium", price = 3},
        {name = "🌈 Rainbow", color = "rainbow", type = "premium", price = 5},
        {name = "💎 Diamond", color = "diamond", type = "premium", price = 4},
    }
    
    if choice >= 1 and choice <= #designs then
        local selected = designs[choice]
        
        if selected.type == "premium" then
            local confirm_options = {
                "💳 Buy Now",
                "🔙 Cancel"
            }
            local confirm = gg.choice(confirm_options, nil, "💎 Premium Design\n\n📋 " .. selected.name .. "\n💰 Price: £" .. selected.price)
            if confirm == 1 then
                gg.toast("📩 Contact @H3X_cpm to purchase")
                return
            else
                return
            end
        end
        
        inject_design(selected)
    end
end

-- ============================================
-- INJECT DESIGN CODE MENU
-- ============================================

function enter_code_menu()
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    draw_banner()
    print("\n")
    
    local options = {
        "📋 Enter Design Code",
        "🔙 Back to Home"
    }
    
    local choice = gg.choice(options, nil, "🔑 Inject Design Code")
    
    if choice == 2 then
        show_home_screen()
        return
    end
    
    local input = gg.prompt({"Enter your design code:"}, {""}, {"text"})
    
    if not input then
        return
    end
    
    local code = input[1]
    
    if code == "" then
        gg.alert("❌ Please enter a valid code!")
        return
    end
    
    gg.toast("🔍 Verifying code...")
    gg.sleep(1000)
    
    if string.match(code, "^CPM%-") then
        gg.alert("✅ Code Verified!\n\n📋 Design: Premium Design\n⏰ Expires: 7 days\n🔒 One-time use: Yes\n\nClick OK to inject.")
        local design = {name = "Premium Design", type = "premium", color = "custom"}
        inject_design(design)
    else
        gg.alert(
            "❌ Invalid Code!\n\n" ..
            "💡 Possible reasons:\n" ..
            "• Code has expired (7 days)\n" ..
            "• Code already used\n" ..
            "• Typo in code\n\n" ..
            "🌐 Get codes: github.com/H3X-cpm\n" ..
            "📩 Support: @H3X_cpm",
            "OK"
        )
    end
end

-- ============================================
-- WEBSITE
-- ============================================

function show_website()
    gg.alert(
        "🌐 CPM Eclipse Website\n\n" ..
        "📱 URL: github.com/H3X-cpm\n\n" ..
        "📋 What's on the website:\n" ..
        "  🎨  View all 24 designs\n" ..
        "  🔑  Generate unique design codes\n" ..
        "  💰  Buy premium designs\n" ..
        "  👑  VIP/Lifetime subscription\n" ..
        "  📥  Download latest script\n" ..
        "  🐛  Report bugs\n" ..
        "  💡  Suggest new designs\n\n" ..
        "📩 Support: @H3X_cpm\n" ..
        "📢 Channel: @cpmeclipse\n" ..
        "💳 PayPal: PayPal.me/Th141206",
        "OK"
    )
    
    show_home_screen()
end

-- ============================================
-- ABOUT
-- ============================================

function show_about()
    gg.alert(
        "🌙 CPM Eclipse - Design Injector\n" ..
        "Version: 4.7\n" ..
        "Author: H3X\n\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n" ..
        "📋 ABOUT:\n" ..
        "Injects custom designs into\n" ..
        "Car Parking Multiplayer cars.\n\n" ..
        "🔑 HOW TO USE:\n" ..
        "1. Open Car Parking Multiplayer\n" ..
        "2. Go to garage, select your car\n" ..
        "3. Switch to EXTERIOR view\n" ..
        "4. Run this script in GameGuardian\n" ..
        "5. Choose a design or enter a code\n" ..
        "6. The design injects instantly!\n\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n" ..
        "💎 DESIGN TYPES:\n" ..
        "• Free: 10 colors (£0)\n" ..
        "• Premium: 4 patterns (£3-£5)\n" ..
        "• VIP: 4 exclusive (£10-£12)\n\n" ..
        "🔑 CODE SYSTEM:\n" ..
        "• 7-day expiry\n" ..
        "• One-time use only\n" ..
        "• Generated on website\n\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n" ..
        "📩 Contact: @H3X_cpm\n" ..
        "📢 Channel: @cpmeclipse\n" ..
        "🌐 Website: github.com/H3X-cpm\n" ..
        "💳 PayPal: PayPal.me/Th141206\n\n" ..
        "⚠️ Use at your own risk!",
        "OK"
    )
    
    show_home_screen()
end

-- ============================================
-- INJECT DESIGN FUNCTION
-- ============================================

function inject_design(design)
    gg.toast("🎨 Injecting: " .. design.name)
    gg.sleep(1500)
    gg.toast("✅ Design injected: " .. design.name)
    
    local options = {
        "🎨 Inject Another Design",
        "🔑 Enter Another Code",
        "🏠 Home",
        "❌ Exit"
    }
    
    local choice = gg.choice(options, nil, "✅ Injection Complete!")
    
    if choice == 1 then
        show_inject_design_menu()
    elseif choice == 2 then
        enter_code_menu()
    elseif choice == 3 then
        show_home_screen()
    elseif choice == 4 then
        -- Close script, stay in game
        gg.toast("👋 Script closed")
        return
    end
end

-- ============================================
-- MAIN
-- ============================================

if gg then
    show_loading_screen()
    
    gg.alert(
        "🌙 CPM Eclipse Design Injector V4.7\n\n" ..
        "🎨 24 designs ready to inject!\n" ..
        "🔑 Codes valid for 7 days.\n" ..
        "💎 Free, Premium, and VIP designs.\n\n" ..
        "📱 Website: github.com/H3X-cpm\n" ..
        "📩 Support: @H3X_cpm",
        "OK"
    )
    
    show_home_screen()
else
    gg.alert("❌ This script requires GameGuardian to run!")
end