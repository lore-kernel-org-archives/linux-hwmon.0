Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45966 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT32 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id w9-v6so1268444pgc.12
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:54 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/13] hwmon: (nct6775) Fix fan6/pwm6 detection for NCT6792D
Date: Thu, 20 Sep 2018 06:45:35 -0700
Message-Id: <1537451141-27242-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Per datasheet, AUXFANIN3 (fan6) and AUXFANOUT3 (pwm6) are only connected
if DSW_EN is false.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 0ad4bf0ab8be..6e11df697e6e 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3522,10 +3522,13 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 		switch (data->kind) {
 		case nct6791:
-		case nct6792:
 			fan6pin = cr2d & BIT(1);
 			pwm6pin = cr2d & BIT(0);
 			break;
+		case nct6792:
+			fan6pin = !dsw_en && (cr2d & BIT(1));
+			pwm6pin = !dsw_en && (cr2d & BIT(0));
+			break;
 		case nct6793:
 		case nct6795:
 		case nct6796:
-- 
2.7.4
