Return-Path: <SRS0=9z2f=DD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03829C4727D
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Sep 2020 02:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA3B6207EA
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Sep 2020 02:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbgIZCIq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Sep 2020 22:08:46 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:9680 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIZCIq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Sep 2020 22:08:46 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id BA6AC4E13AD;
        Sat, 26 Sep 2020 10:08:42 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] hwmon: fix spelling typo in comments
Date:   Sat, 26 Sep 2020 10:08:33 +0800
Message-Id: <1601086116-32218-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTB5LGksYSk1KTxkdVkpNS0pLQ01KSUhLTU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6NTo4CD8hFgE1EBYCORAv
        VjcKCglVSlVKTUtKS0NNSklIT09CVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFKTUlKNwY+
X-HM-Tid: 0a74c82b6bca9376kuwsba6ac4e13ad
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Modify the comment typo: "compliment" -> "complement".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/hwmon/tmp513.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 23908dc..c37d321
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -192,7 +192,7 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
 		/*
 		 * The valus is read in voltage in the chip but reported as
 		 * current to the user.
-		 * 2's compliment number shifted by one to four depending
+		 * 2's complement number shifted by one to four depending
 		 * on the pga gain setting. 1lsb = 10uV
 		 */
 		*val = sign_extend32(regval, 17 - tmp51x_get_pga_shift(data));
-- 
2.7.4

