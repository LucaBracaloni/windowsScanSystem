@echo off
:: window title name
title System Tool

:: ---------------------------
:: -   ASCII ART BY NUB3     -
:: --------------------------- 


:::   ________  ___  ___  ________  ___________  _______  ___      ___      ___________  ______      ______    ___       
:::  /"       )|"  \/"  |/"       )("     _   ")/"     "||"  \    /"  |    ("     _   ")/    " \    /    " \  |"  |      
::: (:   \___/  \   \  /(:   \___/  )__/  \\__/(: ______) \   \  //   |     )__/  \\__/// ____  \  // ____  \ ||  |      
:::  \___  \     \\  \/  \___  \       \\_ /    \/    |   /\\  \/.    |        \\_ /  /  /    ) :)/  /    ) :)|:  |      
:::   __/  \\    /   /    __/  \\      |.  |    // ___)_ |: \.        |        |.  | (: (____/ //(: (____/ //  \  |___   
:::  /" \   :)  /   /    /" \   :)     \:  |   (:      "||.  \    /:  |        \:  |  \        /  \        /  ( \_|:  \  
::: (_______/  |___/    (_______/       \__|    \_______)|___|\__/|___|         \__|   \"_____/    \"_____/    \_______)                                                                                                                    
:::
:::                                     |  Versione Beta 1.1.0 - Created by Nub3  |                                                                                        


:start                                             
:: script ASCII art
    for /f "delims=: tokens=*" %%A in ('findstr /b ":::" "%~f0"') do @echo(%%A 


    :: -----------------------------
    :: -       MENU OPTION         -
    :: -----------------------------
 
    echo.
    call :menu

    :askChoice
    set /p choice="Choose an option:  "

    :: input validation number beetween 1 and 9   
    if "%choice%" lss "1" if "%choice%" gtr "9" (
        call :setSceltaNonValida
        goto :askChoice
    )

    :: Choice input control
    if "%choice%" geq "1" if "%choice%" leq "9" (
        goto option%choice%
    ) else (
        call :setSceltaNonValida
    )

    :: ------------------------
    :: - MENU CHOICE CONTROL  -
    :: ------------------------

    :option1
        sfc /scannow
        call :setHeaderLoading
        echo.
        pause
        cls
        goto :start

    :option2
        systeminfo
        echo.
        pause
        cls
        goto :start

    :option3
        wmic memorychip get capacity, caption, devicelocator, speed
        echo.
        pause
        cls
        goto :start

    :option4
        wmic path win32_videocontroller get caption, adapterram, driverversion
        echo.
        pause
        cls
        goto :start

    :option5
        ping google.com -n 4
        echo.
        pause
        cls
        goto :start

    :option6
        ipconfig /all
        echo.
        pause
        cls
        goto :start

    :option7
        tasklist
        echo.
        pause
        cls
        goto :start

    :option8
        wmic baseboard get product, manufacturer, version
        echo.
        pause
        cls
        goto :start

    :option9
        call :setHeaderExit
        color 7
        call :setTimeExit


        :menu
        :: previous menu Asci art
            color 7
            echo        /-----------------------------------\
            echo        -           SYSTEM TOOL             -
            echo        -------------------------------------
            echo        -        1 Scan windows System      -
            echo        -        2 System Information       -
            echo        -        3 RAM Information          -
            echo        -        4 SCHEDA VIDEO inf         -
            echo        -        5 Test di rete             -
            echo        -        6 Rete information         -
            echo        -        7 Monitoring exc           -
            echo        -        8 Motherboard info         -
            echo        -        9 Esci                     -
            echo        \-----------------------------------/
            echo.
            EXIT /B 0

        :setSceltaNonValida
            echo.
            echo        /-----------------------------------\
            echo         -         Not Valid Input          -
            echo        \-----------------------------------/
            echo.
            call :setTimeExit
            call :setNormalColor
            cls
            call :start
            EXIT /B 0

        :setHeaderExit
            echo.
            echo        /-----------------------------------\
            echo         -         Exit Program...          -
            echo        \-----------------------------------/
            echo.
            EXIT /B 0

        :setHeaderLoading
            echo.
            echo        /-----------------------------------\
            echo         -            Loading...            -
            echo        \-----------------------------------/
            echo.
            EXIT /B 0

        :setTimeExit
            timeout /t 2 > nul 
            echo.
            EXIT /B 0

        :setNormalColor
            color 7
            EXIT /B 0
            