Return-Path: <SRS0=3GeG=BK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CECC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B309D2087C
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgGaTrR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 31 Jul 2020 15:47:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:37015 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgGaTrR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jul 2020 15:47:17 -0400
IronPort-SDR: 029Avdq692uFN8cx3XYUIEfdP09bmr0L9g4qmidp4n5yvLiJ/RYXr9C9CUd3RvlGwvSh9GbsBW
 DAgM+ErVL/MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151828908"
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="151828908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 12:47:16 -0700
IronPort-SDR: GVKMXqhWFyly6XPQuyITuhpJ6wzNx48jT7th8NLrhC+I35+yRY0fRsd9FILaFq7w29iTS0BHgD
 9y/w+qeS/ySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="291308157"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2020 12:47:16 -0700
Received: from zlukwins-pc.igk.intel.com (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 3D99958027C;
        Fri, 31 Jul 2020 12:47:15 -0700 (PDT)
From:   Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH 2/3] hwmon: (core) Add support for rated attributes
Date:   Fri, 31 Jul 2020 21:37:16 +0200
Message-Id: <1596224237-32280-3-git-send-email-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
References: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding implementation for new attributes (rated_min/rated_max) for
currentX, inX, powerX, tempX and humidityX.

Tested with OpenBMC stack and simple hwmon driver using
rated_min/rated_max for the following types of sensors: hwmon_temp,
hwmon_in, hwmon_curr, hwmon_power, hwmon_humidity.
For each sensor rated attributes were available and returned
expected values.

Signed-off-by: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
---
 drivers/hwmon/hwmon.c | 10 ++++++++++
 include/linux/hwmon.h | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3f596a5..6c68405 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -431,6 +431,8 @@ static const char * const hwmon_temp_attr_templates[] = {
 	[hwmon_temp_lowest] = "temp%d_lowest",
 	[hwmon_temp_highest] = "temp%d_highest",
 	[hwmon_temp_reset_history] = "temp%d_reset_history",
+	[hwmon_temp_rated_min] = "temp%d_rated_min",
+	[hwmon_temp_rated_max] = "temp%d_rated_max",
 };
 
 static const char * const hwmon_in_attr_templates[] = {
@@ -450,6 +452,8 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max_alarm] = "in%d_max_alarm",
 	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
 	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
+	[hwmon_in_rated_min] = "in%d_rated_min",
+	[hwmon_in_rated_max] = "in%d_rated_max",
 };
 
 static const char * const hwmon_curr_attr_templates[] = {
@@ -469,6 +473,8 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max_alarm] = "curr%d_max_alarm",
 	[hwmon_curr_lcrit_alarm] = "curr%d_lcrit_alarm",
 	[hwmon_curr_crit_alarm] = "curr%d_crit_alarm",
+	[hwmon_curr_rated_min] = "curr%d_rated_min",
+	[hwmon_curr_rated_max] = "curr%d_rated_max",
 };
 
 static const char * const hwmon_power_attr_templates[] = {
@@ -501,6 +507,8 @@ static const char * const hwmon_power_attr_templates[] = {
 	[hwmon_power_max_alarm] = "power%d_max_alarm",
 	[hwmon_power_lcrit_alarm] = "power%d_lcrit_alarm",
 	[hwmon_power_crit_alarm] = "power%d_crit_alarm",
+	[hwmon_power_rated_min] = "power%d_rated_min",
+	[hwmon_power_rated_max] = "power%d_rated_max",
 };
 
 static const char * const hwmon_energy_attr_templates[] = {
@@ -519,6 +527,8 @@ static const char * const hwmon_humidity_attr_templates[] = {
 	[hwmon_humidity_max_hyst] = "humidity%d_max_hyst",
 	[hwmon_humidity_alarm] = "humidity%d_alarm",
 	[hwmon_humidity_fault] = "humidity%d_fault",
+	[hwmon_humidity_rated_min] = "humidity%d_rated_min",
+	[hwmon_humidity_rated_max] = "humidity%d_rated_max",
 };
 
 static const char * const hwmon_fan_attr_templates[] = {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 363d4a8..1e8d6ea 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -85,6 +85,8 @@ enum hwmon_temp_attributes {
 	hwmon_temp_lowest,
 	hwmon_temp_highest,
 	hwmon_temp_reset_history,
+	hwmon_temp_rated_min,
+	hwmon_temp_rated_max,
 };
 
 #define HWMON_T_ENABLE		BIT(hwmon_temp_enable)
@@ -112,6 +114,8 @@ enum hwmon_temp_attributes {
 #define HWMON_T_LOWEST		BIT(hwmon_temp_lowest)
 #define HWMON_T_HIGHEST		BIT(hwmon_temp_highest)
 #define HWMON_T_RESET_HISTORY	BIT(hwmon_temp_reset_history)
+#define HWMON_T_RATED_MIN	BIT(hwmon_temp_rated_min)
+#define HWMON_T_RATED_MAX	BIT(hwmon_temp_rated_max)
 
 enum hwmon_in_attributes {
 	hwmon_in_enable,
@@ -130,6 +134,8 @@ enum hwmon_in_attributes {
 	hwmon_in_max_alarm,
 	hwmon_in_lcrit_alarm,
 	hwmon_in_crit_alarm,
+	hwmon_in_rated_min,
+	hwmon_in_rated_max,
 };
 
 #define HWMON_I_ENABLE		BIT(hwmon_in_enable)
@@ -148,6 +154,8 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
 #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
 #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
+#define HWMON_I_RATED_MIN	BIT(hwmon_in_rated_min)
+#define HWMON_I_RATED_MAX	BIT(hwmon_in_rated_max)
 
 enum hwmon_curr_attributes {
 	hwmon_curr_enable,
@@ -166,6 +174,8 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max_alarm,
 	hwmon_curr_lcrit_alarm,
 	hwmon_curr_crit_alarm,
+	hwmon_curr_rated_min,
+	hwmon_curr_rated_max,
 };
 
 #define HWMON_C_ENABLE		BIT(hwmon_curr_enable)
@@ -184,6 +194,8 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX_ALARM	BIT(hwmon_curr_max_alarm)
 #define HWMON_C_LCRIT_ALARM	BIT(hwmon_curr_lcrit_alarm)
 #define HWMON_C_CRIT_ALARM	BIT(hwmon_curr_crit_alarm)
+#define HWMON_C_RATED_MIN	BIT(hwmon_curr_rated_min)
+#define HWMON_C_RATED_MAX	BIT(hwmon_curr_rated_max)
 
 enum hwmon_power_attributes {
 	hwmon_power_enable,
@@ -215,6 +227,8 @@ enum hwmon_power_attributes {
 	hwmon_power_max_alarm,
 	hwmon_power_lcrit_alarm,
 	hwmon_power_crit_alarm,
+	hwmon_power_rated_min,
+	hwmon_power_rated_max,
 };
 
 #define HWMON_P_ENABLE			BIT(hwmon_power_enable)
@@ -246,6 +260,8 @@ enum hwmon_power_attributes {
 #define HWMON_P_MAX_ALARM		BIT(hwmon_power_max_alarm)
 #define HWMON_P_LCRIT_ALARM		BIT(hwmon_power_lcrit_alarm)
 #define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
+#define HWMON_P_RATED_MIN		BIT(hwmon_power_rated_min)
+#define HWMON_P_RATED_MAX		BIT(hwmon_power_rated_max)
 
 enum hwmon_energy_attributes {
 	hwmon_energy_enable,
@@ -267,6 +283,8 @@ enum hwmon_humidity_attributes {
 	hwmon_humidity_max_hyst,
 	hwmon_humidity_alarm,
 	hwmon_humidity_fault,
+	hwmon_humidity_rated_min,
+	hwmon_humidity_rated_max,
 };
 
 #define HWMON_H_ENABLE			BIT(hwmon_humidity_enable)
@@ -278,6 +296,8 @@ enum hwmon_humidity_attributes {
 #define HWMON_H_MAX_HYST		BIT(hwmon_humidity_max_hyst)
 #define HWMON_H_ALARM			BIT(hwmon_humidity_alarm)
 #define HWMON_H_FAULT			BIT(hwmon_humidity_fault)
+#define HWMON_H_RATED_MIN		BIT(hwmon_humidity_rated_min)
+#define HWMON_H_RATED_MAX		BIT(hwmon_humidity_rated_max)
 
 enum hwmon_fan_attributes {
 	hwmon_fan_enable,
-- 
2.7.4

