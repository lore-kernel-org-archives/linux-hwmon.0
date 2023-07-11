Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3706EEB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 16:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjGKQFR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjGKQFQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 12:05:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E4319B
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbf1b82dc7so60833495e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689091514; x=1691683514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ6zIJuacID5DOSHqnnoP33bErwpH8EdehQ+RhKIoRY=;
        b=cqjF8kmNdfLVDPdvvG0sxY2ov+69drHqon+x5ZIHqNYWu2KVbRJ2ZOezhBVyUdUP7O
         1S7rGwrbbM3zMg4RrJCNLPTb4HLyAZUehEJ1byJE+MTryZPOFsKn81ZXDGyoPgn71IPx
         dZrzv/Ky7QoyympNY6vi1vEL0GBc6Nkh9L3fKN5TuwlRmFfmeaQTKSIAt/QPb5jItfjm
         CzeYstqAhC7uow8E7tB1MRWWrfeg4AtsYmkKwaB6EsxzrsbtoiiNB7pg3CNbF159CuU9
         F1/QJJGQMM88ap0e9rzz2bzim2XhajupwwwB1su6u8GY4+sM39VByq2VOIFrFpAhhDPb
         ZnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091514; x=1691683514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ6zIJuacID5DOSHqnnoP33bErwpH8EdehQ+RhKIoRY=;
        b=ORj+fSxs3q8Z4EFfzjG7p2KjzBbv6kN9suC1Utxe8eDmq3QYDKe1x0wJ/mm8PFGLbp
         pw7gCZgR3MszV/57lLOOUieXhRPVUN/JVbpH6F9bknZnkNlLuSbvUAwqLaqKHnabbC0M
         d/s7RsBf/JjeDGIHTrVBCJyDqxpc+4/EBx1zxkhtxFkXjlcpr68k1t65AM2nH5BmSPcP
         XS9gZ7bPeVF++zdeb5SlTsM4OnHaJUtzKlNQaTV1PnbkZ+df5CSYg9uyNeIrAPLsAejo
         tWwnyh3y7P/7HlA5DFLx0zLyeyzv3JcfKRW0QjvKfXZ1N1DA1tRQzeg1aeBTpu44Nr+L
         OAoQ==
X-Gm-Message-State: ABy/qLZNzp/hWa4mC9xPe3q1xWskMK1dA7g/OQpy8ak2kuQCj3bUuLPA
        3RlRenAPmQuIYAEfHvoksOIAPQ==
X-Google-Smtp-Source: APBJJlFBlmktdcZYIUZKA4HPuooXWyZXhV79B7dghEn80d1rlfC9GDjz+NJ8H2jGbQTKlzdbL6NX6A==
X-Received: by 2002:a5d:58cf:0:b0:313:f399:6cea with SMTP id o15-20020a5d58cf000000b00313f3996ceamr16513594wrf.4.1689091513872;
        Tue, 11 Jul 2023 09:05:13 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm2590377wrr.94.2023.07.11.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:05:13 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 2/3] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date:   Tue, 11 Jul 2023 18:04:50 +0200
Message-ID: <20230711160452.818914-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
References: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add support to read DTS for reading Intel Sapphire Rapids platform.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
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

