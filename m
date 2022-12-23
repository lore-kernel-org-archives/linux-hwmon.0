Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACB7C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Dec 2022 08:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiLWILH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Dec 2022 03:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiLWILG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Dec 2022 03:11:06 -0500
Received: from out30-8.freemail.mail.aliyun.com (out30-8.freemail.mail.aliyun.com [115.124.30.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970BDB49D;
        Fri, 23 Dec 2022 00:11:01 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VXvsJgx_1671783058;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VXvsJgx_1671783058)
          by smtp.aliyun-inc.com;
          Fri, 23 Dec 2022 16:10:59 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] hwmon: Fix some kernel-doc comments
Date:   Fri, 23 Dec 2022 16:10:56 +0800
Message-Id: <20221223081056.88345-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Make the description of @aht10_data to @data in aht10_read_values()
and remove @client in aht10_init() to clear the below warnings:

drivers/hwmon/aht10.c:87: warning: Excess function parameter 'client' description in 'aht10_init'
drivers/hwmon/aht10.c:131: warning: Function parameter or member 'data' not described in 'aht10_read_values'
drivers/hwmon/aht10.c:131: warning: Excess function parameter 'aht10_data' description in 'aht10_read_values'

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3543
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/hwmon/aht10.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index d76f3441ecf1..9babd69d54a3 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -79,7 +79,6 @@ struct aht10_data {
 
 /**
  * aht10_init() - Initialize an AHT10 chip
- * @client: the i2c client associated with the AHT10
  * @data: the data associated with this AHT10 chip
  * Return: 0 if succesfull, 1 if not
  */
@@ -124,7 +123,7 @@ static int aht10_polltime_expired(struct aht10_data *data)
 
 /**
  * aht10_read_values() - read and parse the raw data from the AHT10
- * @aht10_data: the struct aht10_data to use for the lock
+ * @data: the struct aht10_data to use for the lock
  * Return: 0 if succesfull, 1 if not
  */
 static int aht10_read_values(struct aht10_data *data)
-- 
2.20.1.7.g153144c

