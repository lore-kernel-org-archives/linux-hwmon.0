Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCECFC43334
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jun 2022 15:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbiFOPv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jun 2022 11:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240820AbiFOPv5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jun 2022 11:51:57 -0400
X-Greylist: delayed 1892 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Jun 2022 08:51:56 PDT
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76C98340D1
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jun 2022 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kBZpZ
        Ni0IzFVrGPXICtLVv6ONBZOKzsw8uMayRGVs98=; b=SmmjdRubGXLXUEpQk2u5R
        FsxJkO4gFqNlBncNEePlj9O0tJPM/0QhhAjTaL5q6MQppv8rJFJXyvCJXeugDVGH
        DfqBuMbMRlXQzxVw07q4YjEfii9GjBR8IvNtLZQv/73VHmNGZlhyQYamb2M17xUy
        NPfLngAfF/epvcECR21FIc=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAAXWPdg+KliVeZzDQ--.47862S2;
        Wed, 15 Jun 2022 23:18:57 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tharvey@gateworks.com, rjones@gateworks.com, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] drivers: hwmon: Add missing of_node_put() in gsc-hwmon.c
Date:   Wed, 15 Jun 2022 23:18:56 +0800
Message-Id: <20220615151856.3970186-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAAXWPdg+KliVeZzDQ--.47862S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyfGF15Jry8Cr17GrWrGrg_yoWkCrg_Zr
        yxWr9xXr98XF1Syr4DCa1Svryqyr4xWFs7Wan7t398AFn8Zrn8Wr1qvrn7W3sxurWagF98
        X3yqyr4Iyr1fujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_j2M7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AMhF1pEDud6qAAAsM
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In gsc_hwmon_get_devtree_pdata(), of_find_compatible_node() will return
a node pointer with refcount incremented. We should use of_node_put() in
fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/hwmon/gsc-hwmon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
index 1fe37418ff46..34c20d13627a 100644
--- a/drivers/hwmon/gsc-hwmon.c
+++ b/drivers/hwmon/gsc-hwmon.c
@@ -268,10 +268,14 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
 
 	/* fan controller base address */
 	fan = of_find_compatible_node(dev->parent->of_node, NULL, "gw,gsc-fan");
-	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {
+	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {		
+		of_node_put(fan);
 		dev_err(dev, "fan node without base\n");
 		return ERR_PTR(-EINVAL);
 	}
+	
+	/* if fan&&!of_property_read_u32 fail */
+	of_node_put(fan);
 
 	/* allocate structures for channels and count instances of each type */
 	device_for_each_child_node(dev, child) {
-- 
2.25.1

