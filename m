Return-Path: <pali.rohar@gmail.com>
Return-path: <pali.rohar@gmail.com>
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Jonathan Buzzard <jonathan@buzzard.org.uk>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] hwmon: (dell-smm) Disable fan support for Dell Vostro 3360
Date: Sat, 27 Jan 2018 17:23:29 +0100
Message-Id: <20180127162329.13813-1-pali.rohar@gmail.com>
In-Reply-To: <20180127162204.13752-1-pali.rohar@gmail.com>
References: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Oleksandr Natalenko <oleksandr@natalenko.name>

Calling fan related SMM functions implemented by Dell BIOS firmware on Dell
Vostro 3360 freeze kernel for about 500ms.

Unfortunately, it is unlikely for Dell to fix this since the machine
is pretty old, so this commit just disables fan support to make the
system usable again.

Via "force" module param fan support can be enabled.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=195751
Link: http://lkml.iu.edu/hypermail/linux/kernel/1711.2/06083.html
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
---
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 3f8b4e482b64..bf3bb7e1adab 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1067,6 +1067,13 @@ static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Inspiron 7720"),
 		},
 	},
+	{
+		.ident = "Dell Vostro 3360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
+		},
+	},
 	{ }
 };
 
-- 
2.11.0
