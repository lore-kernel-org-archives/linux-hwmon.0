Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835B8EB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 00:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjGRA2t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 20:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjGRA2t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 20:28:49 -0400
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDE610C4;
        Mon, 17 Jul 2023 17:28:40 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VnfMp9j_1689640117;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VnfMp9j_1689640117)
          by smtp.aliyun-inc.com;
          Tue, 18 Jul 2023 08:28:38 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] hwmon: Remove duplicated include in lm75.c
Date:   Tue, 18 Jul 2023 08:28:36 +0800
Message-Id: <20230718002836.118268-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

./drivers/hwmon/lm75.c: linux/of.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5900
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/hwmon/lm75.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 72cdc405a3b0..bcfa8193e5e7 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -14,7 +14,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 #include <linux/regulator/consumer.h>
-- 
2.20.1.7.g153144c

