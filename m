Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32791 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753138AbeA0Q33 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:29:29 -0500
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (dell-smm) Disable fan support for Dell Inspiron 7720
Date: Sat, 27 Jan 2018 17:28:34 +0100
Message-Id: <20180127162834.14675-1-pali.rohar@gmail.com>
In-Reply-To: <20180127162204.13752-1-pali.rohar@gmail.com>
References: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Calling fan related SMM functions implemented by Dell BIOS firmware on Dell
Inspiron 7720 freeze kernel for about 500ms. Until Dell fixes it we need to
disable fan support for Dell Inspiron 7720 as it makes system unusable.

Via "force" module param fan support can be enabled.

Reported-by: vova7890@mail.ru
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=195751
Cc: stable@vger.kernel.org # v4.0+, will need backport
---
 drivers/hwmon/dell-smm-hwmon.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index aef4f8317ae2..3f8b4e482b64 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -76,6 +76,7 @@ static uint i8k_fan_mult = I8K_FAN_MULT;
 static uint i8k_pwm_mult;
 static uint i8k_fan_max = I8K_FAN_HIGH;
 static bool disallow_fan_type_call;
+static bool disallow_fan_support;
 
 #define I8K_HWMON_HAVE_TEMP1	(1 << 0)
 #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
@@ -242,6 +243,9 @@ static int i8k_get_fan_status(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN, };
 
+	if (disallow_fan_support)
+		return -EINVAL;
+
 	regs.ebx = fan & 0xff;
 	return i8k_smm(&regs) ? : regs.eax & 0xff;
 }
@@ -253,6 +257,9 @@ static int i8k_get_fan_speed(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_SPEED, };
 
+	if (disallow_fan_support)
+		return -EINVAL;
+
 	regs.ebx = fan & 0xff;
 	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * i8k_fan_mult;
 }
@@ -264,7 +271,7 @@ static int _i8k_get_fan_type(int fan)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
 
-	if (disallow_fan_type_call)
+	if (disallow_fan_support || disallow_fan_type_call)
 		return -EINVAL;
 
 	regs.ebx = fan & 0xff;
@@ -289,6 +296,9 @@ static int i8k_get_fan_nominal_speed(int fan, int speed)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_GET_NOM_SPEED, };
 
+	if (disallow_fan_support)
+		return -EINVAL;
+
 	regs.ebx = (fan & 0xff) | (speed << 8);
 	return i8k_smm(&regs) ? : (regs.eax & 0xffff) * i8k_fan_mult;
 }
@@ -300,6 +310,9 @@ static int i8k_set_fan(int fan, int speed)
 {
 	struct smm_regs regs = { .eax = I8K_SMM_SET_FAN, };
 
+	if (disallow_fan_support)
+		return -EINVAL;
+
 	speed = (speed < 0) ? 0 : ((speed > i8k_fan_max) ? i8k_fan_max : speed);
 	regs.ebx = (fan & 0xff) | (speed << 8);
 
@@ -772,6 +785,8 @@ static struct attribute *i8k_attrs[] = {
 static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 			      int index)
 {
+	if (disallow_fan_support && index >= 8)
+		return 0;
 	if (disallow_fan_type_call &&
 	    (index == 9 || index == 12 || index == 15))
 		return 0;
@@ -1039,6 +1054,23 @@ static const struct dmi_system_id i8k_blacklist_fan_type_dmi_table[] __initconst
 };
 
 /*
+ * On some machines all fan related SMM functions implemented by Dell BIOS
+ * firmware freeze kernel for about 500ms. Until Dell fixes these problems fan
+ * support for affected blacklisted Dell machines stay disabled.
+ * See bug: https://bugzilla.kernel.org/show_bug.cgi?id=195751
+ */
+static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
+	{
+		.ident = "Dell Inspiron 7720",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Inspiron 7720"),
+		},
+	},
+	{ }
+};
+
+/*
  * Probe for the presence of a supported laptop.
  */
 static int __init i8k_probe(void)
@@ -1060,6 +1092,12 @@ static int __init i8k_probe(void)
 			i8k_get_dmi_data(DMI_BIOS_VERSION));
 	}
 
+	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
+		pr_warn("broken Dell BIOS detected, disallow fan support\n");
+		if (!force)
+			disallow_fan_support = true;
+	}
+
 	if (dmi_check_system(i8k_blacklist_fan_type_dmi_table)) {
 		pr_warn("broken Dell BIOS detected, disallow fan type call\n");
 		if (!force)
-- 
2.11.0

