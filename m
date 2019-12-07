Return-Path: <SRS0=6LgM=Z5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0277EC43603
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFB7D2467B
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhVc+iUB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfLGOL6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Dec 2019 09:11:58 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41960 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOL6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Dec 2019 09:11:58 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so3924053plb.8
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Dec 2019 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=WfwtMS2ue8XVUaFAroujQiHorwzPtteK4zLrdHTkSnw=;
        b=nhVc+iUBUogX4lhygprCxnJU3j0J3y7Jw1h0hZheHZXIaJFCGPH6VmWBHuBoBy0xyJ
         Ty1MGtyjlYSI9jbvgvVaGSWHK4O97WxO6lc+AVi4pU5gzjlq3bYIotPk3nrVCKuFo2Q1
         2b8d8+qJwEr+n1C8hVQzcIHuYqhBmoxO39KNnwnI1E4/Z+6qkWYKomisWKJ3VQVBriGR
         VBwkddWixEV1vnVST8C5Aa4JBqIQNEDIvDlRJeo9jYo9Go2BuN//38/67qOTj05LKSgb
         aoiBa71MQAVdmKUJKqSjWCvSOTIyRd2cdVpISQOReb/+gTIrJocQwMsyrT2bmqSwnPUE
         AbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=WfwtMS2ue8XVUaFAroujQiHorwzPtteK4zLrdHTkSnw=;
        b=k91FIiM0eikhyG5mKdsA0hnzRgFyrwWIYP0X8rhRzciHJXcsB8Ead+LCNFbtuTCojx
         QQqNV5TNeOzaFFvtjJ8oFeny2+rgr9Y/3lTd8HN7uoSw9xpIongiBvlPG875fRQLSdv0
         BCUwl6NxwNRCdCiQzB6s7LDIOmvzQBXAepcfJjKOPkAjsX7nyGT9fhNdIWVdBqFPuYAc
         mVsPcbwaMLocm1dSpeO3FClgFmsfrEpBOz62LvR3WdO8Y7fPRCvJWaYCFR01kxRYp6OY
         gj10i8gJ1xJqE4DoJsEgDDp+7CfEf+EY8VZsWoq8V0GFu498AzjWWaZpzue3fYIHoQmn
         yKBQ==
X-Gm-Message-State: APjAAAWTs/CvFHwOiMdGZ1O9RML1BxC+WfkQgIAOvhQTjaCr87aNEKQa
        y9e8wQAGDVM6wG7YrX4JPkjpDOfC
X-Google-Smtp-Source: APXvYqyTsMVsHjVWrF/66APgEBM3iKb47neti3kY2Ngrh52igjCQTavQZU4Pasa18AfQVzRh1pFzHg==
X-Received: by 2002:a17:90a:94cc:: with SMTP id j12mr20941786pjw.3.1575727917118;
        Sat, 07 Dec 2019 06:11:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a3sm6551066pjh.31.2019.12.07.06.11.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2019 06:11:56 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Add support for enable attribute to hwmon core
Date:   Sat,  7 Dec 2019 06:11:51 -0800
Message-Id: <20191207141151.10136-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The hwmon ABI supports enable attributes since commit fb41a710f84e
("hwmon: Document the sensor enable attribute"), but did not
add support for those attributes to the hwmon core. Do that now.

Since the enable attributes are logically the most important attribute,
they are added as first attribute to the attribute list. Move
hwmon_in_enable from last to first place for consistency.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c |  8 +++++++-
 include/linux/hwmon.h | 18 +++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 95a1ae178213..6d9ca25f7587 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -327,6 +327,7 @@ static const char * const hwmon_chip_attrs[] = {
 };
 
 static const char * const hwmon_temp_attr_templates[] = {
+	[hwmon_temp_enable] = "temp%d_enable",
 	[hwmon_temp_input] = "temp%d_input",
 	[hwmon_temp_type] = "temp%d_type",
 	[hwmon_temp_lcrit] = "temp%d_lcrit",
@@ -354,6 +355,7 @@ static const char * const hwmon_temp_attr_templates[] = {
 };
 
 static const char * const hwmon_in_attr_templates[] = {
+	[hwmon_in_enable] = "in%d_enable",
 	[hwmon_in_input] = "in%d_input",
 	[hwmon_in_min] = "in%d_min",
 	[hwmon_in_max] = "in%d_max",
@@ -369,10 +371,10 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max_alarm] = "in%d_max_alarm",
 	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
 	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
-	[hwmon_in_enable] = "in%d_enable",
 };
 
 static const char * const hwmon_curr_attr_templates[] = {
+	[hwmon_curr_enable] = "curr%d_enable",
 	[hwmon_curr_input] = "curr%d_input",
 	[hwmon_curr_min] = "curr%d_min",
 	[hwmon_curr_max] = "curr%d_max",
@@ -391,6 +393,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 };
 
 static const char * const hwmon_power_attr_templates[] = {
+	[hwmon_power_enable] = "power%d_enable",
 	[hwmon_power_average] = "power%d_average",
 	[hwmon_power_average_interval] = "power%d_average_interval",
 	[hwmon_power_average_interval_max] = "power%d_interval_max",
@@ -422,11 +425,13 @@ static const char * const hwmon_power_attr_templates[] = {
 };
 
 static const char * const hwmon_energy_attr_templates[] = {
+	[hwmon_energy_enable] = "energy%d_enable",
 	[hwmon_energy_input] = "energy%d_input",
 	[hwmon_energy_label] = "energy%d_label",
 };
 
 static const char * const hwmon_humidity_attr_templates[] = {
+	[hwmon_humidity_enable] = "humidity%d_enable",
 	[hwmon_humidity_input] = "humidity%d_input",
 	[hwmon_humidity_label] = "humidity%d_label",
 	[hwmon_humidity_min] = "humidity%d_min",
@@ -438,6 +443,7 @@ static const char * const hwmon_humidity_attr_templates[] = {
 };
 
 static const char * const hwmon_fan_attr_templates[] = {
+	[hwmon_fan_enable] = "fan%d_enable",
 	[hwmon_fan_input] = "fan%d_input",
 	[hwmon_fan_label] = "fan%d_label",
 	[hwmon_fan_min] = "fan%d_min",
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index dcda9589cdaf..5e609f25878c 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -60,7 +60,8 @@ enum hwmon_chip_attributes {
 #define HWMON_C_TEMP_SAMPLES		BIT(hwmon_chip_temp_samples)
 
 enum hwmon_temp_attributes {
-	hwmon_temp_input = 0,
+	hwmon_temp_enable,
+	hwmon_temp_input,
 	hwmon_temp_type,
 	hwmon_temp_lcrit,
 	hwmon_temp_lcrit_hyst,
@@ -86,6 +87,7 @@ enum hwmon_temp_attributes {
 	hwmon_temp_reset_history,
 };
 
+#define HWMON_T_ENABLE		BIT(hwmon_temp_enable)
 #define HWMON_T_INPUT		BIT(hwmon_temp_input)
 #define HWMON_T_TYPE		BIT(hwmon_temp_type)
 #define HWMON_T_LCRIT		BIT(hwmon_temp_lcrit)
@@ -112,6 +114,7 @@ enum hwmon_temp_attributes {
 #define HWMON_T_RESET_HISTORY	BIT(hwmon_temp_reset_history)
 
 enum hwmon_in_attributes {
+	hwmon_in_enable,
 	hwmon_in_input,
 	hwmon_in_min,
 	hwmon_in_max,
@@ -127,9 +130,9 @@ enum hwmon_in_attributes {
 	hwmon_in_max_alarm,
 	hwmon_in_lcrit_alarm,
 	hwmon_in_crit_alarm,
-	hwmon_in_enable,
 };
 
+#define HWMON_I_ENABLE		BIT(hwmon_in_enable)
 #define HWMON_I_INPUT		BIT(hwmon_in_input)
 #define HWMON_I_MIN		BIT(hwmon_in_min)
 #define HWMON_I_MAX		BIT(hwmon_in_max)
@@ -145,9 +148,9 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
 #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
 #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
-#define HWMON_I_ENABLE		BIT(hwmon_in_enable)
 
 enum hwmon_curr_attributes {
+	hwmon_curr_enable,
 	hwmon_curr_input,
 	hwmon_curr_min,
 	hwmon_curr_max,
@@ -165,6 +168,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_crit_alarm,
 };
 
+#define HWMON_C_ENABLE		BIT(hwmon_curr_enable)
 #define HWMON_C_INPUT		BIT(hwmon_curr_input)
 #define HWMON_C_MIN		BIT(hwmon_curr_min)
 #define HWMON_C_MAX		BIT(hwmon_curr_max)
@@ -182,6 +186,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_CRIT_ALARM	BIT(hwmon_curr_crit_alarm)
 
 enum hwmon_power_attributes {
+	hwmon_power_enable,
 	hwmon_power_average,
 	hwmon_power_average_interval,
 	hwmon_power_average_interval_max,
@@ -212,6 +217,7 @@ enum hwmon_power_attributes {
 	hwmon_power_crit_alarm,
 };
 
+#define HWMON_P_ENABLE			BIT(hwmon_power_enable)
 #define HWMON_P_AVERAGE			BIT(hwmon_power_average)
 #define HWMON_P_AVERAGE_INTERVAL	BIT(hwmon_power_average_interval)
 #define HWMON_P_AVERAGE_INTERVAL_MAX	BIT(hwmon_power_average_interval_max)
@@ -242,14 +248,17 @@ enum hwmon_power_attributes {
 #define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
 
 enum hwmon_energy_attributes {
+	hwmon_energy_enable,
 	hwmon_energy_input,
 	hwmon_energy_label,
 };
 
+#define HWMON_E_ENABLE			BIT(hwmon_energy_enable)
 #define HWMON_E_INPUT			BIT(hwmon_energy_input)
 #define HWMON_E_LABEL			BIT(hwmon_energy_label)
 
 enum hwmon_humidity_attributes {
+	hwmon_humidity_enable,
 	hwmon_humidity_input,
 	hwmon_humidity_label,
 	hwmon_humidity_min,
@@ -260,6 +269,7 @@ enum hwmon_humidity_attributes {
 	hwmon_humidity_fault,
 };
 
+#define HWMON_H_ENABLE			BIT(hwmon_humidity_enable)
 #define HWMON_H_INPUT			BIT(hwmon_humidity_input)
 #define HWMON_H_LABEL			BIT(hwmon_humidity_label)
 #define HWMON_H_MIN			BIT(hwmon_humidity_min)
@@ -270,6 +280,7 @@ enum hwmon_humidity_attributes {
 #define HWMON_H_FAULT			BIT(hwmon_humidity_fault)
 
 enum hwmon_fan_attributes {
+	hwmon_fan_enable,
 	hwmon_fan_input,
 	hwmon_fan_label,
 	hwmon_fan_min,
@@ -283,6 +294,7 @@ enum hwmon_fan_attributes {
 	hwmon_fan_fault,
 };
 
+#define HWMON_F_ENABLE			BIT(hwmon_fan_enable)
 #define HWMON_F_INPUT			BIT(hwmon_fan_input)
 #define HWMON_F_LABEL			BIT(hwmon_fan_label)
 #define HWMON_F_MIN			BIT(hwmon_fan_min)
-- 
2.17.1

