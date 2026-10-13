Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD504BC007
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873236; cv=none; b=tOLD3VNV8WTtrXmabgpSWV7JOlq7n0bg1OCy1PfzOrnH27T6Tq+XRCoO+l9kvL+yXZUK7v7RwltwoCCn+bHFys4Blc9732aW8radJwBuVs8w5WQFq1FoTQWqWIazUQcLeB4Gb1KAcPgfDDswnMoMOVzi2A+LC7bpoV8w+dH+edA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873236; c=relaxed/simple;
	bh=PKDt9a17x5JwDBBG2cr351fvRdaGcmqb74KmAxG/+jI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOgvOb7IOzhmaogLQZvjnfA+312A80t73v4mDwWcSZrewoli+mPXvVDL2xHzZKwUhHK5sdTZJSaqdcYlzE+kNVYDHFOO58tVItDoW+b7dk09b+I43Ky9Gt0tTS2xK+hbZsRCMNhxqxwUV+0HKVkqXiqiB8UprOs6+uhn7oJxCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myzr4P6w; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myzr4P6w"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c9879395so788494a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873234; x=1792478034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTNsy5m2fl3FNNHCS2M1Dkdj9lpqET4GIobo7b5ehNE=;
        b=myzr4P6wCvoZJlBMOFMxmkdSIEPnMsg6M4vjI+H+7NW2TPn0QXtMC5IBAzW1QRId2J
         XJE09aNDoZsJQqoZLoR7UfRaP2SXqjc0K4TuV7i2scG4fWwcsg2xHwtWYyduxm7QUvvv
         Ba5kC7IAZCDUYHYN4Z0TBWGv88XsIYhNa9ESxsqCsjBlICkpXRMSgyp1hjHTlk/+e6mO
         HkP+xaP9nlpkU21qHiKpO2NMr8zjCRzE5jeILBJUTgQTcvG9nVLMLQMpynjz3w0HNbSe
         7hkotiRDIXagzJ+5T1eBADkm2Vpk7/JvzZ+s3vMH+WCbH27ScyFS31mqLXGdQGdXIFin
         HNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873234; x=1792478034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTNsy5m2fl3FNNHCS2M1Dkdj9lpqET4GIobo7b5ehNE=;
        b=LSQd90n7sq0mFgtTFhKqYGL784zI3coOgz4XNVCTpBfIwsUZmuT+JPODMcCazKQ2e+
         TwjzxYR2jMrvODwT24CFVl4H7Sr8mEv18xbU/6Ni4kCmDbBVzb2Z5pdlMCZtyNqQLuRK
         YVT37iuW1fIYz/yHmpy1Jys94gjFofdEf0Jyip89J8iD+v2W4+xLcz5nMnNqGzi4Itp/
         0FwZIo2wl1DK6+HNl8keo+kQcxve8k7LQlT8DK+bjsP487oDUMWJ0hl4tu+62JlXxrBX
         Naq6YinTaBYfQiuHeGcnvVL9WUL9jUGgkulobLTFwcX2g1U7stOC+RDHuWg0f9SsINr0
         m1Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxWL0scqslOhrQL6x3yxjbGGiKGg0Cx4vTCaAzydZ8mEbU9cW+B1MOJbRYXkiXA4XaKLmR4ydGOd36WTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9+Uh/siWACZzG+G71YLCSl9pjOMd57tkax82y62KHzZb0FXBF
	zTDCDQx8AVI9HagdftCYs/UR8mhZCS4+qXh4N/UYnHqBGGS7jV9XxNe6
X-Gm-Gg: AYBFou08gQe/wE6NXxxSPHYSif3uuZ7b8hzutF8HNhhh40AbSPYs5uLf/gr/JYohptU
	+0B97uEIpAT2rSTerbyqQdmfPk9cU9wF/6LF8JbGYhy9pDjh7c9bV9qrL/dirjnZjR7Z7JzmBln
	sdFR4oIk1V/dQkTWOfTw7ir7g3R93WO9amVhqFLoh5UxzXmzp+eFFhq5FCfx+xRearP9rJjNihg
	JsWg0mgMce3grM3c9qnxyKUC79QzQ6hP/opGY1D/JLg5XNK5Lqd4k3eU2gDPfz7i8jSBnfXuT9q
	i7Hz53IZb2vMJgycUitATGux7/YbMfB0HM72u12C6Bg3vGZscSl1bLTnN8FcgAox+oxLz/eX82v
	utwo7i8rKwJD4WN9ie4AsYYyEWiGO0RkaoLeGFCTl4vpIcOP1RnVziWoosMmQ2+vFuSynnc5qB0
	RgrdMSjnMSS8K32FLUcCYsw2VKaCmwmzd3azFVIr5HUwXNb71PPNbp3FJlF68u3qF+dH6o6blhf
	YQCVKhp6oAAkjcosuNVgsON0dABR2Bl7Rs5tUsKPXgMSB1rG2k=
X-Received: by 2002:a17:90b:1dc1:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3ab3ac9f622mr8108214a91.27.1791873233720;
        Mon, 12 Oct 2026 23:33:53 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:53 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
Date: Tue, 13 Oct 2026 14:32:51 +0800
Message-Id: <20261013063259.2734757-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Each sub-device driver defines the module type used by its own
commands. The upcoming HIF transport also needs to recognise
NCT6694_RPT_MOD, as report accesses are served from a separate
register space rather than through the command mailbox.

Move all module types into the shared header so that the transports
and the sub-device drivers use a single set of definitions.

No functional change.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- Added Andi's Reviewed-by.

Changes in v8:
- Reworded the commit message to explain why the transport needs the
  module types.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/gpio/gpio-nct6694.c         |  7 -------
 drivers/hwmon/nct6694-hwmon.c       | 21 ---------------------
 drivers/i2c/busses/i2c-nct6694.c    |  7 -------
 drivers/net/can/usb/nct6694_canfd.c |  6 ------
 drivers/rtc/rtc-nct6694.c           |  7 -------
 drivers/watchdog/nct6694_wdt.c      |  7 -------
 include/linux/mfd/nct6694.h         |  9 +++++++++
 7 files changed, 9 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..53bfc5983648 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -13,13 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 GPIO controller.
- * This defines the module type used for communication with the NCT6694
- * GPIO controller over the USB interface.
- */
-#define NCT6694_GPIO_MOD	0xFF
-
 #define NCT6694_GPIO_VER	0x90
 #define NCT6694_GPIO_VALID	0x110
 #define NCT6694_GPI_DATA	0x120
diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
index 9a9a4db434c4..bd4c106305c7 100644
--- a/drivers/hwmon/nct6694-hwmon.c
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -15,13 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 report channel
- * This defines the module type used for communication with the NCT6694
- * report channel over the USB interface.
- */
-#define NCT6694_RPT_MOD			0xFF
-
 /* Report channel */
 /*
  * The report channel is used to report the status of the hardware monitor
@@ -38,13 +31,6 @@
 #define NCT6694_TIN_STS(x)		(0x6A + (x))
 #define NCT6694_FIN_STS(x)		(0x6E + (x))
 
-/*
- * USB command module type for NCT6694 HWMON controller.
- * This defines the module type used for communication with the NCT6694
- * HWMON controller over the USB interface.
- */
-#define NCT6694_HWMON_MOD		0x00
-
 /* Command 00h - Hardware Monitor Control */
 #define NCT6694_HWMON_CONTROL		0x00
 #define NCT6694_HWMON_CONTROL_SEL	0x00
@@ -53,13 +39,6 @@
 #define NCT6694_HWMON_ALARM		0x02
 #define NCT6694_HWMON_ALARM_SEL		0x00
 
-/*
- * USB command module type for NCT6694 PWM controller.
- * This defines the module type used for communication with the NCT6694
- * PWM controller over the USB interface.
- */
-#define NCT6694_PWM_MOD			0x01
-
 /* PWM Command - Manual Control */
 #define NCT6694_PWM_CONTROL		0x01
 #define NCT6694_PWM_CONTROL_SEL		0x00
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
index 1413ab6f9462..ef3329f34246 100644
--- a/drivers/i2c/busses/i2c-nct6694.c
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -12,13 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 I2C controller.
- * This defines the module type used for communication with the NCT6694
- * I2C controller over the USB interface.
- */
-#define NCT6694_I2C_MOD			0x03
-
 /* Command 00h - I2C Deliver */
 #define NCT6694_I2C_DELIVER		0x00
 #define NCT6694_I2C_DELIVER_SEL		0x00
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
index e5f7f8849a73..262b4c26c9d4 100644
--- a/drivers/net/can/usb/nct6694_canfd.c
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -18,12 +18,6 @@
 
 #define DEVICE_NAME "nct6694-canfd"
 
-/* USB command module type for NCT6694 CANfd controller.
- * This defines the module type used for communication with the NCT6694
- * CANfd controller over the USB interface.
- */
-#define NCT6694_CANFD_MOD			0x05
-
 /* Command 00h - CAN Setting and Initialization */
 #define NCT6694_CANFD_SETTING			0x00
 #define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
index 35401a0d9cf5..c06902f150c9 100644
--- a/drivers/rtc/rtc-nct6694.c
+++ b/drivers/rtc/rtc-nct6694.c
@@ -14,13 +14,6 @@
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 RTC controller.
- * This defines the module type used for communication with the NCT6694
- * RTC controller over the USB interface.
- */
-#define NCT6694_RTC_MOD		0x08
-
 /* Command 00h - RTC Time */
 #define NCT6694_RTC_TIME	0x0000
 #define NCT6694_RTC_TIME_SEL	0x00
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
index bc3689bd4b6b..4c06ac105562 100644
--- a/drivers/watchdog/nct6694_wdt.c
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -20,13 +20,6 @@
 
 #define NCT6694_WDT_MAX_DEVS		2
 
-/*
- * USB command module type for NCT6694 WDT controller.
- * This defines the module type used for communication with the NCT6694
- * WDT controller over the USB interface.
- */
-#define NCT6694_WDT_MOD			0x07
-
 /* Command 00h - WDT Setup */
 #define NCT6694_WDT_SETUP		0x00
 #define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 69e4652cf16c..d46ae34a497e 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -8,6 +8,15 @@
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#define NCT6694_HWMON_MOD	0x00
+#define NCT6694_PWM_MOD		0x01
+#define NCT6694_I2C_MOD		0x03
+#define NCT6694_CANFD_MOD	0x05
+#define NCT6694_WDT_MOD		0x07
+#define NCT6694_RTC_MOD		0x08
+#define NCT6694_RPT_MOD		0xFF
+#define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
+
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
 #define NCT6694_INT_IN_EP	0x01
-- 
2.34.1

