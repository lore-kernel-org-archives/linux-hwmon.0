Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D4BC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Nov 2022 11:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiKYLt0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Nov 2022 06:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiKYLtW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Nov 2022 06:49:22 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50490209A6;
        Fri, 25 Nov 2022 03:49:20 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id l127so4153439oia.8;
        Fri, 25 Nov 2022 03:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOXNTE9xfnPW2G/iGt1IpLAFj2E+xtqk4njhsk5DHuc=;
        b=BblAeuOY1NKGSskjr34K2bCI61/0T8j6XcKQxa95Vvg5TZ8nkyBSCLxkRBXkGYKY8E
         a50XFbvr07EKwksOF5fv4hSvw72/f+d4WmtdJLBW6Ojo3E7BdRdwKC2KGvbLyEQ9ZI3E
         iwLyXUkThs9W/n1pjOccw+v3T/2u8W0JRiSWdXd8gtmwfHIcBHKs7u3uhbUVqn99JaSV
         /o6lpK7FnOKCiTa3MOUgwIdaZLEmtjmhx0/P4yg5arJ6FDY1R8fKuPL31l/vfOibMHaM
         0xRijlynTU8yX4iFDSwYYV9z4o1dBDNo63Yzs4x5P5tpoFcLZIW2U7jJc6qLsy6jrU3n
         +Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOXNTE9xfnPW2G/iGt1IpLAFj2E+xtqk4njhsk5DHuc=;
        b=5BMPOi1wjM2NSPS+IOLJUKdXq2GZI+T2XzKWt5j4S6fsY1B1ulvfXgCbQrqe48gaaZ
         C9Pwfv2bYGKQuNrWndxhDwkTbw1drYEIJsRuzllYWIhNQMpX8NvYw68fhZuJAOritQ1X
         46I56FiEMK2Xy2V4EigqqdNDxKCYqoy1a1/8+yvP6Ebu5G6VfjRWG5PnoEEeixbfFmOZ
         682bEFgLvVrcV0CvHmETYyO3EyZF1WjX4QLNmVUfAkWO0+zy0sG/PzqKGyB57q4thmnM
         xWVKAM2OCnc3xPRlE6JhTTG0LmHmpU+zSJ9sW2aYwTqF5ldTj6cHooQl6HSr3tCbPGkx
         drkQ==
X-Gm-Message-State: ANoB5pkPhb1o8kIXkeZszTJuZpoTKo9oznCY6fgeQh3qTjxSujga3q3Z
        vuYxrcsRxxiLr048II+bQTQ=
X-Google-Smtp-Source: AA0mqf4+wJJZfREn9zEYYPLvukpCivtnhFwGbQXWI42v4lJwTRVyMfvdJMaOjq1fkL5fOD2HtLw3Wg==
X-Received: by 2002:aca:1707:0:b0:35b:9bda:4973 with SMTP id j7-20020aca1707000000b0035b9bda4973mr83473oii.267.1669376959603;
        Fri, 25 Nov 2022 03:49:19 -0800 (PST)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id h10-20020a056870d24a00b0013b0b19100fsm1910102oac.32.2022.11.25.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:49:18 -0800 (PST)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     w_armin@gmx.de
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        pobrn@protonmail.com,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH v2] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
Date:   Fri, 25 Nov 2022 08:49:01 -0300
Message-Id: <20221125114901.11309-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
DMI strings are added to this driver since the same EC layout is used and
has similar specs as the OXP mini AMD.

The added devices are:
- OneXPlayer mini PRO (AMD 6800U)
- AOK ZOE A1 (AMD 6800U)

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
Corrected commit message (AOK ZOE description)
Removed unhelpful dev_info message
---
 Documentation/hwmon/oxp-sensors.rst | 16 +++++++++---
 drivers/hwmon/oxp-sensors.c         | 40 ++++++++++++++++++++++++-----
 2 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
index f612dddc964a..39c588ec5c50 100644
--- a/Documentation/hwmon/oxp-sensors.rst
+++ b/Documentation/hwmon/oxp-sensors.rst
@@ -12,9 +12,19 @@ Description:
 One X Player devices from One Netbook provide fan readings and fan control
 through its Embedded Controller.

-Currently only supports AMD boards from the One X Player lineup. Intel boards
-could be supported if we could figure out the EC registers and values to write
-to since the EC layout and model is different.
+Currently only supports AMD boards from the One X Player and AOK ZOE lineup.
+Intel boards could be supported if we could figure out the EC registers and
+values to write to since the EC layout and model is different.
+
+Supported devices
+-----------------
+
+Currently the driver supports the following handhelds:
+
+ - AOK ZOE A1
+ - OneXPlayer AMD
+ - OneXPlayer mini AMD
+ - OneXPlayer mini AMD PRO

 Sysfs entries
 -------------
diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index da54a38f4454..a2bfcf3f9909 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -3,13 +3,14 @@
  * Platform driver for OXP Handhelds that expose fan reading and control
  * via hwmon sysfs.
  *
- * All boards have the same DMI strings and they are told appart by the
+ * Old boards have the same DMI strings and they are told appart by the
  * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
  * but the code is made to be simple to add other handheld boards in the
  * future.
- * Fan control is provided via pwm interface in the range [0-255]. AMD
- * boards use [0-100] as range in the EC, the written value is scaled to
- * accommodate for that.
+ * Fan control is provided via pwm interface in the range [0-255].
+ * Old AMD boards use [0-100] as range in the EC, the written value is
+ * scaled to accommodate for that. Newer boards like the mini PRO and
+ * AOK ZOE are not scaled but have the same EC layout.
  *
  * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
  */
@@ -39,16 +40,39 @@ static bool unlock_global_acpi_lock(void)
 	return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
 }

+enum oxp_board {
+	aok_zoe_a1 = 1,
+	oxp_mini_amd,
+	oxp_mini_amd_pro,
+};
+
+static enum oxp_board board;
+
 #define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
 #define OXP_SENSOR_PWM_ENABLE_REG	0x4A /* PWM enable is 1 register long */
 #define OXP_SENSOR_PWM_REG		0x4B /* PWM reading is 1 register long */

 static const struct dmi_system_id dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
+		},
+		.driver_data = (void *) &(enum oxp_board) {aok_zoe_a1},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
 		},
+		.driver_data = (void *) &(enum oxp_board) {oxp_mini_amd},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER Mini Pro"),
+		},
+		.driver_data = (void *) &(enum oxp_board) {oxp_mini_amd_pro},
 	},
 	{},
 };
@@ -137,7 +161,8 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
 			if (ret)
 				return ret;
-			*val = (*val * 255) / 100;
+			if (board == oxp_mini_amd)
+				*val = (*val * 255) / 100;
 			return 0;
 		case hwmon_pwm_enable:
 			return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
@@ -166,7 +191,8 @@ static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
 		case hwmon_pwm_input:
 			if (val < 0 || val > 255)
 				return -EINVAL;
-			val = (val * 100) / 255;
+			if (board == oxp_mini_amd)
+				val = (val * 100) / 255;
 			return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
 		default:
 			break;
@@ -216,6 +242,8 @@ static int oxp_platform_probe(struct platform_device *pdev)
 	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return -ENODEV;

+	board = *((enum oxp_board *) dmi_entry->driver_data);
+
 	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
 						     &oxp_ec_chip_info, NULL);


base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
--
2.38.1

