Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D244EC54E94
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 17:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjAXRJG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 12:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjAXRJF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 12:09:05 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A6136FF2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 09:08:09 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id cc13-20020a05683061cd00b00684b8cf2f4dso9558937otb.12
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 09:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G2ATE2ol1qfIYI4qHdawYofz6+j+KFTCV0noKv2WY7c=;
        b=CzOftMi4vNjx4JK/4O8Hah/hnonf65ZxHWqGleuCfKBpvJv5guqEgye6ry1+rUBiJN
         wvOYzsA+4iFDyp2D3GGDScTGjdjyqTf3dYbzM1NJfZ1mo7vYw0hkiy7Qx68gmhR3QWx0
         HTewP57xATZJraiVmqiZtmqdCaJD2ZAhr9i9X79ijB0fT8BEJEy0a6IpDakhxAIsSxM7
         7O7cIR0H7xFXM4XbpOnkCbsNF5QMprBAF1fvRmhXs3pUV8DVEDNxcNUR8KgDM4iFMKiW
         Ed/1AeqGT8nMe++O+W+oJKoTO1wr0G4LF3S4ru8A4ouaXm8fGBcKdgkfpnjsMe0bMw6E
         s+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2ATE2ol1qfIYI4qHdawYofz6+j+KFTCV0noKv2WY7c=;
        b=5JSWslzCQSIzx34o9UwJu7a6PYZA2LJ1d8qe6Cyu1uE0PgEfjPWY7sUcVOSKkLzM3h
         o3794M1Y4lGIhZPs99J2TnZWVhqze3CTMZAnLumIq/ou9CQ49G7dp7ZCK3dfroJV4A1V
         bOb1yjzcmIAst4CLIPv8mbfHoX91cDicrO44zOMrJCNWwSxglvwH9wFGcAXwpPCKAlbH
         90m6Dfc3Oxp1T2HhzD9m6bfpmZYfEtcpIyGPQGEmQVmyQlWH3MGLiuXlnsc8UvmnwtZn
         4Pla6V6UEQOwWyZzaSr/UdY7ni43Sxhvv/h/li3CaN2zuc4uY6zzAt2ACwKi9WuLEy3Z
         RAMQ==
X-Gm-Message-State: AFqh2krWZoLcFaE29VENg8cYYeJBCVRnEwbL+EfVUolQ4XKs1m2pmeoM
        +QyBLdaGhM+DIrhLIbFgBdm1kwQ9f2E=
X-Google-Smtp-Source: AMrXdXtH4UhUiT3eYr0rAACMmo9YT8uXku4JqHew4Xd8nvF235pEMAN6BS0TkLE3McjFm99nbHOAfw==
X-Received: by 2002:a9d:84f:0:b0:686:52aa:7c63 with SMTP id 73-20020a9d084f000000b0068652aa7c63mr14252713oty.28.1674580071853;
        Tue, 24 Jan 2023 09:07:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q9-20020a056830232900b006705829996fsm1131819otg.56.2023.01.24.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:07:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Steve Foreman <foremans@google.com>,
        Chris Ho <Chris.Ho@analog.com>
Subject: [PATCH] hwmon: (pmbus/max16601) Add support for MAX16600
Date:   Tue, 24 Jan 2023 09:07:48 -0800
Message-Id: <20230124170748.562960-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From programming perspective, MAX16600 is identical to MAX16601 and
MAX16602. Add support for it.

Cc: Steve Foreman <foremans@google.com>
Cc: Chris Ho <Chris.Ho@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max16601.rst | 11 ++++++++++-
 drivers/hwmon/pmbus/Kconfig      |  4 ++--
 drivers/hwmon/pmbus/max16601.c   | 14 +++++++++-----
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
index 6a4eef8efbaf..c8c63a053e40 100644
--- a/Documentation/hwmon/max16601.rst
+++ b/Documentation/hwmon/max16601.rst
@@ -13,6 +13,14 @@ Supported chips:
 
     Datasheet: Not published
 
+  * Maxim MAX16600
+
+    Prefix: 'max16600'
+
+    Addresses scanned: -
+
+    Datasheet: Not published
+
   * Maxim MAX16601
 
     Prefix: 'max16601'
@@ -36,7 +44,8 @@ Description
 -----------
 
 This driver supports the MAX16508 VR13 Dual-Output Voltage Regulator
-as well as the MAX16601 VR13.HC Dual-Output Voltage Regulator chipsets.
+as well as the MAX16600, MAX16601, and MAX16602 VR13.HC Dual-Output
+Voltage Regulator chipsets.
 
 The driver is a client driver to the core PMBus driver.
 Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 30448e049486..b3f50dbe4da2 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -237,10 +237,10 @@ config SENSORS_MAX16064
 	  be called max16064.
 
 config SENSORS_MAX16601
-	tristate "Maxim MAX16508, MAX16601, MAX16602"
+	tristate "Maxim MAX16508, MAX16600, MAX16601, and MAX16602"
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX16508, MAX16601 and MAX16602.
+	  MAX16508, MAX16600, MAX16601, and MAX16602.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max16601.
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index b628405e6586..6724f723f74c 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Hardware monitoring driver for Maxim MAX16508, MAX16601 and MAX16602.
+ * Hardware monitoring driver for Maxim MAX16508, MAX16600, MAX16601,
+ * and MAX16602.
  *
  * Implementation notes:
  *
@@ -31,7 +32,7 @@
 
 #include "pmbus.h"
 
-enum chips { max16508, max16601, max16602 };
+enum chips { max16508, max16600, max16601, max16602 };
 
 #define REG_DEFAULT_NUM_POP	0xc4
 #define REG_SETPT_DVID		0xd1
@@ -202,7 +203,7 @@ static int max16601_identify(struct i2c_client *client,
 	else
 		info->vrm_version[0] = vr12;
 
-	if (data->id != max16601 && data->id != max16602)
+	if (data->id != max16600 && data->id != max16601 && data->id != max16602)
 		return 0;
 
 	reg = i2c_smbus_read_byte_data(client, REG_DEFAULT_NUM_POP);
@@ -263,6 +264,7 @@ static void max16601_remove(void *_data)
 
 static const struct i2c_device_id max16601_id[] = {
 	{"max16508", max16508},
+	{"max16600", max16600},
 	{"max16601", max16601},
 	{"max16602", max16602},
 	{}
@@ -281,11 +283,13 @@ static int max16601_get_id(struct i2c_client *client)
 		return -ENODEV;
 
 	/*
-	 * PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx" or
-	 * MAX16602y.xx or "MAX16500y.xx".cdxxcccccccccc
+	 * PMBUS_IC_DEVICE_ID is expected to return MAX1660[012]y.xx" or
+	 * "MAX16500y.xx".cdxxcccccccccc
 	 */
 	if (!strncmp(buf, "MAX16500", 8)) {
 		id = max16508;
+	} else if (!strncmp(buf, "MAX16600", 8)) {
+		id = max16600;
 	} else if (!strncmp(buf, "MAX16601", 8)) {
 		id = max16601;
 	} else if (!strncmp(buf, "MAX16602", 8)) {
-- 
2.39.1

