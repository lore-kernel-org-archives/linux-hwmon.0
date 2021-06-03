Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5554CC47096
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Jun 2021 08:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AE496136E
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Jun 2021 08:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFCIkm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Jun 2021 04:40:42 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:45531 "EHLO nksmu.kylinos.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229611AbhFCIkm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Jun 2021 04:40:42 -0400
X-UUID: 0c957269bb9e4c01b82befbc6c67934a-20210603
X-UUID: 0c957269bb9e4c01b82befbc6c67934a-20210603
X-User: luriwen@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
        (envelope-from <luriwen@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 133540621; Thu, 03 Jun 2021 16:38:38 +0800
From:   Riwen Lu <luriwen@kylinos.cn>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Riwen Lu <luriwen@kylinos.cn>, Xin Chen <chenxin@kylinos.cn>
Subject: [PATCH v2] hwmon: (scpi-hwmon) shows the negative temperature properly
Date:   Thu,  3 Jun 2021 16:38:45 +0800
Message-Id: <20210603083845.569751-1-luriwen@kylinos.cn>
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
Changes since v1:
- Add judgment for sensor->info.class. If it is TEMPERATURE situation,
  return the sensor value as a signed value, otherwise return it as a
  unsigned value.
---
 drivers/hwmon/scpi-hwmon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 25aac40f2764..45a7e319143d 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -99,7 +99,10 @@ scpi_show_sensor(struct device *dev, struct device_attribute *attr, char *buf)
 
 	scpi_scale_reading(&value, sensor);
 
-	return sprintf(buf, "%llu\n", value);
+	if (sensor->info.class == TEMPERATURE)
+		return sprintf(buf, "%lld\n", value);
+	else
+		return sprintf(buf, "%llu\n", value);
 }
 
 static ssize_t
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
