Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7764BC433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Jan 2021 09:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 323A522AAD
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Jan 2021 09:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbhAKJxA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Jan 2021 04:53:00 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:53811 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728685AbhAKJxA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Jan 2021 04:53:00 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0ULMSoy0_1610358731;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULMSoy0_1610358731)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 11 Jan 2021 17:52:17 +0800
From:   YANG LI <abaci-bugfix@linux.alibaba.com>
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        YANG LI <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] hwmon: abx500: style: Simplify bool comparison
Date:   Mon, 11 Jan 2021 17:52:09 +0800
Message-Id: <1610358729-86795-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix the following coccicheck warning:
./drivers/hwmon/abx500.c:84:8-26: WARNING: Comparison to bool

Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
Reported-by: Abaci Robot<abaci@linux.alibaba.com>
---
 drivers/hwmon/abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/abx500.c b/drivers/hwmon/abx500.c
index 4b96488..3879b13 100644
--- a/drivers/hwmon/abx500.c
+++ b/drivers/hwmon/abx500.c
@@ -81,7 +81,7 @@ static void gpadc_monitor(struct work_struct *work)
 
 		if (data->min[i] != 0) {
 			if (temp < data->min[i]) {
-				if (data->min_alarm[i] == false) {
+				if (!data->min_alarm[i]) {
 					data->min_alarm[i] = true;
 					updated_min_alarm = true;
 				}
-- 
1.8.3.1

