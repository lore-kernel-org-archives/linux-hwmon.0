Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA017C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 23:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D20F6069E
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 23:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhG2XIn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jul 2021 19:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhG2XIn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jul 2021 19:08:43 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B01DC061765
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jul 2021 16:08:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g13so13915267lfj.12
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jul 2021 16:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMTdfxaoduGDhtfCKPfHLiXFst+GTSXs5E6m9RDYiWc=;
        b=wIc2CLBfbdTUY+TN7+ILNdmj6q4IlRGVFxe2BMnl/I2zXG2bxLhmGwI7GPYSLyFn9q
         hy9E8JDe21XGm/yawGKDNg75vrHzwpbOM+rMn6bf3POje+Qp9IP1qXKmzHZh7i8nmcn1
         4JGmI+KWI+JyQZpDN/PGbi9AOagrFMKSLpfNYct4jVe3T+9Jz7DjjIiPyjcK5rCEeh6l
         5Eh/X1U5nx2i4ghVJUqoWzNRUPYsIjjYuC179ow9MryPuQ2Hz8/U4wUZmX0TsecOCFP2
         8j0+Nb9VDEoKYluC0pMgolNoR1gxDPMdkvVfoQR8azbqA8QEpWLjTDlybyU9UsRGdP/+
         n0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMTdfxaoduGDhtfCKPfHLiXFst+GTSXs5E6m9RDYiWc=;
        b=gZqpBSahX9ivy9536KZTc+y43bHwehGReJCAed9YuybI0RRDR9X3q6OF2nLeNwNviF
         yszyL9f9vON0DeGCAaGgivn+/lxz3CPXU3k4Vp8ECMnEERkgc5VjDfELGExXrWYmFr86
         W/RnCRlRxznHYo6nCIz27EVSKufzfu7pen2mneghYwWma/n5nUKCh+ki1XgDoOnP/Kfa
         /btg72ehfaaK3mBDQ36/GCpJXD/Kleop8NBeeIrwIDcuts2WHmkcIlQQo64UVEb9ik4i
         OVKpKyohogPlg9n3ceIVi7+VkogcZtyPcQ8sZTYqaoLCvkWNrq2tN+5XGwGsvCNsmHYf
         hZIw==
X-Gm-Message-State: AOAM533N1T55xaE6L6FnqmolvhB4nUizjzVp75UAfVTq9Gz0U6VQhP2g
        W8bPnJo0h7+etE/81AhQsbsmyg==
X-Google-Smtp-Source: ABdhPJx+aw9ad3Qb9PUn9IqcB0Vzrs0eS1YtSg0xpN0T5FQaPEJGQG7akXDONfnvGyGF0GKjpTd/fw==
X-Received: by 2002:a05:6512:aca:: with SMTP id n10mr5363316lfu.387.1627600116835;
        Thu, 29 Jul 2021 16:08:36 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id l21sm248815ljc.94.2021.07.29.16.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:08:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] hwmon: (w83781d) Match on device tree compatibles
Date:   Fri, 30 Jul 2021 01:05:43 +0200
Message-Id: <20210729230543.2853485-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729230543.2853485-1-linus.walleij@linaro.org>
References: <20210729230543.2853485-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I2C devices should match on the proper compatible string.
This is already used in one device tree in the kernel (MIPS)
so let's add the matches.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/w83781d.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index e84aa5604e64..ce8e2c10e854 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -1571,10 +1571,21 @@ static const struct i2c_device_id w83781d_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, w83781d_ids);
 
+static const struct of_device_id w83781d_of_match[] = {
+	{ .compatible = "winbond,w83781d" },
+	{ .compatible = "winbond,w83781g" },
+	{ .compatible = "winbond,w83782d" },
+	{ .compatible = "winbond,w83783s" },
+	{ .compatible = "asus,as99127f" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, w83781d_of_match);
+
 static struct i2c_driver w83781d_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name = "w83781d",
+		.of_match_table = w83781d_of_match,
 	},
 	.probe_new	= w83781d_probe,
 	.remove		= w83781d_remove,
-- 
2.31.1

