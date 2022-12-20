Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F60AC3DA78
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Dec 2022 00:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbiLTAFv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Dec 2022 19:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbiLTAFr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Dec 2022 19:05:47 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0331A8
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Dec 2022 16:05:45 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id f24so5053110vkl.9
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Dec 2022 16:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJMGVx/c3dHDkaRWc2L4bcsVUSNNmncwpOKzTe9TVL4=;
        b=Ofzaz35lynvdnSiVHvcRnf9yKy6m1B644SLmuzdMMIXjSlGONBbNGyWZxmhelAA821
         9Gkgbwj3AWCKPYaeEHqgFJzszxBDUeRSRog7ByMZTfLlfcC37gU2gaZ7SDNKkVCRJ/hq
         QiM8yeOQx4LSCfWYiW5RjGQEVznzRaYzfzkKRfZnmyj/oT3pJDxW3q3LZRxxMlEsZCww
         qUnkB3k5fttcGXz5zP2sITuTrE51/15enY8Ed7LHYGbmXlEwJqKBDtuTveAsMAAr7Yu6
         Z7r2qQdeLMqvROT02KT1SzpkFTmXV/K4JHfSafNb+3z6AKGeCLJfLncE77xCJ2mOoKEI
         xffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJMGVx/c3dHDkaRWc2L4bcsVUSNNmncwpOKzTe9TVL4=;
        b=SKnKuuMPx4it2N/MxRyTccDZkTVbbFinzrLd8keOnopRrwlawv1NCg4bPWDDmGfEdG
         FMDWvsxDjf374jcGK6YWRBUZ0oIY3r/n/Wu6UX1UAPVXPMUCaysTqVy/FU5eB+iE4SD6
         /EArDG6Yeq02VSEZghl1I0Ii4uXnMvOBMg/8/o4OpRQRpsdms4ccV8tlwnhnkYZnUbw9
         toBP0wMbmEcuowofG1AW9P18FmFgj/ZK1BXLBh2zMX/NcEudU/4STMvv4nfRaotdNjgF
         l534gnXB2QuXnR/Wqle0ojJYU8z5A+pwtsSkEeK5y5cm/+5bAfOV5oCRqdJkmTA3wtdb
         wEXw==
X-Gm-Message-State: AFqh2ko8UJmFc3HSo8L3MT8ZlNUu4/FVSpF5S+6mPWSuWP2zgFcNUWIs
        zvQvpf6nYehC64DXZG2Hiy3ciUmtnEPhGYhy
X-Google-Smtp-Source: AMrXdXvSPx43BorZHVkyiUnmAzJzGL1p82hYUfox9RY15Fdm7ViTbM2ltazSaxSD+qOxQt7rNf59kg==
X-Received: by 2002:a05:6122:45d:b0:3c6:bdf4:695b with SMTP id f29-20020a056122045d00b003c6bdf4695bmr9378658vkk.5.1671494744542;
        Mon, 19 Dec 2022 16:05:44 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id o70-20020a374149000000b006e702033b15sm7721430qka.66.2022.12.19.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 16:05:44 -0800 (PST)
From:   "Cormier, Jonathan" <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     "Cormier, Jonathan" <jcormier@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Subject: [PATCH v2 2/4] hwmon: ltc2945: Add devicetree match table
Date:   Mon, 19 Dec 2022 19:04:55 -0500
Message-Id: <20221220000457.1163446-3-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221220000457.1163446-1-jcormier@criticallink.com>
References: <20221214220727.1350784-1-jcormier@criticallink.com>
 <20221220000457.1163446-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: "Cormier, Jonathan" <jcormier@criticallink.com>
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
