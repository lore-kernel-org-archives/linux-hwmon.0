Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36073 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT31 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id p5-v6so4388759plk.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:53 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/13] hwmon: (nct6775) Improve instruction grouping
Date: Thu, 20 Sep 2018 06:45:34 -0700
Message-Id: <1537451141-27242-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When determining support for a given fan or pwm control, the code is
easier to read if the necessary instructions are grouped together.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 0f20f7c2a96b..0ad4bf0ab8be 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3530,16 +3530,16 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		case nct6795:
 		case nct6796:
 			pwm5pin |= cr2d & BIT(7);
-
 			fan5pin |= cr1b & BIT(5);
 
 			if (data->kind != nct6796) {
-				fan6pin = !dsw_en && (cr2d & BIT(1));
-				pwm6pin = !dsw_en && (cr2d & BIT(0));
-
 				fan5pin |= creb & BIT(5);
 				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+
+				fan6pin = !dsw_en && (cr2d & BIT(1));
 				fan6pin |= creb & BIT(3);
+
+				pwm6pin = !dsw_en && (cr2d & BIT(0));
 				pwm6pin |= creb & BIT(2);
 			}
 
-- 
2.7.4
