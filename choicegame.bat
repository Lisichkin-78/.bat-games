@echo off
title 🏚️ BREAK-IN – Horror Choice
color 4F
setlocal enabledelayedexpansion

:: ==== GAME STATE ====
set "hasWeapon=0"
set "policeCalled=0"
set "hid=0"
set "caught=0"
set "escaped=0"
set "ending="

:: ==== TITLE SCREEN ====
cls
echo.
echo   ██████╗ ██████╗ ███████╗ █████╗ ██╗  ██╗    ██╗███╗   ██╗
echo   ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝    ██║████╗  ██║
echo   ██████╔╝██████╔╝█████╗  ███████║█████╔╝     ██║██╔██╗ ██║
echo   ██╔══██╗██╔══██╗██╔══╝  ██╔══██║██╔═██╗     ██║██║╚██╗██║
echo   ██████╔╝██║  ██║███████╗██║  ██║██║  ██╗    ██║██║ ╚████║
echo   ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝
echo.
echo   ==========================================
echo     ☠️  SOMEONE IS IN YOUR HOUSE...  ☠️
echo   ==========================================
echo.
echo   "It's 2:13 AM. You hear a window shatter."
echo.
pause
cls

:: ==== SCENE 1 – THE NOISE ====
:scene1
echo   ==========================================
echo   🛏️  YOUR BEDROOM – 2:13 AM
echo   ==========================================
echo.
echo   A loud CRASH from downstairs jolts you awake.
echo   Your heart pounds. You're not alone.
echo.
echo   What do you do?
echo.
echo      [1]  Grab your phone and call 911
echo      [2]  Grab a heavy object (weapon)
echo      [3]  Hide in the closet
echo      [4]  Go downstairs to investigate
echo.
set /p choice="> "

if "!choice!"=="1" goto callPolice
if "!choice!"=="2" goto getWeapon
if "!choice!"=="3" goto hideCloset
if "!choice!"=="4" goto investigate
echo   Invalid choice. Try again.
pause
goto scene1

:: ==== BRANCH: CALL POLICE ====
:callPolice
set "policeCalled=1"
cls
echo   ==========================================
echo   📞  DIALING 911...
echo   ==========================================
echo.
echo   "911, what's your emergency?"
echo   You whisper: "Someone broke into my house!"
echo   Dispatcher: "Stay quiet. Officers are on the way."
echo.
echo   But the intruder heard your voice...
timeout /t 2 /nobreak >nul
cls
echo   ==========================================
echo   🚪  FOOTSTEPS ON THE STAIRS
echo   ==========================================
echo.
echo   They're coming up. You have seconds.
echo.
echo      [1]  Hide under the bed
echo      [2]  Lock the door and brace
echo      [3]  Try to escape through the window
echo.
set /p choice="> "

if "!choice!"=="1" goto hideUnderBed
if "!choice!"=="2" goto lockDoor
if "!choice!"=="3" goto escapeWindow
echo   Invalid.
pause
goto callPolice

:: ==== BRANCH: GET WEAPON ====
:getWeapon
set "hasWeapon=1"
cls
echo   ==========================================
echo   ⚾  YOU GRAB A BASEBALL BAT
echo   ==========================================
echo.
echo   Your hands tremble. The bat feels heavy.
echo   The footsteps are now at the bottom of the stairs.
echo.
echo      [1]  Wait behind the door – ambush
echo      [2]  Creep to the top of the stairs
echo      [3]  Lock yourself in the bathroom
echo.
set /p choice="> "

if "!choice!"=="1" goto ambush
if "!choice!"=="2" goto creepStairs
if "!choice!"=="3" goto bathroom
echo   Invalid.
pause
goto getWeapon

:: ==== BRANCH: HIDE CLOSET ====
:hideCloset
set "hid=1"
cls
echo   ==========================================
echo   🚪  YOU SLIP INTO THE CLOSET
echo   ==========================================
echo.
echo   The closet is dark and smells of old wood.
echo   You hear the intruder open your bedroom door.
echo   They walk in... and stop.
echo.
echo   You hold your breath.
echo.
timeout /t 2 /nobreak >nul
cls
echo   ==========================================
echo   👀  THE CLOSET DOOR CREAKS...
echo   ==========================================
echo.
echo   They're right outside. Do you:
echo.
echo      [1]  Stay absolutely still
echo      [2]  Burst out and attack
echo      [3]  Scream for help
echo.
set /p choice="> "

if "!choice!"=="1" goto stayStill
if "!choice!"=="2" goto burstAttack
if "!choice!"=="3" goto screamHelp
echo   Invalid.
pause
goto hideCloset

:: ==== BRANCH: INVESTIGATE ====
:investigate
cls
echo   ==========================================
echo   🕯️  YOU CREEP DOWNSTAIRS
echo   ==========================================
echo.
echo   The living room is trashed. The back door is open.
echo   A shadow moves near the kitchen.
echo.
echo      [1]  Turn on the lights
echo      [2]  Sneak to the kitchen
echo      [3]  Run back upstairs
echo.
set /p choice="> "

if "!choice!"=="1" goto lightsOn
if "!choice!"=="2" goto sneakKitchen
if "!choice!"=="3" goto runUpstairs
echo   Invalid.
pause
goto investigate

:: =============================================
::  ENDING SCENES (with flash/jump scares)
:: =============================================

:: ---- GOOD ENDING: Police arrive in time ----
:policeArrive
cls
color 2F
echo   ==========================================
echo   🚨  POLICE ARRIVE!  🚨
echo   ==========================================
echo.
echo   Sirens wail outside. The intruder panics and flees.
echo   Officers storm in and secure the house.
echo.
echo   You're safe. Shaken, but alive.
echo.
echo   ★★★★★  GOOD ENDING – "Saved by the Bell"  ★★★★★
set "ending=Good"
goto endGame

:: ---- BAD ENDING: Caught by intruder ----
:caughtEnding
cls
color 4C
echo   ==========================================
echo   🔪  "FOUND YOU."  🔪
echo   ==========================================
echo.
echo   A cold hand grabs your shoulder.
echo   You turn... and everything goes black.
echo.
echo   💀  BAD ENDING – "Too Late"  💀
set "ending=Bad"
goto endGame

:: ---- ESCAPE ENDING ----
:escapeEnding
cls
color 3F
echo   ==========================================
echo   🏃  YOU ESCAPE THROUGH THE WINDOW!
echo   ==========================================
echo.
echo   You land in the bushes, scrape your arm, but you're out.
echo   You run to the neighbor's house and they call the police.
echo.
echo   ✅  NEUTRAL ENDING – "Out of the Pan"  ✅
set "ending=Escape"
goto endGame

:: ---- FIGHT ENDING (win) ----
:fightWin
cls
color 6F
echo   ==========================================
echo   ⚔️  YOU KNOCKED THE INTRUDER OUT!
echo   ==========================================
echo.
echo   With a swing of your bat / a lucky punch, they go down.
echo   You tie them up and call the police yourself.
echo.
echo   🥊  SECRET ENDING – "Home Defender"  🥊
set "ending=FightWin"
goto endGame

:: =============================================
::  SUB‑SCENES (lead to endings)
:: =============================================

:hideUnderBed
cls
echo   ==========================================
echo   🛏️  UNDER THE BED
echo   ==========================================
echo.
echo   You slide under the bed, dust tickling your nose.
echo   The intruder kicks the door open.
echo   They look around... then crouch down.
echo.
timeout /t 1 /nobreak >nul
color 4C
echo.
echo   ⚡ "I see you." ⚡
timeout /t 1 /nobreak >nul
color 4F
echo.
echo   You try to run, but they grab your ankle.
goto caughtEnding

:lockDoor
cls
echo   ==========================================
echo   🔒  DOOR LOCKED – YOU BRACE
echo   ==========================================
echo.
echo   They ram the door. Once. Twice.
echo   On the third hit, the frame splinters.
echo.
echo   You swing wildly – but they're faster.
goto caughtEnding

:escapeWindow
cls
echo   ==========================================
echo   🪟  WINDOW ESCAPE
echo   ==========================================
echo.
echo   You pry the window open. The cold air hits you.
echo   You jump just as the intruder bursts in.
echo.
if %policeCalled%==1 (
   echo   You hear sirens in the distance – they're here!
   goto policeArrive
) else (
   echo   You land hard and run into the night.
   goto escapeEnding
)

:ambush
cls
echo   ==========================================
echo   🚪  YOU WAIT BEHIND THE DOOR
echo   ==========================================
echo.
echo   The doorknob turns. The intruder steps in.
echo   You swing the bat with all your might!
echo.
set /a hit=%random% %%2
if !hit!==0 (
   echo   It connects! They crumple to the floor.
   goto fightWin
) else (
   echo   They dodge and grab the bat from you.
   goto caughtEnding
)

:creepStairs
cls
echo   ==========================================
echo   🚶  AT THE TOP OF THE STAIRS
echo   ==========================================
echo.
echo   You peer down. The intruder is rifling through drawers.
echo   You have the high ground.
echo.
echo      [1]  Throw something to distract them
echo      [2]  Rush down and attack
echo      [3]  Call out to them
echo.
set /p choice="> "
if "!choice!"=="1" goto distract
if "!choice!"=="2" goto rushAttack
if "!choice!"=="3" goto callOut
echo Invalid.
goto creepStairs

:distract
cls
echo   ==========================================
echo   📦  YOU THROW A VASE
echo   ==========================================
echo.
echo   It shatters in the kitchen. The intruder runs to check.
echo   You silently creep down and out the front door.
echo.
goto escapeEnding

:rushAttack
cls
echo   ==========================================
echo   🏃  YOU RUSH DOWN THE STAIRS
echo   ==========================================
echo.
echo   They hear you and turn with a knife.
echo   You clash – but they're quicker.
goto caughtEnding

:callOut
cls
echo   ==========================================
echo   📢  "HEY!" YOU SHOUT
echo   ==========================================
echo.
echo   The intruder freezes. They look up.
echo   "You got guts. But that won't save you."
echo.
timeout /t 1 /nobreak >nul
color 4C
echo   They charge up the stairs.
goto caughtEnding

:bathroom
cls
echo   ==========================================
echo   🚽  BATHROOM – LOCKED IN
echo   ==========================================
echo.
echo   You lock the door and crouch in the tub.
echo   The intruder tries the handle, then kicks it.
echo   The lock holds... for now.
echo.
echo   You can hear them walking away.
echo.
if %policeCalled%==1 (
   echo   Then – sirens! They're here!
   goto policeArrive
) else (
   echo   You stay there until morning. They're gone.
   echo   ✅ NEUTRAL ENDING – "Safe Room" ✅
   set "ending=Neutral"
   goto endGame
)

:stayStill
cls
echo   ==========================================
echo   🤫  YOU STAY PERFECTLY STILL
echo   ==========================================
echo.
echo   The intruder's hand is on the closet knob.
echo   They pause... then turn and leave the room.
echo.
echo   You hear them go back downstairs, then out the door.
echo.
echo   ✅ NEUTRAL ENDING – "The Quiet One" ✅
set "ending=Neutral"
goto endGame

:burstAttack
cls
echo   ==========================================
echo   💥  YOU BURST OUT SWINGING
echo   ==========================================
echo.
echo   You catch them off guard! You land a solid hit.
echo   They stumble and fall down the stairs.
echo.
goto fightWin

:screamHelp
cls
echo   ==========================================
echo   📢  YOU SCREAM AT THE TOP OF YOUR LUNGS
echo   ==========================================
echo.
echo   The intruder flinches – then laughs.
echo   "Nobody can hear you out here."
echo.
echo   They open the closet door.
goto caughtEnding

:lightsOn
cls
echo   ==========================================
echo   💡  LIGHTS ON!
echo   ==========================================
echo.
echo   The room floods with light. The intruder is right there.
echo   They cover their eyes – you have a split second.
echo.
echo      [1]  Punch them
echo      [2]  Run
echo.
set /p choice="> "
if "!choice!"=="1" goto fightWin
if "!choice!"=="2" goto escapeEnding
goto lightsOn

:sneakKitchen
cls
echo   ==========================================
echo   🍴  KITCHEN – THEY'RE THERE
echo   ==========================================
echo.
echo   You grab a knife from the block. They turn.
echo   You lunge – and they stumble backward into the pantry.
echo   You slam the door and wedge it shut.
echo.
echo   Then you run out the front door.
goto escapeEnding

:runUpstairs
cls
echo   ==========================================
echo   🏃  YOU RAN BACK UPSTAIRS
echo   ==========================================
echo.
echo   The intruder is right behind you. You dive into your room.
echo   You lock the door and push the dresser against it.
echo.
echo   They try to break in – but then you hear... sirens?
if %policeCalled%==1 (
   goto policeArrive
) else (
   echo   No, it's just the wind. They keep pounding.
   goto caughtEnding
)

:: =============================================
::  END GAME SCREEN
:: =============================================
:endGame
echo.
echo   ==========================================
echo   🏁  GAME OVER
echo   ==========================================
echo.
if "!ending!"=="Good" echo   ★ You survived thanks to quick thinking.
if "!ending!"=="Bad" echo   ☠️ The intruder got you. You should have acted sooner.
if "!ending!"=="Escape" echo   🏃 You escaped – but the intruder is still out there.
if "!ending!"=="Neutral" echo   😐 You made it through, but not without scars.
if "!ending!"=="FightWin" echo   🥊 You fought back and won – a true survivor!
echo.
echo   Press any key to exit...
pause >nul
exit