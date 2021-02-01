Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BF8C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 20:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 138CE601FB
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 20:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhBAUFb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Feb 2021 15:05:31 -0500
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:48032 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhBAUEM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Feb 2021 15:04:12 -0500
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 86B65708CC4
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Feb 2021 20:59:54 +0100 (CET)
Received: from s645.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id 677962E2C946;
        Mon,  1 Feb 2021 20:59:54 +0100 (CET)
Received: from s472.loopia.se (unknown [172.22.191.6])
        by s645.loopia.se (Postfix) with ESMTP id 582F61579F39;
        Mon,  1 Feb 2021 20:59:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s499.loopia.se ([172.22.191.5])
        by s472.loopia.se (s472.loopia.se [172.22.190.12]) (amavisd-new, port 10024)
        with LMTP id V4hAb4oufpMl; Mon,  1 Feb 2021 20:59:53 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.176
Received: from localhost.localdomain (h-155-4-131-176.NA.cust.bahnhof.se [155.4.131.176])
        (Authenticated sender: carl@hgsystem.se)
        by s499.loopia.se (Postfix) with ESMTPSA id 525251CDD839;
        Mon,  1 Feb 2021 20:59:53 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 1/2] Clear sensor data after chip write
Date:   Mon,  1 Feb 2021 20:59:28 +0100
Message-Id: <20210201195929.1200-2-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210201195929.1200-1-erik.rosen@metormote.com>
References: <20210201195929.1200-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Set the sensor->data field to -ENODATA to force a chip access next time
the sensor value is read.

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 192442b3b7a2..e27f23eee1e3 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -974,7 +974,7 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 	if (ret < 0)
 		rv = ret;
 	else
-		sensor->data = regval;
+		sensor->data = -ENODATA;
 	mutex_unlock(&data->update_lock);
 	return rv;
 }
-- 
2.20.1

