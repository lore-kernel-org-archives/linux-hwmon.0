Return-Path: <SRS0=3GeG=BK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8DCC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50DCF22B3F
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGaTrV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 31 Jul 2020 15:47:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:37015 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgGaTrV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jul 2020 15:47:21 -0400
IronPort-SDR: lN2aQ/SYELmJumDITTmJW2B4M63bDiKfeVVqjmnLfQ/qLFdClWTWHEhtv67MgFVyxrXzo55Y0C
 VMvN9jef6QBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151828914"
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="151828914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 12:47:19 -0700
IronPort-SDR: rEbvuRthESSPszQeAEhRu3JxqJmtTMzCXPqoMva4ja2cq0EG83Oe8OhNVEpxio27Bz6gAB5awI
 b9NMY6ZhTgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="491587272"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 12:47:19 -0700
Received: from zlukwins-pc.igk.intel.com (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 87449580713;
        Fri, 31 Jul 2020 12:47:18 -0700 (PDT)
From:   Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH 3/3] hwmon: (pmbus/core) Add support for rated attributes
Date:   Fri, 31 Jul 2020 21:37:17 +0200
Message-Id: <1596224237-32280-4-git-send-email-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
References: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding implementation for new attributes (rated_min/rated_max) to
cover PMBus specification about rated values reporting:
MFR_VIN_MIN, MFR_VIN_MAX, MFR_IIN_MAX, MFR_PIN_MAX, MFR_VOUT_MIN,
MFR_VOUT_MAX, MFR_IOUT_MAX, MFR_POUT_MAX, MFR_MAX_TEMP_1/2/3.

Tested with OpenBMC stack. All rated attributes were available
and reported correct values.

Signed-off-by: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
---
 Documentation/hwmon/pmbus.rst    | 15 +++++++++++-
 drivers/hwmon/pmbus/pmbus.h      | 13 +++++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 49 +++++++++++++++++++++++++++++++++-------
 3 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index 2658dde..fd3403b 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -211,6 +211,10 @@ inX_lcrit_alarm		Voltage critical low alarm.
 inX_crit_alarm		Voltage critical high alarm.
 			From VOLTAGE_OV_FAULT status.
 inX_label		"vin", "vcap", or "voutY"
+inX_rated_min		Minimum rated voltage.
+			From MFR_VIN_MIN or MFR_VOUT_MIN register.
+inX_rated_max		Maximum rated voltage.
+			From MFR_VIN_MAX or MFR_VOUT_MAX register.
 
 currX_input		Measured current. From READ_IIN or READ_IOUT register.
 currX_max		Maximum current.
@@ -230,6 +234,8 @@ currX_crit_alarm	Current critical high alarm.
 currX_label		"iin", "iinY", "iinY.Z", "ioutY", or "ioutY.Z",
 			where Y reflects the page number and Z reflects the
 			phase.
+currX_rated_max		Maximum rated current.
+			From MFR_IIN_MAX or MFR_IOUT_MAX register.
 
 powerX_input		Measured power. From READ_PIN or READ_POUT register.
 powerX_cap		Output power cap. From POUT_MAX register.
@@ -244,10 +250,12 @@ powerX_crit_alarm	Output power critical high alarm.
 powerX_label		"pin", "pinY", "pinY.Z", "poutY", or "poutY.Z",
 			where Y reflects the page number and Z reflects the
 			phase.
+powerX_rated_max	Maximum rated power.
+			From MFR_PIN_MAX or MFR_POUT_MAX register.
 
 tempX_input		Measured temperature.
 			From READ_TEMPERATURE_X register.
-tempX_min		Mimimum temperature. From UT_WARN_LIMIT register.
+tempX_min		Minimum temperature. From UT_WARN_LIMIT register.
 tempX_max		Maximum temperature. From OT_WARN_LIMIT register.
 tempX_lcrit		Critical low temperature.
 			From UT_FAULT_LIMIT register.
@@ -265,4 +273,9 @@ tempX_lcrit_alarm	Chip temperature critical low alarm. Set by comparing
 tempX_crit_alarm	Chip temperature critical high alarm. Set by comparing
 			READ_TEMPERATURE_X with OT_FAULT_LIMIT if
 			TEMP_OT_FAULT status is set.
+tempX_rated_min		Minimum rated temperature.
+			From MFR_TAMBIENT_MIN register.
+tempX_rated_max		Maximum rated temperature.
+			From MFR_TAMBIENT_MAX, MFR_MAX_TEMP_1, MFR_MAX_TEMP_2 or
+			MFR_MAX_TEMP_3 register.
 ======================= ========================================================
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 18e06fc..6d9f2cf 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -119,9 +119,22 @@ enum pmbus_regs {
 	PMBUS_MFR_DATE			= 0x9D,
 	PMBUS_MFR_SERIAL		= 0x9E,
 
+	PMBUS_MFR_VIN_MIN		= 0xA0,
+	PMBUS_MFR_VIN_MAX		= 0xA1,
+	PMBUS_MFR_IIN_MAX		= 0xA2,
+	PMBUS_MFR_PIN_MAX		= 0xA3,
+	PMBUS_MFR_VOUT_MIN		= 0xA4,
+	PMBUS_MFR_VOUT_MAX		= 0xA5,
+	PMBUS_MFR_IOUT_MAX		= 0xA6,
+	PMBUS_MFR_POUT_MAX		= 0xA7,
+
 	PMBUS_IC_DEVICE_ID		= 0xAD,
 	PMBUS_IC_DEVICE_REV		= 0xAE,
 
+	PMBUS_MFR_MAX_TEMP_1		= 0xC0,
+	PMBUS_MFR_MAX_TEMP_2		= 0xC1,
+	PMBUS_MFR_MAX_TEMP_3		= 0xC2,
+
 /*
  * Virtual registers.
  * Useful to support attributes which are not supported by standard PMBus
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2191575..e51fb04 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1408,6 +1408,12 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_VIN_HISTORY,
 		.attr = "reset_history",
+	}, {
+		.reg = PMBUS_MFR_VIN_MIN,
+		.attr = "rated_min",
+	}, {
+		.reg = PMBUS_MFR_VIN_MAX,
+		.attr = "rated_max",
 	},
 };
 
@@ -1471,7 +1477,13 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_VOUT_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_VOUT_MIN,
+		.attr = "rated_min",
+	}, {
+		.reg = PMBUS_MFR_VOUT_MAX,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_sensor_attr voltage_attributes[] = {
@@ -1541,7 +1553,10 @@ static const struct pmbus_limit_attr iin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_IIN_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_IIN_MAX,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_limit_attr iout_limit_attrs[] = {
@@ -1575,7 +1590,10 @@ static const struct pmbus_limit_attr iout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_IOUT_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_IOUT_MAX,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_sensor_attr current_attributes[] = {
@@ -1626,7 +1644,10 @@ static const struct pmbus_limit_attr pin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_PIN_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_PIN_MAX,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_limit_attr pout_limit_attrs[] = {
@@ -1660,7 +1681,10 @@ static const struct pmbus_limit_attr pout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_POUT_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_POUT_MAX,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_sensor_attr power_attributes[] = {
@@ -1724,7 +1748,10 @@ static const struct pmbus_limit_attr temp_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_MAX_TEMP_1,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_limit_attr temp_limit_attrs2[] = {
@@ -1762,7 +1789,10 @@ static const struct pmbus_limit_attr temp_limit_attrs2[] = {
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP2_HISTORY,
 		.attr = "reset_history",
-	}
+	}, {
+		.reg = PMBUS_MFR_MAX_TEMP_2,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_limit_attr temp_limit_attrs3[] = {
@@ -1788,7 +1818,10 @@ static const struct pmbus_limit_attr temp_limit_attrs3[] = {
 		.attr = "crit",
 		.alarm = "crit_alarm",
 		.sbit = PB_TEMP_OT_FAULT,
-	}
+	}, {
+		.reg = PMBUS_MFR_MAX_TEMP_3,
+		.attr = "rated_max",
+	},
 };
 
 static const struct pmbus_sensor_attr temp_attributes[] = {
-- 
2.7.4

