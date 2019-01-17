Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C69BC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BAAA20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCT4D5On"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfAQVOm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:42 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33603 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id z11so5000245pgu.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I1NW2cHc6U8DBYR2Q393W97w4CKya9h9ISLaDD/ej4k=;
        b=KCT4D5On5G9hO1iWz4ZHZDAm2yAYWteS915wMFTE5+BN5j0Yt0NkGPFyzFkKwbaqgd
         pBjF6Q+MNBj+A2wAGoGaFldNZ8DCz+MSYv9k/hhWVmD9ezEG/Vn3H6xkpZm22J52aI4D
         tzLeKCXkLuYIrP1dh0T3XvT6laqQ32fSn3FtQV1LdMxZtbqklXuYycwPZ+0uLN2y9f0Z
         MI0JdIB0Nuyg2zW2umydvkLphGLOttfwNq+u0EvVxfVkYInvDKTHPyy+cz/ZwUtvFKNw
         C7UEi/2LqAX6bfYGV3Df6sed0NpHcsBES0UxSez3YeZt0R4qQ9AnQOKg4XODnt7mXqKW
         9e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=I1NW2cHc6U8DBYR2Q393W97w4CKya9h9ISLaDD/ej4k=;
        b=qzP9oFsm8BQx4UWVgvsryQVIgsA264yDwhbeNxb42a4LvsxyZ1UVfzEX1HnjCA2STq
         k5KdVG56Yywp/k9qHPw5S+067l058VsKvtrgXU4AJkjgQHO0VAUldqB9NEtQIXqSphsq
         GGhtbz050wh0NVj4l8ZFwtJb7xCOtM66WKxX3B167pKTGV8pR0tIgTvVmSK4kabins52
         ESUBqkjI0FgmU0U1P5MvvFM/Aro3X2590EsPknyy4MqY2FwLFGCQ2nATN/caYwC2BkZV
         T6IlaI2CD50SHml8IldgKwMJpoRKiDnPUeG3BPwVLlhpmU64y8xXKFZ9GbE+BtBaFLP5
         j5gw==
X-Gm-Message-State: AJcUukfflbKDsY8x5TbUCLxU2ySRC3/Z9EoSztjEVUzmehINu5bh5uJT
        Hltrc2DJHrCRisnVWX6pPK9epSwm
X-Google-Smtp-Source: ALg8bN7nzzqzNZbVUmF6zmZrHQ5Pouh5vOHO5lc0FC+WGo96nMHrS89qkhUM3tZQD7rlKXkOVhd9gA==
X-Received: by 2002:a63:bd1a:: with SMTP id a26mr14841369pgf.121.1547759680845;
        Thu, 17 Jan 2019 13:14:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n7sm4374072pff.36.2019.01.17.13.14.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:40 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 28/29] hwmon: (ltc4222) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:48 -0800
Message-Id: <1547759629-23007-29-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4222.c | 56 ++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/ltc4222.c b/drivers/hwmon/ltc4222.c
index 88f747292816..32248f351a6e 100644
--- a/drivers/hwmon/ltc4222.c
+++ b/drivers/hwmon/ltc4222.c
@@ -94,7 +94,7 @@ static int ltc4222_get_value(struct device *dev, u8 reg)
 	return val;
 }
 
-static ssize_t ltc4222_show_value(struct device *dev,
+static ssize_t ltc4222_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -106,7 +106,7 @@ static ssize_t ltc4222_show_value(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", value);
 }
 
-static ssize_t ltc4222_show_bool(struct device *dev,
+static ssize_t ltc4222_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
@@ -125,45 +125,39 @@ static ssize_t ltc4222_show_bool(struct device *dev,
 }
 
 /* Voltages */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_SOURCE1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_ADIN1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_SOURCE2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_ADIN2);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc4222_value, LTC4222_SOURCE1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc4222_value, LTC4222_ADIN1);
+static SENSOR_DEVICE_ATTR_RO(in3_input, ltc4222_value, LTC4222_SOURCE2);
+static SENSOR_DEVICE_ATTR_RO(in4_input, ltc4222_value, LTC4222_ADIN2);
 
 /*
  * Voltage alarms
  * UV/OV faults are associated with the input voltage, and power bad and fet
  * faults are associated with the output voltage.
  */
-static SENSOR_DEVICE_ATTR_2(in1_min_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT1, FAULT_UV);
-static SENSOR_DEVICE_ATTR_2(in1_max_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT1, FAULT_OV);
-static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT1, FAULT_POWER_BAD | FAULT_FET_BAD);
-
-static SENSOR_DEVICE_ATTR_2(in3_min_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT2, FAULT_UV);
-static SENSOR_DEVICE_ATTR_2(in3_max_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT2, FAULT_OV);
-static SENSOR_DEVICE_ATTR_2(in4_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT2, FAULT_POWER_BAD | FAULT_FET_BAD);
+static SENSOR_DEVICE_ATTR_2_RO(in1_min_alarm, ltc4222_bool, LTC4222_FAULT1,
+			       FAULT_UV);
+static SENSOR_DEVICE_ATTR_2_RO(in1_max_alarm, ltc4222_bool, LTC4222_FAULT1,
+			       FAULT_OV);
+static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, ltc4222_bool, LTC4222_FAULT1,
+			       FAULT_POWER_BAD | FAULT_FET_BAD);
+
+static SENSOR_DEVICE_ATTR_2_RO(in3_min_alarm, ltc4222_bool, LTC4222_FAULT2,
+			       FAULT_UV);
+static SENSOR_DEVICE_ATTR_2_RO(in3_max_alarm, ltc4222_bool, LTC4222_FAULT2,
+			       FAULT_OV);
+static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, ltc4222_bool, LTC4222_FAULT2,
+			       FAULT_POWER_BAD | FAULT_FET_BAD);
 
 /* Current (via sense resistor) */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_SENSE1);
-static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc4222_show_value, NULL,
-			  LTC4222_SENSE2);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc4222_value, LTC4222_SENSE1);
+static SENSOR_DEVICE_ATTR_RO(curr2_input, ltc4222_value, LTC4222_SENSE2);
 
 /* Overcurrent alarm */
-static SENSOR_DEVICE_ATTR_2(curr1_max_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT1, FAULT_OC);
-static SENSOR_DEVICE_ATTR_2(curr2_max_alarm, S_IRUGO, ltc4222_show_bool, NULL,
-			    LTC4222_FAULT2, FAULT_OC);
+static SENSOR_DEVICE_ATTR_2_RO(curr1_max_alarm, ltc4222_bool, LTC4222_FAULT1,
+			       FAULT_OC);
+static SENSOR_DEVICE_ATTR_2_RO(curr2_max_alarm, ltc4222_bool, LTC4222_FAULT2,
+			       FAULT_OC);
 
 static struct attribute *ltc4222_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
-- 
2.7.4

