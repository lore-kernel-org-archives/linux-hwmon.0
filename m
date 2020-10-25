Return-Path: <SRS0=FQn6=EA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18644C55179
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Oct 2020 00:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D962098B
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Oct 2020 00:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="QGH5hDI8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1766015AbgJYA7q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Oct 2020 20:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1766002AbgJYA7l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Oct 2020 20:59:41 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9823C0613D2
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o18so5670946edq.4
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ve+g7yzha+kqfqdGqXpj/2snQKKTgSW/x5r8vVHUiK4=;
        b=QGH5hDI8Hd8y5MrXbJP2aNTf7VQEKvsotI6K0PQZxetjrvQh7qQKE8IQwIWEA7CNDG
         TSHSzD9U1rgrabpmY1YJYnSuBooGWGg8DKZGKSgCHH0x4NFae4wR3lb8H3wW+hwGKv9q
         /QcnB61IgnJsiGScDKgJMOwJKtwycFgTdw0nl4JxtvQMhUnc+vwB6kToi0aXAoUu3xSD
         rMeKVCb0wDoqV2zDcgrxWscaNfXaT7gWmSseGJeZUxp+escfiWYRK1Kv/KxDrKZKuLBr
         YkqN89WiotEsL4FoPgP7tQFdOVuP9K9+CUUJfzsd6Wd3v7lxMtn3N1wTvMw0qFfpyIyz
         HxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ve+g7yzha+kqfqdGqXpj/2snQKKTgSW/x5r8vVHUiK4=;
        b=fitWtYf6s0nnH4O2gLwGLhInwguFnaUYaHm8APvR4KPAKqzYTA7SZH997fWnK1W5y5
         VcqTjdUOOx2iT0JJP8CjQvZzxQF5BfuDZ7dq6ti1wDjoNTJQQKMO0ZVAmBwBqh5FOU69
         /PHZfRLMvHsyOrXnw5DP7Gdsn0omXcwPONrBF7afGmZLbOGExYl3JLk7Er4X7MSjuffN
         tG5opkiLbRUe6Ss2k+fHVFeflnwFzcKpUIlkRq60xVt2MNQbzzIAFVAaT0cme3OL8cXM
         mtqXWgIOg3CCIh3Q+s2TA3yeiDTKk2RQ+fWzo2MEf2gWnQnRVs/GP3OE0l41cWW5ix5b
         QGEQ==
X-Gm-Message-State: AOAM530pURsZR5xLNrgs2jMQNeNgD9f05mkvuCPPieYAqCnG60DKJMJf
        e8Wh+UhOtVV/XFGjnKE+OnvltA==
X-Google-Smtp-Source: ABdhPJwolPXq3q6ayIHgj2Llk3qDBqNWadvUfztpEUU6Xrq9oUb81d+t+e+WyC0U3Ysd1mlouuuQPQ==
X-Received: by 2002:a50:d751:: with SMTP id i17mr9408440edj.337.1603587579517;
        Sat, 24 Oct 2020 17:59:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id q5sm2797274edt.79.2020.10.24.17.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 17:59:38 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v7 6/6] MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver
Date:   Sun, 25 Oct 2020 02:59:16 +0200
Message-Id: <20201025005916.64747-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201025005916.64747-1-luka.kovacic@sartura.hr>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add an entry for the IEI WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867157311dc8..d56fdc300066 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8460,6 +8460,20 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
+F:	Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
+F:	Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
+F:	drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
+F:	drivers/leds/leds-iei-wt61p803-puzzle.c
+F:	drivers/mfd/iei-wt61p803-puzzle.c
+F:	include/linux/mfd/iei-wt61p803-puzzle.h
+
 IFE PROTOCOL
 M:	Yotam Gigi <yotam.gi@gmail.com>
 M:	Jamal Hadi Salim <jhs@mojatatu.com>
-- 
2.26.2

