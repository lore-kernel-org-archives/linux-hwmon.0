Return-Path: <SRS0=52eC=3S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1481BC2D0DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9B7D20716
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Jan 2020 15:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgA2PIu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Jan 2020 10:08:50 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38901 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgA2PIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Jan 2020 10:08:50 -0500
Received: by mail-ed1-f68.google.com with SMTP id p23so79528edr.5
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jan 2020 07:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBRHZCsjL/cdpH2kvC5t0YTEqXst7ZbeMIG5t22O534=;
        b=sOSVId3n7bITr3tyBcQd9bMCm9LDmtqWXgXaqaFZK4eSgWht5AG5V8MXdy+QHzLaD/
         wyertrOmPQSiJgIGrrTfd6VEHW+5UfdPxr/Z8S+ffDrmuSBy1aMbIAPRFc5ErocBtreO
         4LiXdp0Siwb5z2AQaVgvq/WzVywOVmJIgyb44M4eACV5a0QYP+rCh4R1n1Nwgtkwv5dR
         d1R0xv/R7VNQuHy+Pet6rIC1+A1IBo2z/aNbNBThLpGHIbPuxpeDPrKjv3bdJ6I6+XCW
         b88ZXJthDegM31UPFKwJJgePBb2hSB9MNYhg0X3Ri4zsvWLAQiPUQEq88W0pQCLf4m7n
         GO0A==
X-Gm-Message-State: APjAAAUsNXqxB6c+FEBbmP5M7aQrzJymgzrSQ/R5wDOHqODQzbA20ORS
        itwwsduFxoAqU73+/oB63f9+3VarnIVYzg==
X-Google-Smtp-Source: APXvYqwJgKmuvGeTvZFI0aNfvSTjTnukYhU9CumE9q4Ae6AUOxAXuGfXLMcbvzAsUflGeFkydmB+ww==
X-Received: by 2002:aa7:d1cf:: with SMTP id g15mr8348919edp.301.1580310528752;
        Wed, 29 Jan 2020 07:08:48 -0800 (PST)
Received: from localhost ([2001:470:1f15:8d0:a512:349:7724:8528])
        by smtp.gmail.com with ESMTPSA id x10sm372934ejf.77.2020.01.29.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:08:48 -0800 (PST)
From:   Haochen Tong <i@hexchain.org>
To:     pali.rohar@gmail.com, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Haochen Tong <i@hexchain.org>
Subject: [PATCH 2/2] dell-smm-hwmon: add XPS 13 9360 to fan control whitelist
Date:   Wed, 29 Jan 2020 16:08:39 +0100
Message-Id: <20200129150839.122689-3-i@hexchain.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129150839.122689-1-i@hexchain.org>
References: <20200129150839.122689-1-i@hexchain.org>
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
index d9f6394c08d6..f20a7ea050e1 100644
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

