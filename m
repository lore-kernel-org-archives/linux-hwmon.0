Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35828 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbeLJWJR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:17 -0500
Received: by mail-pf1-f196.google.com with SMTP id z9so6066017pfi.2
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:16 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH 17/30] hwmon: (applesmc) Replace S_<PERMS> with octal values
Date: Mon, 10 Dec 2018 14:08:35 -0800
Message-Id: <1544479728-30077-18-git-send-email-linux@roeck-us.net>
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

Cc: Henrik Rydberg <rydberg@bitmath.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/applesmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 5c677ba44014..a24e8fa7fba8 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1128,7 +1128,7 @@ static int applesmc_create_nodes(struct applesmc_node_group *groups, int num)
 			attr = &node->sda.dev_attr.attr;
 			sysfs_attr_init(attr);
 			attr->name = node->name;
-			attr->mode = S_IRUGO | (grp->store ? S_IWUSR : 0);
+			attr->mode = 0444 | (grp->store ? 0200 : 0);
 			ret = sysfs_create_file(&pdev->dev.kobj, attr);
 			if (ret) {
 				attr->name = NULL;
-- 
2.7.4
