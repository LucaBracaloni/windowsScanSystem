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
:::                                     |  Versione Beta 1.0.0 - Created by Nub3  |                                                                                        


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
    set "isValid=0"
    for %%N in (1 2 3 4 5 6 7 8 9) do (
        if "%choice%"=="%%N" set "isValid=1"
    )

    if "%isValid%"=="1" (
        goto option%choice%
    ) else (
        call :displayInvalidInputMessage
        goto :start  :: Return to main menu after invalid input
    )

    :: ------------------------
    :: - MENU CHOICE CONTROL  -
    :: ------------------------

    :option1
        sfc /scannow
        call :setHeaderLoading
        goto :postOptionCommand

    :option2
        systeminfo
        goto :postOptionCommand

    :option3
        wmic memorychip get capacity, caption, devicelocator, speed
        goto :postOptionCommand

    :option4
        wmic path win32_videocontroller get caption, adapterram, driverversion
        goto :postOptionCommand

    :option5
        ping google.com -n 4
        goto :postOptionCommand

    :option6
        ipconfig /all
        goto :postOptionCommand

    :option7
        tasklist
        goto :postOptionCommand

    :option8
        wmic baseboard get product, manufacturer, version
        goto :postOptionCommand

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

        :postOptionCommand
            echo.
            pause
            cls
            goto :start

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

        :displayInvalidInputMessage
            cls
            EXIT /B 0

        :setTimeExit
            timeout /t 2 > nul 
            echo.
            EXIT /B 0

        :setNormalColor
            color 7
            EXIT /B 0
            