Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84509C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 08:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5022B64FB3
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 08:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbhCPIKy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 04:10:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13625 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhCPIKk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 04:10:40 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F05XF1915z17LrV;
        Tue, 16 Mar 2021 16:08:45 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 16:10:27 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <huangdaode@huawei.com>
Subject: [PATCH] hwmon: (ina2xx) Convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Tue, 16 Mar 2021 16:11:02 +0800
Message-ID: <1615882262-39367-1-git-send-email-f.fangjian@huawei.com>
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
 drivers/hwmon/ina2xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index ca97f9e..2c12395 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -310,7 +310,7 @@ static ssize_t ina2xx_value_show(struct device *dev,
 	if (err < 0)
 		return err;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			ina2xx_get_value(data, attr->index, regval));
 }
 
@@ -450,7 +450,7 @@ static ssize_t ina226_alarm_show(struct device *dev,
 
 	alarm = (regval & BIT(attr->index)) &&
 		(regval & INA226_ALERT_FUNCTION_FLAG);
-	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
+	return sysfs_emit(buf, "%d\n", alarm);
 }
 
 /*
@@ -481,7 +481,7 @@ static ssize_t ina2xx_shunt_show(struct device *dev,
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
+	return sysfs_emit(buf, "%li\n", data->rshunt);
 }
 
 static ssize_t ina2xx_shunt_store(struct device *dev,
@@ -537,7 +537,7 @@ static ssize_t ina226_interval_show(struct device *dev,
 	if (status)
 		return status;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ina226_reg_to_interval(regval));
+	return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
 }
 
 /* shunt voltage */
-- 
2.7.4

