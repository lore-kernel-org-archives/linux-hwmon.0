Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267943AA9
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jul 2024 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720805755; cv=none; b=QaiyBmgs59an7JTw49s4gQkX2dpOFZwKorrPyaTxS6fks67dwsmGYIy+pQLDWRd+qDahc08iqzmEtJkEA58X8ckoGy8FCBxTx/JNDXDxliGB2QnMVx6y+4Cb92Bjqo4auioM6Z3n4O5keNeEhL3BrA2ou1PQI0VrhAc2HtLmpWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720805755; c=relaxed/simple;
	bh=GtA1fWs/2fPfykKda7ZWRApC0EEiPKXwbWYe2ZtAbSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIF4/N/37cp8yRiaTuugPUTLXvvvj9yNqyAN7Lyx+pRcUT/35HxsTahO2i20sPWSt+BqS1QfP/EYAV6K4mJmy4DU1a72pLruTh2lL8SAgeqaWeomG+KClLsxa57q7ZA5/gfYymHDVqsDOX5Jh/IGAmcK/Wh7GExLp7vknAXOEN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjVOAXbG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjVOAXbG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-706a1711ee5so1843011b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jul 2024 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720805752; x=1721410552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8jvZVYaHrwkH7jukx/9PpbOdIlHCjC8kvHNBPAe58=;
        b=WjVOAXbG1xIIp0eNZAfPCAJO2cSbnV1eyOCwRXm6w6iR7xu5fd/aBPE1b/k4PPXee3
         1rKQZjBmlHWI0S1axoHXwJMXKWt+Oy87BQ6E0RJgnTfam0gDcGo1F/eLuKV7W+XStw24
         k7camKqQIJeseCxAs8yCY7kxCA/k/NNGHr0NI+a3aLUHBdDegc7PnJfRo6vIy7zNv3UO
         DwPhfZk9a8UZv0ncseRRN599yroZbZ459G4MiuT8or/CCYm+nR2QYDbgPTtDixGjmVqz
         MWMgmQGK2gZCZvu0rtDk+ul1dk2TvffEj7XLSlBIQvYvVkMYK08aHAMPh4DozRYKWXC3
         15/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720805752; x=1721410552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU8jvZVYaHrwkH7jukx/9PpbOdIlHCjC8kvHNBPAe58=;
        b=hbDVIzW1wzFmuu9LLEmsy7qbDaGmg2BWbSDRZBs+oBA7sIUxGkBaBNUf9YctmRqd1r
         QVjqoQQuLmBAAWeveltl3W+QHzGuH7bj4BMvst0G+x7aUWa9gynLntrbQhz5T8rjT/PU
         l9toWz8E347MTRivgToCU1RJrxvn8HHIF1SbFYLfM7q1kq1/L+CpcuM3TRziYeTKdueP
         Vue8rPqMsOeX0euYJRgJaoG+KL5pPwZ5jSgSwdI2M27CMSCQkjF247Sx+E7vRKLonW4w
         N5JoLzyJdmHGbhCsQN/ZfEQotSzQFYJh9yQOLd4Jx0TGUyoYeK+AIEP0/nD3XGGByG/p
         LuuA==
X-Gm-Message-State: AOJu0YwYztY1EFw0JtEDztp4UXTOzzTfkoTbWQ6A0ZEA5BUQqvDDU0yh
	aUhsLYzyAtHcQAxgKNfyHCPMEzRo/c2BPMBZmxGYIwrrzG2ya+5HSPrklQ==
X-Google-Smtp-Source: AGHT+IFPt8lBuI3A3h/314Vlgv3zX33StI3JMueAyMsHI4DgDv6bknG3AoBdtE9u9ONtKaMK932n8Q==
X-Received: by 2002:a05:6a20:2588:b0:1c0:f7a4:2c39 with SMTP id adf61e73a8af0-1c2984e3693mr13810752637.56.1720805751636;
        Fri, 12 Jul 2024 10:35:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439e3a45sm7762723b3a.186.2024.07.12.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 10:35:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Remove obsolete adm1021 and max6642 drivers
Date: Fri, 12 Jul 2024 10:35:48 -0700
Message-Id: <20240712173548.3556699-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADM1021, MAX6642, and compatible chips are supported by the lm90 driver.
Remove the obsolete stand-alone drivers to reduce maintenance overhead.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/adm1021.rst | 153 ----------
 Documentation/hwmon/index.rst   |   2 -
 Documentation/hwmon/max6642.rst |  27 --
 drivers/hwmon/Kconfig           |  24 --
 drivers/hwmon/Makefile          |   2 -
 drivers/hwmon/adm1021.c         | 505 --------------------------------
 drivers/hwmon/max6642.c         | 314 --------------------
 7 files changed, 1027 deletions(-)
 delete mode 100644 Documentation/hwmon/adm1021.rst
 delete mode 100644 Documentation/hwmon/max6642.rst
 delete mode 100644 drivers/hwmon/adm1021.c
 delete mode 100644 drivers/hwmon/max6642.c

diff --git a/Documentation/hwmon/adm1021.rst b/Documentation/hwmon/adm1021.rst
deleted file mode 100644
index 116fb2019956..000000000000
--- a/Documentation/hwmon/adm1021.rst
+++ /dev/null
@@ -1,153 +0,0 @@
-Kernel driver adm1021
-=====================
-
-Supported chips:
-
-  * Analog Devices ADM1021
-
-    Prefix: 'adm1021'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Analog Devices website
-
-  * Analog Devices ADM1021A/ADM1023
-
-    Prefix: 'adm1023'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Analog Devices website
-
-  * Genesys Logic GL523SM
-
-    Prefix: 'gl523sm'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet:
-
-  * Maxim MAX1617
-
-    Prefix: 'max1617'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Maxim website
-
-  * Maxim MAX1617A
-
-    Prefix: 'max1617a'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Maxim website
-
-  * National Semiconductor LM84
-
-    Prefix: 'lm84'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the National Semiconductor website
-
-  * Philips NE1617
-
-    Prefix: 'max1617' (probably detected as a max1617)
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Philips website
-
-  * Philips NE1617A
-
-    Prefix: 'max1617' (probably detected as a max1617)
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Philips website
-
-  * TI THMC10
-
-    Prefix: 'thmc10'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the TI website
-
-  * Onsemi MC1066
-
-    Prefix: 'mc1066'
-
-    Addresses scanned: I2C 0x18 - 0x1a, 0x29 - 0x2b, 0x4c - 0x4e
-
-    Datasheet: Publicly available at the Onsemi website
-
-
-Authors:
-	- Frodo Looijaard <frodol@dds.nl>,
-	- Philip Edelbrock <phil@netroedge.com>
-
-Module Parameters
------------------
-
-* read_only: int
-  Don't set any values, read only mode
-
-
-Description
------------
-
-The chips supported by this driver are very similar. The Maxim MAX1617 is
-the oldest; it has the problem that it is not very well detectable. The
-MAX1617A solves that. The ADM1021 is a straight clone of the MAX1617A.
-Ditto for the THMC10. From here on, we will refer to all these chips as
-ADM1021-clones.
-
-The ADM1021 and MAX1617A reports a die code, which is a sort of revision
-code. This can help us pinpoint problems; it is not very useful
-otherwise.
-
-ADM1021-clones implement two temperature sensors. One of them is internal,
-and measures the temperature of the chip itself; the other is external and
-is realised in the form of a transistor-like device. A special alarm
-indicates whether the remote sensor is connected.
-
-Each sensor has its own low and high limits. When they are crossed, the
-corresponding alarm is set and remains on as long as the temperature stays
-out of range. Temperatures are measured in degrees Celsius. Measurements
-are possible between -65 and +127 degrees, with a resolution of one degree.
-
-If an alarm triggers, it will remain triggered until the hardware register
-is read at least once. This means that the cause for the alarm may already
-have disappeared!
-
-This driver only updates its values each 1.5 seconds; reading it more often
-will do no harm, but will return 'old' values. It is possible to make
-ADM1021-clones do faster measurements, but there is really no good reason
-for that.
-
-
-Netburst-based Xeon support
----------------------------
-
-Some Xeon processors based on the Netburst (early Pentium 4, from 2001 to
-2003) microarchitecture had real MAX1617, ADM1021, or compatible chips
-within them, with two temperature sensors. Other Xeon processors of this
-era (with 400 MHz FSB) had chips with only one temperature sensor.
-
-If you have such an old Xeon, and you get two valid temperatures when
-loading the adm1021 module, then things are good.
-
-If nothing happens when loading the adm1021 module, and you are certain
-that your specific Xeon processor model includes compatible sensors, you
-will have to explicitly instantiate the sensor chips from user-space. See
-method 4 in Documentation/i2c/instantiating-devices.rst. Possible slave
-addresses are 0x18, 0x1a, 0x29, 0x2b, 0x4c, or 0x4e. It is likely that
-only temp2 will be correct and temp1 will have to be ignored.
-
-Previous generations of the Xeon processor (based on Pentium II/III)
-didn't have these sensors. Next generations of Xeon processors (533 MHz
-FSB and faster) lost them, until the Core-based generation which
-introduced integrated digital thermal sensors. These are supported by
-the coretemp driver.
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 03d313af469a..6fcfb74d74c8 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -25,7 +25,6 @@ Hardware Monitoring Kernel Drivers
    acpi_power_meter
    ad7314
    adc128d818
-   adm1021
    adm1025
    adm1026
    adm1031
@@ -154,7 +153,6 @@ Hardware Monitoring Kernel Drivers
    max34440
    max6620
    max6639
-   max6642
    max6650
    max6697
    max8688
diff --git a/Documentation/hwmon/max6642.rst b/Documentation/hwmon/max6642.rst
deleted file mode 100644
index 7e5b7d4f9492..000000000000
--- a/Documentation/hwmon/max6642.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-Kernel driver max6642
-=====================
-
-Supported chips:
-
-  * Maxim MAX6642
-
-    Prefix: 'max6642'
-
-    Addresses scanned: I2C 0x48-0x4f
-
-    Datasheet: Publicly available at the Maxim website
-
-	       http://datasheets.maxim-ic.com/en/ds/MAX6642.pdf
-
-Authors:
-
-	Per Dalen <per.dalen@appeartv.com>
-
-Description
------------
-
-The MAX6642 is a digital temperature sensor. It senses its own temperature as
-well as the temperature on one external diode.
-
-All temperature values are given in degrees Celsius. Resolution
-is 0.25 degree for the local temperature and for the remote temperature.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e14ae18a973b..1e5d98b05490 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -105,18 +105,6 @@ config SENSORS_AD7418
 	  This driver can also be built as a module. If so, the module
 	  will be called ad7418.
 
-config SENSORS_ADM1021
-	tristate "Analog Devices ADM1021 and compatibles"
-	depends on I2C
-	depends on SENSORS_LM90=n
-	help
-	  If you say yes here you get support for Analog Devices ADM1021
-	  and ADM1023 sensor chips and clones: Maxim MAX1617 and MAX1617A,
-	  Genesys Logic GL523SM, National Semiconductor LM84 and TI THMC10.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called adm1021.
-
 config SENSORS_ADM1025
 	tristate "Analog Devices ADM1025 and compatibles"
 	depends on I2C
@@ -1241,18 +1229,6 @@ config SENSORS_MAX6639
 	  This driver can also be built as a module. If so, the module
 	  will be called max6639.
 
-config SENSORS_MAX6642
-	tristate "Maxim MAX6642 sensor chip"
-	depends on I2C
-	depends on SENSORS_LM90=n
-	help
-	  If you say yes here you get support for MAX6642 sensor chip.
-	  MAX6642 is a SMBus-Compatible Remote/Local Temperature Sensor
-	  with Overtemperature Alarm from Maxim.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called max6642.
-
 config SENSORS_MAX6650
 	tristate "Maxim MAX6650 sensor chip"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e3f25475d1f0..da00df92503e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -31,7 +31,6 @@ obj-$(CONFIG_SENSORS_AD7414)	+= ad7414.o
 obj-$(CONFIG_SENSORS_AD7418)	+= ad7418.o
 obj-$(CONFIG_SENSORS_ADC128D818) += adc128d818.o
 obj-$(CONFIG_SENSORS_ADCXX)	+= adcxx.o
-obj-$(CONFIG_SENSORS_ADM1021)	+= adm1021.o
 obj-$(CONFIG_SENSORS_ADM1025)	+= adm1025.o
 obj-$(CONFIG_SENSORS_ADM1026)	+= adm1026.o
 obj-$(CONFIG_SENSORS_ADM1029)	+= adm1029.o
@@ -154,7 +153,6 @@ obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
 obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
 obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
 obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
-obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
 obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
 obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
 obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
deleted file mode 100644
index 7c15398ebb37..000000000000
--- a/drivers/hwmon/adm1021.c
+++ /dev/null
@@ -1,505 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * adm1021.c - Part of lm_sensors, Linux kernel modules for hardware
- *	       monitoring
- * Copyright (c) 1998, 1999  Frodo Looijaard <frodol@dds.nl> and
- *			     Philip Edelbrock <phil@netroedge.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-#include <linux/i2c.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
-#include <linux/mutex.h>
-
-
-/* Addresses to scan */
-static const unsigned short normal_i2c[] = {
-	0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, 0x4d, 0x4e, I2C_CLIENT_END };
-
-enum chips {
-	adm1021, adm1023, max1617, max1617a, thmc10, lm84, gl523sm, mc1066 };
-
-/* adm1021 constants specified below */
-
-/* The adm1021 registers */
-/* Read-only */
-/* For nr in 0-1 */
-#define ADM1021_REG_TEMP(nr)		(nr)
-#define ADM1021_REG_STATUS		0x02
-/* 0x41 = AD, 0x49 = TI, 0x4D = Maxim, 0x23 = Genesys , 0x54 = Onsemi */
-#define ADM1021_REG_MAN_ID		0xFE
-/* ADM1021 = 0x0X, ADM1023 = 0x3X */
-#define ADM1021_REG_DEV_ID		0xFF
-/* These use different addresses for reading/writing */
-#define ADM1021_REG_CONFIG_R		0x03
-#define ADM1021_REG_CONFIG_W		0x09
-#define ADM1021_REG_CONV_RATE_R		0x04
-#define ADM1021_REG_CONV_RATE_W		0x0A
-/* These are for the ADM1023's additional precision on the remote temp sensor */
-#define ADM1023_REG_REM_TEMP_PREC	0x10
-#define ADM1023_REG_REM_OFFSET		0x11
-#define ADM1023_REG_REM_OFFSET_PREC	0x12
-#define ADM1023_REG_REM_TOS_PREC	0x13
-#define ADM1023_REG_REM_THYST_PREC	0x14
-/* limits */
-/* For nr in 0-1 */
-#define ADM1021_REG_TOS_R(nr)		(0x05 + 2 * (nr))
-#define ADM1021_REG_TOS_W(nr)		(0x0B + 2 * (nr))
-#define ADM1021_REG_THYST_R(nr)		(0x06 + 2 * (nr))
-#define ADM1021_REG_THYST_W(nr)		(0x0C + 2 * (nr))
-/* write-only */
-#define ADM1021_REG_ONESHOT		0x0F
-
-/* Initial values */
-
-/*
- * Note: Even though I left the low and high limits named os and hyst,
- * they don't quite work like a thermostat the way the LM75 does.  I.e.,
- * a lower temp than THYST actually triggers an alarm instead of
- * clearing it.  Weird, ey?   --Phil
- */
-
-/* Each client has this additional data */
-struct adm1021_data {
-	struct i2c_client *client;
-	enum chips type;
-
-	const struct attribute_group *groups[3];
-
-	struct mutex update_lock;
-	bool valid;		/* true if following fields are valid */
-	char low_power;		/* !=0 if device in low power mode */
-	unsigned long last_updated;	/* In jiffies */
-
-	int temp_max[2];		/* Register values */
-	int temp_min[2];
-	int temp[2];
-	u8 alarms;
-	/* Special values for ADM1023 only */
-	u8 remote_temp_offset;
-	u8 remote_temp_offset_prec;
-};
-
-/* (amalysh) read only mode, otherwise any limit's writing confuse BIOS */
-static bool read_only;
-
-static struct adm1021_data *adm1021_update_device(struct device *dev)
-{
-	struct adm1021_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-		int i;
-
-		dev_dbg(dev, "Starting adm1021 update\n");
-
-		for (i = 0; i < 2; i++) {
-			data->temp[i] = 1000 *
-				(s8) i2c_smbus_read_byte_data(
-					client, ADM1021_REG_TEMP(i));
-			data->temp_max[i] = 1000 *
-				(s8) i2c_smbus_read_byte_data(
-					client, ADM1021_REG_TOS_R(i));
-			if (data->type != lm84) {
-				data->temp_min[i] = 1000 *
-				  (s8) i2c_smbus_read_byte_data(client,
-							ADM1021_REG_THYST_R(i));
-			}
-		}
-		data->alarms = i2c_smbus_read_byte_data(client,
-						ADM1021_REG_STATUS) & 0x7c;
-		if (data->type == adm1023) {
-			/*
-			 * The ADM1023 provides 3 extra bits of precision for
-			 * the remote sensor in extra registers.
-			 */
-			data->temp[1] += 125 * (i2c_smbus_read_byte_data(
-				client, ADM1023_REG_REM_TEMP_PREC) >> 5);
-			data->temp_max[1] += 125 * (i2c_smbus_read_byte_data(
-				client, ADM1023_REG_REM_TOS_PREC) >> 5);
-			data->temp_min[1] += 125 * (i2c_smbus_read_byte_data(
-				client, ADM1023_REG_REM_THYST_PREC) >> 5);
-			data->remote_temp_offset =
-				i2c_smbus_read_byte_data(client,
-						ADM1023_REG_REM_OFFSET);
-			data->remote_temp_offset_prec =
-				i2c_smbus_read_byte_data(client,
-						ADM1023_REG_REM_OFFSET_PREC);
-		}
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
-
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct adm1021_data *data = adm1021_update_device(dev);
-
-	return sprintf(buf, "%d\n", data->temp[index]);
-}
-
-static ssize_t temp_max_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct adm1021_data *data = adm1021_update_device(dev);
-
-	return sprintf(buf, "%d\n", data->temp_max[index]);
-}
-
-static ssize_t temp_min_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct adm1021_data *data = adm1021_update_device(dev);
-
-	return sprintf(buf, "%d\n", data->temp_min[index]);
-}
-
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	int index = to_sensor_dev_attr(attr)->index;
-	struct adm1021_data *data = adm1021_update_device(dev);
-	return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
-}
-
-static ssize_t alarms_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buf)
-{
-	struct adm1021_data *data = adm1021_update_device(dev);
-	return sprintf(buf, "%u\n", data->alarms);
-}
-
-static ssize_t temp_max_store(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct adm1021_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	long temp;
-	int reg_val, err;
-
-	err = kstrtol(buf, 10, &temp);
-	if (err)
-		return err;
-	temp /= 1000;
-
-	mutex_lock(&data->update_lock);
-	reg_val = clamp_val(temp, -128, 127);
-	data->temp_max[index] = reg_val * 1000;
-	if (!read_only)
-		i2c_smbus_write_byte_data(client, ADM1021_REG_TOS_W(index),
-					  reg_val);
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-static ssize_t temp_min_store(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct adm1021_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	long temp;
-	int reg_val, err;
-
-	err = kstrtol(buf, 10, &temp);
-	if (err)
-		return err;
-	temp /= 1000;
-
-	mutex_lock(&data->update_lock);
-	reg_val = clamp_val(temp, -128, 127);
-	data->temp_min[index] = reg_val * 1000;
-	if (!read_only)
-		i2c_smbus_write_byte_data(client, ADM1021_REG_THYST_W(index),
-					  reg_val);
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-static ssize_t low_power_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct adm1021_data *data = adm1021_update_device(dev);
-	return sprintf(buf, "%d\n", data->low_power);
-}
-
-static ssize_t low_power_store(struct device *dev,
-			       struct device_attribute *devattr,
-			       const char *buf, size_t count)
-{
-	struct adm1021_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	char low_power;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-	low_power = val != 0;
-
-	mutex_lock(&data->update_lock);
-	if (low_power != data->low_power) {
-		int config = i2c_smbus_read_byte_data(
-			client, ADM1021_REG_CONFIG_R);
-		data->low_power = low_power;
-		i2c_smbus_write_byte_data(client, ADM1021_REG_CONFIG_W,
-			(config & 0xBF) | (low_power << 6));
-	}
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
-static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 5);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
-static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
-
-static DEVICE_ATTR_RO(alarms);
-static DEVICE_ATTR_RW(low_power);
-
-static struct attribute *adm1021_attributes[] = {
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&dev_attr_alarms.attr,
-	&dev_attr_low_power.attr,
-	NULL
-};
-
-static const struct attribute_group adm1021_group = {
-	.attrs = adm1021_attributes,
-};
-
-static struct attribute *adm1021_min_attributes[] = {
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group adm1021_min_group = {
-	.attrs = adm1021_min_attributes,
-};
-
-/* Return 0 if detection is successful, -ENODEV otherwise */
-static int adm1021_detect(struct i2c_client *client,
-			  struct i2c_board_info *info)
-{
-	struct i2c_adapter *adapter = client->adapter;
-	const char *type_name;
-	int reg, conv_rate, status, config, man_id, dev_id;
-
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
-		pr_debug("detect failed, smbus byte data not supported!\n");
-		return -ENODEV;
-	}
-
-	status = i2c_smbus_read_byte_data(client, ADM1021_REG_STATUS);
-	conv_rate = i2c_smbus_read_byte_data(client,
-					     ADM1021_REG_CONV_RATE_R);
-	config = i2c_smbus_read_byte_data(client, ADM1021_REG_CONFIG_R);
-
-	/* Check unused bits */
-	if ((status & 0x03) || (config & 0x3F) || (conv_rate & 0xF8)) {
-		pr_debug("detect failed, chip not detected!\n");
-		return -ENODEV;
-	}
-
-	/* Determine the chip type. */
-	man_id = i2c_smbus_read_byte_data(client, ADM1021_REG_MAN_ID);
-	dev_id = i2c_smbus_read_byte_data(client, ADM1021_REG_DEV_ID);
-
-	if (man_id < 0 || dev_id < 0)
-		return -ENODEV;
-
-	if (man_id == 0x4d && dev_id == 0x01) {
-		/*
-		 * dev_id 0x01 matches MAX6680, MAX6695, MAX6696, and possibly
-		 * others. Read register which is unsupported on MAX1617 but
-		 * exists on all those chips and compare with the dev_id
-		 * register. If it matches, it may be a MAX1617A.
-		 */
-		reg = i2c_smbus_read_byte_data(client,
-					       ADM1023_REG_REM_TEMP_PREC);
-		if (reg != dev_id)
-			return -ENODEV;
-		type_name = "max1617a";
-	} else if (man_id == 0x41) {
-		if ((dev_id & 0xF0) == 0x30)
-			type_name = "adm1023";
-		else if ((dev_id & 0xF0) == 0x00)
-			type_name = "adm1021";
-		else
-			return -ENODEV;
-	} else if (man_id == 0x49)
-		type_name = "thmc10";
-	else if (man_id == 0x23)
-		type_name = "gl523sm";
-	else if (man_id == 0x54)
-		type_name = "mc1066";
-	else {
-		int lte, rte, lhi, rhi, llo, rlo;
-
-		/* extra checks for LM84 and MAX1617 to avoid misdetections */
-
-		llo = i2c_smbus_read_byte_data(client, ADM1021_REG_THYST_R(0));
-		rlo = i2c_smbus_read_byte_data(client, ADM1021_REG_THYST_R(1));
-
-		/* fail if any of the additional register reads failed */
-		if (llo < 0 || rlo < 0)
-			return -ENODEV;
-
-		lte = i2c_smbus_read_byte_data(client, ADM1021_REG_TEMP(0));
-		rte = i2c_smbus_read_byte_data(client, ADM1021_REG_TEMP(1));
-		lhi = i2c_smbus_read_byte_data(client, ADM1021_REG_TOS_R(0));
-		rhi = i2c_smbus_read_byte_data(client, ADM1021_REG_TOS_R(1));
-
-		/*
-		 * Fail for negative temperatures and negative high limits.
-		 * This check also catches read errors on the tested registers.
-		 */
-		if ((s8)lte < 0 || (s8)rte < 0 || (s8)lhi < 0 || (s8)rhi < 0)
-			return -ENODEV;
-
-		/* fail if all registers hold the same value */
-		if (lte == rte && lte == lhi && lte == rhi && lte == llo
-		    && lte == rlo)
-			return -ENODEV;
-
-		/*
-		 * LM84 Mfr ID is in a different place,
-		 * and it has more unused bits. Registers at 0xfe and 0xff
-		 * are undefined and return the most recently read value,
-		 * here the value of the configuration register.
-		 */
-		if (conv_rate == 0x00
-		    && man_id == config && dev_id == config
-		    && (config & 0x7F) == 0x00
-		    && (status & 0xAB) == 0x00) {
-			type_name = "lm84";
-		} else {
-			if ((config & 0x3f) || (status & 0x03))
-				return -ENODEV;
-			/* fail if low limits are larger than high limits */
-			if ((s8)llo > lhi || (s8)rlo > rhi)
-				return -ENODEV;
-			type_name = "max1617";
-		}
-	}
-
-	pr_debug("Detected chip %s at adapter %d, address 0x%02x.\n",
-		 type_name, i2c_adapter_id(adapter), client->addr);
-	strscpy(info->type, type_name, I2C_NAME_SIZE);
-
-	return 0;
-}
-
-static void adm1021_init_client(struct i2c_client *client)
-{
-	/* Enable ADC and disable suspend mode */
-	i2c_smbus_write_byte_data(client, ADM1021_REG_CONFIG_W,
-		i2c_smbus_read_byte_data(client, ADM1021_REG_CONFIG_R) & 0xBF);
-	/* Set Conversion rate to 1/sec (this can be tinkered with) */
-	i2c_smbus_write_byte_data(client, ADM1021_REG_CONV_RATE_W, 0x04);
-}
-
-static const struct i2c_device_id adm1021_id[];
-
-static int adm1021_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct adm1021_data *data;
-	struct device *hwmon_dev;
-
-	data = devm_kzalloc(dev, sizeof(struct adm1021_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->client = client;
-	data->type = i2c_match_id(adm1021_id, client)->driver_data;
-	mutex_init(&data->update_lock);
-
-	/* Initialize the ADM1021 chip */
-	if (data->type != lm84 && !read_only)
-		adm1021_init_client(client);
-
-	data->groups[0] = &adm1021_group;
-	if (data->type != lm84)
-		data->groups[1] = &adm1021_min_group;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
-
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static const struct i2c_device_id adm1021_id[] = {
-	{ "adm1021", adm1021 },
-	{ "adm1023", adm1023 },
-	{ "max1617", max1617 },
-	{ "max1617a", max1617a },
-	{ "thmc10", thmc10 },
-	{ "lm84", lm84 },
-	{ "gl523sm", gl523sm },
-	{ "mc1066", mc1066 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, adm1021_id);
-
-static struct i2c_driver adm1021_driver = {
-	.class		= I2C_CLASS_HWMON,
-	.driver = {
-		.name	= "adm1021",
-	},
-	.probe		= adm1021_probe,
-	.id_table	= adm1021_id,
-	.detect		= adm1021_detect,
-	.address_list	= normal_i2c,
-};
-
-module_i2c_driver(adm1021_driver);
-
-MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl> and "
-		"Philip Edelbrock <phil@netroedge.com>");
-MODULE_DESCRIPTION("adm1021 driver");
-MODULE_LICENSE("GPL");
-
-module_param(read_only, bool, 0);
-MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
diff --git a/drivers/hwmon/max6642.c b/drivers/hwmon/max6642.c
deleted file mode 100644
index 9302ab233910..000000000000
--- a/drivers/hwmon/max6642.c
+++ /dev/null
@@ -1,314 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Driver for +/-1 degree C, SMBus-Compatible Remote/Local Temperature Sensor
- * with Overtemperature Alarm
- *
- * Copyright (C) 2011 AppearTV AS
- *
- * Derived from:
- *
- *  Based on the max1619 driver.
- *  Copyright (C) 2003-2004 Oleksij Rempel <bug-track@fisher-privat.net>
- *                          Jean Delvare <jdelvare@suse.de>
- *
- * The MAX6642 is a sensor chip made by Maxim.
- * It reports up to two temperatures (its own plus up to
- * one external one). Complete datasheet can be
- * obtained from Maxim's website at:
- *   http://datasheets.maxim-ic.com/en/ds/MAX6642.pdf
- */
-
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-#include <linux/i2c.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
-#include <linux/mutex.h>
-#include <linux/sysfs.h>
-
-static const unsigned short normal_i2c[] = {
-	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
-
-/*
- * The MAX6642 registers
- */
-
-#define MAX6642_REG_R_MAN_ID		0xFE
-#define MAX6642_REG_R_CONFIG		0x03
-#define MAX6642_REG_W_CONFIG		0x09
-#define MAX6642_REG_R_STATUS		0x02
-#define MAX6642_REG_R_LOCAL_TEMP	0x00
-#define MAX6642_REG_R_LOCAL_TEMPL	0x11
-#define MAX6642_REG_R_LOCAL_HIGH	0x05
-#define MAX6642_REG_W_LOCAL_HIGH	0x0B
-#define MAX6642_REG_R_REMOTE_TEMP	0x01
-#define MAX6642_REG_R_REMOTE_TEMPL	0x10
-#define MAX6642_REG_R_REMOTE_HIGH	0x07
-#define MAX6642_REG_W_REMOTE_HIGH	0x0D
-
-/*
- * Conversions
- */
-
-static int temp_from_reg10(int val)
-{
-	return val * 250;
-}
-
-static int temp_from_reg(int val)
-{
-	return val * 1000;
-}
-
-static int temp_to_reg(int val)
-{
-	return val / 1000;
-}
-
-/*
- * Client data (each client gets its own)
- */
-
-struct max6642_data {
-	struct i2c_client *client;
-	struct mutex update_lock;
-	bool valid; /* zero until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
-
-	/* registers values */
-	u16 temp_input[2]; /* local/remote */
-	u16 temp_high[2]; /* local/remote */
-	u8 alarms;
-};
-
-/*
- * Real code
- */
-
-static void max6642_init_client(struct max6642_data *data,
-				struct i2c_client *client)
-{
-	u8 config;
-
-	/*
-	 * Start the conversions.
-	 */
-	config = i2c_smbus_read_byte_data(client, MAX6642_REG_R_CONFIG);
-	if (config & 0x40)
-		i2c_smbus_write_byte_data(client, MAX6642_REG_W_CONFIG,
-					  config & 0xBF); /* run */
-
-	data->temp_high[0] = i2c_smbus_read_byte_data(client,
-				MAX6642_REG_R_LOCAL_HIGH);
-	data->temp_high[1] = i2c_smbus_read_byte_data(client,
-				MAX6642_REG_R_REMOTE_HIGH);
-}
-
-/* Return 0 if detection is successful, -ENODEV otherwise */
-static int max6642_detect(struct i2c_client *client,
-			  struct i2c_board_info *info)
-{
-	struct i2c_adapter *adapter = client->adapter;
-	u8 reg_config, reg_status, man_id;
-
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
-		return -ENODEV;
-
-	/* identification */
-	man_id = i2c_smbus_read_byte_data(client, MAX6642_REG_R_MAN_ID);
-	if (man_id != 0x4D)
-		return -ENODEV;
-
-	/* sanity check */
-	if (i2c_smbus_read_byte_data(client, 0x04) != 0x4D
-	    || i2c_smbus_read_byte_data(client, 0x06) != 0x4D
-	    || i2c_smbus_read_byte_data(client, 0xff) != 0x4D)
-		return -ENODEV;
-
-	/*
-	 * We read the config and status register, the 4 lower bits in the
-	 * config register should be zero and bit 5, 3, 1 and 0 should be
-	 * zero in the status register.
-	 */
-	reg_config = i2c_smbus_read_byte_data(client, MAX6642_REG_R_CONFIG);
-	if ((reg_config & 0x0f) != 0x00)
-		return -ENODEV;
-
-	/* in between, another round of sanity checks */
-	if (i2c_smbus_read_byte_data(client, 0x04) != reg_config
-	    || i2c_smbus_read_byte_data(client, 0x06) != reg_config
-	    || i2c_smbus_read_byte_data(client, 0xff) != reg_config)
-		return -ENODEV;
-
-	reg_status = i2c_smbus_read_byte_data(client, MAX6642_REG_R_STATUS);
-	if ((reg_status & 0x2b) != 0x00)
-		return -ENODEV;
-
-	strscpy(info->type, "max6642", I2C_NAME_SIZE);
-
-	return 0;
-}
-
-static struct max6642_data *max6642_update_device(struct device *dev)
-{
-	struct max6642_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	u16 val, tmp;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		dev_dbg(dev, "Updating max6642 data.\n");
-		val = i2c_smbus_read_byte_data(client,
-					MAX6642_REG_R_LOCAL_TEMPL);
-		tmp = (val >> 6) & 3;
-		val = i2c_smbus_read_byte_data(client,
-					MAX6642_REG_R_LOCAL_TEMP);
-		val = (val << 2) | tmp;
-		data->temp_input[0] = val;
-		val = i2c_smbus_read_byte_data(client,
-					MAX6642_REG_R_REMOTE_TEMPL);
-		tmp = (val >> 6) & 3;
-		val = i2c_smbus_read_byte_data(client,
-					MAX6642_REG_R_REMOTE_TEMP);
-		val = (val << 2) | tmp;
-		data->temp_input[1] = val;
-		data->alarms = i2c_smbus_read_byte_data(client,
-					MAX6642_REG_R_STATUS);
-
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
-
-/*
- * Sysfs stuff
- */
-
-static ssize_t temp_max10_show(struct device *dev,
-			       struct device_attribute *dev_attr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6642_data *data = max6642_update_device(dev);
-
-	return sprintf(buf, "%d\n",
-		       temp_from_reg10(data->temp_input[attr->index]));
-}
-
-static ssize_t temp_max_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
-	struct max6642_data *data = max6642_update_device(dev);
-
-	return sprintf(buf, "%d\n", temp_from_reg(data->temp_high[attr2->nr]));
-}
-
-static ssize_t temp_max_store(struct device *dev,
-			      struct device_attribute *attr, const char *buf,
-			      size_t count)
-{
-	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
-	struct max6642_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	data->temp_high[attr2->nr] = clamp_val(temp_to_reg(val), 0, 255);
-	i2c_smbus_write_byte_data(data->client, attr2->index,
-				  data->temp_high[attr2->nr]);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	int bitnr = to_sensor_dev_attr(attr)->index;
-	struct max6642_data *data = max6642_update_device(dev);
-	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
-}
-
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_max10, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_max10, 1);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp_max, 0,
-			       MAX6642_REG_W_LOCAL_HIGH);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp_max, 1,
-			       MAX6642_REG_W_REMOTE_HIGH);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
-
-static struct attribute *max6642_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(max6642);
-
-static int max6642_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct max6642_data *data;
-	struct device *hwmon_dev;
-
-	data = devm_kzalloc(dev, sizeof(struct max6642_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->client = client;
-	mutex_init(&data->update_lock);
-
-	/* Initialize the MAX6642 chip */
-	max6642_init_client(data, client);
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-							   client->name, data,
-							   max6642_groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-/*
- * Driver data (common to all clients)
- */
-
-static const struct i2c_device_id max6642_id[] = {
-	{ "max6642" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, max6642_id);
-
-static struct i2c_driver max6642_driver = {
-	.class		= I2C_CLASS_HWMON,
-	.driver = {
-		.name	= "max6642",
-	},
-	.probe		= max6642_probe,
-	.id_table	= max6642_id,
-	.detect		= max6642_detect,
-	.address_list	= normal_i2c,
-};
-
-module_i2c_driver(max6642_driver);
-
-MODULE_AUTHOR("Per Dalen <per.dalen@appeartv.com>");
-MODULE_DESCRIPTION("MAX6642 sensor driver");
-MODULE_LICENSE("GPL");
-- 
2.39.2

