Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from confino.investici.org ([212.103.72.250]:29124 "EHLO
        confino.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbeK1Kcu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Nov 2018 05:32:50 -0500
From: Michele Sorcinelli <michelesr@autistici.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Michele Sorcinelli <michelesr@autistici.org>
Subject: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
Date: Tue, 27 Nov 2018 23:06:37 +0000
Message-Id: <20181127230637.8673-1-michelesr@autistici.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Allow the module to be loaded on Dell XPS 9570, without having to use
the "force=1" option. The module loads without problems, and reports
correct fan values:

    $ time cat /proc/i8k
    1.0 1.5 -1 35 0 0 0 0 -1 -22
    cat /proc/i8k  0.00s user 0.00s system 7% cpu 0.033 total

However, the call may freeze the kernel for a very small time due to
code running in the SSM layer. This is a known issue with the driver, and
can be reproduced with other supported models. Average execution
time is 33 ms.

The command line tools from i8kutils can properly set the fan speed,
although the firmware will override it, unless automatic fan
control is disabled with the proper SSM call.

Average fans speed (when firwmare automatic control is off):

STATE -> RPM
0 0 -> 0 0
1 1 -> 2500 2500
2 2 -> 5100 5100
3 3 -> same as 2 2
---
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 9d3ef879d..367a8a617 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1017,6 +1017,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
 		},
 	},
+	{
+		.ident = "Dell XPS 15 9570",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
+		},
+	},
 	{ }
 };
 
-- 
2.19.2
