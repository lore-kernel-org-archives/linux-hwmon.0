Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37764 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbeINVsP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Sep 2018 17:48:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id 2-v6so4650655pgo.4
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Sep 2018 09:33:00 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Robert Kern <ulteq@web.de>
Subject: [PATCH 1/2] hwmon: (nct6775) Fix temperature sources for NCT6796D
Date: Fri, 14 Sep 2018 09:32:53 -0700
Message-Id: <1536942774-23738-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The following kernel log message is reported for the nct6775 driver
on ASUS WS X299 SAGE.

nct6775: Found NCT6796D or compatible chip at 0x2e:0x290
nct6775 nct6775.656: Invalid temperature source 11 at index 0,
			source register 0x100, temp register 0x73
nct6775 nct6775.656: Invalid temperature source 11 at index 2,
			source register 0x300, temp register 0x77
nct6775 nct6775.656: Invalid temperature source 11 at index 3,
			source register 0x800, temp register 0x79
nct6775 nct6775.656: Invalid temperature source 11 at index 4,
			source register 0x900, temp register 0x7b

A recent version of the datasheet lists temperature source 11 as reserved.
However, an older version of the datasheet lists temperature sources 10
and 11 as supported virtual temperature sources. Apparently the older
version of the datasheet is correct, so list those temperature sources
as supported.

Reported-by: Robert Kern <ulteq@web.de>
Cc: Robert Kern <ulteq@web.de>
Fixes: 81820059a428 ("hwmon: (nct6775) Add support for NCT6796D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 87c316c6c341..1e6f0e6ba740 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -725,8 +725,8 @@ static const char *const nct6796_temp_label[] = {
 	"AUXTIN4",
 	"SMBUSMASTER 0",
 	"SMBUSMASTER 1",
-	"",
-	"",
+	"Virtual_TEMP2",
+	"Virtual_TEMP3",
 	"",
 	"",
 	"",
@@ -746,10 +746,10 @@ static const char *const nct6796_temp_label[] = {
 	"PECI Agent 0 Calibration",
 	"PECI Agent 1 Calibration",
 	"",
-	"Virtual_TEMP"
+	"Virtual_TEMP1"
 };
 
-#define NCT6796_TEMP_MASK	0xbfff03fe
+#define NCT6796_TEMP_MASK	0xbfff0ffe
 
 /* NCT6102D/NCT6106D specific data */
 
-- 
2.7.4
