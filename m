Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B25C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 12:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7BD1613CC
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 12:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhEUMs7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 08:48:59 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:43804 "EHLO nksmu.kylinos.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234145AbhEUMs6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 08:48:58 -0400
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 08:48:37 EDT
X-UUID: c72d25bcf0b54f778f2a912c437cfc23-20210521
X-UUID: c72d25bcf0b54f778f2a912c437cfc23-20210521
X-User: luriwen@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
        (envelope-from <luriwen@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 1469929180; Fri, 21 May 2021 20:42:08 +0800
From:   Riwen Lu <luriwen@kylinos.cn>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Riwen Lu <luriwen@kylinos.cn>, Xin Chen <chenxin@kylinos.cn>
Subject: [PATCH v1] hwmon: (scpi-hwmon) shows the negative temperature properly
Date:   Fri, 21 May 2021 20:42:04 +0800
Message-Id: <20210521124204.22263-1-luriwen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The scpi hwmon shows the sub-zero temperature in an unsigned integer,
which would confuse the users when the machine works in low temperature
environment. This shows the sub-zero temperature in an signed value and
users can get it properly from sensors.

Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
Tested-by: Xin Chen <chenxin@kylinos.cn>
---
 drivers/hwmon/scpi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 25aac40f2764..583a600bc82d 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -99,7 +99,7 @@ scpi_show_sensor(struct device *dev, struct device_attribute *attr, char *buf)
 
 	scpi_scale_reading(&value, sensor);
 
-	return sprintf(buf, "%llu\n", value);
+	return sprintf(buf, "%lld\n", value);
 }
 
 static ssize_t
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
