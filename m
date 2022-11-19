Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EC4C4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Nov 2022 16:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiKSQ0G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Nov 2022 11:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbiKSQZr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2022 11:25:47 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E44898EE;
        Sat, 19 Nov 2022 08:24:41 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13c2cfd1126so9335544fac.10;
        Sat, 19 Nov 2022 08:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5hTeburqR8Hae/XZ97a/QxzyOgDZB34hQSyr/XEb3c=;
        b=SFVLbX+Iwz4D7pir+petUJoaeC8WYjW04P+tB87Ef8KaVtEGKVubh8VudCndZ5StJ5
         DhYfaCmL6RrqR32W1EWZyT7z9laCSoD9LhX62ktvSyMyjoevsXbQfdUJdImfFunpWxOA
         XXcAHKXYDX5o7zS+vY7A6SNj80DTeDL5UCAfPJYxAVXHujE3BiSynkgE8PiUFcxf5l4e
         94NL+M3O1ccQ1YtWZN+IW/iNfU22SJBntyYmXoGdNraJ6nIht5Ol4Edq4MhR9nj2baJo
         mh1bCpDvEL1u+n1266Koo9qXqXyuN8liAPdZZmmkkPmbu4wkuIuuhOcATfIppZ6514c2
         5dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5hTeburqR8Hae/XZ97a/QxzyOgDZB34hQSyr/XEb3c=;
        b=KpEKkufBzoR39RXaXs6yGsCVqtqWMJgLIJRisCVCbU82609HneiaBu1VokgyjAnUZ4
         Owpr2U8YhTPQubDA/fzlmnActZmA1e+LCIJKGOadva5lPI8pNGB3fSH9Vmwl4nh9/Ru/
         ZMK8/rYV/mMjg2HQZmBkHlOZsaQfTfehPuV1bvYk6oI7patG6RnCrLW8+IS8Mdbdwyot
         1/nSJGuksYTg0b6JbfwvJ0d+rsPf9xEJZUdR4di8ZL9S1XlYdkwcD/km01LYDh6P4kQr
         zhDHTnESdlUKKfdPtUI/2Qy7dOZmCkwNaDD97C4PuH0pSwuOY+lzNlPbU+Q2FGNwn4ws
         mVxQ==
X-Gm-Message-State: ANoB5pmp+vKKZV/zJe7cVimwB+pZkwM86Y5nnyOQZwLmArXmqd/VsgPJ
        Cfb7ZgP/7hYS6N7AextQBb57/15Cdag=
X-Google-Smtp-Source: AA0mqf46lY7T+fjR7rRB3B5nMHw+UOq8AxVxyGYkUkObUHag1TkAgUyKaboU/2/Ui38oU54Hi3SU4A==
X-Received: by 2002:a05:6870:970d:b0:13c:19bc:1350 with SMTP id n13-20020a056870970d00b0013c19bc1350mr6765530oaq.226.1668875080473;
        Sat, 19 Nov 2022 08:24:40 -0800 (PST)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
        by smtp.gmail.com with ESMTPSA id h5-20020a9d5545000000b0066cb9069e0bsm2899626oti.42.2022.11.19.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 08:24:39 -0800 (PST)
From:   =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
To:     w_armin@gmx.de
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        pobrn@protonmail.com,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>
Subject: [PATCH] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
Date:   Sat, 19 Nov 2022 13:23:48 -0300
Message-Id: <20221119162347.36698-1-samsagax@gmail.com>
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
- AOK ZOE A1 (AMD 5800U)

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
---
 Documentation/hwmon/oxp-sensors.rst | 16 ++++++++---
 drivers/hwmon/oxp-sensors.c         | 41 ++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 9 deletions(-)

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
index da54a38f4454..23e575479d1a 100644
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
@@ -216,6 +242,9 @@ static int oxp_platform_probe(struct platform_device *pdev)
 	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return -ENODEV;

+	board = *((enum oxp_board *) dmi_entry->driver_data);
+	dev_info(dev, "Board: %i", board);
+
 	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
 						     &oxp_ec_chip_info, NULL);


base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
--
2.38.1

