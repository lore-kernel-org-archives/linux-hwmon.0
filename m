Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/13] hwmon: (nct6775) Fix names of DIMM temperature sources
Date: Thu, 20 Sep 2018 06:45:39 -0700
Message-Id: <1537451141-27242-11-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

For NCT6795D and NCT6796D, the DIMM temperature sources are named
"Agent[01] Dimm [01]" per datasheet. Match names in datasheets to
avoid confusion.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index c07414dd38dd..77255f7da974 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -704,10 +704,10 @@ static const char *const nct6795_temp_label[] = {
 	"PCH_CHIP_TEMP",
 	"PCH_CPU_TEMP",
 	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
+	"Agent0 Dimm0",
+	"Agent0 Dimm1",
+	"Agent1 Dimm0",
+	"Agent1 Dimm1",
 	"BYTE_TEMP0",
 	"BYTE_TEMP1",
 	"PECI Agent 0 Calibration",
@@ -742,10 +742,10 @@ static const char *const nct6796_temp_label[] = {
 	"PCH_CHIP_TEMP",
 	"PCH_CPU_TEMP",
 	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
+	"Agent0 Dimm0",
+	"Agent0 Dimm1",
+	"Agent1 Dimm0",
+	"Agent1 Dimm1",
 	"BYTE_TEMP0",
 	"BYTE_TEMP1",
 	"PECI Agent 0 Calibration",
-- 
2.7.4
