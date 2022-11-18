Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB90CC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Nov 2022 09:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbiKRJen (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Nov 2022 04:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241240AbiKRJen (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2022 04:34:43 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F80195AB
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 01:34:41 -0800 (PST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NDBSH3vjnzHvrw;
        Fri, 18 Nov 2022 17:34:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 17:34:39 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 17:34:39 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <fenghua.yu@intel.com>
CC:     <linux-hwmon@vger.kernel.org>, <jdelvare@suse.com>,
        <linux@roeck-us.net>, <yangyingliang@huawei.com>
Subject: [PATCH] hwmon: (coretemp) fix pci device refcount leak in nv1a_ram_new()
Date:   Fri, 18 Nov 2022 17:33:03 +0800
Message-ID: <20221118093303.214163-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As comment of pci_get_domain_bus_and_slot() says, it returns
a pci device with refcount increment, when finish using it,
the caller must decrement the reference count by calling
pci_dev_put(). So call it after using to avoid refcount leak.

Fixes: 14513ee696a0 ("hwmon: (coretemp) Use PCI host bridge ID to identify CPU if necessary")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/hwmon/coretemp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 8bf32c6c85d9..84a980fa0671 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -242,10 +242,13 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 	 */
 	if (host_bridge && host_bridge->vendor == PCI_VENDOR_ID_INTEL) {
 		for (i = 0; i < ARRAY_SIZE(tjmax_pci_table); i++) {
-			if (host_bridge->device == tjmax_pci_table[i].device)
+			if (host_bridge->device == tjmax_pci_table[i].device) {
+				pci_dev_put(host_bridge);
 				return tjmax_pci_table[i].tjmax;
+			}
 		}
 	}
+	pci_dev_put(host_bridge);
 
 	for (i = 0; i < ARRAY_SIZE(tjmax_table); i++) {
 		if (strstr(c->x86_model_id, tjmax_table[i].id))
-- 
2.25.1

