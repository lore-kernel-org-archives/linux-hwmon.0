Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D91C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 13:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiK0NoD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 08:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiK0NoC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 08:44:02 -0500
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658D38D;
        Sun, 27 Nov 2022 05:44:01 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VVllJei_1669556633;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VVllJei_1669556633)
          by smtp.aliyun-inc.com;
          Sun, 27 Nov 2022 21:43:58 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] hwmon: (hih6130) Modify mismatched function name
Date:   Sun, 27 Nov 2022 21:43:51 +0800
Message-Id: <20221127134351.87394-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

No functional modification involved.

drivers/hwmon/hih6130.c:185: warning: expecting prototype for hih6130_show_humidity(). Prototype was for hih6130_humidity_show() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3264
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hwmon/hih6130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index d9394e19fea8..764e6e185d98 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -172,7 +172,7 @@ static ssize_t hih6130_temperature_show(struct device *dev,
 }
 
 /**
- * hih6130_show_humidity() - show humidity measurement value in sysfs
+ * hih6130_humidity_show() - show humidity measurement value in sysfs
  * @dev: device
  * @attr: device attribute
  * @buf: sysfs buffer (PAGE_SIZE) where measurement values are written to
-- 
2.20.1.7.g153144c

