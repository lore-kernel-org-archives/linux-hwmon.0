Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C45DC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Apr 2022 05:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238295AbiDXFRx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Apr 2022 01:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238210AbiDXFRc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Apr 2022 01:17:32 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55841BEAF
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Apr 2022 22:14:32 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t15so13690799oie.1
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Apr 2022 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jackdoan-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8Bhcq3T4n7sBhzJHAxzqa1VW//Z34i8PxIoitJ0L22Q=;
        b=k/QLgoDbm5/nZaN5pRCSfoBZyMX7X/ufK0TdIL0UfZQiuqoJLPSxSV8blUnBJQmtd7
         lmVMdbQIkQTJzXun+MRDiEDdD+4paNyzhe16wt4OAGOVQw0MezZC6ueiCGT32I82CeD9
         rTQ7Cq+vNmCReRotn7ohCUPo5DlA5yjY47oBg01RoOZm3lTSOFBCMlOmzmy0FmqMgwMY
         GKNKbCMX/fQNtIGoS/keLtVcgVHeAJqOS1NIOwFvb3ljGanBYSVjRu5wQNbFaqq1AU7R
         WMRVA5mcC97s4tdsDSwQBtL5Q307VkNcz2Fe4SLMxdTz1VyAQ2CiWo7mo2s2MqYqu4da
         EANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8Bhcq3T4n7sBhzJHAxzqa1VW//Z34i8PxIoitJ0L22Q=;
        b=0jaqE5US7q9pLVfnx32vHPP0s8aX3CmNS02014+HEW2XdNKe81/vKm0CWpRPKgquWK
         sXiXVzlqSBNzVrnn9cNE6l9L9Bc/7M4U51t6exv81zaUCz9pwvBYwcDHUXEW64oWevft
         cq12N+0POp9RE0Mir0HKt/yuyfDjx82LHl9M4KhsPd0VDn8/7sm+Drp42qpPYmYz766V
         z08Oox8/2/TRRyS39dqrT4IXTrzrfDA91paSS7h9xhsbsEVLYamxIZ+hFWIXJknNarT7
         48ysy6YweWe6K4WDUXm1ArwX2wuAn5VLReIavAwpdobPuVXsNqlKIyhju936lgGziPkt
         YJhA==
X-Gm-Message-State: AOAM533UcKJ3fQNx5C7yptDUr0rRDkt8oIKB3kqczEKMNa2eHgWZ1rcE
        nSWDWCr0/6XM0pHO5yrj6PQrdg1TbS8J4cviE5YqH0bZ
X-Google-Smtp-Source: ABdhPJxn8Af8KPLkOz0ACyvdF6+LcYAGa2M4gRTpzP43rbA7PrGk1gxh4flZ3nblhcSsaITiDZgwaQ==
X-Received: by 2002:aca:de84:0:b0:2f9:c97c:421c with SMTP id v126-20020acade84000000b002f9c97c421cmr5457622oig.46.1650777271458;
        Sat, 23 Apr 2022 22:14:31 -0700 (PDT)
Received: from jackdesk ([2600:1700:24d0:1e2f:386a:dfff:fe72:8e55])
        by smtp.gmail.com with ESMTPSA id q203-20020acad9d4000000b002f8ee3f69e2sm2456892oig.52.2022.04.23.22.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 22:14:30 -0700 (PDT)
Date:   Sun, 24 Apr 2022 00:14:22 -0500
From:   Jack Doan <me@jackdoan.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (aquacomputer_d5next) Add support for Aquacomputer
 Farbwerk
Message-ID: <YmTcrq8Gzel0zYYD@jackdesk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend aquacomputer_d5next driver to expose hardware
temperature sensors of the Aquacomputer Farbwerk RGB controller, which
communicates through a proprietary USB HID protocol.

Four temperature sensors are available. Additionally, serial number and
firmware version are exposed through debugfs.

Also, add Jack Doan to MAINTAINERS for this driver.

Signed-off-by: Jack Doan <me@jackdoan.com>
Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
---
Changes in v2:
  - update Kconfig so it applies cleanly
  - add "select CRC16" to Kconfig
---
 Documentation/hwmon/aquacomputer_d5next.rst |  3 +-
 MAINTAINERS                                 |  1 +
 drivers/hwmon/Kconfig                       |  5 +--
 drivers/hwmon/aquacomputer_d5next.c         | 37 ++++++++++++++++++---
 4 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/aquacomputer_d5next.rst b/Documentation/hwmon/aquacomputer_d5next.rst
index e69f718caf5b..717e28226cde 100644
--- a/Documentation/hwmon/aquacomputer_d5next.rst
+++ b/Documentation/hwmon/aquacomputer_d5next.rst
@@ -6,6 +6,7 @@ Kernel driver aquacomputer-d5next
 Supported devices:
 
 * Aquacomputer D5 Next watercooling pump
+* Aquacomputer Farbwerk RGB controller
 * Aquacomputer Farbwerk 360 RGB controller
 * Aquacomputer Octo fan controller
 
@@ -32,7 +33,7 @@ better suited for userspace tools.
 The Octo exposes four temperature sensors and eight PWM controllable fans, along
 with their speed (in RPM), power, voltage and current.
 
-The Farbwerk 360 exposes four temperature sensors. Depending on the device,
+The Farbwerk and Farbwerk 360 expose four temperature sensors. Depending on the device,
 not all sysfs and debugfs entries will be available.
 
 Usage notes
diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..c5cd8dd866ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1446,6 +1446,7 @@ F:	drivers/media/i2c/aptina-pll.*
 
 AQUACOMPUTER D5 NEXT PUMP SENSOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
+M:	Jack Doan <me@jackdoan.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/hwmon/aquacomputer_d5next.rst
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 1f1bb4d858cb..4a6d6c5b9b69 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -256,13 +256,14 @@ config SENSORS_AHT10
 	  will be called aht10.
 
 config SENSORS_AQUACOMPUTER_D5NEXT
-	tristate "Aquacomputer D5 Next, Octo and Farbwerk 360"
+	tristate "Aquacomputer D5 Next, Octo, Farbwerk, and Farbwerk 360"
 	depends on USB_HID
 	select CRC16
 	help
 	  If you say yes here you get support for sensors and fans of
 	  the Aquacomputer D5 Next watercooling pump, Octo fan
-	  controller and Farbwerk 360 RGB controller, where available.
+	  controller, Farbwerk and Farbwerk 360 RGB controllers, where
+	  available.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called aquacomputer_d5next.
diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index a464473bc981..7d2e7279abfb 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * hwmon driver for Aquacomputer devices (D5 Next, Farbwerk 360, Octo)
+ * hwmon driver for Aquacomputer devices (D5 Next, Farbwerk, Farbwerk 360, Octo)
  *
  * Aquacomputer devices send HID reports (with ID 0x01) every second to report
  * sensor values.
  *
  * Copyright 2021 Aleksa Savic <savicaleksa83@gmail.com>
+ * Copyright 2022 Jack Doan <me@jackdoan.com>
  */
 
 #include <linux/crc16.h>
@@ -19,14 +20,16 @@
 #include <asm/unaligned.h>
 
 #define USB_VENDOR_ID_AQUACOMPUTER	0x0c70
+#define USB_PRODUCT_ID_FARBWERK		0xf00a
 #define USB_PRODUCT_ID_D5NEXT		0xf00e
 #define USB_PRODUCT_ID_FARBWERK360	0xf010
 #define USB_PRODUCT_ID_OCTO		0xf011
 
-enum kinds { d5next, farbwerk360, octo };
+enum kinds { d5next, farbwerk, farbwerk360, octo };
 
 static const char *const aqc_device_names[] = {
 	[d5next] = "d5next",
+	[farbwerk] = "farbwerk",
 	[farbwerk360] = "farbwerk360",
 	[octo] = "octo"
 };
@@ -69,6 +72,12 @@ static u8 secondary_ctrl_report[] = {
 #define D5NEXT_PUMP_CURRENT		112
 #define D5NEXT_FAN_CURRENT		99
 
+/* Register offsets for the Farbwerk RGB controller */
+#define FARBWERK_NUM_SENSORS		4
+#define FARBWERK_SENSOR_START		0x2f
+#define FARBWERK_SENSOR_SIZE		0x02
+#define FARBWERK_SENSOR_DISCONNECTED	0x7FFF
+
 /* Register offsets for the Farbwerk 360 RGB controller */
 #define FARBWERK360_NUM_SENSORS		4
 #define FARBWERK360_SENSOR_START	0x32
@@ -125,7 +134,7 @@ static const char *const label_d5next_current[] = {
 	"Fan current"
 };
 
-/* Labels for Farbwerk 360 and Octo temperature sensors */
+/* Labels for Farbwerk, Farbwerk 360 and Octo temperature sensors */
 static const char *const label_temp_sensors[] = {
 	"Sensor 1",
 	"Sensor 2",
@@ -319,6 +328,7 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 			if (channel == 0)
 				return 0444;
 			break;
+		case farbwerk:
 		case farbwerk360:
 		case octo:
 			return 0444;
@@ -551,8 +561,7 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
-static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data,
-			 int size)
+static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
 {
 	int i, sensor_value;
 	struct aqc_data *priv;
@@ -587,6 +596,17 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 		priv->current_input[0] = get_unaligned_be16(data + D5NEXT_PUMP_CURRENT);
 		priv->current_input[1] = get_unaligned_be16(data + D5NEXT_FAN_CURRENT);
 		break;
+	case farbwerk:
+		/* Temperature sensor readings */
+		for (i = 0; i < FARBWERK_NUM_SENSORS; i++) {
+			sensor_value = get_unaligned_be16(data + FARBWERK_SENSOR_START +
+							  i * FARBWERK_SENSOR_SIZE);
+			if (sensor_value == FARBWERK_SENSOR_DISCONNECTED)
+				priv->temp_input[i] = -ENODATA;
+			else
+				priv->temp_input[i] = sensor_value * 10;
+		}
+		break;
 	case farbwerk360:
 		/* Temperature sensor readings */
 		for (i = 0; i < FARBWERK360_NUM_SENSORS; i++) {
@@ -733,6 +753,11 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		priv->voltage_label = label_d5next_voltages;
 		priv->current_label = label_d5next_current;
 		break;
+	case USB_PRODUCT_ID_FARBWERK:
+		priv->kind = farbwerk;
+
+		priv->temp_label = label_temp_sensors;
+		break;
 	case USB_PRODUCT_ID_FARBWERK360:
 		priv->kind = farbwerk360;
 
@@ -795,6 +820,7 @@ static void aqc_remove(struct hid_device *hdev)
 
 static const struct hid_device_id aqc_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_D5NEXT) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_FARBWERK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_FARBWERK360) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_OCTO) },
 	{ }
@@ -826,4 +852,5 @@ module_exit(aqc_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Aleksa Savic <savicaleksa83@gmail.com>");
+MODULE_AUTHOR("Jack Doan <me@jackdoan.com>");
 MODULE_DESCRIPTION("Hwmon driver for Aquacomputer devices");
-- 
2.36.0

