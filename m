Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEE6ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 16:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiIPQDI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 12:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiIPQCx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 12:02:53 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Sep 2022 09:02:50 PDT
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E4E7B56EB
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bPnqF
        v1HqQWFe6uSD+rBCt0vnw8wWQ0OVfuTJeOfZ5E=; b=GN7eA+V/2Qr61skTuJb0H
        s2w/t7cTV6cUw1NOvSnBp2Xgfve8l3eSeedkb5Hcwf+5XcK+1h9rhzum0EsPWbuh
        jBo8pF7mZphpkdIiP5eiS6oIB9R9aE56NQRiqXualn5X2EPIOQgQM1c74808NwE3
        tRUyPjddYqblUz3zRf3syo=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp14 (Coremail) with SMTP id EsCowAA33RWDmiRjpEr3AA--.23823S2;
        Fri, 16 Sep 2022 23:47:15 +0800 (CST)
From:   Mengda Chen <chenmengda2009@163.com>
To:     tharvey@gateworks.com, jdelvare@suse.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org
Cc:     windhl@126.com, chenmengda2009@163.com
Subject: [PATCH v3] hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
Date:   Fri, 16 Sep 2022 23:47:08 +0800
Message-Id: <20220916154708.3084515-1-chenmengda2009@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAA33RWDmiRjpEr3AA--.23823S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxZw1kWw1rWF17ZF1xGrg_yoWDKFg_ur
        1xWr9xZrn5CFWSyr4qvFWfuw1qya15Wr12gFnayrW3A3WrZrsIgr1v9FnrX3sxury3WFy5
        Z3yDtrWSyr45ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJDGeDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: xfkh0zxhqjvtisqqmqqrwthudrp/xtbBZxF+wFet8y5xOQAAsn
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Liang He <windhl@126.com>

In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
the of_find_compatible_node() which will automatically call
of_node_put() for the 'from' argument.

Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
Signed-off-by: Liang He <windhl@126.com>
Co-developed-by: Mengda Chen <chenmengda2009@163.com>
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

