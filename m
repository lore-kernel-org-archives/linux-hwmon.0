Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168C2C54EE9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Sep 2022 11:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbiI0LaU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Sep 2022 07:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiI0L3K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 07:29:10 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962C7A925C
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Sep 2022 04:28:21 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McHNg61DNzpTHr;
        Tue, 27 Sep 2022 19:25:23 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 19:28:18 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <liwei391@huawei.com>,
        <zengheng4@huawei.com>
Subject: [PATCH -next] hwmon: (nct6683) remove unused variable in nct6683_create_attr_group
Date:   Tue, 27 Sep 2022 19:43:52 +0800
Message-ID: <20220927114352.2498079-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When enable 'unused-but-set-variable' compile
warning option, it would raise warning as below:

drivers/hwmon/nct6683.c:415:9:
warning: variable 'j' set but not used [-Wunused-but-set-variable]

Variable 'j' in nct6683_create_attr_group is unused,
so remove it and simplify the 'for' loop.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/hwmon/nct6683.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 6a9f420e7d32..a872f783e9cc 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -412,7 +412,7 @@ nct6683_create_attr_group(struct device *dev,
 	struct sensor_device_attr_u *su;
 	struct attribute_group *group;
 	struct attribute **attrs;
-	int i, j, count;
+	int i, count;
 
 	if (repeat <= 0)
 		return ERR_PTR(-EINVAL);
@@ -443,7 +443,7 @@ nct6683_create_attr_group(struct device *dev,
 
 	for (i = 0; i < repeat; i++) {
 		t = tg->templates;
-		for (j = 0; *t != NULL; j++) {
+		while (*t) {
 			snprintf(su->name, sizeof(su->name),
 				 (*t)->dev_attr.attr.name, tg->base + i);
 			if ((*t)->s2) {
-- 
2.25.1

