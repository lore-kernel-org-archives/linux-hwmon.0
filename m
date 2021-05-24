Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F57BC04FF3
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 May 2021 06:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30B1661185
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 May 2021 06:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhEXGZk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 May 2021 02:25:40 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:33716 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231605AbhEXGZk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 May 2021 02:25:40 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UZssckj_1621837441;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZssckj_1621837441)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 24 May 2021 14:24:07 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     hmh@hmh.eng.br
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix inconsistent indenting
Date:   Mon, 24 May 2021 14:23:58 +0800
Message-Id: <1621837438-70790-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Eliminate the follow smatch warning:

drivers/platform/x86/thinkpad_acpi.c:7942 volume_write() warn:
inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -For the follow advice: https://lore.kernel.org/patchwork/patch/1434215/

 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index dd60c93..b7fec1b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7938,7 +7938,7 @@ static int volume_write(char *buf)
 				continue;
 			} else if (sscanf(cmd, "level %u", &l) == 1 &&
 				   l >= 0 && l <= TP_EC_VOLUME_MAX) {
-					new_level = l;
+				new_level = l;
 				continue;
 			}
 		}
-- 
1.8.3.1

