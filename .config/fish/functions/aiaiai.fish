function aiaiai
    if set -q KITTY_WINDOW_ID
        kitty @ launch --type=tab --title "Webserver" --cwd /home/julio/Documents/aiaiai/open-webui/in-progress-webui fish -c "trap '' SIGINT; cd webserver; and fish -c 'trap SIGINT; make -f scripts/makefile run-local'; fish"
        kitty @ launch --type=tab --title "Backend" --cwd /home/julio/Documents/aiaiai/open-webui/in-progress-webui fish -c "trap '' SIGINT; cd backend; and fish -c 'trap SIGINT; watchfiles --filter python \"python main.py\"'; fish"
        kitty @ launch --type=tab --title "Frontend" --cwd /home/julio/Documents/aiaiai/open-webui/in-progress-webui fish -c "trap '' SIGINT; fish -c 'trap SIGINT; npm run dev'; fish"
    else
        kitty --title "aiaiai-session" --session ~/.config/kitty/aiaiai.session
    end
end