Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54672 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753152AbeA0QWo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:22:44 -0500
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/4] hwmon: (dell-smm) Enable broken functionality via "force" module param
Date: Sat, 27 Jan 2018 17:22:01 +0100
Message-Id: <20180127162204.13752-2-pali.rohar@gmail.com>
In-Reply-To: <20180127162204.13752-1-pali.rohar@gmail.com>
References: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some Dell machines are broken and some functionality is disabled. Show
warning into dmesg about this fact and allow user via "force" module param
to override brokenness and enable broken functionality.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c7c9e95e58a8..aef4f8317ae2 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1060,8 +1060,11 @@ static int __init i8k_probe(void)
 			i8k_get_dmi_data(DMI_BIOS_VERSION));
 	}
 
-	if (dmi_check_system(i8k_blacklist_fan_type_dmi_table))
-		disallow_fan_type_call = true;
+	if (dmi_check_system(i8k_blacklist_fan_type_dmi_table)) {
+		pr_warn("broken Dell BIOS detected, disallow fan type call\n");
+		if (!force)
+			disallow_fan_type_call = true;
+	}
 
 	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
 		sizeof(bios_version));
-- 
2.11.0

