Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4772618
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060881; cv=none; b=VetB1HI5QFeLk3cJLd7B6CMxgl3RYFbHiqPSsmkfurw7icehvvDqFoB9CweCrqxaZefv0ReI2cYAAxSJBpNeItVnrQKUD8uk2NmgKlfjT2jq4XOwBtRGSAz2rNxNm8J6cu6gt4y5HcEsIGtqxOrlR2awT4fe6IUGxI6h5cA9f/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060881; c=relaxed/simple;
	bh=Z50H53I/SO7w3PdRxuVnOf38cTMq46oG3e09WmmO2vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmjwcnEKyJyIsYxOSA0OtLNyu4iBAcwXvq9QGzrbPL/NPV5cp4cYtjryIpxQLo/LtC9+p8RBwXu4R3ZXPWEVYmXLMS84iT18ezvQb0jEpSlUKlMNF2mC3eZKbX2AaZREei3fS/bukXjYldqkn84ZNYor69BRZXlo8L+w4zHwKyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=frVDlgML; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="frVDlgML"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e99ef0902so158680185a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786060878; x=1786665678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ISpxvCM/L/zFQQejjgVzs6fOe2HVSJayj2d6i61jn0=;
        b=frVDlgMLPOujAZU28qhuUmPw4IbbkDjLHICPLvIR7aYKXqwPzxGtGZvBhDB2jw5LOn
         /4Pp+LcJAYoyqpjTSA2yayukCt7q7yh9kGmfvcUkSXEEKBMk5rvhwaMTwPrvgwxI7Oe9
         2wpv7GLw4MdXqw3iaH3v+GTutClE3W8aCo8xwtRfheTiZ+FFVGSz8J6etkfNBVT0O325
         BkXSHKIyx4wNj8yFtEpYjBvjfIpS0yg8by8bzx2iNdAry0nsVPT/uWNCQB13NRNwGn78
         2Vj98vHLPJMfZI6kEz2C8rmmItdatzf/aupPS1vJk7RuQk/CfrYXb0aOW7Bf8rY07lf8
         vTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060878; x=1786665678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ISpxvCM/L/zFQQejjgVzs6fOe2HVSJayj2d6i61jn0=;
        b=Kd9w1DelK13KfUqvTUsExhvONfnxruVl6/8hcF1gDpoDMqyJFDMkuhPyz8Jze57Tgp
         XxBjpNe8B7KN4CaUHZdxkg2dNWpl1DjkXxAFQfR0FnEEU77PPQkvGA7Ex9a1R3wIBNyE
         /pVQ0B5mjp/3RtoDIfj90WLwl+nMeiJsVJpu9RnqC8hrc0I8FBptrsfrOLKNEuHj7vzC
         ICMmc7kyiEHh0Z0+Rxtn8+x19U5x06XVu50RcRzWTaIBLd5z/fkNNEZfSm9pSrr8ABiw
         DsU1Pvrnrv3LoemjXu7m0bGaBip4hK+78Js39yPz/ZuXtKOs3N/8lT8ylkDGsz67jiEM
         mN7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVubMs6OM9wkzffZACPu0pQ80s0aG/mtscDxY53zP3/2El8X64NzqlcSFB9qQacQw6O0X90duAaLrx+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAWa+4VvDWBYx6LfzJqhV0qZkcIoXqGDZz3cfqS3DSt/yNMXz
	M4ItIYn7WrzIOTVf++7jlJx+JHZhGkg//TOT2m8aoHh4Ga4bfR+NrsVRarRdrB+Azqc=
X-Gm-Gg: AR+sD13eFG2kUb5MtT6qo0qjOm7UxBtEGDdsfZnDbXD5tdXuwYn97/DZeIeJ1B35eBX
	0wCqGVy9gasRB5H1egPsWfv1Y8kRxArAKFgeOiAHoTctcoB1qQASnrvmjAozMxaB8zE4TqB/oSd
	y1DTHdXFkizugqHDEyt91I1d9LSwTyDXzO7CnEnAlyAMXFLsymQUHOVJlTaJrnt/fOrMGwLTZkT
	R5gNLuh2QLvh4oLYOXiwrpevuNxZ2MSbZgrTFFPSA7JpdNJFJCsO6hd4EyQw6o5Q3TyRx/Zp9Qq
	xWJsjTODEmIMc/zBmPzPRL8k76/7/LSTOiCLbOS2UNkORNDH2yLzy0/lVoIFQWAMONZ2eMHT3uh
	xAXx5J7kh5t/98XMiKsDmTNQkovYTtKzO+gOjch/Q2meR1//Ou8QdZw4R5Sjj/MHCKn47CWBfXh
	IPDnObEbuZcFUC0p+FyOIiEzwj1T9KLRa1oXGwLzFuiEy2IGsJQ3HvCB2Snro6UYMxvcroR5/nD
	JukUADlVYmEd4QLPD5Cf6XtXxi9/erxjQ==
X-Received: by 2002:a05:620a:2b86:b0:934:9011:596c with SMTP id af79cd13be357-936490e7a9cmr1911171785a.24.1786060877904;
        Thu, 06 Aug 2026 17:01:17 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm27341485a.38.2026.08.06.17.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:01:17 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
Date: Thu,  6 Aug 2026 20:01:06 -0400
Message-ID: <20260807000107.1786892-3-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807000107.1786892-1-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROG Ryujin III uses different report offsets and a different
cooler-duty channel from the Ryujin II. It also lacks the separate
external fan controller supplied with the older model.

Add model data and USB IDs for the Extreme and EVA Edition variants.
Skip controller commands and hide the unavailable controller hwmon
channels for these devices. Update the driver documentation, Kconfig
text, and module description accordingly.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 Documentation/hwmon/asus_rog_ryujin.rst | 24 +++++++++++++-----------
 drivers/hwmon/Kconfig                   |  4 ++--
 drivers/hwmon/asus_rog_ryujin.c         | 18 ++++++++++++++++--
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index 9f77da070022..cfdfe3712f19 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -6,6 +6,8 @@ Kernel driver asus_rog_ryujin
 Supported devices:
 
 * ASUS ROG RYUJIN II 360
+* ASUS ROG RYUJIN III EXTREME
+* ASUS ROG RYUJIN III EVA EDITION
 
 Author: Aleksa Savic
 
@@ -16,10 +18,10 @@ This driver enables hardware monitoring support for the listed ASUS ROG RYUJIN
 all-in-one CPU liquid coolers. Available sensors are pump, internal and external
 (controller) fan speed in RPM, their duties in PWM, as well as coolant temperature.
 
-Attaching external fans to the controller is optional and allows them to be
-controlled from the device. If not connected, the fan-related sensors will
-report zeroes. The controller is a separate hardware unit that comes bundled
-with the AIO and connects to it to allow fan control.
+The RYUJIN II includes a separate external fan controller. Attaching fans to
+the controller is optional and allows them to be controlled from the device.
+If not connected, the controller-related sensors will report zeroes. The
+RYUJIN III does not expose these controller channels.
 
 The addressable LCD screen is not supported in this driver and should
 be controlled through userspace tools.
@@ -33,15 +35,15 @@ supports hot swapping.
 Sysfs entries
 -------------
 
-=========== =============================================
+=========== ==========================================================
 fan1_input  Pump speed (in rpm)
 fan2_input  Internal fan speed (in rpm)
-fan3_input  External (controller) fan 1 speed (in rpm)
-fan4_input  External (controller) fan 2 speed (in rpm)
-fan5_input  External (controller) fan 3 speed (in rpm)
-fan6_input  External (controller) fan 4 speed (in rpm)
+fan3_input  External (controller) fan 1 speed (in rpm, RYUJIN II only)
+fan4_input  External (controller) fan 2 speed (in rpm, RYUJIN II only)
+fan5_input  External (controller) fan 3 speed (in rpm, RYUJIN II only)
+fan6_input  External (controller) fan 4 speed (in rpm, RYUJIN II only)
 temp1_input Coolant temperature (in millidegrees Celsius)
 pwm1        Pump duty
 pwm2        Internal fan duty
-pwm3        External (controller) fan duty
-=========== =============================================
+pwm3        External (controller) fan duty (RYUJIN II only)
+=========== ==========================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e60bfc31bbad..c7640fcb32e4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -293,11 +293,11 @@ config SENSORS_ASC7621
 	  will be called asc7621.
 
 config SENSORS_ASUS_ROG_RYUJIN
-	tristate "ASUS ROG RYUJIN II 360 hardware monitoring driver"
+	tristate "ASUS ROG RYUJIN hardware monitoring driver"
 	depends on HID
 	help
 	  If you say yes here you get support for the fans and sensors of
-	  the ASUS ROG RYUJIN II 360 AIO CPU liquid cooler.
+	  supported ASUS ROG RYUJIN II and III AIO CPU liquid coolers.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_rog_ryujin.
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index b86b87e33615..5bc60c6036de 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * hwmon driver for Asus ROG Ryujin II 360 AIO cooler.
+ * hwmon driver for Asus ROG Ryujin AIO coolers.
  *
  * Copyright 2024 Aleksa Savic <savicaleksa83@gmail.com>
  */
@@ -17,6 +17,8 @@
 
 #define USB_VENDOR_ID_ASUS_ROG		0x0b05
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
+#define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
+#define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -34,6 +36,14 @@ static const struct rog_ryujin_device_info rog_ryujin_ii_360_info = {
 	.has_controller = true,
 };
 
+static const struct rog_ryujin_device_info rog_ryujin_iii_info = {
+	.temp_offset = 5,
+	.pump_speed_offset = 7,
+	.fan_speed_offset = 10,
+	.duty_channel = 1,
+	.has_controller = false,
+};
+
 #define STATUS_VALIDITY		1500	/* ms */
 #define MAX_REPORT_LENGTH	65
 
@@ -573,6 +583,10 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 static const struct hid_device_id rog_ryujin_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EXTREME),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
@@ -602,4 +616,4 @@ module_exit(rog_ryujin_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Aleksa Savic <savicaleksa83@gmail.com>");
-MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin II 360 AIO cooler");
+MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin AIO coolers");
-- 
2.55.0

