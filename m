Return-Path: <SRS0=4YUc=3W=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACFC3524B
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9204920679
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Feb 2020 23:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgBBXcE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Feb 2020 18:32:04 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43767 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgBBXcE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Feb 2020 18:32:04 -0500
Received: by mail-ed1-f65.google.com with SMTP id dc19so14089517edb.10
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Feb 2020 15:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbBtxOMCWI7krPQ56hssJyjH+aaq5ctY6DOgGbaJvNM=;
        b=X1WhEV3OH1jeoJRGg1BmHAg+8tcZlu+N3Z0bLSXvTgMCLshmszlw2tOX3bA8W6rB1o
         CTrHS7g0UEAymtKUVYyffWoDMO/4VSF3AkwLl0U6ELezyI7wN1Wv/avPXTEjs8Pbg4VR
         obgXpvzyBfbtsEBFQisqHk3np0v9xNbAS08HsVrFJA3Pu3m3Je+efghdYetLmNPpwo3L
         TYd2Y5nwa9CnklndR20tab3yZsqfM4ErauqZ3cIIthU/WhR5ZVbUXIszTT4ZoUaz1ZI2
         p50TbFTjgow36GLj/E/fn/5y2Vd8SCuL1ckSz4evsXWKsRqRpVcKxsb96sNZYkTdeCyH
         nxPA==
X-Gm-Message-State: APjAAAVKD2W7B3t+8Brki/5R4eH8nohhfucyo4h8agHT9gNqlT8jja/T
        WJbNy/H2Uy1+W/aJL8E6mdM=
X-Google-Smtp-Source: APXvYqzIefVG+KRiyIyeBdq9EyK+xZsDzGaUESeufIpZBUTq/Ww73hNWOlq6A0ukVMMX09XxhIK5sA==
X-Received: by 2002:a17:906:4041:: with SMTP id y1mr17458878ejj.174.1580686322411;
        Sun, 02 Feb 2020 15:32:02 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:4c8c:bac4:eefe:456b])
        by smtp.gmail.com with ESMTPSA id n11sm442075eje.86.2020.02.02.15.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2020 15:32:01 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH v2 2/2] dell-smm-hwmon: add XPS 13 9360 to fan control whitelist
Date:   Mon,  3 Feb 2020 00:31:51 +0100
Message-Id: <20200202233151.1840067-3-i@hexchain.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200202233151.1840067-1-i@hexchain.org>
References: <20200202233151.1840067-1-i@hexchain.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tests have shown that fan control works fine on XPS 13 9360.

Signed-off-by: Haochen Tong <i@hexchain.org>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index c8f2182ba969..f79e10a55840 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1225,6 +1225,14 @@ static struct dmi_system_id i8k_whitelist_fan_control[] __initdata = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident = "Dell XPS 13 9360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{ }
 };
 
-- 
2.25.0

