Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC1C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 08:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352256AbiFNI6P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 04:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355358AbiFNI6K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 04:58:10 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04A125C6A;
        Tue, 14 Jun 2022 01:58:06 -0700 (PDT)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 25E8uijK013682-25E8uijN013682
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 14 Jun 2022 16:56:48 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        mudongliang <mudongliangabcd@gmail.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] driver: hwmon: remove NULL check before kvfree
Date:   Tue, 14 Jun 2022 16:56:31 +0800
Message-Id: <20220614085634.123101-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: mudongliang <mudongliangabcd@gmail.com>

kvfree can handle NULL pointer as its argument.
According to coccinelle isnullfree check, remove NULL check
before kvfree operation.

Signed-off-by: mudongliang <mudongliangabcd@gmail.com>
---
 drivers/hwmon/occ/p9_sbe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 42fc7b97bb34..01405ae2f9bd 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -55,8 +55,7 @@ static bool p9_sbe_occ_save_ffdc(struct p9_sbe_occ *ctx, const void *resp,
 	mutex_lock(&ctx->sbe_error_lock);
 	if (!ctx->sbe_error) {
 		if (resp_len > ctx->ffdc_size) {
-			if (ctx->ffdc)
-				kvfree(ctx->ffdc);
+			kvfree(ctx->ffdc);
 			ctx->ffdc = kvmalloc(resp_len, GFP_KERNEL);
 			if (!ctx->ffdc) {
 				ctx->ffdc_len = 0;
@@ -171,8 +170,7 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 	ctx->sbe = NULL;
 	occ_shutdown(occ);
 
-	if (ctx->ffdc)
-		kvfree(ctx->ffdc);
+	kvfree(ctx->ffdc);
 
 	return 0;
 }
-- 
2.35.1

