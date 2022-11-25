Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFF2C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Nov 2022 01:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiKYBph (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Nov 2022 20:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKYBpf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2022 20:45:35 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCF931B
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 17:45:34 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NJHjf2BpTzHtgm;
        Fri, 25 Nov 2022 09:44:54 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 09:45:32 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <eugene.shalygin@gmail.com>, <jdelvare@suse.com>,
        <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] hwmon: (asus-ec-sensors) Add checks for devm_kcalloc
Date:   Fri, 25 Nov 2022 01:43:29 +0000
Message-ID: <20221125014329.121560-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As the devm_kcalloc may return NULL, the return value needs to be checked
to avoid NULL poineter dereference.

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 81e688975c6a..a901e4e33d81 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -938,6 +938,8 @@ static int asus_ec_probe(struct platform_device *pdev)
 	ec_data->nr_sensors = hweight_long(ec_data->board_info->sensors);
 	ec_data->sensors = devm_kcalloc(dev, ec_data->nr_sensors,
 					sizeof(struct ec_sensor), GFP_KERNEL);
+	if (!ec_data->sensors)
+		return -ENOMEM;
 
 	status = setup_lock_data(dev);
 	if (status) {
-- 
2.17.1

