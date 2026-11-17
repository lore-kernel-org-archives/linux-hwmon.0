Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884365;
	b=SyjENaNDnVNN/osmPuZYJ6N4OiLcwI93+biYenquR+q0kGCJpdry7cJRdzGAExmVljkI
	 9oBf9v1kInGRBT2Bii7fWdKVJBUg+X6xuvDVe1t4C5WchMCOITOr5am2ZSs6tVgo9AOn6
	 +kiDdBAaqBI8OTF5PgZFSRqrH+1MTeIZD4ibGZ6T3a54JnjE3MMQ1V3k4Hj+5WLeo2WqT
	 p6CAnD20taP3bz5e0T0wt0AVgwGtNa2JLO2Z9Vy/U526XOZuVoaC34zVCbSa8uSesPKCh
	 Ew/nBR2ZU45sGeylxqkSg1reCwyHOOlOqbScGeNx+tIQCBtcm3KacooeDe6eY6bWJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/d0GAOmI3rr5ZlNJragbA8PtTGft0vvOo6Tfphrs8rM=;
	b=XFbtOQjhLtvbYtW8Gq67kKVXApgAbuPzerEpCXHv7WT+3JBi/yyjwNriLd1lsiVsIc1v
	 VIWqlQd7aWKIrraIKfL1Ina3wd2kHaGPZ8hYGOTebXBPdUhnRZ9kknHknVNy1HjAnfcbN
	 3/AoPwGgWH337KexZLVPoh7+S9RhWhKhLGXBsazT7t88P1sbOdpXuplvevy8NP+HSzbo5
	 fuyyP9Z0NTu3Y6jRb+WaPYLo99pn6OxlaAWJHtAXMaIDCyvzFSz5VR4iHDKi4uDLYwhG7
	 PiE4iG2BZx/fLHMYrABhmQbLPm8pWuhBTgPF6DVcsEuYneOUp/rAzb2cR4D75me2yog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5LApNdf;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D54606A8A2
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D54606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5LApNdf
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4f4095a7aso478607b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884363; x=1795489163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d0GAOmI3rr5ZlNJragbA8PtTGft0vvOo6Tfphrs8rM=;
        b=l5LApNdfU0DcwwREFTFPoBrcz1XcS3ewPM90UrnGzN6hpaUpyTDK6W4qoUY1h51Mqg
         /nDRiPsferdBIptMCPb5FTFoab4Yu9QwboLKOsgBWs8aJZLJdqijDE4zLyf9uVNgfZff
         zVf/Bh9alwcrCTCcPMV2S8rJ2qtnEbTCsISpul6hm7uxyEWjbqK9RbaUJ7DHnpD4jOnd
         TeEnEa9yO8fn13TcD+VAKtL40Lzn3RaAzprLdLpw73VpMfJk/SPqceuRnCnK/gQCdVma
         b+t7RGQBwBAp+quIkfxIFXMavvECaJVIki0J9ypjZWsG97DhnwHbLbvjkiozIUrB8VMD
         MTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884363; x=1795489163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d0GAOmI3rr5ZlNJragbA8PtTGft0vvOo6Tfphrs8rM=;
        b=nvzvNic0dsmE4N32Lfjq5EMBYH/HOsfWsyjcNLqERA/RFU3OiSapCF6LuZn8352vCj
         uEUOXg0cGGap/5lQf5Z9RJZguDAON7NZ8/xf6WactfBdl+L23jdpX6FvuqbUwiLR2tCS
         aEQa3j338go3Jj7leZIfoCMpJa0uE9N2PW0vjbBdfdqwYcxQX5481fsDkUIpqfLDCkW8
         2uCtkeF/CvRBy3jPZ4AtDqhgPBMsIBnF4SOOVndPERYcGIDVVV/aREFHdXsYhmsHr2be
         pBwsBwxaHRTIiQKjoPbjKXl1xkPmGUgDgTgHvrnKYTu+/2/gKTz9O8muSQMhMweZ6scV
         f4yQ==
X-Forwarded-Encrypted: i=1; AL+hErGA59+uNE6t/qykT8tnC6lnyY+u0WDGERwfSnIYq5BPxgkOnLx3rlF/kz6KEtTl9yJvTsN6Oe5el6bh9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jA+ADl6hcDcr1cR21Nm+/aT7KkNJq+MFTfPSq0okcFmDRrIkK
	khM2DlRSkXfGH2ba1wz07SpHPRL+rKybzOfBohxoSwFjHXwc3j4+wH6q
X-Gm-Gg: AZFdTZe9jPg0soa9HS+ioGJ7hA33aAwp4A/2TsEc9vcvnkn6BV+vXnTa5V9Iuo9OWJS
	/AHpp/BkLVwtEbijw1+bOg9YaPIpr88IZ9vW/C9esVL7Q4HMVX8+K8uFeItXRbMWMLIK74ZwNnq
	qKFhJ+ezAhXWU/dghOk3bXsE69gAvgbWXj5vjLMQ65eWQIWxEA9SoY3XN1cnD7IxtT6q/SCXLue
	2/kaAQbcCcOZm1kBcgN1HjFFC5Rr4scIxpr/OcU/wM3oirOOURmZI2PnaxrBpdSPgWpJptSIQqK
	a0XzYO1hBOdmn85JNkmA5iedSuHGLCx9gFpeIkdrhbmPrrAhUVJ3XhTz85R4/n5+WzvmokW4fmT
	8oKfX/I4mCEZYIeU89Lr5SWi2Z3Hd1zR8bIJTB3Lf0kQlyEXlbdlz+YTuy1LyK9XrE6Rfqm6MO+
	okzOObyUTZevodjemlcafibC01mddtnBZY5r8NpmvGzR4Ysj/D8IQEOQ9lEM3efczDOthGZxrxS
	PgMVqc79k7iEHST0q90rJKL+A2trbMlmnbrYKAARpJhyFS7uvwAbc6Om8myl86UlBen+hJE7PyJ
	r2h4Jc+vDON6LWvR8tnotvYUteT++jRLsl+o45hJpFPM1JlyXgTV234uWUEeK/AlAdN+Cqk37M0
	crEcjO5+/vY2XArceRU0laqKO0ViWSNC+ziX0up6OI/b7wHqyiyXtT/3qYd7ns0EZgZVvVBX3qQ
	lpCnor18VrEhYMZH+jpg==
X-Received: by 2002:a05:690c:6e86:b0:8b3:47fd:a020 with SMTP id 00721157ae682-8b4aa3101eemr79929947b3.35.1794884363213;
        Mon, 16 Nov 2026 18:59:23 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f1406sm14609047b3.6.2026.11.16.18.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:21 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:13 -0500
Subject: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
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
Message-Id: <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=26748; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Y2v2A8L7mwzx5TwV2s212WtXu/ZES+doTmufuvGgc+4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/pzKO23kOmVh5eenDoaHcC3Vdlms+hahU963Jbm7
 fWXv3I/6/jIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhr6s4wMiw7wmF6ld
 Np0lcN9ezrvxl673w4UaS0VD3bpmvVqlTh/TEMv9mbRK4H79cz3sPNeGJji/4Z6WdG14+kRpbua
 vsslZG0ggsA
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
up to 300 ms per node, so refresh a node at most once per
update_interval. The hwmon core serializes the callbacks, which also
serializes the refreshes.

The console callback lives in core_marvel.o, which generic kernels
built with ALPHA_LEGACY_START_ADDRESS leave out.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Documentation/hwmon/index.rst      |   1 +
 Documentation/hwmon/marvel-env.rst |  72 +++++
 MAINTAINERS                        |   8 +
 arch/alpha/include/asm/gct.h       |   2 +
 drivers/hwmon/Kconfig              |  11 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/marvel-env.c         | 609 +++++++++++++++++++++++++++++++++++++
 7 files changed, 704 insertions(+)

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
index 000000000000..7e0457a60094
--- /dev/null
+++ b/Documentation/hwmon/marvel-env.rst
@@ -0,0 +1,72 @@
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
+unit. On systems with more than one drawer the label starts with the
+cabinet and drawer numbers.
+
+A refresh keeps the boot CPU in the console with interrupts disabled for up
+to 300 ms per unit, so a unit is refreshed at most once every
+``update_interval`` milliseconds (10000 by default).
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
+``update_interval``         Minimum time between refreshes of a unit, in ms
+
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
index 000000000000..e501e049d702
--- /dev/null
+++ b/drivers/hwmon/marvel-env.c
@@ -0,0 +1,609 @@
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
+	unsigned int update_interval;	/* ms */
+	struct marvel_env_node *nodes;
+	unsigned int nr_nodes;
+	struct marvel_env_chan *chans[hwmon_max];
+	unsigned int nr_chans[hwmon_max];
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
+	if (n->valid && time_before(jiffies, n->last_refresh +
+				    msecs_to_jiffies(data->update_interval)))
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
+	if (n->cabinet || n->drawer)
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
+		if (type != hwmon_max && add)
+			marvel_env_add_chan(data, n, pkt, type,
+					    pkt_type == ENV_PKT_POWER_SUPPLY,
+					    pkt_type == ENV_PKT_SENSOR && i ?
+					    i - 1 : i);
+		else if (type != hwmon_max)
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
+				struct marvel_env_node *n =
+					&data->nodes[data->nr_nodes];
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
+	if (type == hwmon_chip)
+		return 0644;
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
+	if (type == hwmon_chip) {
+		*val = data->update_interval;
+		return 0;
+	}
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
+static int marvel_env_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_chip || attr != hwmon_chip_update_interval)
+		return -EOPNOTSUPP;
+
+	data->update_interval = clamp_val(val, 0, 3600 * MSEC_PER_SEC);
+	return 0;
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
+	.write = marvel_env_write,
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
+static const struct hwmon_channel_info * const marvel_env_chip_info =
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
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
+	data->update_interval = 10 * MSEC_PER_SEC;
+
+	marvel_env_find_nodes(data, gct_node(0), false);
+	if (!data->nr_nodes)
+		return -ENODEV;
+	data->nodes = devm_kcalloc(dev, data->nr_nodes, sizeof(*data->nodes),
+				   GFP_KERNEL);
+	if (!data->nodes)
+		return -ENOMEM;
+	data->nr_nodes = 0;
+	marvel_env_find_nodes(data, gct_node(0), true);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		marvel_env_refresh(data, &data->nodes[i]);
+		marvel_env_walk(data, &data->nodes[i], false);
+	}
+
+	info = devm_kcalloc(dev, ARRAY_SIZE(marvel_env_types) + 2,
+			    sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+	info[nr_info++] = marvel_env_chip_info;
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
+		data->nr_chans[type] = 0;
+	}
+	if (nr_info == 1)
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

