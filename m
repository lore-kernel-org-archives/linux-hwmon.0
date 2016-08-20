Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ch3vs02.rockwellcollins.com ([205.175.226.29]:1929 "EHLO
        ch3vs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750838AbcHTCIs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2016 22:08:48 -0400
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com,
        Matt Weber <matthew.weber@rockwellcollins.com>,
        Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: [PATCH v2] hwmon: (ucd9000) support for ucd90160 sensor
Date: Fri, 19 Aug 2016 21:08:45 -0500
Message-Id: <1471658925-43438-1-git-send-email-matthew.weber@rockwellcollins.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

ucd90160 sensor reused existing register layout so just a
id addition was required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
v1 -> v2
[Guenter
 - enumeration on a per driver basis isn't required, dropped
   first patch as "Generalize OF support" covers it
---
 drivers/hwmon/pmbus/Kconfig   | 6 +++---
 drivers/hwmon/pmbus/ucd9000.c | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 054d3d8..93cf6dd 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -126,12 +126,12 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_UCD9000
-	tristate "TI UCD90120, UCD90124, UCD9090, UCD90910"
+	tristate "TI UCD90120, UCD90124, UCD9090, UCD90910, UCD90160"
 	default n
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  UCD90120, UCD90124, UCD9090, UCD90910 Sequencer and System Health
-	  Controllers.
+	  UCD90120, UCD90124, UCD9090, UCD90910, UCD90160 Sequencer and System
+	  Health Controllers.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9000.
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index fbb1479..5cf25f8 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -28,7 +28,7 @@
 #include <linux/i2c/pmbus.h>
 #include "pmbus.h"
 
-enum chips { ucd9000, ucd90120, ucd90124, ucd9090, ucd90910 };
+enum chips { ucd9000, ucd90120, ucd90124, ucd9090, ucd90910, ucd90160 };
 
 #define UCD9000_MONITOR_CONFIG		0xd5
 #define UCD9000_NUM_PAGES		0xd6
@@ -114,6 +114,7 @@ static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd90124", ucd90124},
 	{"ucd9090", ucd9090},
 	{"ucd90910", ucd90910},
+	{"ucd90160", ucd90160},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
-- 
1.9.1

