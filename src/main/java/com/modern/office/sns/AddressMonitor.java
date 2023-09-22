package com.modern.office.sns;

import com.modern.office.scheduler.AppConfig;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.URL;
import java.util.Objects;

@Service
@Slf4j
@RequiredArgsConstructor
public class AddressMonitor {

    private final AppConfig appConfig;
    private final SnsService snsService;
    private String originalIp;

    @Scheduled(fixedDelay = 60000)
    public void lookup()
    {
        try
        {
            var whatismyip = new URL("http://checkip.amazonaws.com");
            var in = new BufferedReader(new InputStreamReader(
                    whatismyip.openStream()));

            var ip = in.readLine();
            log.info("Looked up own IP address: {}", ip);

            if (Objects.isNull(appConfig.getOriginalIp()))
            {
                appConfig.setOriginalIp(ip);
            }
            else
            {
                if (!appConfig.getOriginalIp().equals(ip))
                {
                    log.info("IP Address has changed from {} to {}", originalIp, ip);
                    appConfig.setOriginalIp(ip);
                    snsService.sendSMS("Your new IP address is " + ip + ". Please visit https://www.dynu.com to reset your domain name", appConfig.getIpAdminPhone());
                }
            }


        }
        catch(Exception e)
        {
            log.error("Error looking up own IP address", e);
        }
    }
}
