Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7E0C6FD19
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Mar 2023 08:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjCJImd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Mar 2023 03:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjCJIl5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Mar 2023 03:41:57 -0500
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D2B7E10BA55;
        Fri, 10 Mar 2023 00:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YFT7z
        s16vbeLcGevQfrFZe7wYgMysfsx9rVuRnnFefk=; b=Tuhp30NuRknZDAJjrEiFi
        o7sulbqQ4faqqSTDrth4OIPPyIHq/BFdDBOB3IJAslmTPV0uw+T+eqTq5HOAGh9M
        +e8QNk67kULt91hrOaDFStMVGbGXkPkaZhLE8EyeFqkyvSk9TovjnIGmZTdUDSp9
        ibDXDaq6gJXcNLZQGp1vL0=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
        by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wBHbX7o7ApkQrpHCw--.4153S2;
        Fri, 10 Mar 2023 16:40:08 +0800 (CST)
From:   Zheng Wang <zyytlz.wz@163.com>
To:     jdelvare@suse.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com,
        Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH] hwmon: (xgene) Fix use after free bug in xgene_hwmon_remove due to race condition
Date:   Fri, 10 Mar 2023 16:40:07 +0800
Message-Id: <20230310084007.1403388-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHbX7o7ApkQrpHCw--.4153S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfJr4xWw1DGF4rZrWrXwb_yoWkKrc_uF
        Wj9FyxWrn8Crn8Ar4qkFnxZrWkKFnYgr47tF4Sy3y5A34agw15X398A3Z7Z348G3y5GFy5
        uw4jkFWrury7ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRErgAUUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiQg4uU1aEEnKxTQAAs-
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In xgene_hwmon_probe, &ctx->workq is bound with
xgene_hwmon_evt_work. Then it will be started.

If we remove the driver which will call
xgene_hwmon_remove to make cleanup, there may
be a unfinished work.

The possiblesequence is as follows:

Fix it by finishing the work before cleanup in the
xgene_hwmon_remove

CPU0                  CPU1

                    |xgene_hwmon_evt_work
xgene_hwmon_remove   |
kfifo_free(&ctx->async_msg_fifo);|
                    |
                    |kfifo_out_spinlocked
                    |//use &ctx->async_msg_fifo
Fixes: 2ca492e22cb7 ("hwmon: (xgene) Fix crash when alarm occurs before driver probe")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/hwmon/xgene-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 5cde837bfd09..d1abea49f01b 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -761,6 +761,7 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
 {
 	struct xgene_hwmon_dev *ctx = platform_get_drvdata(pdev);
 
+	cancel_work_sync(&ctx->workq);
 	hwmon_device_unregister(ctx->hwmon_dev);
 	kfifo_free(&ctx->async_msg_fifo);
 	if (acpi_disabled)
-- 
2.25.1

