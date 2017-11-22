Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:46042 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdKVWI1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Nov 2017 17:08:27 -0500
From: Robert Lippert <roblip@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, xow@google.com,
        Robert Lippert <rlippert@google.com>
Subject: [PATCH] hwmon: (pmbus/lm25066) Swap low/high current coefficients for LM5066(i)
Date: Wed, 22 Nov 2017 14:07:28 -0800
Message-Id: <20171122220728.17861-1-rlippert@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The _L low-current mode coefficient values should reference the
datasheet rows with CL=VDD but it seems were mistakenly pulled from
the rows with CL=GND.

This causes the current/power to be reported as approximately double
the actual value when CL=GND and half the actual value when CL=VDD.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 drivers/hwmon/pmbus/lm25066.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 10d17fb8f283..aa052f4449a9 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -191,19 +191,19 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10753,
+			.m = 5405,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5405,
+			.m = 10753,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
+			.m = 605,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 605,
+			.m = 1204,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -222,23 +222,23 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 15076,
-			.b = -504,
+			.m = 7645,
+			.b = 100,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 7645,
-			.b = 100,
+			.m = 15076,
+			.b = -504,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1701,
-			.b = -4000,
+			.m = 861,
+			.b = -965,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 861,
-			.b = -965,
+			.m = 1701,
+			.b = -4000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
-- 
2.15.0.448.gf294e3d99a-goog

