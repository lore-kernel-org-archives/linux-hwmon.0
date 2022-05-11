Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC79C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 06:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiEKGi0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 02:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234462AbiEKGiZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 02:38:25 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8141D23F384;
        Tue, 10 May 2022 23:38:24 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KylZG3DJhz1JC19;
        Wed, 11 May 2022 14:37:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 14:38:22 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 14:38:21 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
CC:     <zbr@ioremap.net>, <jdelvare@suse.com>, <linux@roeck-us.net>,
        <gregkh@linuxfoundation.org>
Subject: [PATCH -next] drivers: w1: use kfree_sensitive()
Date:   Wed, 11 May 2022 14:49:54 +0800
Message-ID: <20220511064954.3401381-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use kfree_sensitive() instead of open-coding it.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/w1/w1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index f2ae2e563dc5..a0a6c3c739d9 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -73,8 +73,7 @@ static void w1_master_release(struct device *dev)
 	struct w1_master *md = dev_to_w1_master(dev);
 
 	dev_dbg(dev, "%s: Releasing %s.\n", __func__, md->name);
-	memset(md, 0, sizeof(struct w1_master) + sizeof(struct w1_bus_master));
-	kfree(md);
+	kfree_sensitive(md);
 }
 
 static void w1_slave_release(struct device *dev)
-- 
2.25.1

