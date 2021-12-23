Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6839C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350275AbhLWUwb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUwb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:31 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCC6C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:30 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t204so4680486oie.7
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/5AobpD1hvWfALiNSky3o4JCXe3Ual0WgR19n8qgZhk=;
        b=oaEYjvUDXwUSw4Re+YJNfYKApmAIK6VO5GxDAztFuTexh2ybDUqPaeHYMFiqPBn/Mv
         wP+Ztnl6+lFu/bmrDij90ICb+bGg7eEKWzuVh8Jsf6CkHDzO8nioBgkbpQNK+z2A5Xov
         oE/UKOPGLsuVm4dvdSweOQyampkNPQOHBKd0Ev3GghaVVP3FxRXdcrewEOV0SUx3aoSL
         hrl3OoX88UN5A/D2QncAYqH77vLTTV39c+2spzJDUwOsfgRYgAbtRrZl/2XP2mFAcjX9
         03AF9CTz7q825xEytW0FeivPNzl/mePA1dGd1Rvn0n1s+PhwJ9wbRrX8gCgqBtWMInPQ
         a0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/5AobpD1hvWfALiNSky3o4JCXe3Ual0WgR19n8qgZhk=;
        b=QX2syRHieND2irPmek8XeNBZ+fxgcFs2ZbEVoxzKbz+BvjuQpRbHnXHZ2mtATKlHzP
         ycSYVKVANTNw735CEApcVjIeD29jq3wxSv75SkAO91mPDJQYYCgNEND6QGhBYGBYCo/d
         9FFDGWSeHnC3W2Tbnz1XeFv4cnIVMfKP9G6rjGNaxglV8P1ui/JiBlyTp7Fp+fNmhjqA
         VjFYoxE2nmHe8XCNkoT/kvv/nNb7oeYJKlXJKdeP9GsZEaOTvnKsZ2pK58htlrTDvmM0
         KvyTdt1QdbbhSQCtBTwDnwXn5rj8Gqlg+s7yBD7gyO2al+/fm9IPWMSIss1sVyH+fluS
         of4w==
X-Gm-Message-State: AOAM533u6SyRNgdA1kIohq6UUdLBLtQaGh72YARqYUyALwvhcTkhycPU
        /fo9PqK15S/zWttnlhLxYhilIB2Ezyo=
X-Google-Smtp-Source: ABdhPJwof66PW1Sve77/YOW8Y1lbGNru5D73UTefmgJ4cSsqV25mJ3z7F4lSYRafEqXdZIl+7+IYlg==
X-Received: by 2002:aca:1c13:: with SMTP id c19mr2883155oic.20.1640292749864;
        Thu, 23 Dec 2021 12:52:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e69sm354094ote.23.2021.12.23.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 4/6] hwmon: (adt7x10) Use devm_request_threaded_irq
Date:   Thu, 23 Dec 2021 12:52:17 -0800
Message-Id: <20211223205219.2184104-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cosmin Tanislav <cosmin.tanislav@analog.com>

To simplify the core driver remove function.

Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Link: https://lore.kernel.org/r/20211221215841.2641417-5-demonsingur@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7x10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 9482fd8fff41..147c28b24167 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -384,9 +384,11 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 		return PTR_ERR(hdev);
 
 	if (irq > 0) {
-		ret = request_threaded_irq(irq, NULL, adt7x10_irq_handler,
-				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				dev_name(dev), dev);
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						adt7x10_irq_handler,
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						dev_name(dev), dev);
 		if (ret)
 			return ret;
 	}
@@ -397,8 +399,6 @@ EXPORT_SYMBOL_GPL(adt7x10_probe);
 
 void adt7x10_remove(struct device *dev, int irq)
 {
-	if (irq > 0)
-		free_irq(irq, dev);
 }
 EXPORT_SYMBOL_GPL(adt7x10_remove);
 
-- 
2.33.0

