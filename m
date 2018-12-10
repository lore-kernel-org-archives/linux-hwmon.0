Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:47090 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbeLJWJU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:20 -0500
Received: by mail-pg1-f193.google.com with SMTP id w7so5599731pgp.13
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:19 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Luca Tettamanti <kronos.it@gmail.com>
Subject: [PATCH 19/30] hwmon: (asus_atk0110) Replace S_<PERMS> with octal values
Date: Mon, 10 Dec 2018 14:08:37 -0800
Message-Id: <1544479728-30077-20-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Cc: Luca Tettamanti <kronos.it@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_atk0110.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index a7cf00885c5d..a5638d1f7e4b 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -799,17 +799,17 @@ static void atk_debugfs_init(struct atk_data *data)
 	if (!d || IS_ERR(d))
 		return;
 
-	f = debugfs_create_x32("id", S_IRUSR | S_IWUSR, d, &data->debugfs.id);
+	f = debugfs_create_x32("id", 0600, d, &data->debugfs.id);
 	if (!f || IS_ERR(f))
 		goto cleanup;
 
-	f = debugfs_create_file("gitm", S_IRUSR, d, data,
-			&atk_debugfs_gitm);
+	f = debugfs_create_file("gitm", 0400, d, data,
+				&atk_debugfs_gitm);
 	if (!f || IS_ERR(f))
 		goto cleanup;
 
-	f = debugfs_create_file("ggrp", S_IRUSR, d, data,
-			&atk_debugfs_ggrp_fops);
+	f = debugfs_create_file("ggrp", 0400, d, data,
+				&atk_debugfs_ggrp_fops);
 	if (!f || IS_ERR(f))
 		goto cleanup;
 
-- 
2.7.4
