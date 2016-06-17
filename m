Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34977 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753509AbcFQWz0 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 17 Jun 2016 18:55:26 -0400
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
Subject: [PATCH 3/6] hwmon: (dell-smm) Disallow fan_type() calls on broken machines
Date: Sat, 18 Jun 2016 00:54:46 +0200
Message-Id: <1466204089-17030-4-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some Dell machines have especially broken SMM or BIOS which cause that once
fan_type() is called then CPU fan speed going randomly up and down. And for
fixing this behaviour reboot is required.

So this patch creates fan_type blacklist of affected Dell machines and
disallow fan_type() call on them to prevent that erratic behaviour.

Old blacklist which disabled loading driver on some machines added in
commits a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")
and 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000") were
moved to FAN_TYPE blacklist.

Reported-by: Jan C Peters <jcpeters89@gmail.com>
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=100121
Cc: stable@vger.kernel.org # v4.0+, will need backport
---
 drivers/hwmon/dell-smm-hwmon.c |   36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c8bd3fdd..4bbc587 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -73,6 +73,7 @@ static u32 i8k_hwmon_flags;
 static uint i8k_fan_mult = I8K_FAN_MULT;
 static uint i8k_pwm_mult;
 static uint i8k_fan_max = I8K_FAN_HIGH;
+static bool disallow_fan_type_call;
 
 #define I8K_HWMON_HAVE_TEMP1	(1 << 0)
 #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
@@ -241,6 +242,9 @@ static int i8k_get_fan_type(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
 
+	if (disallow_fan_type_call)
+		return -EINVAL;
+
 	regs.ebx = fan & 0xff;
 	return i8k_smm(&regs) ? : regs.eax & 0xff;
 }
@@ -726,6 +730,9 @@ static struct attribute *i8k_attrs[] = {
 static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 			      int index)
 {
+	if (disallow_fan_type_call &&
+	    (index == 9 || index == 12))
+		return 0;
 	if (index >= 0 && index <= 1 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
 		return 0;
@@ -937,12 +944,14 @@ static struct dmi_system_id i8k_dmi_table[] __initdata = {
 
 MODULE_DEVICE_TABLE(dmi, i8k_dmi_table);
 
-static struct dmi_system_id i8k_blacklist_dmi_table[] __initdata = {
+/*
+ * On some machines once I8K_SMM_GET_FAN_TYPE is issued then CPU fan speed
+ * randomly going up and down due to bug in Dell SMM or BIOS. Here is blacklist
+ * of affected Dell machines for which we disallow I8K_SMM_GET_FAN_TYPE call.
+ * See bug: https://bugzilla.kernel.org/show_bug.cgi?id=100121
+ */
+static struct dmi_system_id i8k_blacklist_fan_type_dmi_table[] __initdata = {
 	{
-		/*
-		 * CPU fan speed going up and down on Dell Studio XPS 8000
-		 * for unknown reasons.
-		 */
 		.ident = "Dell Studio XPS 8000",
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -950,16 +959,19 @@ static struct dmi_system_id i8k_blacklist_dmi_table[] __initdata = {
 		},
 	},
 	{
-		/*
-		 * CPU fan speed going up and down on Dell Studio XPS 8100
-		 * for unknown reasons.
-		 */
 		.ident = "Dell Studio XPS 8100",
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Studio XPS 8100"),
 		},
 	},
+	{
+		.ident = "Dell Inspiron 580",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Inspiron 580 "),
+		},
+	},
 	{ }
 };
 
@@ -974,8 +986,7 @@ static int __init i8k_probe(void)
 	/*
 	 * Get DMI information
 	 */
-	if (!dmi_check_system(i8k_dmi_table) ||
-	    dmi_check_system(i8k_blacklist_dmi_table)) {
+	if (!dmi_check_system(i8k_dmi_table)) {
 		if (!ignore_dmi && !force)
 			return -ENODEV;
 
@@ -986,6 +997,9 @@ static int __init i8k_probe(void)
 			i8k_get_dmi_data(DMI_BIOS_VERSION));
 	}
 
+	if (dmi_check_system(i8k_blacklist_fan_type_dmi_table))
+		disallow_fan_type_call = true;
+
 	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
 		sizeof(bios_version));
 	strlcpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
-- 
1.7.9.5

