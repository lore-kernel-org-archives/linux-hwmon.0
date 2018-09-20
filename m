Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45076 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT30 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id i26-v6so4393398pfo.12
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:52 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/13] hwmon: (nct6775) Use logical or instead of if statements where possible
Date: Thu, 20 Sep 2018 06:45:33 -0700
Message-Id: <1537451141-27242-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use
	boolean |= <expression>;
instead of
	if (!boolean)
		boolean = <expression>;
to assign values to boolean variables.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 984b22d4999a..0f20f7c2a96b 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3529,36 +3529,24 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		case nct6793:
 		case nct6795:
 		case nct6796:
-			if (!pwm5pin)
-				pwm5pin = cr2d & BIT(7);
+			pwm5pin |= cr2d & BIT(7);
 
-			if (!fan5pin)
-				fan5pin = cr1b & BIT(5);
+			fan5pin |= cr1b & BIT(5);
 
 			if (data->kind != nct6796) {
-				if (!dsw_en) {
-					fan6pin = cr2d & BIT(1);
-					pwm6pin = cr2d & BIT(0);
-				}
+				fan6pin = !dsw_en && (cr2d & BIT(1));
+				pwm6pin = !dsw_en && (cr2d & BIT(0));
 
-				if (!fan5pin)
-					fan5pin = creb & BIT(5);
-				if (!pwm5pin)
-					pwm5pin = (creb & BIT(4)) &&
-						!(cr2a & BIT(0));
-				if (!fan6pin)
-					fan6pin = creb & BIT(3);
-				if (!pwm6pin)
-					pwm6pin = creb & BIT(2);
+				fan5pin |= creb & BIT(5);
+				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+				fan6pin |= creb & BIT(3);
+				pwm6pin |= creb & BIT(2);
 			}
 
 			if (data->kind == nct6795 || data->kind == nct6796) {
-				if (!fan6pin)
-					fan6pin = (cr2a & BIT(4)) &&
-					  (!dsw_en || (cred & BIT(4)));
-				if (!pwm6pin)
-					pwm6pin = (cr2a & BIT(3)) &&
-					  (cred & BIT(2));
+				fan6pin |= (cr2a & BIT(4)) &&
+						(!dsw_en || (cred & BIT(4)));
+				pwm6pin |= (cr2a & BIT(3)) && (cred & BIT(2));
 			}
 
 			if (data->kind == nct6796) {
-- 
2.7.4
