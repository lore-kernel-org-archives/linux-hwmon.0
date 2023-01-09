Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CE3C63797
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Jan 2023 23:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237841AbjAIXgD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbjAIXgB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2023 18:36:01 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8E18FEF
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Jan 2023 15:35:59 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id h21so9433539qta.12
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jan 2023 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foqffIKuz799F5wyGtIM3OCFdqRESGZUJXSmZJH7pvM=;
        b=LW23jYdpmTZPKAu1WNAQKdJrg5k7NJiFihuZiyYCDKpFVyPTxoX3R+4j2E/8C20sGz
         DdPxbKkkaAXqsaLfqLHBFijQTc6CYz4U5GpoJYjEsTG2PZKxaVtq3Tso9AiBDCHhXqV5
         dq4q63L+CIGkpvTwRe98VF3jzL3qibGsXp6E2Bp4lvs5DB1lIG6ZTjSP4pDpVhX8L2nC
         L4XNW6VIMQsR9lcNlSxeJmkqwFkxnsgA5AbemvE2r/Ld4N8ubsHn0FDVZDZH2dK/oHJo
         FkzrdomLx36tBU+wDHxCLM7SJc/fIRMyhdh9dXD9cnbf7gFtv7nAktBx0YFhFZvEsrXs
         A5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foqffIKuz799F5wyGtIM3OCFdqRESGZUJXSmZJH7pvM=;
        b=Sxr74poqEo6vl+U4iSmEXrwNu33OK9qNb+2bInXV1FQb2u2jeksJ657JD9C9ZRGPR9
         isMh2adm6bdNHyJ9YL32pYOihWFYn6NCO7OPsoovUPhnbG0lL99B1mW+IkEcgtBE3ANw
         AEMH6FHlKNRNpAQto+63TXBGOanaLs3oy61UMXZrXWiF2vv6Yv+Rbbq2uGtqoCBDJDjW
         Si9TI5gJZn0IXE9ZKB2IbUpTkE40alTWONyOAdl/VknsGBm2GgdDA8OjC2F7RErMWYv7
         bXfaLRSpGRfjwBDt0Sw/0Sk/afjh5vywfZpeb1bijqQn/0Y1+KyX5NuQtmeiratJbHuE
         M6tg==
X-Gm-Message-State: AFqh2koz442l7Nsa+PLucjuYIHwnRyZdTN1tKTq91SCg1YmwK6UNWuPe
        96rv6/iWJ+kSFneRFSKAR1ng/C51pTGilDB6
X-Google-Smtp-Source: AMrXdXuKBe+/Uuajz3rIj6IYkFaqoY4JPMU3uJI0uiqlFZFfgymDjbD1lQMih2c4XDNjXaLumE2glQ==
X-Received: by 2002:ac8:5557:0:b0:3ab:5b6d:1add with SMTP id o23-20020ac85557000000b003ab5b6d1addmr99038370qtr.66.1673307357915;
        Mon, 09 Jan 2023 15:35:57 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006fa8299b4d5sm6294846qkp.100.2023.01.09.15.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:35:57 -0800 (PST)
From:   Jonathan Cormier <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jonathan Cormier <jcormier@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Subject: [PATCH v3 2/5] hwmon: ltc2945: Add devicetree match table
Date:   Mon,  9 Jan 2023 18:35:31 -0500
Message-Id: <20230109233534.1932370-3-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109233534.1932370-1-jcormier@criticallink.com>
References: <20221214220727.1350784-3-jcormier@criticallink.com>
 <20230109233534.1932370-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add adi,ltc2945 compatible

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/hwmon/ltc2945.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index 9adebb59f604..9af3e3821152 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -58,6 +58,12 @@
 #define CONTROL_MULT_SELECT	(1 << 0)
 #define CONTROL_TEST_MODE	(1 << 4)
 
+static const struct of_device_id __maybe_unused ltc2945_of_match[] = {
+	{ .compatible = "adi,ltc2945" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc2945_of_match);
+
 static inline bool is_power_reg(u8 reg)
 {
 	return reg < LTC2945_SENSE_H;
@@ -475,8 +481,9 @@ MODULE_DEVICE_TABLE(i2c, ltc2945_id);
 
 static struct i2c_driver ltc2945_driver = {
 	.driver = {
-		   .name = "ltc2945",
-		   },
+		.name = "ltc2945",
+		.of_match_table = of_match_ptr(ltc2945_of_match),
+	},
 	.probe_new = ltc2945_probe,
 	.id_table = ltc2945_id,
 };
-- 
2.25.1

