Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34268 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdCCXL2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Mar 2017 18:11:28 -0500
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
Date: Fri,  3 Mar 2017 23:41:52 +0100
Message-Id: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

It was reported that dell-smm-hwmon is working fine on Dell XPS 15 9560.

Link: http://www.spinics.net/lists/platform-driver-x86/msg10751.html
Reported-by: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 34704b0..3189246 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -995,6 +995,13 @@ enum i8k_configs {
 		},
 		.driver_data = (void *)&i8k_config_data[DELL_XPS],
 	},
+	{
+		.ident = "Dell XPS 15 9560",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
+		},
+	},
 	{ }
 };
 
-- 
1.7.9.5

