Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37643 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id 2-v6so4473403pgo.4
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:51 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/13] hwmon: (nct6775) Declare and initialize LDN specific config variables earlier
Date: Thu, 20 Sep 2018 06:45:32 -0700
Message-Id: <1537451141-27242-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Declare and initialize LDN / chip specific configuration variables
earlier. This simplifies re-using the configuration variables for
multiple chips and makes the code easier to read.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index aa8a44608ca3..984b22d4999a 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3505,6 +3505,12 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		int cr2d = superio_inb(sioreg, 0x2d);
 		int cr2f = superio_inb(sioreg, 0x2f);
 		bool dsw_en = cr2f & BIT(3);
+		int creb;
+		int cred;
+
+		superio_select(sioreg, NCT6775_LD_12);
+		creb = superio_inb(sioreg, 0xeb);
+		cred = superio_inb(sioreg, 0xed);
 
 		fan3pin = !(cr1c & BIT(5));
 		fan4pin = !(cr1c & BIT(6));
@@ -3529,10 +3535,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			if (!fan5pin)
 				fan5pin = cr1b & BIT(5);
 
-			superio_select(sioreg, NCT6775_LD_12);
 			if (data->kind != nct6796) {
-				int creb = superio_inb(sioreg, 0xeb);
-
 				if (!dsw_en) {
 					fan6pin = cr2d & BIT(1);
 					pwm6pin = cr2d & BIT(0);
@@ -3550,8 +3553,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			}
 
 			if (data->kind == nct6795 || data->kind == nct6796) {
-				int cred = superio_inb(sioreg, 0xed);
-
 				if (!fan6pin)
 					fan6pin = (cr2a & BIT(4)) &&
 					  (!dsw_en || (cred & BIT(4)));
-- 
2.7.4
