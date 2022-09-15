Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420B7ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 02:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiIOCDO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Sep 2022 22:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiIOCDN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Sep 2022 22:03:13 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C36C80B6B
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Sep 2022 19:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1H9bg
        fLADeY5TLmobMz+1+6ynNLnCFMZbr1Mgt3FL5c=; b=NvjDVZ6woKW/vPq34fnog
        H04Ve52JlstoAtvLZyzjup7tOJtTZeAuXaVSGQel6AcoF23vzxX+0T1bkDBhIzS6
        +y08qbUThqvRdImN579DtWjot0I64RiP9GP98yfwmeVRBuKCRAH6mcELazH83t9t
        fPErZTeex+d/gqcIdeCK20=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp2 (Coremail) with SMTP id DMmowAAXnWHGhyJjRWw7Bg--.40446S2;
        Thu, 15 Sep 2022 10:02:47 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tharvey@gateworks.com, rjones@gateworks.com, jdelvare@suse.com,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc:     windhl@126.com, chenmengda2009@163.com
Subject: [PATCH] hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
Date:   Thu, 15 Sep 2022 10:02:45 +0800
Message-Id: <20220915020245.4001047-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAAXnWHGhyJjRWw7Bg--.40446S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxZw1kWw1rXFy5Kr4fGrg_yoWDGwb_ur
        4xWr9xXrn8CFWSyr4qvF4furyqyr4UWr12g3ZayrW3A3WUZrs0qrnYvFnrJ39xury3WFy5
        Xw4DtrWSyr4rZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRibyZUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgF9F1-HZ1az8gAAsZ
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
the of_find_compatible_node() which will automatically call
of_node_put() for the 'from' argument.

Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
Signed-off-by: Liang He <windhl@126.com>
Signed-off-by: Mengda Chen <chenmengda2009@163.com>
---
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

