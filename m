Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD00CC001DE
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 18:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjGSSmJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGSSmI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 14:42:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9862BC7
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3144098df56so7477210f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689792126; x=1692384126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YESQXc4adgNO1cttL/AjWO2pAQBf3ZzNJHpCW2KolRA=;
        b=Rl2FdoCHApcz0dp+QfaobCU5dzqdds622mfr89E8twyKZy2v9t3M0sU9RsQPp3H95g
         51dmNSpBuyADlNZsigin4hS0NYHneF+U/5btckuLioux1u9HHHJXDKH0/opiwcHnmnDv
         mwTTSVcemDFnaDparfLhxAQa3JySi0NjKyURTXke5TQW14rpLCiMqLwQUrKQOh9psPQW
         reGw8ZJNgssFogGaBQRGAoe7lRsPzUWHNoD4xzd9TO8UV1k3v+WDM6LHD0aBc+mCJDPU
         o2F8IpDesxnxLYFdeKEiXLvK1WY3kKROfdBPsn9BLD7AuU5NtJST3mi/eHGEEweopO/1
         3amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792126; x=1692384126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YESQXc4adgNO1cttL/AjWO2pAQBf3ZzNJHpCW2KolRA=;
        b=RcUwGqaN5tslBUnva2IL9fQWqYLgxPTiyQJC/RW/2mQMlv0FlX0s0FJhfOX9R4P+0D
         2Ljs4+7yp+8nuKUIUQKQsQnSzJWHf1C/VSgmKclVpOHbP4FXVkZT03WCWxTvhZM1katD
         GiJJTzmkdhTQNrS1iQZ6I73FLKX478mRyp2ItYwjv+jPHfJVFNiiIXxpv1zTcqwJSGnp
         O2SBJeKMS4XQKwft0ZyOiAzMpdDP0FqVD7ynymV9zGeGFYOzigl3Sr7MXYnkNS9is3Xl
         rOBd9+l2dioUGBhnTd4MLEF16h+yft0vVV2UvjDkKl/sK/OIuxBPvfRl0EXUepCBr7Zb
         mW9A==
X-Gm-Message-State: ABy/qLawO/sUqZ+5FDjuw/GJKoDOTqfvBy+JBbOyIBM+keujUpHuWWUn
        E40dWDVSZe/mCHRUhO7RIZeWjg==
X-Google-Smtp-Source: APBJJlETkG1uZ2M6MNaSyYgos6n+wB3KZg5vJOIKOZvrR2JfhSffwZAWZitdwihEbYETi7ZzOOmw8Q==
X-Received: by 2002:a5d:4ec5:0:b0:314:111a:e121 with SMTP id s5-20020a5d4ec5000000b00314111ae121mr551469wrv.30.1689792125989;
        Wed, 19 Jul 2023 11:42:05 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm5948877wrr.58.2023.07.19.11.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:42:05 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 2/3] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date:   Wed, 19 Jul 2023 20:41:53 +0200
Message-ID: <20230719184155.59375-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
References: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add support to read DTS for reading Intel Sapphire Rapids platform.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Chagnes in V3:
- Update Acked-by in commit message.
Changes in V2:
- Refactored from previous patchset as seperate patch based on subsystem.
---
 drivers/hwmon/peci/cputemp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index e5b65a382772..a812c15948d9 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -363,6 +363,7 @@ static int init_core_mask(struct peci_cputemp *priv)
 	switch (peci_dev->info.model) {
 	case INTEL_FAM6_ICELAKE_X:
 	case INTEL_FAM6_ICELAKE_D:
+	case INTEL_FAM6_SAPPHIRERAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
@@ -531,6 +532,13 @@ static struct resolved_cores_reg resolved_cores_reg_icx = {
 	.offset = 0xd0,
 };
 
+static struct resolved_cores_reg resolved_cores_reg_spr = {
+	.bus = 31,
+	.dev = 30,
+	.func = 6,
+	.offset = 0x80,
+};
+
 static const struct cpu_info cpu_hsx = {
 	.reg		= &resolved_cores_reg_hsx,
 	.min_peci_revision = 0x33,
@@ -549,6 +557,12 @@ static const struct cpu_info cpu_icx = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_spr = {
+	.reg		= &resolved_cores_reg_spr,
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -574,6 +588,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.icxd",
 		.driver_data = (kernel_ulong_t)&cpu_icx,
 	},
+	{
+		.name = "peci_cpu.cputemp.spr",
+		.driver_data = (kernel_ulong_t)&cpu_spr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.41.0

