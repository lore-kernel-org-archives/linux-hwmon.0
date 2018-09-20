Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41154 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id b12-v6so4380315plr.8
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:57 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/13] hwmon: (nct6775) Separate fan/pwm configuration detection for NCT6795D
Date: Thu, 20 Sep 2018 06:45:37 -0700
Message-Id: <1537451141-27242-9-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Separate fan/pwm configuration detection for NCT6795D into separate
case statement to make the code easier to read.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 556b4cfacbd1..d9c2b934321d 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3542,6 +3542,19 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			pwm6pin |= creb & BIT(2);
 			break;
 		case nct6795:
+			fan5pin |= cr1b & BIT(5);
+			fan5pin |= creb & BIT(5);
+
+			fan6pin = (cr2a & BIT(4)) &&
+					(!dsw_en || (cred & BIT(4)));
+			fan6pin |= creb & BIT(3);
+
+			pwm5pin |= cr2d & BIT(7);
+			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+
+			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
+			pwm6pin |= creb & BIT(2);
+			break;
 		case nct6796:
 			pwm5pin |= cr2d & BIT(7);
 			fan5pin |= cr1b & BIT(5);
@@ -3561,10 +3574,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 					(!dsw_en || (cred & BIT(4)));
 			pwm6pin |= (cr2a & BIT(3)) && (cred & BIT(2));
 
-			if (data->kind == nct6796) {
-				fan7pin = !(cr2b & BIT(2));
-				pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
-			}
+			fan7pin = !(cr2b & BIT(2));
+			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 
 			break;
 		default:	/* NCT6779D */
-- 
2.7.4
