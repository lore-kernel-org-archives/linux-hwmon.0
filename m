Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33290 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbeLJWIz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:08:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id z11so5626853pgu.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:55 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/30] hwmon: (acpi_power_meter) Replace S_<PERMS> with octal values
Date: Mon, 10 Dec 2018 14:08:20 -0800
Message-Id: <1544479728-30077-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 34e45b97629e..e98591fa2528 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -638,12 +638,12 @@ static int register_attrs(struct acpi_power_meter_resource *resource,
 
 	while (attrs->label) {
 		sensors->dev_attr.attr.name = attrs->label;
-		sensors->dev_attr.attr.mode = S_IRUGO;
+		sensors->dev_attr.attr.mode = 0444;
 		sensors->dev_attr.show = attrs->show;
 		sensors->index = attrs->index;
 
 		if (attrs->set) {
-			sensors->dev_attr.attr.mode |= S_IWUSR;
+			sensors->dev_attr.attr.mode |= 0200;
 			sensors->dev_attr.store = attrs->set;
 		}
 
-- 
2.7.4
