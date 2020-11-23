Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C67C2D0E4
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 10:16:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 331322078E
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 10:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgKWKQc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:16:32 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8386 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgKWKQc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Nov 2020 05:16:32 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CfjjR622Hz72Mj;
        Mon, 23 Nov 2020 18:16:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Nov 2020
 18:16:28 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (ina3221) Fix PM usage counter unbalance in ina3221_write_enable
Date:   Mon, 23 Nov 2020 18:20:00 +0800
Message-ID: <20201123102000.3864999-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pm_runtime_get_sync will increment pm usage counter
even it failed. Forgetting to putting operation will
result in reference leak here. We fix it by replacing
it with pm_runtime_resume_and_get to keep usage counter
balanced.

Fixes: 323aeb0eb5d9a ("hwmon: (ina3221) Add PM runtime support")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/hwmon/ina3221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 72cfdc007e60..d80bd3efcd6d 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -489,7 +489,7 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 
 	/* For enabling routine, increase refcount and resume() at first */
 	if (enable) {
-		ret = pm_runtime_get_sync(ina->pm_dev);
+		ret = pm_runtime_resume_and_get(ina->pm_dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to get PM runtime\n");
 			return ret;
-- 
2.25.4

