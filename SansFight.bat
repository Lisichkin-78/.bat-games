@echo off
title Sans Fight - Undertale
color 0A
setlocal enabledelayedexpansion

:: ==== INITIAL SETUP ====
set "playerHP=20"
set "sansHP=20"
set "maxHP=20"
set "turn=1"

:: ==== TITLE SCREEN ====
cls
echo.
echo   =====================================
echo         ⚔️  SANS FIGHT  ⚔️
echo   =====================================
echo.
echo   "you're gonna have a bad time."
echo.
pause
cls

:: ==== MAIN BATTLE LOOP ====
:fightLoop
cls
echo   =====================================
echo         🛡️  FIGHT!  (Turn %turn%)
echo   =====================================
echo.
echo   Your HP: !playerHP! / %maxHP%
echo   Sans HP: !sansHP! / %maxHP%
echo.
if !sansHP! leq 0 goto win
if !playerHP! leq 0 goto lose

:: ---- PLAYER TURN ----
echo   What do you do?
echo.
echo      [1] ATTACK
echo      [2] SPARE
echo      [3] ACT
echo.
set /p choice="> "

if "!choice!"=="1" goto playerAttack
if "!choice!"=="2" goto spare
if "!choice!"=="3" goto act
echo Invalid choice. Try again.
pause
goto fightLoop

:: ---- PLAYER ATTACK ----
:playerAttack
set /a damage=%random% %%5 + 1
set /a sansHP-=damage
if !sansHP! lss 0 set sansHP=0
echo.
echo   You swing your weapon and deal !damage! damage!
if !sansHP! leq 0 goto win
echo   Sans is still standing...
pause
goto sansTurn

:: ---- SPARE ----
:spare
echo.
echo   You try to spare Sans...
echo   "heh. you really think that'll work?"
echo   "nah. but i'll let you off easy this time."
echo.
echo   ★ SPARE successful! You show mercy.
echo   Sans disappears with a wink.
pause
goto endGame

:: ---- ACT ----
:act
echo.
echo   You check Sans.
echo   "Sans - ATK 1, DEF 1. the easiest enemy."
echo   "can't dodge forever, right?"
pause
goto sansTurn

:: ---- SANS TURN ----
:sansTurn
echo.
echo   ~~~~~~~~~~ SANS ATTACKS! ~~~~~~~~~~
set /a attackType=%random% %%2
if !attackType!==0 (
   echo   "bones appear from the ground!"
   set /a damage=%random% %%4 + 1
) else (
   echo   "a Gaster Blaster fires at you!"
   set /a damage=%random% %%6 + 1
)
set /a playerHP-=damage
if !playerHP! lss 0 set playerHP=0
echo.
echo   You take !damage! damage!
echo.
if !playerHP! leq 0 goto lose
echo   Your HP: !playerHP! / %maxHP%
pause
set /a turn+=1
goto fightLoop

:: ---- WIN ----
:win
cls
echo   =====================================
echo             🎉 YOU WIN! 🎉
echo   =====================================
echo.
echo   Sans is dust...
echo   "heh... not bad, kid."
echo   "but you're still gonna have a bad time."
echo.
echo   ★ YOU WON!
pause
goto endGame

:: ---- LOSE ----
:lose
cls
echo   =====================================
echo             💀 YOU LOSE 💀
echo   =====================================
echo.
echo   Sans grins as your HP drops to 0.
echo   "game over, pal."
echo.
pause
goto endGame

:: ---- END ----
:endGame
echo.
echo   Thanks for playing!
echo   Press any key to exit...
pause >nul
exit