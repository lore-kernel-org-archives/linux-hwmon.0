Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853CAC433DB
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Feb 2021 08:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EBF864F69
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Feb 2021 08:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhBBIuU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Feb 2021 03:50:20 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:51579 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232744AbhBBIuR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 2 Feb 2021 03:50:17 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UNfEMIj_1612255745;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNfEMIj_1612255745)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Feb 2021 16:49:11 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] hwmon: (pmbus) convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Tue,  2 Feb 2021 16:49:03 +0800
Message-Id: <1612255743-52579-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix the following coccicheck warning:

./drivers/hwmon/pmbus/inspur-ipsps.c:73:8-16: WARNING: use scnprintf or
sprintf.

./drivers/hwmon/pmbus/inspur-ipsps.c:114:9-17: WARNING: use scnprintf or
sprintf.

./drivers/hwmon/pmbus/inspur-ipsps.c:94:8-16: WARNING: use scnprintf or
sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Modified code space.

 drivers/hwmon/pmbus/inspur-ipsps.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 88c5865..bf593fd 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -70,7 +70,7 @@ static ssize_t ipsps_string_show(struct device *dev,
 	p = memscan(data, '#', rc);
 	*p = '\0';
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", data);
+	return sysfs_emit(buf, "%s\n", data);
 }
 
 static ssize_t ipsps_fw_version_show(struct device *dev,
@@ -91,9 +91,9 @@ static ssize_t ipsps_fw_version_show(struct device *dev,
 	if (rc != 6)
 		return -EPROTO;
 
-	return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
-			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
-			data[4], data[5]/* < 100 */);
+	return sysfs_emit(buf, "%u.%02u%u-%u.%02u\n",
+			  data[1], data[2]/* < 100 */, data[3]/*< 10*/,
+			  data[4], data[5]/* < 100 */);
 }
 
 static ssize_t ipsps_mode_show(struct device *dev,
@@ -111,19 +111,19 @@ static ssize_t ipsps_mode_show(struct device *dev,
 
 	switch (rc) {
 	case MODE_ACTIVE:
-		return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "[%s] %s %s\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	case MODE_STANDBY:
-		return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "%s [%s] %s\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	case MODE_REDUNDANCY:
-		return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "%s %s [%s]\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	default:
-		return snprintf(buf, PAGE_SIZE, "unspecified\n");
+		return sysfs_emit(buf, "unspecified\n");
 	}
 }
 
-- 
1.8.3.1

