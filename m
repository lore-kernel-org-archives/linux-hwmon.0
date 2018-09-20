Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44474 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1-v6so4456183pgp.11
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:56 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/13] hwmon: (nct6775) Separate fan/pwm configuration detection for NCT6793D
Date: Thu, 20 Sep 2018 06:45:36 -0700
Message-Id: <1537451141-27242-8-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

While detecting the configuration for multiple chips in one go reduces
code size, it also increases code complexity. Separate chip detection
to improve code readability. As first step, separate detection for
NCT6793D.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 6e11df697e6e..556b4cfacbd1 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3530,6 +3530,17 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			pwm6pin = !dsw_en && (cr2d & BIT(0));
 			break;
 		case nct6793:
+			fan5pin |= cr1b & BIT(5);
+			fan5pin |= creb & BIT(5);
+
+			fan6pin = creb & BIT(3);
+
+			pwm5pin |= cr2d & BIT(7);
+			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+
+			pwm6pin = !dsw_en && (cr2d & BIT(0));
+			pwm6pin |= creb & BIT(2);
+			break;
 		case nct6795:
 		case nct6796:
 			pwm5pin |= cr2d & BIT(7);
@@ -3546,11 +3557,9 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 				pwm6pin |= creb & BIT(2);
 			}
 
-			if (data->kind == nct6795 || data->kind == nct6796) {
-				fan6pin |= (cr2a & BIT(4)) &&
-						(!dsw_en || (cred & BIT(4)));
-				pwm6pin |= (cr2a & BIT(3)) && (cred & BIT(2));
-			}
+			fan6pin |= (cr2a & BIT(4)) &&
+					(!dsw_en || (cred & BIT(4)));
+			pwm6pin |= (cr2a & BIT(3)) && (cred & BIT(2));
 
 			if (data->kind == nct6796) {
 				fan7pin = !(cr2b & BIT(2));
-- 
2.7.4
