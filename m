Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53793 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756310AbcIKTmz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Sep 2016 15:42:55 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6775) Add support for multiple virtual temperature sources
Date: Sun, 11 Sep 2016 12:42:52 -0700
Message-Id: <1473622972-26377-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

For virtual temperatures, the actual temperature values are written
by software, presumably by the BIOS. This functionality is (as of
right now) supported on NCT6791D, NCT6792D, and NCT6793D. On those chips,
the temperatures are written into registers 0xea..0xef on page 0.
This is known to be used on some Asus motherboards, where the actual
temperature source can be configured in the BIOS.

Report the 'virtual' temperatures for all monotoring sources to address
this situation.

Example for the resulting output (as seen with the 'sensors' command):

nct6791-isa-0290
Adapter: ISA adapter
...
Virtual_TEMP:           +31.0°C
PECI Agent 0:           +38.5°C
Virtual_TEMP:           +32.0°C
...

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 7859a30ce31e..ce75dd4db7eb 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -195,6 +195,8 @@ superio_exit(int ioreg)
 
 #define NUM_FAN		6
 
+#define TEMP_SOURCE_VIRTUAL	0x1f
+
 /* Common and NCT6775 specific data */
 
 /* Voltage min/max registers for nr=7..14 are in bank 5 */
@@ -3940,7 +3942,7 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 
 		src = nct6775_read_value(data, data->REG_TEMP_SEL[i]) & 0x1f;
-		if (!src || (mask & (1 << src)))
+		if (!src)
 			continue;
 
 		if (src >= data->temp_label_num ||
@@ -3952,7 +3954,16 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		mask |= 1 << src;
+		/*
+		 * For virtual temperature sources, the 'virtual' temperature
+		 * for each fan reflects a different temperature, and there
+		 * are no duplicates.
+		 */
+		if (src != TEMP_SOURCE_VIRTUAL) {
+			if (mask & (1 << src))
+				continue;
+			mask |= 1 << src;
+		}
 
 		/* Use fixed index for SYSTIN(1), CPUTIN(2), AUXTIN(3) */
 		if (src <= data->temp_fixed_num) {
-- 
2.5.0

