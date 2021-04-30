Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7260EC43460
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 12:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 484306145A
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 12:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhD3MgO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Apr 2021 08:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbhD3MgN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Apr 2021 08:36:13 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EDEC06138E
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 05:35:24 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id y7so6118410ejj.9
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k1xgkQIQAXFIiUoyaG4mWCe3d5IAOycQwU/Qso6LJ1Q=;
        b=mHj4oOVWHkjSWEixwh283R2+eii9GUPhAXQjx8b2ssCcBqe3rOTw0PN5aLBzzGLu7M
         36unXq22romf3vSfJfm+iZhhiffE+0yY6VYia5/cTvbq5GFsLrjZNmcNWUYkTE0m3Upc
         Ptd9An7vCjHFAKWeWZ1hrUjAOVEDobeFmzMfhGt4Uf02xwYmdBZVl/vt55CUiQpGbR6C
         e8gaNKzcnUqxy9wYsqbOLf+LBQDS3zHcPR3RIYbqkKb3GfmrZ6Xsv4OHQ2+cRX9H4lGl
         GuCIvhR/74RX64gcvOURLP9vAc5157kmDUBEG6nm7Vt5FEnAinFDqw/PgLEeHttyBJfR
         Atgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1xgkQIQAXFIiUoyaG4mWCe3d5IAOycQwU/Qso6LJ1Q=;
        b=i8rdKdv1pZIUw69EhEzRvNvdHTZQadJOeYSNrAqs/qnO4xIDyckqLGNI+XNOEHczXy
         8+DRyDDSjAumEe9XJ4QJ1A8h4aHQmJc/XWcTPk7GZV+MpTXJlsa6arXbRQ4v9f3xOPLi
         L+1FHi5j+WDxb4XVRXn7Br52/r6igqfjmMRdcaKq43lR34de4TCa539zyAXPY2pYlb1t
         8ypFsc2DfpDjscCre9sBN2HqXdcRjyV0jk4YvhzevBQfTvbUiGzgtq18CIC9RTOemGQQ
         7Mws54eOiAnamdCzBrtV2nvJscwsjP7+707CgCVwIXreHt3azVxvWDU5AXG4b5WYoAZX
         UY2g==
X-Gm-Message-State: AOAM530wloEWiTe4+sGPl3Ics+kGsWnoNtoMGwI1p/YubfNdWuA/jz8a
        fdjGwAq/kLm+I/bsYWTlfJUE6taI+e+WqQ9FhqQ=
X-Google-Smtp-Source: ABdhPJzY310x0/M6PR54dBF4kM3yoLIWCb2LRVDpaEmyWtp04drhNKX4L8OS+/jY30OiUs/NzjMLYg==
X-Received: by 2002:a17:906:6044:: with SMTP id p4mr4221114ejj.82.1619786123449;
        Fri, 30 Apr 2021 05:35:23 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id d15sm1822988ejj.42.2021.04.30.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 05:35:22 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/6] dt-bindings: gpio: Add Delta TN48M CPLD GPIO bindings
Date:   Fri, 30 Apr 2021 14:35:07 +0200
Message-Id: <20210430123511.116057-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430123511.116057-1-robert.marko@sartura.hr>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CPLD inside of the Delta TN48M does not number GPIOs
at all, so in order to ensure numbering lets use bindigs.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 include/dt-bindings/gpio/tn48m-gpio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tn48m-gpio.h

diff --git a/include/dt-bindings/gpio/tn48m-gpio.h b/include/dt-bindings/gpio/tn48m-gpio.h
new file mode 100644
index 000000000000..4ece4826d746
--- /dev/null
+++ b/include/dt-bindings/gpio/tn48m-gpio.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * GPIO definitions for Delta TN48M CPLD GPIO driver
+ *
+ * Copyright 2020 Sartura Ltd
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#ifndef _DT_BINDINGS_TN48M_GPIO_H
+#define _DT_BINDINGS_TN48M_GPIO_H
+
+#define SFP_TX_DISABLE_52	0
+#define SFP_TX_DISABLE_51	1
+#define SFP_TX_DISABLE_50	2
+#define SFP_TX_DISABLE_49	3
+#define SFP_PRESENT_52		4
+#define SFP_PRESENT_51		5
+#define SFP_PRESENT_50		6
+#define SFP_PRESENT_49		7
+#define SFP_LOS_52		8
+#define SFP_LOS_51		9
+#define SFP_LOS_50		10
+#define SFP_LOS_49		11
+
+#endif /* _DT_BINDINGS_TN48M_GPIO_H */
-- 
2.31.1

