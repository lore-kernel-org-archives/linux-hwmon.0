Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44308 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbeI2Iir (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Sep 2018 04:38:47 -0400
Received: by mail-pg1-f193.google.com with SMTP id g2-v6so5638176pgu.11
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Sep 2018 19:12:15 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>
Subject: [PATCH] MAINTAINERS: Update PMBUS maintainer entry
Date: Fri, 28 Sep 2018 19:12:10 -0700
Message-Id: <1538187130-23599-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

MAX20751 is a PMBUS driver, which has its own maintainer entry.
On top of that, the entry for MAX20751 points to a non-existing file.
Drop it. Add various missing driver documentation files.

Reported-by: Joe Perches <joe@perches.com>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ad052aeac39..2621511d6784 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8830,13 +8830,6 @@ S:	Maintained
 F:	Documentation/hwmon/max16065
 F:	drivers/hwmon/max16065.c
 
-MAX20751 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/max20751
-F:	drivers/hwmon/max20751.c
-
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
 L:	linux-media@vger.kernel.org
@@ -11552,7 +11545,26 @@ W:	http://hwmon.wiki.kernel.org/
 W:	http://www.roeck-us.net/linux/drivers/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
+F:	Documentation/devicetree/bindings/hwmon/max31785.txt
+F:	Documentation/devicetree/bindings/hwmon/ltc2978.txt
+F:	Documentation/hwmon/adm1275
+F:	Documentation/hwmon/ibm-cffps
+F:	Documentation/hwmon/ir35221
+F:	Documentation/hwmon/lm25066
+F:	Documentation/hwmon/ltc2978
+F:	Documentation/hwmon/ltc3815
+F:	Documentation/hwmon/max16064
+F:	Documentation/hwmon/max20751
+F:	Documentation/hwmon/max31785
+F:	Documentation/hwmon/max34440
+F:	Documentation/hwmon/max8688
 F:	Documentation/hwmon/pmbus
+F:	Documentation/hwmon/pmbus-core
+F:	Documentation/hwmon/tps40422
+F:	Documentation/hwmon/ucd9000
+F:	Documentation/hwmon/ucd9200
+F:	Documentation/hwmon/zl6100
 F:	drivers/hwmon/pmbus/
 F:	include/linux/pmbus.h
 
-- 
2.7.4
