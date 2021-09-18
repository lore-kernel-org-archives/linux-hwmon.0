Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDB9C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Sep 2021 05:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D099761244
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Sep 2021 05:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhIRFOz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Sep 2021 01:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhIRFOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Sep 2021 01:14:55 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A00FC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Sep 2021 22:13:32 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631942010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=au2jCHVR8jssj4sYJIcjNlES/Ci6oiJOsbutoFYq8+Y=;
        b=ofX3V+ISIhAO2ZMNppM0pKjX+vV0ei9FkoHnT31MHDB7JkkVmJFnaDERhHtjdBOlek8+j+
        8qkq29eR7RT4tkGHuaBpBRFj+I9X1uDdCqT74ZXIRhsJeWA4x3Q9ZMy4Gx26+x2b3slvP+
        Ay3c0n5VkjmklVwEFjz4lSfhKgBcXmU=
From:   Jackie Liu <liu.yun@linux.dev>
To:     pali@kernel.org, jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, liu.yun@linux.dev, W_Armin@gmx.de
Subject: [PATCH] hwmon: (dell-smm): make struct dell_smm_data *data __maybe_unused
Date:   Sat, 18 Sep 2021 13:13:00 +0800
Message-Id: <20210918051300.1171578-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

The compiler warns when the data are actually unused:

  drivers/hwmon/dell-smm-hwmon.c: In function ‘i8k_init_procfs’:
  drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable ‘data’ [-Werror=unused-variable]
    624 |  struct dell_smm_data *data = dev_get_drvdata(dev);
        |                        ^~~~

[Why]
If CONFIG_PROC_FS=n, proc_create_data is NULL, data is unused.

[Fix]
Mark them __maybe_unused to suppress that warning as well.

Fixes: ba04d73c26ed ("hwmon: (dell-smm-hwmon) Move variables into a driver private data structure")
Cc: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 774c1b0715d9..d73f4a4bd96e 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -621,7 +621,7 @@ static void i8k_exit_procfs(void *param)
 
 static void __init i8k_init_procfs(struct device *dev)
 {
-	struct dell_smm_data *data = dev_get_drvdata(dev);
+	struct dell_smm_data __maybe_unused *data = dev_get_drvdata(dev);
 
 	/* Register the proc entry */
 	proc_create_data("i8k", 0, NULL, &i8k_proc_ops, data);
-- 
2.25.1

