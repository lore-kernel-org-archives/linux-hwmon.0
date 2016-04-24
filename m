Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60438 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbcDXVz4 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 24 Apr 2016 17:55:56 -0400
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: sch5636: trivial fix of spelling mistake on revision
Date: Sun, 24 Apr 2016 22:55:47 +0100
Message-Id: <1461534947-19273-1-git-send-email-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

fix spelling mistake, revison -> revision

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/sch5636.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index 131a281..d24d7b6 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -449,7 +449,7 @@ static int sch5636_probe(struct platform_device *pdev)
 		}
 		revision[i] = val;
 	}
-	pr_info("Found %s chip at %#hx, revison: %d.%02d\n", DEVNAME,
+	pr_info("Found %s chip at %#hx, revision: %d.%02d\n", DEVNAME,
 		data->addr, revision[0], revision[1]);
 
 	/* Read all temp + fan ctrl registers to determine which are active */
-- 
2.7.4

