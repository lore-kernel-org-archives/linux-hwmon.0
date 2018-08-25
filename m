Return-Path: <festevam@gmail.com>
Return-path: <festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 2/2] hwmon: (mc13783-adc) Use nxp.com URLs
Date: Sat, 25 Aug 2018 00:27:56 -0300
Message-Id: <1535167676-27013-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1535167676-27013-1-git-send-email-festevam@gmail.com>
References: <1535167676-27013-1-git-send-email-festevam@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Use the nxp.com URLs for the MC13783 and MC13892 datasheets.

The original URLs are still valid, but the nxp.com one is shorter
and more up-to-date.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/hwmon/mc13783-adc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/mc13783-adc b/Documentation/hwmon/mc13783-adc
index 2798a29..05ccc9f 100644
--- a/Documentation/hwmon/mc13783-adc
+++ b/Documentation/hwmon/mc13783-adc
@@ -4,10 +4,10 @@ Kernel driver mc13783-adc
 Supported chips:
   * Freescale MC13783
     Prefix: 'mc13783'
-    Datasheet: http://www.freescale.com/files/rf_if/doc/data_sheet/MC13783.pdf?fsrch=1
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/MC13783.pdf
   * Freescale MC13892
     Prefix: 'mc13892'
-    Datasheet: http://cache.freescale.com/files/analog/doc/data_sheet/MC13892.pdf?fsrch=1&sr=1
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/MC13892.pdf
 
 Authors:
     Sascha Hauer <s.hauer@pengutronix.de>
-- 
2.7.4
