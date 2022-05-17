Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3EFC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 02:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiEQCW2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 22:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiEQCW0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 22:22:26 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9626A1835C;
        Mon, 16 May 2022 19:22:24 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L2Kcb08VLzhZDH;
        Tue, 17 May 2022 10:21:35 +0800 (CST)
Received: from dggpemm500018.china.huawei.com (7.185.36.111) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 10:21:57 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 10:21:56 +0800
From:   keliu <liuke94@huawei.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     keliu <liuke94@huawei.com>
Subject: [PATCH] hwmon: Directly use ida_alloc()/free()
Date:   Tue, 17 May 2022 02:40:22 +0000
Message-ID: <20220517024022.1980274-1-liuke94@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500018.china.huawei.com (7.185.36.111)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use ida_alloc()/ida_free() instead of deprecated
ida_simple_get()/ida_simple_remove() .

Signed-off-by: keliu <liuke94@huawei.com>
---
 drivers/hwmon/hwmon.c  |  6 +++---
 drivers/hwmon/ibmaem.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 22de7a9e7ba7..2e2cd79d89eb 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -764,7 +764,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 			 "hwmon: '%s' is not a valid name attribute, please fix\n",
 			 name);
 
-	id = ida_simple_get(&hwmon_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&hwmon_ida, GFP_KERNEL);
 	if (id < 0)
 		return ERR_PTR(id);
 
@@ -856,7 +856,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 free_hwmon:
 	hwmon_dev_release(hdev);
 ida_remove:
-	ida_simple_remove(&hwmon_ida, id);
+	ida_free(&hwmon_ida, id);
 	return ERR_PTR(err);
 }
 
@@ -968,7 +968,7 @@ void hwmon_device_unregister(struct device *dev)
 
 	if (likely(sscanf(dev_name(dev), HWMON_ID_FORMAT, &id) == 1)) {
 		device_unregister(dev);
-		ida_simple_remove(&hwmon_ida, id);
+		ida_free(&hwmon_ida, id);
 	} else
 		dev_dbg(dev->parent,
 			"hwmon_device_unregister() failed: bad class ID!\n");
diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index de6baf6ca3d1..5c4cf742f5ae 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -482,7 +482,7 @@ static void aem_delete(struct aem_data *data)
 	ipmi_destroy_user(data->ipmi.user);
 	platform_set_drvdata(data->pdev, NULL);
 	platform_device_unregister(data->pdev);
-	ida_simple_remove(&aem_ida, data->id);
+	ida_free(&aem_ida, data->id);
 	kfree(data);
 }
 
@@ -539,7 +539,7 @@ static int aem_init_aem1_inst(struct aem_ipmi_data *probe, u8 module_handle)
 		data->power_period[i] = AEM_DEFAULT_POWER_INTERVAL;
 
 	/* Create sub-device for this fw instance */
-	data->id = ida_simple_get(&aem_ida, 0, 0, GFP_KERNEL);
+	data->id = ida_alloc(&aem_ida, GFP_KERNEL);
 	if (data->id < 0)
 		goto id_err;
 
@@ -600,7 +600,7 @@ static int aem_init_aem1_inst(struct aem_ipmi_data *probe, u8 module_handle)
 	platform_set_drvdata(data->pdev, NULL);
 	platform_device_unregister(data->pdev);
 dev_err:
-	ida_simple_remove(&aem_ida, data->id);
+	ida_free(&aem_ida, data->id);
 id_err:
 	kfree(data);
 
@@ -679,7 +679,7 @@ static int aem_init_aem2_inst(struct aem_ipmi_data *probe,
 		data->power_period[i] = AEM_DEFAULT_POWER_INTERVAL;
 
 	/* Create sub-device for this fw instance */
-	data->id = ida_simple_get(&aem_ida, 0, 0, GFP_KERNEL);
+	data->id = ida_alloc(&aem_ida, GFP_KERNEL);
 	if (data->id < 0)
 		goto id_err;
 
@@ -740,7 +740,7 @@ static int aem_init_aem2_inst(struct aem_ipmi_data *probe,
 	platform_set_drvdata(data->pdev, NULL);
 	platform_device_unregister(data->pdev);
 dev_err:
-	ida_simple_remove(&aem_ida, data->id);
+	ida_free(&aem_ida, data->id);
 id_err:
 	kfree(data);
 
-- 
2.25.1

