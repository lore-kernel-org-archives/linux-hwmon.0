Return-path: <pali.rohar@gmail.com>
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Sat, 21 May 2016 16:46:41 +0200
Message-Id: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On more Dell machines (e.g. Dell Precision M3800) I8K_SMM_GET_FAN_TYPE call
is too expensive (CPU is too long in SMM mode) and cause kernel to hang.
This patch cache type for each fan (as it should not change) and change the
way how fan presense is detected. It revert and use function fan_status()
as was before commit f989e55452c7 ("i8k: Add support for fan labels").

Moreover, kernel hangs for 2 - 3 seconds only sometimes and only on some
Dell machines. When kernel hangs fan speed is at max. So it was hard to
debug and bisect where is root of this problem. It looks like this is bug
in Dell BIOS which implement fan type SMM code... and there is no way how
to fix it in kernel.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Reported-and-tested-by: Tolga Cakir <cevelnet@gmail.com>
Fixes: f989e55452c7 ("i8k: Add support for fan labels")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=112021
Link: https://bugzilla.kernel.org/show_bug.cgi?id=100121
Cc: stable@vger.kernel.org # v4.0+, will need backport
---
 drivers/hwmon/dell-smm-hwmon.c |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)
---

Hi!

Jan C Peters, Thorsten Leemhuis, David Santamaría Rogado, Peter Saunderson
and others, can you test this patch if it fixes your freeze problem at
boottime and when using "sensors" program?

I need to know if this patch fixes problem on Dell Studio XPS 8000 and
Dell Studio XPS 8100 machines, so we can revert git commits:

6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c43318d..577445f 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -235,7 +235,7 @@ static int i8k_get_fan_speed(int fan)
 /*
  * Read the fan type.
  */
-static int i8k_get_fan_type(int fan)
+static int _i8k_get_fan_type(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
 
@@ -243,6 +243,17 @@ static int i8k_get_fan_type(int fan)
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
@@ -767,13 +778,13 @@ static int __init i8k_init_hwmon(void)
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
 
-	/* First fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(0);
+	/* First fan attributes, if fan status is OK */
+	err = i8k_get_fan_status(0);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN1;
 
-	/* Second fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(1);
+	/* Second fan attributes, if fan status is OK */
+	err = i8k_get_fan_status(1);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
 
-- 
1.7.9.5
