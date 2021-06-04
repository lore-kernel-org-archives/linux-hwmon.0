Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A13C47096
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jun 2021 03:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5235C611ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jun 2021 03:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFDDLu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Jun 2021 23:11:50 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:47092 "EHLO nksmu.kylinos.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229718AbhFDDLu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Jun 2021 23:11:50 -0400
X-UUID: da0bcbaed8fc4653ab6935434e2e54ea-20210604
X-UUID: da0bcbaed8fc4653ab6935434e2e54ea-20210604
X-User: luriwen@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
        (envelope-from <luriwen@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 5188936; Fri, 04 Jun 2021 11:09:45 +0800
From:   Riwen Lu <luriwen@kylinos.cn>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Riwen Lu <luriwen@kylinos.cn>, Xin Chen <chenxin@kylinos.cn>
Subject: [PATCH v3] hwmon: (scpi-hwmon) shows the negative temperature properly
Date:   Fri,  4 Jun 2021 11:09:59 +0800
Message-Id: <20210604030959.736379-1-luriwen@kylinos.cn>
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

Changes since v2:
- Add a typecast u64 to s64 when it is a temperature value.
- Add a comment ahead of the if statement.
- Remove the unnecessary 'else' statement.
---
 drivers/hwmon/scpi-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 25aac40f2764..919877970ae3 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -99,6 +99,15 @@ scpi_show_sensor(struct device *dev, struct device_attribute *attr, char *buf)
 
 	scpi_scale_reading(&value, sensor);
 
+	/*
+	 * Temperature sensor values are treated as signed values based on
+	 * observation even though that is not explicitly specified, and
+	 * because an unsigned u64 temperature does not really make practical
+	 * sense especially when the temperature is below zero degrees Celsius.
+	 */
+	if (sensor->info.class == TEMPERATURE)
+		return sprintf(buf, "%lld\n", (s64)value);
+
 	return sprintf(buf, "%llu\n", value);
 }
 
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
