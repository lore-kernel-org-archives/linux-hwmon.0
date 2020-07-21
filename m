Return-Path: <SRS0=0msx=BA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05AEC433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jul 2020 13:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8E6C20792
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jul 2020 13:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgGUNji (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Jul 2020 09:39:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:56816 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728477AbgGUNjh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Jul 2020 09:39:37 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F0978D3E47D864E25938;
        Tue, 21 Jul 2020 21:39:32 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Jul 2020 21:39:22 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next] hwmon: sparx5: Make symbol 's5_temp_match' static
Date:   Tue, 21 Jul 2020 21:49:19 +0800
Message-ID: <20200721134919.34033-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The sparse tool complains as follows:

drivers/hwmon/sparx5-temp.c:150:27: warning:
 symbol 's5_temp_match' was not declared. Should it be static?

This variable is not used outside of sparx5-temp.c, this commit
marks it static.

Fixes: c2cb4b5777e1 ("hwmon: sparx5: Add Sparx5 SoC temperature driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/sparx5-temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 7d7a060259a8..1a2b1026b026 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -147,7 +147,7 @@ static int s5_temp_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-const struct of_device_id s5_temp_match[] = {
+static const struct of_device_id s5_temp_match[] = {
 	{ .compatible = "microchip,sparx5-temp" },
 	{},
 };

