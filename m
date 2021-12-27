Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02694C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Dec 2021 11:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhL0Lgr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Dec 2021 06:36:47 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:48145 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231968AbhL0Lgr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Dec 2021 06:36:47 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0V.wXMsR_1640604994;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0V.wXMsR_1640604994)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 27 Dec 2021 19:36:44 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     mezin.alexander@gmail.com
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] hwmon: Use min() instead of doing it manually
Date:   Mon, 27 Dec 2021 19:36:32 +0800
Message-Id: <20211227113632.90672-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Eliminate following coccicheck warning:

./drivers/hwmon/nzxt-smart2.c:461:12-13: WARNING opportunity for min().

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hwmon/nzxt-smart2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 534d39b8908e..b30de7441fbb 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -458,7 +458,7 @@ static int send_output_report(struct drvdata *drvdata, const void *data,
 
 	ret = hid_hw_output_report(drvdata->hid, drvdata->output_buffer,
 				   sizeof(drvdata->output_buffer));
-	return ret < 0 ? ret : 0;
+	return min(ret, 0);
 }
 
 static int set_pwm(struct drvdata *drvdata, int channel, long val)
-- 
2.20.1.7.g153144c

