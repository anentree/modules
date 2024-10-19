[0;1;32m●[0m onedrive.service - OneDrive Free Client
     Loaded: loaded (]8;;file://desktop/etc/systemd/user/onedrive.service/etc/systemd/user/onedrive.service]8;;; [0;1;32menabled[0m; preset: ignored)
     Active: [0;1;32mactive (running)[0m since Mon 2024-10-14 14:35:48 CDT; 1s ago
 Invocation: c6d21fc83caa47308fd8d58e9f560618
    Process: 112168 ExecStartPre=/nix/store/0kg70swgpg45ipcz3pr2siidq9fn6d77-coreutils-9.5/bin/sleep 15 (code=exited, status=0/SUCCESS)
   Main PID: 112224 (onedrive)
      Tasks: 6 (limit: 18998)
     Memory: 2.2M (peak: 2.9M)
        CPU: 27ms
     CGroup: /user.slice/user-1000.slice/user@1000.service/app.slice/onedrive.service
             └─[0;38;5;245m112224 /nix/store/xhv051vgrjbxn4550pahr0v0p06wk43m-onedrive-2.5.2/bin/onedrive --monitor[0m

Oct 14 14:35:33 desktop systemd[1713]: onedrive.service: Scheduled restart job, restart counter is at 578.
Oct 14 14:35:33 desktop systemd[1713]: Starting OneDrive Free Client...
Oct 14 14:35:48 desktop systemd[1713]: Started OneDrive Free Client.
Oct 14 14:35:48 desktop onedrive[112224]: D-Bus message bus daemon is available; GUI notifications are now enabled
Oct 14 14:35:48 desktop onedrive[112224]: Using IPv4 and IPv6 (if configured) for all network operations
Oct 14 14:35:48 desktop onedrive[112224]: Attempting to contact Microsoft OneDrive Login Service
