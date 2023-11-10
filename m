Return-Path: <linux-hwmon+bounces-4-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2A6C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:49:43 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C07B2173B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABE03C6A9;
	Fri, 10 Nov 2023 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B23D386
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 17:46:59 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A996FAC;
	Thu,  9 Nov 2023 22:26:28 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0Vw3PLXK_1699595621;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vw3PLXK_1699595621)
          by smtp.aliyun-inc.com;
          Fri, 10 Nov 2023 13:53:42 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] hwmon: Fix some kernel-doc comments
Date: Fri, 10 Nov 2023 13:53:41 +0800
Message-Id: <20231110055341.39939-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some kernel-doc comments to silence the warnings:
drivers/hwmon/sht4x.c:65: warning: Function parameter or member 'valid' not described in 'sht4x_data'
drivers/hwmon/sht4x.c:73: warning: Function parameter or member 'data' not described in 'sht4x_read_values'
drivers/hwmon/sht4x.c:73: warning: Excess function parameter 'sht4x_data' description in 'sht4x_read_values'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7220
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/hwmon/sht4x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 7ee797410458..4883755d4b1e 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -49,6 +49,7 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
  * struct sht4x_data - All the data required to operate an SHT4X chip
  * @client: the i2c client associated with the SHT4X
  * @lock: a mutex that is used to prevent parallel access to the i2c client
+ * @valid: validity of fields below
  * @update_interval: the minimum poll interval
  * @last_updated: the previous time that the SHT4X was polled
  * @temperature: the latest temperature value received from the SHT4X
@@ -66,7 +67,7 @@ struct sht4x_data {
 
 /**
  * sht4x_read_values() - read and parse the raw data from the SHT4X
- * @sht4x_data: the struct sht4x_data to use for the lock
+ * @data: the struct sht4x_data to use for the lock
  * Return: 0 if successful, -ERRNO if not
  */
 static int sht4x_read_values(struct sht4x_data *data)
-- 
2.20.1.7.g153144c


