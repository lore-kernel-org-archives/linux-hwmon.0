Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC9DC48BCF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 22:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B00D0613DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Jun 2021 22:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFIWJu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFIWJt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Jun 2021 18:09:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC30C0617A6
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Jun 2021 15:07:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a11so40010375ejf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Jun 2021 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DmHuey4cBQMswlLLUPQdxLcQq4bcm4Xw89GIxtMTQuY=;
        b=kCpbBnD3FPXMBZhPjwjsn1hRdjXyvj7R1pPQ67vE4PBWKitdWy561xORxvaqA/xeom
         Gdy09gpnEA2MoLeI08rVfagTxl0xwbmajYuofLWwlykAxd4YqB8NRr0nSK9NI03C3OWJ
         VqTMoLDN4pWZXHpptf2pX5nY0czfddPYRLGC8XYMkEMkNSKAvy6CSK50qFhHmRcFDqjx
         1Nn1R1FZosA71CqCd3LtjSnGerjPUPSm9oPGf+7T9Av0Ydyr2FdND/rQdYzjgO+hS5XI
         ieYXIyBwxC3ntXgXIy4KxgPPO6z7TOaiirKeu1LXThSRTJAQZHlnKwYSlwrZRB1cuziA
         gtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DmHuey4cBQMswlLLUPQdxLcQq4bcm4Xw89GIxtMTQuY=;
        b=jitqFKhWroa8OmvrAKCvjGvMY3jAcPgev2KXda1bJowl/YZI2dCk5HJRwczt4nEywK
         E6x82QxJq+T1jJQ41gDSSYtAaqm3nJERnwZ8ULT9Lj3trpIKW8GdK55k/zENFRoN1RB7
         lz5MeVEumc/exwjQ5/zmqOxvH7+oqYJrsuGEDTkubCdtTZoc70v4wU0R3Fqc/ai9BLFh
         vfVqp4I8Wzz8dRJV8aiMMsN1SOQxjVco5OmJlbP58MML3kmInshkt+Q2gfJlvx2f/heo
         qPgD1WiczxWBBAdQ6W7R0sjQgYIA4JdviP2b07Ir5VLRZNzrhaguSfysw/hDAyiJs8d8
         uN/Q==
X-Gm-Message-State: AOAM532T21BBX6US8gSpA13F4aUfhNMq2H+kLWVaF6+44Pq9yzJcWBt0
        1L67qlCyQV8gTgN63NAz4tHKpQ==
X-Google-Smtp-Source: ABdhPJzWF/+YLbb8YQlYfbo9ySrHFfjMk/ow95h1OIOwtbJczccDo+PAk/42a+FOs/pxuavP2gQ4RQ==
X-Received: by 2002:a17:906:3b87:: with SMTP id u7mr1721897ejf.548.1623276456891;
        Wed, 09 Jun 2021 15:07:36 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id q16sm409770edt.26.2021.06.09.15.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 15:07:36 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/3] hwmon: (tps23861) correct shunt LSB values
Date:   Thu, 10 Jun 2021 00:07:28 +0200
Message-Id: <20210609220728.499879-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609220728.499879-1-robert.marko@sartura.hr>
References: <20210609220728.499879-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Current shunt LSB values got reversed during in the
original driver commit.

So, correct the current shunt LSB values according to
the datasheet.

This caused reading slightly skewed current values.

Fixes: fff7b8ab2255 ("hwmon: add Texas Instruments TPS23861 driver")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/tps23861.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index c3685b7e9e82..8bd6435c13e8 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -105,8 +105,8 @@
 #define TEMPERATURE_LSB			652 /* 0.652 degrees Celsius */
 #define VOLTAGE_LSB			3662 /* 3.662 mV */
 #define SHUNT_RESISTOR_DEFAULT		255000 /* 255 mOhm */
-#define CURRENT_LSB_255			62260 /* 62.260 uA */
-#define CURRENT_LSB_250			61039 /* 61.039 uA */
+#define CURRENT_LSB_250			62260 /* 62.260 uA */
+#define CURRENT_LSB_255			61039 /* 61.039 uA */
 #define RESISTANCE_LSB			110966 /* 11.0966 Ohm*/
 #define RESISTANCE_LSB_LOW		157216 /* 15.7216 Ohm*/
 
-- 
2.31.1

