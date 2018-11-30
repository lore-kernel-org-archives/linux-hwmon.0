Return-Path: <michelesr@autistici.org>
Return-path: <michelesr@autistici.org>
From: Michele Sorcinelli <michelesr@autistici.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	Michele Sorcinelli <michelesr@autistici.org>
Subject: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
Date: Fri, 30 Nov 2018 18:42:56 +0000
Message-Id: <20181130184256.7487-1-michelesr@autistici.org>
In-Reply-To: <026d224f-7f8d-b50f-f269-e6b2408a8822@autistici.org>
References: <026d224f-7f8d-b50f-f269-e6b2408a8822@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Allow the module to be loaded on Dell XPS 9570, without having to
provide the "force=1" option.

Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 9d3ef879d..367a8a617 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1017,6 +1017,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
 		},
 	},
+	{
+		.ident = "Dell XPS 15 9570",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
+		},
+	},
 	{ }
 };
 
-- 
2.19.2
