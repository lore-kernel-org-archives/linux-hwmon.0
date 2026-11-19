Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047002;
	b=mE11BgTUBrG1+JkkBJv28RcIE6pbtdcRavMUDiFxyiIsQnIU4O2L+qCRdqO5En0XZ6mp
	 f2FhzQScCxthFBJ36AEjDYJKO3NbaU+fCzb6GePSg3fbQOXxSehUuOLde5KqmTovKls8/
	 DffSCRPOHspj7LTpseaGgmMauAZ/uYomyxuihuvN9UNyvx6yCxnDEDsiPpQAtHe332gbQ
	 zOEP2wFN8D2lDpNSop6eOQPd71r2/CD93froUwxeZnpJtvEsQXZ3YDyHJ8yYl8hCafygr
	 5eqdQyGPhQGaZW67+DpJnhBAuSstmrtfiYCSQjw7GS92rwLmVItx/GjhxAQ4mvZ0Isw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5y8vTiX+vds2w4wlNnvx/9XDPfMUlxXwPeZuPa8V+wk=;
	b=aNUOIWw2BdG+Wzr1HeTCpn0UgUVI/GD/zsz7Je0B/llVAOGWORvvqGOyLKX9UI9LRrML
	 quMc1gHOg3O8IwbLC8abMvLsHxtfB/1HBmvh7jZvnciIrAzJ4NV24wDEKr+pLV3Ggw0Ul
	 Z+Q8Bhz7BLNIjDSuk7gNRtOa8PpSBKuk0EHGkc2qlk6gDQRLsufDoLXkotIQqf4UJOE3j
	 vEiuH47YTy7KESaw6H0tqKfWWABmaOgBVkfVgjWeejW+C89qIHhMXBoToVDjKmQ0SslFq
	 p5yNvrTeCX9aAJjob/ePP4UJefyC8UA36jRPgDznKyvPOARKRerfBpBHkNqJmSNw6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rNSkBOBb;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5171360A2629
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5171360A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rNSkBOBb
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67db8985419so2225412d50.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 16:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795047000; x=1795651800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y8vTiX+vds2w4wlNnvx/9XDPfMUlxXwPeZuPa8V+wk=;
        b=rNSkBOBbLy5BJe3rtWx4MahKWDiUV6++05CC6gHbUaDgiJO7Jwa7ryE+mpvXQZyOkV
         xm8DatOR6S4jrdfurisl3UWVCAQj/7/Vb/v5SVnrJkPbE881QRJr1talcPd0DBpFFDxq
         9E/2oZoBb5CDZyz7Hc089MhyuvID7HT98M/c55t9mzJC70hIZk3rsHW2IO7znh8IULkN
         IKnKiSCXn35HwFgGMV17GInSsUF5XRmbjgcTPsu+J7fNchzPNMdmOky6xQ1Jxz1flg1b
         GCvp+zOhQ3ZVy9C6ot3Nt69JMytmlJAx0Juoi+CIvgD8pOkYDY5gWjJCSwtm2Eode3BO
         ePUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047000; x=1795651800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5y8vTiX+vds2w4wlNnvx/9XDPfMUlxXwPeZuPa8V+wk=;
        b=s5aBl9pFSRo4Ie5b6kp1L8YH6JYjZI15XYIeiJn8iJZxnJk3SiO2OChMV3CbTlTSZM
         rZEhQ+BK51xbrY6uuHXZK3TleNO9IWShhKDRfc1dvuE4lyEh26Jv7D7XzVaYyiMNSJl6
         oiYOJsm0oBQzvRTAhamk2Z9IV5BlVw29XMKuQ2kbJlEjzvUU+MEDEIsUeLfXgx/06EyE
         o7C80HlRZWhsSsISfiEPQ3aupu4GvFhtKh447r9jBVt70qs9LuogXgEjQApoAVB1VNtp
         /g2pgmg4QDksoYUsZYnoqQZ81cs08iCaxxhT4RVnuAeB1+V+jMYagiOE16n+jOgMqov9
         aTvQ==
X-Forwarded-Encrypted: i=1; AL+hErHQna11YSLWsGWpgeAfIURAUjBQ8B7ijovU/IDMGOyjsM+B+USpvCp8YIntPa2V526xFyUvxLIvse/t8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NQ8O7F+NvjO2R1nwvN+npGaf60a28kHcy566cdSf96edcLjFF
	1NnJ5EHjMK8kAtGnrng5kunZOnKhC6APSzbrYw4U8gdtysW4XSqt1deOdu/GM3OU
X-Gm-Gg: AZFdTZcbnr8VfJdmyRR4An4eyzlhpkZ9DaR2VB393MetupLt1Qh+4GOFhLUxDMSn02c
	5bkOMoGpUI12ebA66pYOkG9YhHALqLJY3A6DVTkTsRaXPdIpuIFr/iirKeyLCwpwniGAhh5ufvD
	GuRgdqQnJPioOgG960c6c8uWAWgQCQ3EkgGvPw2Slo8fF9YLrywn5/GGVCj990xxMmxGnIgVgEM
	G53CHKtj9XDggsiHc/R7ztxgf3YHltGfNKIYJ4pMvDGRieCt8osl+A0N4VyhKL5RUp/1PFZTgo4
	MQEFph3amAQhI/WNG6C1HD4J2UGonh1VQ2Y/l59Z6f4aVa9lGD44a8aYHmTR9r8m6fDKipv94gv
	hihrGU2FAZS245MK+XKBrXL64myTw3WYLw87XynJICWiBGCSSkqWEgk59KGIch4fmYXUsnkGQ63
	sbNTOk0iA2HfGTEsPM9an8IqTIzqugwfJfY+VncIiVccCLrMpV2N37rPSj43B8jgtq7RZyYmG8l
	uNpWifU28s81UpXGS0me8OAjRMLaREnRpiwjI/70/4ne5QHyLepwsG26iQZ8oY8ry6wM3Yj8kLf
	EOtWM5+gmXy8I1tKaR1666o0JcsRPkHjAFv6OpNkRubYj3XM/dsyhKpKAR84SDRMe9tztuQcPMk
	F3SNCKo7EAjunegZ2xHgbdO9nhc6TewXFmXlVfYJehsJL66ZDHpv5+9F5zzSqcPZRBldCsAsORg
	2WBUGwhwrWlkhrtNeXrg7kxD/NS5THd5nBf5k4gPA=
X-Received: by 2002:a05:690e:1382:b0:67d:9fef:d614 with SMTP id 956f58d0204a3-67dd4530a30mr1800693d50.38.1795047000198;
        Wed, 18 Nov 2026 16:10:00 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd58ca17bsm2452078d50.21.2026.11.18.16.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:59 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:51 -0500
Subject: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-6-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=26425; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=TdEIwdfbNPkSNtus8SMc9OYeiZeZZ80Yuc6NUbb+feE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xm9nbfO1une5atppdv//fS4fvZKM9vFE1+/xexNf
 rQp2uJUSsdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBco/6AkeFXZ+XDtU
 tOyp3vX3KgcdIkmc5EvWNrsiZFnpN+Lta9xWEXI8O7kkTx3KnCnfONjwjvK3ki/D8nwpX3d7X8d
 eFXDYrFGSwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
The SRM console describes each sensor as a packet in a power and
environment node of its config tree (GCT), and fills in the readings
when asked to refresh the node. The packet layout was taken from Tru64
UNIX.

The firmware gives each temperature, fan and voltage sensor a warning
limit and a failure limit, and reports the sensor in the warning or
failure state once its reading reaches one. Neither state means that the
sensor is broken: a temperature past its failure limit is too high, not
faulty. Power supplies are either working or failed, with the cause
(AC, POK, overtemperature, fan) logged by the firmware.

Export the sensors through hwmon. A temperature's warning and failure
limits become max and crit, with max_alarm set in either state and
crit_alarm in the failure state. A fan's warning limit becomes min, with
min_alarm set in either state and fault in the failure state, which is
when the firmware counts the fan as failed. A voltage exports its
reading, with min_alarm or max_alarm set in either state and lcrit_alarm
or crit_alarm in the failure state, depending on which side of its
nominal voltage it reads. The console gives the nominal voltage and only
one other limit, so the voltage limits are not exported. A power supply
is a voltage channel with only a fault attribute.

A refresh keeps the boot CPU in the console with interrupts disabled for
up to 300 ms per node, so refresh a node at most once every 10 seconds.
The hwmon core serializes the callbacks, which also
serializes the refreshes.

The console callback lives in core_marvel.o, which generic kernels
built with ALPHA_LEGACY_START_ADDRESS leave out.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Documentation/hwmon/index.rst      |   1 +
 Documentation/hwmon/marvel-env.rst |  69 +++++
 MAINTAINERS                        |   8 +
 arch/alpha/include/asm/gct.h       |   2 +
 drivers/hwmon/Kconfig              |  11 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/marvel-env.c         | 597 +++++++++++++++++++++++++++++++++++++
 7 files changed, 689 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..b062ad1ff53f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -157,6 +157,7 @@ Hardware Monitoring Kernel Drivers
    ltc4286
    lx1308
    macsmc-hwmon
+   marvel-env
    max127
    max15301
    max16064
diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
new file mode 100644
index 000000000000..02d5241749bc
--- /dev/null
+++ b/Documentation/hwmon/marvel-env.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver marvel-env
+========================
+
+Supported systems:
+
+  * Marvel (EV7) AlphaServers: the GS1280, ES80 and ES47 families,
+    booted from the SRM console
+
+Author: Matt Turner <mattst88@gmail.com>
+
+Description
+-----------
+
+The management firmware of these machines monitors temperatures, fans,
+voltages and power supplies, and the SRM console describes each sensor in
+its configuration tree (GCT). This driver asks the console to refresh the
+readings and exports them.
+
+The console has no sensor names, so the labels are built from the reporting
+unit (such as ``CMM0`` or ``MBM/PBM``) and the sensor's position in that
+unit. On systems with more than one drawer every label starts with the
+cabinet and drawer numbers.
+
+A refresh keeps the boot CPU in the console with interrupts disabled for up
+to 300 ms per unit, so a unit is refreshed at most once every 10 seconds.
+
+Sysfs entries
+-------------
+
+The management firmware gives each temperature, fan and voltage sensor a
+warning limit and a failure limit, and reports the sensor in the warning or
+failure state when its reading reaches the limit. Neither state means that
+the sensor is broken. Power supplies have no warning state and are reported
+as voltage channels that only have a fault attribute.
+
+=========================== =================================================
+``temp[1-*]_input``         Temperature
+``temp[1-*]_max``           Warning limit
+``temp[1-*]_crit``          Failure limit
+``temp[1-*]_max_alarm``     Temperature reached the warning limit
+``temp[1-*]_crit_alarm``    Temperature reached the failure limit
+``temp[1-*]_label``         Sensor label
+
+``fan[1-*]_input``          Fan speed
+``fan[1-*]_min``            Warning limit
+``fan[1-*]_min_alarm``      Fan speed dropped to the warning limit
+``fan[1-*]_fault``          Fan speed dropped to the failure limit, and the
+                            firmware counts the fan as failed
+``fan[1-*]_label``          Fan label
+
+``in[0-*]_input``           Voltage
+``in[0-*]_min_alarm``       Voltage is below the warning limit
+``in[0-*]_max_alarm``       Voltage is above the warning limit
+``in[0-*]_lcrit_alarm``     Voltage is below the failure limit
+``in[0-*]_crit_alarm``      Voltage is above the failure limit
+``in[0-*]_fault``           Power supply has failed
+``in[0-*]_label``           Sensor or power supply label
+=========================== =================================================
+
+The firmware checks a voltage against limits on both sides of the nominal
+voltage, but the console only describes the nominal voltage and one other
+limit, so the voltage limits are not exported. Whether a voltage is too low
+or too high comes from comparing it with the nominal voltage.
+
+Sensors that the console reports as unknown or not present when the driver
+loads are not exported. If a sensor becomes unknown later, reading its input,
+alarm or fault attribute fails with ``-ENODATA``.
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..09dee8fab9ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16100,6 +16100,14 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/img/pistachio*
 
+MARVEL ALPHASERVER ENVIRONMENTAL SENSOR DRIVER
+M:	Matt Turner <mattst88@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-alpha@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/marvel-env.rst
+F:	drivers/hwmon/marvel-env.c
+
 MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	netdev@vger.kernel.org
diff --git a/arch/alpha/include/asm/gct.h b/arch/alpha/include/asm/gct.h
index 2847449fb168..afa7ed870bd1 100644
--- a/arch/alpha/include/asm/gct.h
+++ b/arch/alpha/include/asm/gct.h
@@ -43,11 +43,13 @@ typedef struct {
  * node types 
  */
 #define GCT_TYPE_HOSE			0x0E
+#define GCT_TYPE_PE			0x13	/* power and environment */
 
 /*
  * node subtypes
  */
 #define GCT_SUBTYPE_IO_PORT_MODULE	0x2C
+#define GCT_SUBTYPE_PE_CABINET		0x3D	/* id holds an 8-bit cabinet */
 
 #define GCT_NODE_PTR(off) ((gct6_node *)((char *)hwrpb + 		\
 					 hwrpb->frut_offset + 		\
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..c0ce5591c82d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
 	  This driver can also be built as a module. If so, the module will
 	  be called macsmc-hwmon.
 
+config SENSORS_MARVEL_ENV
+	tristate "Marvel (EV7) AlphaServer environmental sensors"
+	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	help
+	  If you say yes here you get support for the temperature, fan,
+	  voltage and power supply sensors of Marvel AlphaServers (the
+	  GS1280, ES80 and ES47), as described by the SRM console.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called marvel-env.
+
 config SENSORS_MAX1111
 	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..2b1b1850d641 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
 obj-$(CONFIG_SENSORS_LTC4283)	+= ltc4283.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
 obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc-hwmon.o
+obj-$(CONFIG_SENSORS_MARVEL_ENV)	+= marvel-env.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
new file mode 100644
index 000000000000..8ec3dd7c0b23
--- /dev/null
+++ b/drivers/hwmon/marvel-env.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Environmental sensors of Marvel (EV7) AlphaServers: the GS1280, ES80 and
+ * ES47 families.
+ *
+ * The SRM console describes every sensor in the config tree (GCT). Each power
+ * and environment (P&E) node may carry a list of environmental packets:
+ * temperature and voltage sensors, fans and power supplies. The console fills
+ * in the readings when asked to refresh the node. The packet layout was
+ * taken from Tru64 UNIX.
+ *
+ * The management firmware gives each temperature, voltage and fan sensor a
+ * warning limit and a failure limit, and puts the sensor in the warning or
+ * failure state when its reading reaches the limit. Neither state means that
+ * the sensor itself is broken. A power supply has no warning state; it is
+ * either working or failed.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/gct.h>
+#include <asm/marvel_env.h>
+
+#define DRVNAME "marvel_env"
+
+#define GCT_FLAGS_REQUIRED	BIT(9)
+#define GCT_FLAGS_EXCLUDED	(BIT(2) | BIT(7) | BIT(12) | BIT(14))
+
+/* Header of a P&E node's packet list, at hd_extension. */
+#define ENV_HDR_COUNT		0x10
+#define ENV_HDR_FIRST		0x14
+#define ENV_HDR_SIZE		0x18
+
+/* Packet types. */
+#define ENV_PKT_POWER_SUPPLY	0x08
+#define ENV_PKT_FAN		0x09
+#define ENV_PKT_SENSOR		0x2a
+
+/*
+ * Sensor packet: kind, status, reading, and two limits. Temperatures are in
+ * tenths of a degree Celsius, voltages in millivolts. For a temperature the
+ * two values are the warning and failure limits. For a voltage they are the
+ * nominal voltage and an upper limit; the firmware checks a voltage against
+ * a window on both sides of the nominal voltage, so neither is exported.
+ */
+#define SENSOR_KIND		0x28
+#define SENSOR_STATUS		0x2c
+#define SENSOR_VALUE		0x30
+#define SENSOR_WARN		0x34
+#define SENSOR_FAIL		0x38
+#define SENSOR_NOMINAL		SENSOR_WARN	/* of a voltage */
+#define SENSOR_SIZE		0x3c
+
+#define SENSOR_KIND_THERMAL	2
+#define SENSOR_KIND_VOLT_FIRST	3
+#define SENSOR_KIND_VOLT_LAST	5
+
+/* Fan packet: status, rpm, low warning limit, low failure limit. */
+#define FAN_STATUS		0x24
+#define FAN_VALUE		0x28
+#define FAN_WARN		0x2c
+#define FAN_SIZE		0x34
+
+/* Power supply packet: status. */
+#define PS_STATUS		0x24
+#define PS_SIZE			0x28
+
+/* Status values, in the low byte of the status word. */
+#define ENV_OK			0
+#define ENV_WARNING		1	/* reading reached the warning limit */
+#define ENV_FAILURE		2	/* reading reached the failure limit */
+#define ENV_UNKNOWN		0xfe
+#define ENV_NOT_PRESENT		0xff
+
+/* Console status of a refresh that Tru64 also treats as success. */
+#define CFGTREE_STATUS_OK2	(-0x4a)
+
+/* A refresh blocks the boot CPU for up to 300 ms, so limit how often. */
+#define REFRESH_INTERVAL	(10 * HZ)
+
+struct marvel_env_node {
+	gct6_node *node;
+	unsigned long offset;		/* from the start of the GCT */
+	unsigned long last_refresh;
+	bool valid;
+	unsigned int cabinet, drawer, pe;
+};
+
+struct marvel_env_chan {
+	struct marvel_env_node *node;
+	unsigned int pkt;		/* packet offset in the node */
+	bool ps;			/* power supply, as an in channel */
+	bool present;			/* known when the driver loaded */
+	char label[32];
+};
+
+struct marvel_env_data {
+	struct device *dev;
+	struct marvel_env_node *nodes;
+	unsigned int nr_nodes, max_nodes;
+	struct marvel_env_chan *chans[hwmon_max];
+	unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
+	bool multi_drawer;		/* label with cabinet and drawer */
+};
+
+static const char * const pe_names[] = {
+	[0x09] = "MBM",
+	[0x0a] = "MBM/PBM",
+	[0x0c] = "PS",
+	[0x0d] = "FAN",
+	[0x0f] = "CMM0", [0x10] = "CMM1", [0x11] = "CMM2", [0x12] = "CMM3",
+	[0x14] = "VRM0", [0x15] = "VRM1", [0x16] = "VRM2", [0x17] = "VRM3",
+	[0x19] = "PBM",
+	[0x1a] = "XSHELF",
+	[0x1b] = "PCIPS",
+	[0x1c] = "PCIFANS",
+};
+
+/* The sensor types the driver exports. */
+static const enum hwmon_sensor_types marvel_env_types[] = {
+	hwmon_temp, hwmon_fan, hwmon_in,
+};
+
+/* The attributes that report the state of a channel. */
+static const u32 marvel_env_alarm_attrs[hwmon_max] = {
+	[hwmon_temp] = HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
+	[hwmon_fan] = HWMON_F_MIN_ALARM | HWMON_F_FAULT,
+	[hwmon_in] = HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
+		     HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I_FAULT,
+};
+
+static inline u32 env_rd(struct marvel_env_node *n, unsigned int off)
+{
+	return *(u32 *)((char *)n->node + off);
+}
+
+static bool env_status_valid(u8 status)
+{
+	return status != ENV_UNKNOWN && status != ENV_NOT_PRESENT;
+}
+
+static u8 marvel_env_status(enum hwmon_sensor_types type,
+			    const struct marvel_env_chan *c)
+{
+	unsigned int off;
+
+	if (type == hwmon_fan)
+		off = FAN_STATUS;
+	else if (c->ps)
+		off = PS_STATUS;
+	else
+		off = SENSOR_STATUS;
+	return env_rd(c->node, c->pkt + off) & 0xff;
+}
+
+/*
+ * The alarm attributes that are set in @status. A reading past the failure
+ * limit is also past the warning limit, so it sets both alarms. A fan below
+ * its failure limit is one the firmware counts as failed. A voltage outside
+ * its limits is too low or too high depending on which side of the nominal
+ * voltage it reads.
+ */
+static u32 marvel_env_alarms(enum hwmon_sensor_types type,
+			     const struct marvel_env_chan *c, u8 status)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (status == ENV_FAILURE)
+			return HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
+		if (status == ENV_WARNING)
+			return HWMON_T_MAX_ALARM;
+		break;
+	case hwmon_fan:
+		if (status == ENV_FAILURE)
+			return HWMON_F_MIN_ALARM | HWMON_F_FAULT;
+		if (status == ENV_WARNING)
+			return HWMON_F_MIN_ALARM;
+		break;
+	case hwmon_in:
+		if (c->ps)
+			return status == ENV_FAILURE ? HWMON_I_FAULT : 0;
+		if (status != ENV_WARNING && status != ENV_FAILURE)
+			break;
+		if ((s32)env_rd(c->node, c->pkt + SENSOR_VALUE) <
+		    (s32)env_rd(c->node, c->pkt + SENSOR_NOMINAL)) {
+			if (status == ENV_FAILURE)
+				return HWMON_I_MIN_ALARM | HWMON_I_LCRIT_ALARM;
+			return HWMON_I_MIN_ALARM;
+		}
+		if (status == ENV_FAILURE)
+			return HWMON_I_MAX_ALARM | HWMON_I_CRIT_ALARM;
+		return HWMON_I_MAX_ALARM;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static inline gct6_node *gct_node(gct6_handle h)
+{
+	return GCT_NODE_PTR(h);
+}
+
+/* Cabinet and drawer come from the P&E node's parent. */
+static void marvel_env_keys(struct marvel_env_node *n)
+{
+	gct6_node *parent = n->node->parent ? gct_node(n->node->parent) : NULL;
+
+	n->pe = n->node->id & 0xff;
+	if (!parent)
+		return;
+	if (parent->type == GCT_TYPE_PE && parent->subtype == GCT_SUBTYPE_PE_CABINET)
+		n->cabinet = (parent->id >> 48) & 0xff;
+	else
+		n->cabinet = (parent->id >> 48) & 0x3f;
+	n->drawer = (parent->id >> 32) & 0xff;
+}
+
+static int marvel_env_refresh(struct marvel_env_data *data,
+			      struct marvel_env_node *n)
+{
+	long status;
+
+	if (n->valid &&
+	    time_before(jiffies, n->last_refresh + REFRESH_INTERVAL))
+		return 0;
+
+	status = marvel_cfgtree_partial_update(n->offset);
+	if (status != 1 && status != CFGTREE_STATUS_OK2) {
+		dev_warn_ratelimited(data->dev,
+				     "refresh of GCT node %#lx failed: %ld\n",
+				     n->offset, status);
+		return -EIO;
+	}
+	n->last_refresh = jiffies;
+	n->valid = true;
+	return 0;
+}
+
+/* The hwmon type of a packet, or hwmon_max to skip it. */
+static enum hwmon_sensor_types marvel_env_pkt_type(struct marvel_env_node *n,
+						   unsigned int pkt,
+						   unsigned int type)
+{
+	unsigned int len = env_rd(n, pkt) & 0xffff;
+	u32 kind;
+
+	switch (type) {
+	case ENV_PKT_SENSOR:
+		if (len < SENSOR_SIZE)
+			break;
+		kind = env_rd(n, pkt + SENSOR_KIND);
+		if (kind == SENSOR_KIND_THERMAL)
+			return hwmon_temp;
+		if (kind >= SENSOR_KIND_VOLT_FIRST && kind <= SENSOR_KIND_VOLT_LAST)
+			return hwmon_in;
+		break;
+	case ENV_PKT_FAN:
+		if (len >= FAN_SIZE)
+			return hwmon_fan;
+		break;
+	case ENV_PKT_POWER_SUPPLY:
+		if (len >= PS_SIZE)
+			return hwmon_in;
+		break;
+	}
+	return hwmon_max;
+}
+
+static void marvel_env_add_chan(struct marvel_env_data *data,
+				struct marvel_env_node *n, unsigned int pkt,
+				enum hwmon_sensor_types type, bool ps,
+				unsigned int index)
+{
+	static const char * const names[hwmon_max] = {
+		[hwmon_temp] = "Temp", [hwmon_fan] = "Fan", [hwmon_in] = "Volt",
+	};
+	const char *what = ps ? "PS" : names[type];
+	struct marvel_env_chan *c;
+	const char *pe = NULL;
+	size_t len = 0;
+	u8 status;
+
+	c = &data->chans[type][data->nr_chans[type]++];
+	c->node = n;
+	c->pkt = pkt;
+	c->ps = ps;
+	status = marvel_env_status(type, c);
+	c->present = env_status_valid(status);
+
+	if (data->multi_drawer)
+		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
+				n->cabinet, n->drawer);
+
+	if (n->pe < ARRAY_SIZE(pe_names))
+		pe = pe_names[n->pe];
+	if (pe && !strncasecmp(pe, what, strlen(what)))
+		scnprintf(c->label + len, sizeof(c->label) - len, "%s %u",
+			  pe, index);
+	else if (pe)
+		scnprintf(c->label + len, sizeof(c->label) - len, "%s %s %u",
+			  pe, what, index);
+	else
+		scnprintf(c->label + len, sizeof(c->label) - len, "PE%u %s %u",
+			  n->pe, what, index);
+}
+
+/*
+ * Walk a P&E node's packets, counting them, or adding them when @add. As
+ * Tru64 does, visit count + 1 packets and number sensors from their
+ * position minus one.
+ */
+static void marvel_env_walk(struct marvel_env_data *data,
+			    struct marvel_env_node *n, bool add)
+{
+	unsigned int size = n->node->size;
+	unsigned int hdr = n->node->hd_extension;
+	unsigned int count, pkt, i;
+
+	if (!hdr || hdr + ENV_HDR_SIZE > size)
+		return;
+	count = env_rd(n, hdr + ENV_HDR_COUNT);
+	pkt = env_rd(n, hdr + ENV_HDR_FIRST);
+
+	for (i = 0; i <= count; i++) {
+		enum hwmon_sensor_types type;
+		unsigned int len, pkt_type;
+
+		if (pkt < 8 || pkt + 8 > size)
+			break;
+		len = env_rd(n, pkt) & 0xffff;
+		pkt_type = env_rd(n, pkt + 4) & 0xffff;
+		if (len < 8 || pkt + len > size)
+			break;
+
+		type = marvel_env_pkt_type(n, pkt, pkt_type);
+		if (type != hwmon_max && add &&
+		    data->nr_chans[type] < data->max_chans[type])
+			marvel_env_add_chan(data, n, pkt, type,
+					    pkt_type == ENV_PKT_POWER_SUPPLY,
+					    pkt_type == ENV_PKT_SENSOR && i ?
+					    i - 1 : i);
+		else if (type != hwmon_max && !add)
+			data->nr_chans[type]++;
+		pkt += len;
+	}
+}
+
+/* Collect the P&E nodes with an environmental packet list. */
+static void marvel_env_find_nodes(struct marvel_env_data *data,
+				  gct6_node *node, bool record)
+{
+	for (; node; node = node->next ? gct_node(node->next) : NULL) {
+		if (node->magic != GCT_NODE_MAGIC)
+			return;
+		if (node->type == GCT_TYPE_PE && node->hd_extension &&
+		    (node->flags & GCT_FLAGS_REQUIRED) &&
+		    !(node->flags & GCT_FLAGS_EXCLUDED)) {
+			if (record) {
+				struct marvel_env_node *n;
+
+				if (data->nr_nodes == data->max_nodes)
+					return;
+				n = &data->nodes[data->nr_nodes];
+
+				n->node = node;
+				n->offset = (char *)node - (char *)gct_node(0);
+				marvel_env_keys(n);
+			}
+			data->nr_nodes++;
+		}
+		if (node->child)
+			marvel_env_find_nodes(data, gct_node(node->child),
+					      record);
+	}
+}
+
+static umode_t marvel_env_is_visible(const void *drvdata,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	const struct marvel_env_data *data = drvdata;
+
+	/* Hide sensors that are absent when the driver loads. */
+	return data->chans[type][channel].present ? 0444 : 0;
+}
+
+/* Called with the hwmon device lock held, which serializes refreshes. */
+static int marvel_env_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+	struct marvel_env_chan *c;
+	struct marvel_env_node *n;
+	unsigned int pkt;
+	u8 status;
+	int ret;
+
+	c = &data->chans[type][channel];
+	n = c->node;
+	pkt = c->pkt;
+
+	ret = marvel_env_refresh(data, n);
+	if (ret)
+		return ret;
+	status = marvel_env_status(type, c);
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+			*val = (s32)env_rd(n, pkt + SENSOR_WARN) * 100L;
+			return 0;
+		case hwmon_temp_crit:
+			*val = (s32)env_rd(n, pkt + SENSOR_FAIL) * 100L;
+			return 0;
+		}
+		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_min) {
+			*val = env_rd(n, pkt + FAN_WARN);
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (!env_status_valid(status))
+		return -ENODATA;
+
+	if (marvel_env_alarm_attrs[type] & BIT(attr)) {
+		*val = !!(marvel_env_alarms(type, c, status) & BIT(attr));
+		return 0;
+	}
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr != hwmon_temp_input)
+			break;
+		*val = (s32)env_rd(n, pkt + SENSOR_VALUE) * 100L;
+		return 0;
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			break;
+		*val = env_rd(n, pkt + FAN_VALUE);
+		return 0;
+	case hwmon_in:
+		if (attr != hwmon_in_input)
+			break;
+		*val = (s32)env_rd(n, pkt + SENSOR_VALUE);
+		return 0;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int marvel_env_read_string(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, const char **str)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+
+	*str = data->chans[type][channel].label;
+	return 0;
+}
+
+static const struct hwmon_ops marvel_env_ops = {
+	.is_visible = marvel_env_is_visible,
+	.read = marvel_env_read,
+	.read_string = marvel_env_read_string,
+};
+
+static u32 marvel_env_config(enum hwmon_sensor_types type,
+			     const struct marvel_env_chan *c)
+{
+	switch (type) {
+	case hwmon_temp:
+		return HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+		       HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL;
+	case hwmon_fan:
+		return HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MIN_ALARM |
+		       HWMON_F_FAULT | HWMON_F_LABEL;
+	case hwmon_in:
+		if (c->ps)
+			return HWMON_I_FAULT | HWMON_I_LABEL;
+		return HWMON_I_INPUT | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
+		       HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I_LABEL;
+	default:
+		return 0;
+	}
+}
+
+static int marvel_env_probe(struct platform_device *pdev)
+{
+	u32 *config[hwmon_max] = { };
+	struct device *dev = &pdev->dev;
+	const struct hwmon_channel_info **info;
+	struct marvel_env_data *data;
+	struct hwmon_chip_info *chip;
+	struct device *hwmon;
+	unsigned int i, k, nr_info = 0;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->dev = dev;
+
+	marvel_env_find_nodes(data, gct_node(0), false);
+	if (!data->nr_nodes)
+		return -ENODEV;
+	data->nodes = devm_kcalloc(dev, data->nr_nodes, sizeof(*data->nodes),
+				   GFP_KERNEL);
+	if (!data->nodes)
+		return -ENOMEM;
+	data->max_nodes = data->nr_nodes;
+	data->nr_nodes = 0;
+	marvel_env_find_nodes(data, gct_node(0), true);
+
+	/* Label with cabinet and drawer if any unit is outside 0/0. */
+	for (i = 0; i < data->nr_nodes; i++)
+		if (data->nodes[i].cabinet || data->nodes[i].drawer)
+			data->multi_drawer = true;
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		marvel_env_refresh(data, &data->nodes[i]);
+		marvel_env_walk(data, &data->nodes[i], false);
+	}
+
+	info = devm_kcalloc(dev, ARRAY_SIZE(marvel_env_types) + 1,
+			    sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+		struct hwmon_channel_info *ci;
+
+		if (!data->nr_chans[type])
+			continue;
+		data->chans[type] = devm_kcalloc(dev, data->nr_chans[type],
+						 sizeof(*data->chans[type]),
+						 GFP_KERNEL);
+		ci = devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
+		config[type] = devm_kcalloc(dev, data->nr_chans[type] + 1,
+					    sizeof(*config[type]), GFP_KERNEL);
+		if (!data->chans[type] || !ci || !config[type])
+			return -ENOMEM;
+		ci->type = type;
+		ci->config = config[type];
+		info[nr_info++] = ci;
+		data->max_chans[type] = data->nr_chans[type];
+		data->nr_chans[type] = 0;
+	}
+	if (!nr_info)
+		return -ENODEV;
+
+	for (i = 0; i < data->nr_nodes; i++)
+		marvel_env_walk(data, &data->nodes[i], true);
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++)
+			config[type][i] = marvel_env_config(type,
+							    &data->chans[type][i]);
+	}
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	chip->ops = &marvel_env_ops;
+	chip->info = info;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
+						     NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver marvel_env_driver = {
+	.driver = {
+		.name = DRVNAME,
+	},
+	.probe = marvel_env_probe,
+};
+module_platform_driver(marvel_env_driver);
+
+MODULE_ALIAS("platform:" DRVNAME);
+MODULE_DESCRIPTION("Marvel (EV7) AlphaServer environmental sensors");
+MODULE_LICENSE("GPL");

-- 
2.56.1

