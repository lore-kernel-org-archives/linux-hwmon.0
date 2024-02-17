Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D137CF1F
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Feb 2024 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708186784; cv=none; b=bkV/YrC26gxYtJHTAmVDdVXtYHn3iB2ngeASbjp13NFv735/oMZQYMPJSj3rVOhJ05/iqBQ5pQdnZkfOTmurMeLB2oB9khjaAW6Pwrp+lw3QtnDqBXoiuxJm4wW6T2HGhImSUdgzcxwy2o7G0r/w6/xGfh/pjFk18R5Ne8KC9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708186784; c=relaxed/simple;
	bh=d3uglRU/AVi2dkD5TddJRnchFyY1qmCsj9x0cUYm1xc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EgPmUFT51rDg8W2WGjSu/SxxtHIyHAaZFFuFlC06EJdf2Hs4nijEqWUeU6FW4HXKUSybAek6DKTQ6k53m552VezONvisSUre2n/2rLQKWd1xCiSsnNsn8sPtrnJ2OKpDV++EsUG6gqgosaLGb0sgbqf9KqtELJzcWSOZB7EqgRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVYdDMdK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVYdDMdK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1da0cd9c0e5so30868955ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Feb 2024 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708186781; x=1708791581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fhvD70oWDFgCWFnekl9gKqHrpVXyiJ7wChV1vBiMebs=;
        b=CVYdDMdKu24LXO6iYA7ogAGDq8dglQa9wdnt+LKcxxeBi9Q4XkCY5QKMo+oG1hwtBk
         2HNqCTcwdUq7ZIsSIFsykniSQ/LV4/zfCoP3kpx8JrmsiDd28vejIAR3HLVhQBTH2Rkj
         0Et6Pj/TgDv2mUTuv84RI8dV8xV4rL4eufWQoaCKbEuwPfqf+zxbjZ5xPp2QLYrqf1Xd
         lQpSwL/aI59n6ZTOHNSHdh4Iuuh7H7/w+S2EzRdZKYBzPT9QjlFFsUwuHhzLzN0Nkn5I
         liyERhx7tSoAS6PpttdS26tYTUuUMjXZ+cbCrgUVCrXNlXmZtObOwFBuifvK6z/pgy/9
         KS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708186781; x=1708791581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhvD70oWDFgCWFnekl9gKqHrpVXyiJ7wChV1vBiMebs=;
        b=kAV9hNH84u7i3Mba8kA5/W80ttL6M6kzTptRzFPaftXh4bUSBaI2xS7NUAAZql0Zfy
         3XB/MQiP6xzx/8Bo8PCUrTxyOdFkmaI/4+uCyw1H3kNjv6CQQxHc6TZYpvW+Ag1lapzV
         AGjeP6uP63qHCDvJKbhKIwUqEfta4UGOdOFZgjjgAwppadmJJaVFm748b7jWxMwyPclv
         nalNRSmgGyBol0SrQEB75zSbCmb7dXTLvcNHua3pPGU0tCOVjryeGhSHjQw8pCt4j8qz
         oCruRjme5VJejrzoAQpANf0ucBZUDR5kXFQo/Iwep4ZX4NZayJ8qcrOZV6IkFeVPCfo/
         WASw==
X-Gm-Message-State: AOJu0Yw5zKv6sMX+OTNe8HPLzSKKXL4b4kVdkys3Q7cdN32b7cPQbtPH
	6SDEKO8Ndpa/EEHXATMzcXPaWrTMug2J3W00IYq4TDNA4kLlz6yOpaaMKA5c
X-Google-Smtp-Source: AGHT+IF2oxplsC8cP1lB5II/uLMpmDDpFyjQjTgaAJ0ABenorOrT39T7wkcskFJOR7BnUPVtKq5C9A==
X-Received: by 2002:a17:90b:4015:b0:299:6b6d:f4a3 with SMTP id ie21-20020a17090b401500b002996b6df4a3mr1314395pjb.9.1708186780949;
        Sat, 17 Feb 2024 08:19:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b13-20020a63eb4d000000b005dc9439c56bsm1751742pgk.13.2024.02.17.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 08:19:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MAINTAINERS: Drop redundant hwmon entries
Date: Sat, 17 Feb 2024 08:19:34 -0800
Message-Id: <20240217161934.2448274-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am listed as maintainer of several individual hardware monitoring drivers
and for the hardware monitoring subsystem itself. That is redundant and
just bloats the MAINTAINERS file. Drop all the redundant entries.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 108 ----------------------------------------------------
 1 file changed, 108 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afe08a63f7a9..9c14c97d1056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10493,22 +10493,6 @@ L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
-INA209 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
-F:	Documentation/hwmon/ina209.rst
-F:	drivers/hwmon/ina209.c
-
-INA2XX HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/ina2xx.rst
-F:	drivers/hwmon/ina2xx.c
-F:	include/linux/platform_data/ina2xx.h
-
 INDEX OF FURTHER KERNEL DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@amd.com>
 S:	Maintained
@@ -11484,14 +11468,6 @@ S:	Maintained
 F:	arch/x86/include/asm/jailhouse_para.h
 F:	arch/x86/kernel/jailhouse.c
 
-JC42.4 TEMPERATURE SENSOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
-F:	Documentation/hwmon/jc42.rst
-F:	drivers/hwmon/jc42.c
-
 JFS FILESYSTEM
 M:	Dave Kleikamp <shaggy@kernel.org>
 L:	jfs-discussion@lists.sourceforge.net
@@ -12557,13 +12533,6 @@ F:	Documentation/hwmon/lm90.rst
 F:	drivers/hwmon/lm90.c
 F:	include/dt-bindings/thermal/lm90.h
 
-LM95234 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/lm95234.rst
-F:	drivers/hwmon/lm95234.c
-
 LME2510 MEDIA DRIVER
 M:	Malcolm Priestley <tvboxspy@gmail.com>
 L:	linux-media@vger.kernel.org
@@ -12767,13 +12736,6 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
-LTC4261 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/ltc4261.rst
-F:	drivers/hwmon/ltc4261.c
-
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org
@@ -13129,13 +13091,6 @@ S:	Maintained
 F:	Documentation/hwmon/max15301.rst
 F:	drivers/hwmon/pmbus/max15301.c
 
-MAX16065 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/max16065.rst
-F:	drivers/hwmon/max16065.c
-
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org
@@ -13160,15 +13115,6 @@ S:	Orphan
 F:	Documentation/hwmon/max6650.rst
 F:	drivers/hwmon/max6650.c
 
-MAX6697 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/max6697.txt
-F:	Documentation/hwmon/max6697.rst
-F:	drivers/hwmon/max6697.c
-F:	include/linux/platform_data/max6697.h
-
 MAX9286 QUAD GMSL DESERIALIZER DRIVER
 M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
@@ -15075,15 +15021,6 @@ M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
 S:	Maintained
 F:	net/ncsi/
 
-NCT6775 HARDWARE MONITOR DRIVER - CORE & PLATFORM DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/nct6775.rst
-F:	drivers/hwmon/nct6775-core.c
-F:	drivers/hwmon/nct6775-platform.c
-F:	drivers/hwmon/nct6775.h
-
 NCT6775 HARDWARE MONITOR DRIVER - I2C DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
 L:	linux-hwmon@vger.kernel.org
@@ -17450,35 +17387,6 @@ S:	Maintained
 F:	Documentation/hwmon/pm6764tr.rst
 F:	drivers/hwmon/pmbus/pm6764tr.c
 
-PMBUS HARDWARE MONITORING DRIVERS
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-W:	http://hwmon.wiki.kernel.org/
-W:	http://www.roeck-us.net/linux/drivers/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
-F:	Documentation/devicetree/bindings/hwmon/ltc2978.txt
-F:	Documentation/devicetree/bindings/hwmon/max31785.txt
-F:	Documentation/hwmon/adm1275.rst
-F:	Documentation/hwmon/ibm-cffps.rst
-F:	Documentation/hwmon/ir35221.rst
-F:	Documentation/hwmon/lm25066.rst
-F:	Documentation/hwmon/ltc2978.rst
-F:	Documentation/hwmon/ltc3815.rst
-F:	Documentation/hwmon/max16064.rst
-F:	Documentation/hwmon/max20751.rst
-F:	Documentation/hwmon/max31785.rst
-F:	Documentation/hwmon/max34440.rst
-F:	Documentation/hwmon/max8688.rst
-F:	Documentation/hwmon/pmbus-core.rst
-F:	Documentation/hwmon/pmbus.rst
-F:	Documentation/hwmon/tps40422.rst
-F:	Documentation/hwmon/ucd9000.rst
-F:	Documentation/hwmon/ucd9200.rst
-F:	Documentation/hwmon/zl6100.rst
-F:	drivers/hwmon/pmbus/
-F:	include/linux/pmbus.h
-
 PMC SIERRA MaxRAID DRIVER
 L:	linux-scsi@vger.kernel.org
 S:	Orphan
@@ -22182,22 +22090,6 @@ F:	drivers/mmc/host/renesas_sdhi*
 F:	drivers/mmc/host/tmio_mmc*
 F:	include/linux/mfd/tmio.h
 
-TMP401 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
-F:	Documentation/hwmon/tmp401.rst
-F:	drivers/hwmon/tmp401.c
-
-TMP464 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
-F:	Documentation/hwmon/tmp464.rst
-F:	drivers/hwmon/tmp464.c
-
 TMP513 HARDWARE MONITOR DRIVER
 M:	Eric Tremblay <etremblay@distech-controls.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.39.2

