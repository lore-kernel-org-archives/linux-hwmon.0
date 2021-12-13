Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74358C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 14:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239373AbhLMO2q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 09:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239346AbhLMO2m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 09:28:42 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515EFC06173F
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:42 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o20so53118972eds.10
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RbKkYhe3QBS/DPfgsXhadm5I5zw3xN0z2dCJciYBGmg=;
        b=grROj4jCnwIi0CdtCcaRm/B9n74qv4hnc6huiDAge0rXl06jsrWVRzTE+NyP/6KZ0q
         pvBfpgjEP4gK+z2oSymoyPcAo9UXtHEWfBiFZoi7w7caXoNxY0eipm0onf9ayXYIKqcJ
         uBXXv8VXaVD1KCEXJO/YWRRerTLDjqedwgGYjq9IwFTY5aKiomPk3KQ5ZDmrE1/PHGCu
         we2tqMVV8czWXrt39F9E2Py5/h7RhN98SmxExXj+FvORC71oiZqIrO7OG2YbSV2e6waN
         H5WWghDx1Wa/p4e9yM7FQzsVrvQNOw5dHnVNQEsYmi7EwNI5Casx06tmIvnJTmzpHGtj
         7Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RbKkYhe3QBS/DPfgsXhadm5I5zw3xN0z2dCJciYBGmg=;
        b=psjQKsBAvbpKdoy8xFPOiDI5bYI4hxnYKecRT2gzeGooKIGRDEZt6NiA89zSx4S8J9
         j4wB969fA8IuT8+akT6pxV7qBWlaTykUFn1/dE0STAME7bM7aXmj+hUgC+bLwonvUrXu
         8RjN8jnau9od5YUC0TvRkQyq+qBEMQsKOe50tK11XucqvPOJKBP28TekMwM0bTizHyiw
         GATUmtEtzQ6cK/bPGcf3EhWe2Bs5NNMlQszB+3nzf2nab8/Sh5BsMKTxLS1BLciTS+jC
         DkIY9FacvRMiB1o0jZ1mgfp+RZ3ZACfgq+CPyabVlDz8YR0eH03v0uP8/w2hLfo5RmWz
         Gq4A==
X-Gm-Message-State: AOAM531kqgJyRcTjh2lHhqnQGv796wrWK0VJKMQy5JqHGYV9Ce6X4rRt
        4AEVlCBhDmEwI+wZsd3x+jKpDIQEtwxr/JjA
X-Google-Smtp-Source: ABdhPJyPk7zqofYrX93TEH/m76uwynpU0eFgVX1sH8q9loAqHixiDfDvBSDy1VFRZ4EhCg6gizTlbQ==
X-Received: by 2002:a17:906:ad89:: with SMTP id la9mr43468078ejb.178.1639405720828;
        Mon, 13 Dec 2021 06:28:40 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id kx3sm5996414ejc.112.2021.12.13.06.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:28:40 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
Subject: [PATCH v2 2/3] pmbus/ir38064: Add of_match_table
Date:   Mon, 13 Dec 2021 15:28:13 +0100
Message-Id: <20211213142814.264802-3-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213142814.264802-1-arthur.heymans@9elements.com>
References: <20211213142814.264802-1-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arthur Heymans <arthur.heymans@9elements.com>

Add the missing of_match_table to allow device tree probing.

Signed-off-by: Arthur Heymans <arthur.heymans@9elements.com>
---
 drivers/hwmon/pmbus/ir38064.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 4e91d3e54a4a..4211de048069 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include "pmbus.h"
 
 static struct pmbus_driver_info ir38064_info = {
@@ -50,10 +51,21 @@ static const struct i2c_device_id ir38064_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, ir38064_id);
 
+static const struct of_device_id ir38064_of_match[] = {
+	{ .compatible = "infineon,ir38060" },
+	{ .compatible = "infineon,ir38064" },
+	{ .compatible = "infineon,ir38164" },
+	{ .compatible = "infineon,ir38263" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, ir38064_of_match);
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ir38064_driver = {
 	.driver = {
 		   .name = "ir38064",
+		   .of_match_table = of_match_ptr(ir38064_of_match),
 		   },
 	.probe_new = ir38064_probe,
 	.id_table = ir38064_id,
-- 
2.33.1

