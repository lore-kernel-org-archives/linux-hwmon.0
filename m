Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5280C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Nov 2022 20:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiKLU4p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Nov 2022 15:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiKLU4n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 15:56:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9864113E3E
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 12:56:42 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v17so12102110edc.8
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ed5nfgujWEM/0RnD6vmOlCXsbNvoMNcsCin9TFwIzFs=;
        b=jOcWFbcaycI2wK1Xh7R3vhjIsuIBM5G5yNY6v+d5CponK1b8UxhXTfbqHFNOxb+14p
         OzQFjx9CWQEi41fDoMqnhk1ukcHKEMxZ2Q3k29YTQrKWns1pgvJIY86B3aKyNHEcOjPX
         Yyjl73Z0rchJE3oAaB2+aRn+aaReUrfE6Q2t0AnaKHnHcohoRYWDcaWzCX4fBtiSwMz9
         wePF8Px6X7OWyyw/VXR0hPnL8RH1D/epZLVOtqRiGzsaFAuJu6du40NaVl4gxjUgQwzb
         IZ3QCItkIjJsA2ejyH5jcFTfCqOtOMWMk1cCvpDqS4kByC2t0JEJH8zL/pKRCq+9/vs/
         O64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed5nfgujWEM/0RnD6vmOlCXsbNvoMNcsCin9TFwIzFs=;
        b=jU7sQ+Qra/ooljIvJnli6eMwgLPD3WsT3JsjDlYbxkUoQ2wTaFV46yuZs8/Pcci7Vx
         HLyeOO6AmBBd5ZGOWMxo2SzcyyAe8GM7tdi2ox/Monj6Y/O8tFV7n/dq0aoAB02UoExN
         4mKsWcgxS41GIAgnZiiqRgURmvAZ9k22GXjX4sAo9kuTXGHBGHTOXpFf3hWWHuKkQUW3
         TneQ9+B9+MVV8CmUVQJRDmG8koz3gD1fBWDClF72A0PoyqHMQz3L/I/qCLtIHpE1FGM/
         ED3xV+9LY7SBq62f9boYft+jwOsqQjqCIWDUAH4KniPlLIpiponB6sKq1vEnurqSbOv4
         Lzmg==
X-Gm-Message-State: ANoB5pk3CwQirwzzADsiZxNSn3g2MGuPXDwLiC/YTGPTdi+qS1AHcv4I
        NhKkGUDAq0oDgxm7ZlGjd/PBrBsdfD7hpA==
X-Google-Smtp-Source: AA0mqf6bNaCNhKSWGqycleNM9ut1kaBfM+YT19h3lz9DqLcjbDFpwkePh9vt1uw72uhiJcqyQNT5Gw==
X-Received: by 2002:aa7:c3d1:0:b0:45a:2d7c:f3a0 with SMTP id l17-20020aa7c3d1000000b0045a2d7cf3a0mr6328401edr.98.1668286600915;
        Sat, 12 Nov 2022 12:56:40 -0800 (PST)
Received: from debian64.daheim (p5b0d77a7.dip0.t-ipconnect.de. [91.13.119.167])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b00782539a02absm2236743ejc.194.2022.11.12.12.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 12:56:40 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.96)
        (envelope-from <chunkeey@gmail.com>)
        id 1otxYO-000296-0e;
        Sat, 12 Nov 2022 21:56:40 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S
Date:   Sat, 12 Nov 2022 21:56:40 +0100
Message-Id: <9072e6884c86199765da31a23ef0935cedaaae6a.1668286473.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

found on the ASRock X670E PG Lightning (and possibly others).

the userspace sensors-detect utiliy found "a" chip right away:
|Probing for Super-I/O at 0x2e/0x2f
|[...]
|Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
|Found unknown chip with ID 0xd802
|    (logical device B has address 0x290, could be sensors)

Looking at the documentation: ASRock was nice enough to point
the exact chip out in the mainboard's "English User Manual" [0].
In section "1.5 Block Diagram" on page 10 it says "SIO NCT6796D-S".
It is also mentioned that it uses eSPI to interface with the CPU.

Adding the chip's ID as a "clone" of the existing NCT6796D leads to:

|nct6796-isa-0290
|Adapter: ISA adapter
|Vcore:                720.00 mV (min =  +0.00 V, max =  +1.74 V)
|in1:                    1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|AVCC:                   3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|+3.3V:                  3.28 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in4:                    1.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in5:                    1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in6:                    1.46 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|3VSB:                   3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|Vbat:                   3.23 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in9:                  904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in10:                 608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in11:                 608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in12:                   1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in13:                 896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in14:                   1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|fan1:                  815 RPM  (min =    0 RPM)
|fan2:                    0 RPM  (min =    0 RPM)
|fan3:                  781 RPM  (min =    0 RPM)
|fan7:                    0 RPM  (min =    0 RPM)
|SYSTIN:                +26.5°C    sensor = thermistor
|CPUTIN:                +27.0°C  (high = +80.0°C, hyst = +75.0°C)
|AUXTIN0:                +2.0°C  (high = +67.0°C, hyst = +110.0°C)
|AUXTIN1:               +15.0°C    sensor = thermistor
|AUXTIN2:               +15.0°C    sensor = thermistor
|AUXTIN3:               +13.0°C    sensor = thermistor
|SMBUSMASTER 0:         +39.5°C  (high = +80.0°C, hyst = +75.0°C)
|PCH_CHIP_CPU_MAX_TEMP:  +0.0°C
|PCH_CHIP_TEMP:          +0.0°C
|PCH_CPU_TEMP:           +0.0°C
|TSI0_TEMP:             +39.9°C
|intrusion0:           ALARM
|intrusion1:           ALARM
|beep_enable:          disabled

Of some note is:
 - voltages for Vcore, 3V3, AVCC, 3VSB and Vbat have sensible values.
   The other voltage inputs are likely "limited to a maximum value of
   2.048V due to an internal setting of 8mV LSB (256 steps x 8mV = 2.048V)"
   [1] (Section 8.6 Analog Inputs - page 58)

 - temperatures reported by SYSTIN (mainboard), TSI0+SMBUSMASTER (CPU-CCDs)
   matches too. CPUTIN really seems to be the IO-DIE of the CPU.

 - fan1 rpms matches the AIO (2nd CPU fan).
   fan3 is the 2nd chassis fan.

   The motherboard has pin-headers for 2 CPU-fans and 4 Chassis/AUX-fans.
   This means that two are missing! The novuton documentation [1] says on
   page 3 that there are 6 fan controls + monitoring inputs.

   what's odd is that pwm1-5 values provided through the sysfs interface.
   and these are matching the fan curves that have been set in the bios.

 - intrusion is not connected, same with all PCH* sensors.
   AUXTIN123 are not moving. AUXTIN0 is moving with

[0] https://download.asrock.com/Manual/X670E%20PG%20Lightning_English.pdf
[1] https://www.nuvoton.com/export/resource-files/NCT6796D_Datasheet_V0_6.pdf
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

Any insights into the missing two fan speed sensors would be very appreciated.
I didn't find a datasheet that talks about the "NCT6796D->S<" specifically or
the "odd" 0xd802 id value.

(I checked on my mainboard and the label on the chip really ends with an "-S")
Nuvoton lists the chip as "NCT6796D-E" on their website. But there are pictures
on google that show a ASRock X570 Taichi motherboard with a NCT6796D-"R" chip.
This looks to me that the letter is something like a revision or model year?
---
 drivers/hwmon/nct6775-core.c     | 1 +
 drivers/hwmon/nct6775-platform.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index da9ec6983e13..8147544ad5d6 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -29,6 +29,7 @@
  * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
  * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
  * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
+ *                                           (0xd802)
  * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index b34783784213..f355d0c2a8cd 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -84,6 +84,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6793_ID		0xd120
 #define SIO_NCT6795_ID		0xd350
 #define SIO_NCT6796_ID		0xd420
+#define SIO_NCT6796S_ID		0xd800
 #define SIO_NCT6797_ID		0xd450
 #define SIO_NCT6798_ID		0xd428
 #define SIO_ID_MASK		0xFFF8
@@ -987,6 +988,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 		sio_data->kind = nct6795;
 		break;
 	case SIO_NCT6796_ID:
+	case SIO_NCT6796S_ID:
 		sio_data->kind = nct6796;
 		break;
 	case SIO_NCT6797_ID:
-- 
2.38.1

