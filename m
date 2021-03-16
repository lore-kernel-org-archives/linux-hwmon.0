Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90D7C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 11:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C11964FAE
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 11:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbhCPLBX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 07:01:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:14347 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbhCPLAk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 07:00:40 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F09JG1BP3z8y0k;
        Tue, 16 Mar 2021 18:58:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 19:00:21 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <tangzihao1@hisilicon.com>, <huangdaode@huawei.com>
Subject: [PATCH V2] hwmon: (ina2xx) Convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Tue, 16 Mar 2021 19:00:57 +0800
Message-ID: <1615892457-35501-1-git-send-email-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Zihao Tang <tangzihao1@hisilicon.com>

Fix the following coccicheck warning:

drivers/hwmon/ina2xx.c:313:8-16: WARNING: use scnprintf or sprintf
drivers/hwmon/ina2xx.c:453:8-16: WARNING: use scnprintf or sprintf
drivers/hwmon/ina2xx.c:484:8-16: WARNING: use scnprintf or sprintf
drivers/hwmon/ina2xx.c:540:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/hwmon/ina2xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index ca97f9e..8acb2db 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -310,8 +310,7 @@ static ssize_t ina2xx_value_show(struct device *dev,
 	if (err < 0)
 		return err;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			ina2xx_get_value(data, attr->index, regval));
+	return sysfs_emit(buf, "%d\n", ina2xx_get_value(data, attr->index, regval));
 }
 
 static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
@@ -450,7 +449,7 @@ static ssize_t ina226_alarm_show(struct device *dev,
 
 	alarm = (regval & BIT(attr->index)) &&
 		(regval & INA226_ALERT_FUNCTION_FLAG);
-	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
+	return sysfs_emit(buf, "%d\n", alarm);
 }
 
 /*
@@ -481,7 +480,7 @@ static ssize_t ina2xx_shunt_show(struct device *dev,
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
+	return sysfs_emit(buf, "%li\n", data->rshunt);
 }
 
 static ssize_t ina2xx_shunt_store(struct device *dev,
@@ -537,7 +536,7 @@ static ssize_t ina226_interval_show(struct device *dev,
 	if (status)
 		return status;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ina226_reg_to_interval(regval));
+	return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
 }
 
 /* shunt voltage */
-- 
2.7.4

