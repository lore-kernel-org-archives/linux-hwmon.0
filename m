Return-path: <matthew.weber@rockwellcollins.com>
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	jdelvare@suse.com,
	Matt Weber <matthew.weber@rockwellcollins.com>,
	Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: [PATCH 2/2] hwmon: (ucd9000) support for ucd90160 sensor
Date: Thu, 18 Aug 2016 23:00:24 -0500
Message-Id: <1471579224-16075-2-git-send-email-matthew.weber@rockwellcollins.com>
In-Reply-To: <1471579224-16075-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1471579224-16075-1-git-send-email-matthew.weber@rockwellcollins.com>
List-ID: <linux-hwmon@vger.kernel.org>

ucd90160 sensor reused existing register layout so just a
compatible id update was required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
 drivers/hwmon/pmbus/Kconfig   | 4 ++--
 drivers/hwmon/pmbus/ucd9000.c | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 054d3d8..4a5136f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -126,11 +126,11 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_UCD9000
-	tristate "TI UCD90120, UCD90124, UCD9090, UCD90910"
+	tristate "TI UCD90120, UCD90124, UCD9090, UCD90910, UCD90160"
 	default n
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  UCD90120, UCD90124, UCD9090, UCD90910 Sequencer and System Health
+	  UCD90120, UCD90124, UCD9090, UCD90910, UCD90160 Sequencer and System Health
 	  Controllers.
 
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 207c30e..946f989 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -31,7 +31,7 @@
 #include <linux/of.h>
 #endif
 
-enum chips { ucd9000, ucd90120, ucd90124, ucd9090, ucd90910 };
+enum chips { ucd9000, ucd90120, ucd90124, ucd9090, ucd90910, ucd90160 };
 
 #define UCD9000_MONITOR_CONFIG		0xd5
 #define UCD9000_NUM_PAGES		0xd6
@@ -118,6 +118,7 @@ static struct of_device_id ucd9000_dt_match[] = {
 	{ .compatible = "ti,ucd90124", .data = (void *)ucd90124 },
 	{ .compatible = "ti,ucd9090", .data = (void *)ucd9090 },
 	{ .compatible = "ti,ucd90910", .data = (void *)ucd90910 },
+	{ .compatible = "ti,ucd90160", .data = (void *)ucd90160 },
 	{ }
 };
 #endif
@@ -129,6 +130,7 @@ static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd90124", ucd90124},
 	{"ucd9090", ucd9090},
 	{"ucd90910", ucd90910},
+	{"ucd90160", ucd90160},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
-- 
1.9.1
