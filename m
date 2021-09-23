Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F9CC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 02:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D3746109E
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 02:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbhIWCgf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 22:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238859AbhIWCge (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 22:36:34 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB07FC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Sep 2021 19:35:03 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id dw14so3443250pjb.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Sep 2021 19:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UBKvrKLKgTcT4zZ9d/SORAapkWj7aa02m+WBywcb45A=;
        b=lDz9rTFFf3Y02Z3JcTL7vb/NR4atFpE9/hCM6Lih3XbV+sWKP590mff0tAj1omPDq2
         PNhYUsiKVxvpZ8DyZvFdLUCiLcbOZlJb1o9mSNJYKW80/LqJOz1Pnewoe3NF8o6bRdJo
         XhrePHFiwhgugE/IGKkFmei2r5EDPkWT8qTSSGiFhAJSYFJ730F75lWi+Np14Di+lK/u
         RGJ6twDA/GthYX2+Apwtq1dUVHFSjzypSxp2BZFflYTk+VzrGVfN6kAUwV8I7nNdfB1f
         hN4dAOWmCcFugfYPeZUIruZ22/k1zTJ8mJf4XROCA2aPIo3t5TDx3oA88O9LDmcbsIo2
         TAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UBKvrKLKgTcT4zZ9d/SORAapkWj7aa02m+WBywcb45A=;
        b=gceKI/5TuDxGnT2IR+pX2ipuvlHfT9pwbJdm8fgSL/XWBTTTg6+HzTWvVkH9tsxcl+
         7TwzUkeQjKb/0+GzsdOLDx4etMpokdaEXRvuf79z9KOTgL1kH9YazPaygK5nnbNTzdAQ
         SjPJCSdy6p//11bT1/YRhIZEv6Cx2T+WzO8Kwt+zFIs140lGqYy8IW8XsYL69dhwvv5G
         dOO90yDe/vaHOxbgBR/x/QDReuG6wOm+4x4VH7M1hPnB96Xhfgw9/e5agwpIPOG1LiQ7
         9qpa/0gNig4SNE8NFW1ivOH4l2AkI2JRopC+qBIg8e54ucyYmfPAbVIHAXIP7eipf7VO
         gb/A==
X-Gm-Message-State: AOAM5324d+VteRVVTXmKRZBIOzvFAAm24nXUVJTPW1cvspzpLscame7F
        T7jPJUUL7BOaZZyTuTwWuQo1pua64uIk6Q==
X-Google-Smtp-Source: ABdhPJz/uQ7kSkHkVFIajRJ+2YCB9qD+8ojREDoV5EhoxAsVcKAXLxfw8iJJezfiWviopCxCzmy18Q==
X-Received: by 2002:a17:902:c1c5:b0:13b:86d8:a28c with SMTP id c5-20020a170902c1c500b0013b86d8a28cmr2035324plc.55.1632364503396;
        Wed, 22 Sep 2021 19:35:03 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:2ece:a59:43d1:a357])
        by smtp.gmail.com with ESMTPSA id j123sm3856042pgc.77.2021.09.22.19.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 19:35:03 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 2/2] dt-bindings: hwmon: (pwm-fan) add retain-state-shutdown property
Date:   Thu, 23 Sep 2021 11:34:48 +0900
Message-Id: <20210923023448.4190-2-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923023448.4190-1-akinobu.mita@gmail.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document new retain-state-shutdown property.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 4509e688623a..c1b2c3ff7ba8 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -19,6 +19,8 @@ Optional properties:
 			  interrupts per revolution). The value must be
 			  greater than zero.
 
+- retain-state-shutdown: Retain the state of the PWM on shutdown.
+
 Example:
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-- 
2.25.1

