Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:37384 "EHLO
        faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935348AbeFMPVD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jun 2018 11:21:03 -0400
From: Jakob Albert <jakob.j.albert@fau.de>
To: devel@linuxdriverproject.org
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenz Kaestle <lorenz.kaestle@fau.de>,
        linux-kernel@i4.cs.fau.de, Jakob Albert <jakob.j.albert@fau.de>
Subject: [PATCH v2 2/3] hwmon: (nct7904) Fix CODE_INDENT error
Date: Wed, 13 Jun 2018 17:13:24 +0200
Message-Id: <1528902805-21474-3-git-send-email-jakob.j.albert@fau.de>
In-Reply-To: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
References: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix CODE_INDENT error reported by checkpatch.pl

Signed-off-by: Lorenz Kaestle <lorenz.kaestle@fau.de>
Signed-off-by: Jakob Albert <jakob.j.albert@fau.de>
---
v1->v2:	Changed patch subject and description

 drivers/hwmon/nct7904.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 7de2421..657ce88 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -431,15 +431,15 @@ static const struct hwmon_channel_info nct7904_in = {
 };
 
 static const u32 nct7904_fan_config[] = {
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-            HWMON_F_INPUT,
-	    0
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	0
 };
 
 static const struct hwmon_channel_info nct7904_fan = {
@@ -448,11 +448,11 @@ static const struct hwmon_channel_info nct7904_fan = {
 };
 
 static const u32 nct7904_pwm_config[] = {
-            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	    0
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	0
 };
 
 static const struct hwmon_channel_info nct7904_pwm = {
@@ -461,16 +461,16 @@ static const struct hwmon_channel_info nct7904_pwm = {
 };
 
 static const u32 nct7904_temp_config[] = {
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-            HWMON_T_INPUT,
-	    0
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	0
 };
 
 static const struct hwmon_channel_info nct7904_temp = {
-- 
2.7.4

