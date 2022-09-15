Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52678ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 09:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiIOJHA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 05:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiIOJGy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 05:06:54 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3780C96765
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BWG3C
        fH3LoaWjMkS0PUZrO0NbIJWQIrTjQv2jq4AYco=; b=GOrDgLLls4dT9R0KT+GJb
        KRVTdvur7GSYxmJNz+gGIRsv21Mx7RPpvPBycKzGq8licmbRWfZy1g5oVOxg8f95
        jWCtl9oojEkNeYV2nd0wr0DeBVCvOXnRuqpMuKRo903l/I/vy1VWGr3NjF2ZJUvb
        4YCvDzM8FGSH/m8+eZtosk=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgDHwjIU6yJjsJTzBg--.42313S2;
        Thu, 15 Sep 2022 17:06:30 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tharvey@gateworks.com, jdelvare@suse.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org
Cc:     windhl@126.com, chenmengda2009@163.com
Subject: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
Date:   Thu, 15 Sep 2022 17:06:27 +0800
Message-Id: <20220915090627.4007728-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDHwjIU6yJjsJTzBg--.42313S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxZw1kWw1rWF1ktw1DJrb_yoWkGwc_ur
        1xur9xZrn5AF4Skr4qvF4fur1qya15Wr12g3ZayrW3Aw15ZrsIqr1q9FnxJ39xZry3WFy5
        X3yqyrWSyr15ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMeHDDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BZ9F1pEEQpFIgAAsC
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
the of_find_compatible_node() which will automatically call
of_node_put() for the 'from' argument.

Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
Co-developed-by: Mengda Chen <chenmengda2009@163.com>
Signed-off-by: Mengda Chen <chenmengda2009@163.com>
Signed-off-by: Liang He <windhl@126.com>
---

 v2: use proper tags advised by Guenter and based on Kernel Doc

 drivers/hwmon/gsc-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
index d64be48f1ef6..b60ec95b5edb 100644
--- a/drivers/hwmon/gsc-hwmon.c
+++ b/drivers/hwmon/gsc-hwmon.c
@@ -267,6 +267,7 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
 	pdata->nchannels = nchannels;
 
 	/* fan controller base address */
+	of_node_get(dev->parent->of_node);
 	fan = of_find_compatible_node(dev->parent->of_node, NULL, "gw,gsc-fan");
 	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {
 		of_node_put(fan);
-- 
2.25.1

