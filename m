Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE4BC48BCF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 22:07:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63C13613E7
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 22:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhFIWJo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhFIWJo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Jun 2021 18:09:44 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D97AC061574
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Jun 2021 15:07:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id he7so21272817ejc.13
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Jun 2021 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huNq8zmvWoHj/7mX4452ngkraIV+X5LPemMUygCMxm8=;
        b=hgBnGnfItYVgT5nriZbB0awvzlm/Y0OnGqaFvrmrMhLayljVz6MpfbFb1vDi5elTiW
         ZnNFsmL499p8pjS6d5GlOegvwFdtnv8frb4HUR+XZpxWCy0V4FTQgr1N5pg+M/r6lwpm
         0xNyTe/qWVkOoT0Y1glmWBzvQjIcX3mue7U6tcMkEI9U0kNXebcEc6xkBY/IMwdYAfOu
         0lyuxp7bzR36Va0EwPv1ylvw4/aG9XJgZbrIQw4ZW7H8wCspUmz+AYrVHR2OXWFvN00t
         bBKWe2VM4k/N+Uq8cBOqIG5mn+ClUmhamrz8ANyvM/IpW2ditKaF4PYqN/oYMRTJjQPI
         zijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huNq8zmvWoHj/7mX4452ngkraIV+X5LPemMUygCMxm8=;
        b=eejp7wU/5uR3QxVRxWcLn6LF232BrcyEpAgIBkUC3eS/9oRa3kZwN86tz8/9Bl9XCt
         MZubfTcm3PDuSJn6jQHSRJMyBIuU+OqtY6lwlnJRwBM69D6c6coYNZQpL9SSdJuYkrzN
         dZW9PjYTZzM8+oz1KnzFe0xxk26aAR95Xngy6ynuq9S3vx8eYEdBr++XSxJD9/bSSyV9
         LX8iZu7LenahS+LiaeQjRzYKRfLh+UO95jdfWCvyWWFWqPDBs1B5JBb1X3i1uePgk7nS
         HkuanzR2+KD2xcNTQuCOYH9DYxg9bIsg8x9VV1gYF/d6CNlfzslGXGYntzPS1+0GWXni
         YkgQ==
X-Gm-Message-State: AOAM5307Zq2ERw0miOlNIcEJ65IgyS81Hvd8Xz/CIx6HLFk70GQKWSXG
        b7H2V57b+Igr9ttGDhQvFGrIDw==
X-Google-Smtp-Source: ABdhPJxUs7A+2kn2ss1y8X2MuWMFqe4tr8KWiOfHP/1frCLYVaynJFV7hn31iqn35kevXzXOt6e77Q==
X-Received: by 2002:a17:906:2854:: with SMTP id s20mr1678505ejc.335.1623276454157;
        Wed, 09 Jun 2021 15:07:34 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id q16sm409770edt.26.2021.06.09.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 15:07:33 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/3] hwmon: (tps23861) define regmap max register
Date:   Thu, 10 Jun 2021 00:07:26 +0200
Message-Id: <20210609220728.499879-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Define the max register address the device supports.
This allows reading the whole register space via
regmap debugfs, without it only register 0x0 is visible.

This was forgotten in the original driver commit.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/tps23861.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index c2484f15298b..fd0be8883829 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -117,6 +117,7 @@ struct tps23861_data {
 static struct regmap_config tps23861_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.max_register = 0x6f,
 };
 
 static int tps23861_read_temp(struct tps23861_data *data, long *val)
-- 
2.31.1

