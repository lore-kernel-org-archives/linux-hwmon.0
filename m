Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BA5C433ED
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 20:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FDA861355
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 20:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhESUL5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 16:11:57 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:56077 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232995AbhESULs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 16:11:48 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 23D602E63900
        for <linux-hwmon@vger.kernel.org>; Wed, 19 May 2021 22:10:24 +0200 (CEST)
Received: from s499.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id 138D72E2B066;
        Wed, 19 May 2021 22:10:24 +0200 (CEST)
Received: from s898.loopia.se (unknown [172.22.191.5])
        by s499.loopia.se (Postfix) with ESMTP id 0F7D61CE67F0;
        Wed, 19 May 2021 22:10:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s899.loopia.se ([172.22.191.5])
        by s898.loopia.se (s898.loopia.se [172.22.190.17]) (amavisd-new, port 10024)
        with LMTP id 7wsbfMAeYpbW; Wed, 19 May 2021 22:10:23 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.133.180
Received: from localhost.localdomain (h-155-4-133-180.NA.cust.bahnhof.se [155.4.133.180])
        (Authenticated sender: carl@hgsystem.se)
        by s899.loopia.se (Postfix) with ESMTPSA id 502ED2C8B9C1;
        Wed, 19 May 2021 22:10:23 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 3/5] hwmon: (pmbus/pim4328) Allow phase function even if it's not on page
Date:   Wed, 19 May 2021 22:10:13 +0200
Message-Id: <20210519201015.83989-4-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210519201015.83989-1-erik.rosen@metormote.com>
References: <20210519201015.83989-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allow the use of a phase function even if it does not exist not on
the associated page.

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 944570edf37f..2f355d5d83bc 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1366,14 +1366,14 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 
 		pages = paged ? info->pages : 1;
 		for (page = 0; page < pages; page++) {
-			if (!(info->func[page] & attrs->func))
-				continue;
-			ret = pmbus_add_sensor_attrs_one(client, data, info,
-							 name, index, page,
-							 0xff, attrs, paged);
-			if (ret)
-				return ret;
-			index++;
+			if (info->func[page] & attrs->func) {
+				ret = pmbus_add_sensor_attrs_one(client, data, info,
+								 name, index, page,
+								 0xff, attrs, paged);
+				if (ret)
+					return ret;
+				index++;
+			}
 			if (info->phases[page]) {
 				int phase;
 
-- 
2.20.1

