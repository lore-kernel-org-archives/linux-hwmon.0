Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842DEEB64D9
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 09:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjGLJNJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 05:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjGLJMy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 05:12:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7D21A3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 02:12:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso10486574e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689153170; x=1691745170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4ZoGAPYZ8auh+cY1dsqTY2FAmhOhUJEp9FjQd56o+w=;
        b=dvqNet6tpnktRGtOqzbtsVLpj/bfeHpughlaL3oKMVMMLyJVS2VbOXxFOoQcjHaw5Q
         MGIrOYLAfDkrECTvPuokDmFvHBWum2prAlWUJk6EkSaeywvahuyjPN9Jq2px5kCLXJMe
         DTsK+ymPr4+epiKI1oyPCTmuKrNXcWSh1DUQyYFBiwy4MgfMxISiHEjnAK6m/wzPcgUj
         4A+7jUysHPi7csWV3Z/H4fXL/az/tflwcUMEOpTe29lTUfTDfCMwQlZ33m+WD/WxTzEF
         qnUPrCxE9rjjZmlsE4GdF6bRoOH3r24nKcfrrDIdWa8TMdv5ceXbknxMoyK+VLMWEQbX
         SsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689153170; x=1691745170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4ZoGAPYZ8auh+cY1dsqTY2FAmhOhUJEp9FjQd56o+w=;
        b=TuzAfn8SFFu+tUHnqu6RSorHq8hQqfirT22qwq3TlGOYc1BLnXLbK65wIsRS7yKAay
         NsDiPiuMhfHd21iQA/MK2eK8XSZOpscWjE8EhkMc3Vowe84t8BpWgylFb6vo6DeQJRTX
         1GBg1yNtGRVjv53U4DO0hdfR9jcgLYdPKbk70Al4DlTGdJgRMtktakFLU2NOS08MJiO5
         ZGAmu/lzdRlrvxo/qztiMvdEvHIDUEiXtYozttSiucA/Q875Om0iJifGGEykckmki/Oa
         9cWt2yJj46mLFz71Vf7ZxgzrcYSSzx79Zc1ouu5PZVnhKlkzLyrVv8g6HxJiZy8AZlY3
         FNug==
X-Gm-Message-State: ABy/qLbc6rwiros6PviQz1E40SclKF4w7bx/P8EZlw+fB+rsgc8Igt0F
        lhHaX4RCC85m+cjl1F3BYZ9mWA==
X-Google-Smtp-Source: APBJJlGizh6n/pkq78hK09NOTcM0Jj2uV2XDJzt6VG+ZM8Y399uMjadI/eauuTqoi357/XOBtMWInQ==
X-Received: by 2002:ac2:4c49:0:b0:4f8:6b7f:c6d6 with SMTP id o9-20020ac24c49000000b004f86b7fc6d6mr18579724lfk.48.1689153169817;
        Wed, 12 Jul 2023 02:12:49 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003f90b9b2c31sm15013711wmq.28.2023.07.12.02.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:12:49 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 3/3] hwmon: (peci/dimmtemp) Add Sapphire Rapids support
Date:   Wed, 12 Jul 2023 11:12:40 +0200
Message-ID: <20230712091241.3668454-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
References: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

This patch extends the functionality of the hwmon (peci/dimmtemp) to
include support for Sapphire Rapids platform.

Sapphire Rapids can accommodate up to 8 CPUs, each with 16 DIMMs. To
accommodate this configuration, the maximum supported DIMM count is
increased, and the corresponding Sapphire Rapids ID and threshold code
are added.

The patch has been tested on a 4S system with 64 DIMMs installed.
Default thresholds are utilized for Sapphire Rapids, as accessing the
threshold requires accessing the UBOX device on Uncore bus 0, which can
only be achieved using MSR access. The non-PCI-compliant MMIO BARs are
not available for this purpose.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V2:
- Update subject.
---
 drivers/hwmon/peci/dimmtemp.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index ed968401f93c..edafbfd66fef 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -30,8 +30,10 @@
 #define DIMM_IDX_MAX_ON_ICX	2
 #define CHAN_RANK_MAX_ON_ICXD	4
 #define DIMM_IDX_MAX_ON_ICXD	2
+#define CHAN_RANK_MAX_ON_SPR	128
+#define DIMM_IDX_MAX_ON_SPR	2
 
-#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
+#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_SPR
 #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
 #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
 
@@ -530,6 +532,15 @@ read_thresholds_icx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
 	return 0;
 }
 
+static int
+read_thresholds_spr(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
+{
+	/* Use defaults */
+	*data = (95 << 16) | (90 << 8);
+
+	return 0;
+}
+
 static const struct dimm_info dimm_hsx = {
 	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
 	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
@@ -572,6 +583,13 @@ static const struct dimm_info dimm_icxd = {
 	.read_thresholds = &read_thresholds_icx,
 };
 
+static const struct dimm_info dimm_spr = {
+	.chan_rank_max	= CHAN_RANK_MAX_ON_SPR,
+	.dimm_idx_max	= DIMM_IDX_MAX_ON_SPR,
+	.min_peci_revision = 0x40,
+	.read_thresholds = &read_thresholds_spr,
+};
+
 static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 	{
 		.name = "peci_cpu.dimmtemp.hsx",
@@ -597,6 +615,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 		.name = "peci_cpu.dimmtemp.icxd",
 		.driver_data = (kernel_ulong_t)&dimm_icxd,
 	},
+	{
+		.name = "peci_cpu.dimmtemp.spr",
+		.driver_data = (kernel_ulong_t)&dimm_spr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
-- 
2.41.0

