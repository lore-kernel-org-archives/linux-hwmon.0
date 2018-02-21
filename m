Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (nct6775) Use NUM_FAN consistently
Date: Wed, 21 Feb 2018 13:09:36 -0800
Message-Id: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The size of some of the arrays using the number of fans is hardcoded.
Use NUM_FAN consistently throughout the driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index c219e43b8f02..01d0225cd92b 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -570,12 +570,12 @@ static const u16 NCT6779_REG_TEMP_CRIT[32] = {
 
 #define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
 
-static const u16 NCT6791_REG_WEIGHT_TEMP_SEL[6] = { 0, 0x239 };
-static const u16 NCT6791_REG_WEIGHT_TEMP_STEP[6] = { 0, 0x23a };
-static const u16 NCT6791_REG_WEIGHT_TEMP_STEP_TOL[6] = { 0, 0x23b };
-static const u16 NCT6791_REG_WEIGHT_DUTY_STEP[6] = { 0, 0x23c };
-static const u16 NCT6791_REG_WEIGHT_TEMP_BASE[6] = { 0, 0x23d };
-static const u16 NCT6791_REG_WEIGHT_DUTY_BASE[6] = { 0, 0x23e };
+static const u16 NCT6791_REG_WEIGHT_TEMP_SEL[NUM_FAN] = { 0, 0x239 };
+static const u16 NCT6791_REG_WEIGHT_TEMP_STEP[NUM_FAN] = { 0, 0x23a };
+static const u16 NCT6791_REG_WEIGHT_TEMP_STEP_TOL[NUM_FAN] = { 0, 0x23b };
+static const u16 NCT6791_REG_WEIGHT_DUTY_STEP[NUM_FAN] = { 0, 0x23c };
+static const u16 NCT6791_REG_WEIGHT_TEMP_BASE[NUM_FAN] = { 0, 0x23d };
+static const u16 NCT6791_REG_WEIGHT_DUTY_BASE[NUM_FAN] = { 0, 0x23e };
 
 static const u16 NCT6791_REG_ALARM[NUM_REG_ALARM] = {
 	0x459, 0x45A, 0x45B, 0x568, 0x45D };
-- 
2.7.4
