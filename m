Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0B5C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Jan 2022 16:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380433AbiAaQ3i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Jan 2022 11:29:38 -0500
Received: from aposti.net ([89.234.176.197]:44614 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1380434AbiAaQ1s (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jan 2022 11:27:48 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon <linux-hwmon@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] hwmon: Fix possible NULL pointer
Date:   Mon, 31 Jan 2022 16:27:40 +0000
Message-Id: <20220131162740.197929-1-paul@crapouillou.net>
In-Reply-To: <20220127085245.GF25644@kili>
References: <20220127085245.GF25644@kili>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The recent addition of the label attribute added some code that read the
"label" device property, without checking first that "dev" was non-NULL.

Fix this issue by first checking that "dev" is non-NULL.

Fixes: ccd98cba6a18 ("hwmon: Add "label" attribute")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/hwmon/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index e36ea82da147..5915fedee69b 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -807,7 +807,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 		hdev->groups = groups;
 	}
 
-	if (device_property_present(dev, "label")) {
+	if (dev && device_property_present(dev, "label")) {
 		err = device_property_read_string(dev, "label", &label);
 		if (err < 0)
 			goto free_hwmon;
-- 
2.34.1

