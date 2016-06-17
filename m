Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33972 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495AbcFQWzb (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 17 Jun 2016 18:55:31 -0400
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 4/6] hwmon: (dell-smm) Cache fan_type() calls and change fan detection
Date: Sat, 18 Jun 2016 00:54:47 +0200
Message-Id: <1466204089-17030-5-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On more Dell machines (e.g. Dell Precision M3800) fan_type() call is too
expensive (CPU is too long in SMM mode) and cause kernel to hang. This is
bug in Dell SMM or BIOS.

This patch caches type for each fan (as it should not change) and changes
the way how fan presense is detected. First it try function fan_status()
as was before commit f989e55452c7 ("i8k: Add support for fan labels"). And
if that fails fallback to fan_type(). *_status() functions can fail in case
fan is not currently accessible (e.g. present on GPU which is currently
turned off).

Reported-by: Tolga Cakir <cevelnet@gmail.com>
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=112021
Cc: stable@vger.kernel.org # v4.0+, will need backport
---
 drivers/hwmon/dell-smm-hwmon.c |   25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 4bbc587..2ac87d5 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -238,7 +238,7 @@ static int i8k_get_fan_speed(int fan)
 /*
  * Read the fan type.
  */
-static int i8k_get_fan_type(int fan)
+static int _i8k_get_fan_type(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
 
@@ -249,6 +249,17 @@ static int i8k_get_fan_type(int fan)
 	return i8k_smm(&regs) ? : regs.eax & 0xff;
 }
 
+static int i8k_get_fan_type(int fan)
+{
+	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
+	static int types[2] = { INT_MIN, INT_MIN };
+
+	if (types[fan] == INT_MIN)
+		types[fan] = _i8k_get_fan_type(fan);
+
+	return types[fan];
+}
+
 /*
  * Read the fan nominal rpm for specific fan speed.
  */
@@ -782,13 +793,17 @@ static int __init i8k_init_hwmon(void)
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
 
-	/* First fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(0);
+	/* First fan attributes, if fan status or type is OK */
+	err = i8k_get_fan_status(0);
+	if (err < 0)
+		err = i8k_get_fan_type(0);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN1;
 
-	/* Second fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(1);
+	/* Second fan attributes, if fan status or type is OK */
+	err = i8k_get_fan_status(1);
+	if (err < 0)
+		err = i8k_get_fan_type(1);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
 
-- 
1.7.9.5

