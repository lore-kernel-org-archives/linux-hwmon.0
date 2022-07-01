Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67862C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 Jul 2022 07:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbiGAHc3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 Jul 2022 03:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235255AbiGAHc2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Jul 2022 03:32:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B746D558;
        Fri,  1 Jul 2022 00:32:27 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LZ6Lv1411zkWYH;
        Fri,  1 Jul 2022 15:31:03 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 15:32:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 15:32:24 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, <jdelvare@suse.com>
Subject: [PATCH] hwmon: (ibmaem) don't call platform_device_del() if platform_device_add() fails
Date:   Fri, 1 Jul 2022 15:41:53 +0800
Message-ID: <20220701074153.4021556-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If platform_device_add() fails, it no need to call platform_device_del(), split
platform_device_unregister() into platform_device_del/put(), so platform_device_put()
can be called separately.

Fixes: 8808a793f052 ("ibmaem: new driver for power/energy/temp meters in IBM System X hardware")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/hwmon/ibmaem.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 5c4cf742f5ae..157e232aace0 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -550,7 +550,7 @@ static int aem_init_aem1_inst(struct aem_ipmi_data *probe, u8 module_handle)
 
 	res = platform_device_add(data->pdev);
 	if (res)
-		goto ipmi_err;
+		goto dev_add_err;
 
 	platform_set_drvdata(data->pdev, data);
 
@@ -598,7 +598,9 @@ static int aem_init_aem1_inst(struct aem_ipmi_data *probe, u8 module_handle)
 	ipmi_destroy_user(data->ipmi.user);
 ipmi_err:
 	platform_set_drvdata(data->pdev, NULL);
-	platform_device_unregister(data->pdev);
+	platform_device_del(data->pdev);
+dev_add_err:
+	platform_device_put(data->pdev);
 dev_err:
 	ida_free(&aem_ida, data->id);
 id_err:
@@ -690,7 +692,7 @@ static int aem_init_aem2_inst(struct aem_ipmi_data *probe,
 
 	res = platform_device_add(data->pdev);
 	if (res)
-		goto ipmi_err;
+		goto dev_add_err;
 
 	platform_set_drvdata(data->pdev, data);
 
@@ -738,7 +740,9 @@ static int aem_init_aem2_inst(struct aem_ipmi_data *probe,
 	ipmi_destroy_user(data->ipmi.user);
 ipmi_err:
 	platform_set_drvdata(data->pdev, NULL);
-	platform_device_unregister(data->pdev);
+	platform_device_del(data->pdev);
+dev_add_err:
+	platform_device_put(data->pdev);
 dev_err:
 	ida_free(&aem_ida, data->id);
 id_err:
-- 
2.25.1

