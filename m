Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF795C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 09:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjGOJpm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 05:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjGOJpl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 05:45:41 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8360D35A2
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=ysu4MHrBWs0vNXqZlk
        /JKZYwB8e9YceT9MszMcw+CmE=; b=jqxcgY56Xdl9YoW291KbHCqe8Gox4J+6tr
        78rRLqwOmTTHthKnJBROil1oLppSaV0+aQ1WeQ8GWlCd/fk9KKKUtk3patFrmSwe
        ZXAWf15eDflf5yvdvVOItOyj5tpfAIpBTm8N8QoNVUsS0I9vjPsHaBNletZHOgiP
        vOdPy1cno=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wDXTPWWarJkPtR7AQ--.16705S4;
        Sat, 15 Jul 2023 17:45:18 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/1] hwmon: check the return value of platform_get_resource()
Date:   Sat, 15 Jul 2023 17:44:52 +0800
Message-Id: <20230715094452.36119-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXTPWWarJkPtR7AQ--.16705S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr48KrykurW7Zr1rur4fGrg_yoW3urc_W3
        yUur93CayF93Z3trs0yry3Zr9FyFn8uFn7Wr4Iqa4Sv3yUZw13JrykZrn7Z3y7WrW7GF9r
        Jw43AFs3ury5CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_l1v3UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiBCt5VaEFxySMAAAsr
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

platform_get_resource() may fail, therefore, the return value
of platform_get_resource should be checked to avoid null pointer
dereference in devm_request_region().

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/hwmon/w83627ehf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index fe960c0a624f..7793a4273e00 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1703,6 +1703,8 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -EINVAL;
 	if (!devm_request_region(dev, res->start, IOREGION_LENGTH, DRVNAME))
 		return -EBUSY;
 
-- 
2.17.1

