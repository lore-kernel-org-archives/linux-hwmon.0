Return-path: <amsfield22@gmail.com>
Date: Mon, 27 Jun 2016 17:23:27 -0700
From: Alison Schofield <amsfield22@gmail.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@gmail.com
Subject: [PATCH] hwmon: (jc42) Add support for Microchip MCP9808 temperature
 sensor
Message-ID: <20160628002319.GA5474@d830.WORKGROUP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

MCP9808 is not officially compliant to JC-42, similar to MCP9804,
but its registers are compatible to JC-42.

Signed-off-by: Alison Schofield <amsfield22@gmail.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>
---
 Documentation/hwmon/jc42 | 3 ++-
 drivers/hwmon/Kconfig    | 4 ++--
 drivers/hwmon/jc42.c     | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/jc42 b/Documentation/hwmon/jc42
index f7f1830a..b4b671f 100644
--- a/Documentation/hwmon/jc42
+++ b/Documentation/hwmon/jc42
@@ -18,10 +18,11 @@ Supported chips:
   * Maxim MAX6604
     Datasheets:
 	http://datasheets.maxim-ic.com/en/ds/MAX6604.pdf
-  * Microchip MCP9804, MCP9805, MCP98242, MCP98243, MCP98244, MCP9843
+  * Microchip MCP9804, MCP9805, MCP9808, MCP98242, MCP98243, MCP98244, MCP9843
     Datasheets:
 	http://ww1.microchip.com/downloads/en/DeviceDoc/22203C.pdf
 	http://ww1.microchip.com/downloads/en/DeviceDoc/21977b.pdf
+	http://ww1.microchip.com/downloads/en/DeviceDoc/25095A.pdf
 	http://ww1.microchip.com/downloads/en/DeviceDoc/21996a.pdf
 	http://ww1.microchip.com/downloads/en/DeviceDoc/22153c.pdf
 	http://ww1.microchip.com/downloads/en/DeviceDoc/22327A.pdf
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d13a..7dfc763 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -644,8 +644,8 @@ config SENSORS_JC42
 	  temperature sensors, which are used on many DDR3 memory modules for
 	  mobile devices and servers.  Support will include, but not be limited
 	  to, ADT7408, AT30TS00, CAT34TS02, CAT6095, MAX6604, MCP9804, MCP9805,
-	  MCP98242, MCP98243, MCP98244, MCP9843, SE97, SE98, STTS424(E),
-	  STTS2002, STTS3000, TSE2002, TSE2004, TS3000, and TS3001.
+	  MCP9808, MCP98242, MCP98243, MCP98244, MCP9843, SE97, SE98,
+	  STTS424(E), STTS2002, STTS3000, TSE2002, TSE2004, TS3000, and TS3001.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called jc42.
diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 9887d32..f67c1bb 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -104,6 +104,9 @@ static const unsigned short normal_i2c[] = {
 #define MCP9804_DEVID		0x0200
 #define MCP9804_DEVID_MASK	0xfffc
 
+#define MCP9808_DEVID		0x0400
+#define MCP9808_DEVID_MASK	0xfffc
+
 #define MCP98242_DEVID		0x2000
 #define MCP98242_DEVID_MASK	0xfffc
 
@@ -160,6 +163,7 @@ static struct jc42_chips jc42_chips[] = {
 	{ IDT_MANID, TS3001_DEVID, TS3001_DEVID_MASK },
 	{ MAX_MANID, MAX6604_DEVID, MAX6604_DEVID_MASK },
 	{ MCP_MANID, MCP9804_DEVID, MCP9804_DEVID_MASK },
+	{ MCP_MANID, MCP9808_DEVID, MCP9808_DEVID_MASK },
 	{ MCP_MANID, MCP98242_DEVID, MCP98242_DEVID_MASK },
 	{ MCP_MANID, MCP98243_DEVID, MCP98243_DEVID_MASK },
 	{ MCP_MANID, MCP98244_DEVID, MCP98244_DEVID_MASK },
-- 
2.1.4
