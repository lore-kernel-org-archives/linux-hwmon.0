Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1887C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 03:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 782AF61939
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 03:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCVDJX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Mar 2021 23:09:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14120 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCVDJO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Mar 2021 23:09:14 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F3fYZ69lhz18GmM;
        Mon, 22 Mar 2021 11:07:14 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 11:09:05 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <tangzihao1@hisilicon.com>, <huangdaode@huawei.com>
Subject: [PATCH] hwmon: (ina3221) Convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Mon, 22 Mar 2021 11:09:37 +0800
Message-ID: <1616382577-63691-1-git-send-email-f.fangjian@huawei.com>
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

drivers/hwmon/ina3221.c:701:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/hwmon/ina3221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d80bd3e..c602583 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -698,7 +698,7 @@ static ssize_t ina3221_shunt_show(struct device *dev,
 	unsigned int channel = sd_attr->index;
 	struct ina3221_input *input = &ina->inputs[channel];
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
+	return sysfs_emit(buf, "%d\n", input->shunt_resistor);
 }
 
 static ssize_t ina3221_shunt_store(struct device *dev,
-- 
2.7.4

