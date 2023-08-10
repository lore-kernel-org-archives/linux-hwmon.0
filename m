Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A104EC04A6A
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 06:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbjHJG10 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjHJG10 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 02:27:26 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9B910F5
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Aug 2023 23:27:25 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLxhS2y80zJsYk;
        Thu, 10 Aug 2023 14:23:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:27:21 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] hwmon: (nsa320-hwmon) Remove redundant of_match_ptr()
Date:   Thu, 10 Aug 2023 14:26:35 +0800
Message-ID: <20230810062635.1947552-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/hwmon/nsa320-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
index e26334469549..18076ba7fc14 100644
--- a/drivers/hwmon/nsa320-hwmon.c
+++ b/drivers/hwmon/nsa320-hwmon.c
@@ -191,7 +191,7 @@ static struct platform_driver nsa320_hwmon_driver = {
 	.probe = nsa320_hwmon_probe,
 	.driver = {
 		.name = "nsa320-hwmon",
-		.of_match_table = of_match_ptr(of_nsa320_hwmon_match),
+		.of_match_table = of_nsa320_hwmon_match,
 	},
 };
 
-- 
2.34.1

