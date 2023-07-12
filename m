Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3997EB64DD
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 09:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbjGLJNK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 05:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbjGLJMy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 05:12:54 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AD4106
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 02:12:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso72732445e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689153169; x=1691745169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As2y1S5d2MKNIGGSQpxsJqwHM8ix7xWAPQggfbywHb4=;
        b=Hs0IRBomcYhxipA/LiintP1gtFz4DiE7t+yEZ7uHGCq082dAK1i0xqnOkPPKy9gv5R
         0FbdI+i1lgZQUBWsNbBF1NsciF7dLdCfuXHCR0pN2QqY5JCCOwqRfSp1GpctvmPzUR72
         w7h1i24zz9YT8gJoyYvHKhgMm0MNZbQ39XCgCj4TS1023eCnO52jesVLqxrsnIQN/lZX
         tcH8lTgu3BTy+9Q2I5EhZcilGQu6ttx8rSMi2VN97cTrlhP76iw6Nmun8PiGMYOghkPR
         /rhtyX0UCFPiXW9Vvx+rPVS2AkypAuUgi+7DRcxcPzQy9a3WGrj5nXOsbsYs6EmAXL/v
         sepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689153169; x=1691745169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As2y1S5d2MKNIGGSQpxsJqwHM8ix7xWAPQggfbywHb4=;
        b=VfMPkCe4Gn162it8S0dpxEjDhtDgsZrSByzBW78uMMPh3avRvm50zpHKSFPU/O4P8e
         35L3yI7pChlm9sD/zpF+TzS1EyI3GA3vBHATXWeaIwFRSlKjufLZIxncT/Urflrna3mo
         +ATPx0t63+99AnSvYaYrpibHC2ochLS28z1zWJESMPkCy4MX20FLD4S4XKmhtw9/4Ziz
         yvHKL9tUDxz2BVTW4Q7uDkwUS0rEsVlA18y/SfmRdmZ/3BOB8NQLFJdtp9M8AqdX1y7e
         qaHC3wTtEwV6AS7CTvISEHlJYzdMpgtiq8ZQLhOhWKrKnTADp23n34TfyvcATMUz4tRu
         5sLA==
X-Gm-Message-State: ABy/qLakYoWSdTpFrSKJUuBNd5ARU/7tjIFbXB5B+MPORNAz4unj23xJ
        3bZ4/O+TJof1jpf8xvSYYOMv6Q==
X-Google-Smtp-Source: APBJJlG+8CvYiKqmaycbha1cyDEg2VMoqqT40oIx06ECrjzd+sS/mZtwA/vlvGg/cL6i7ymTaVLp1w==
X-Received: by 2002:a7b:c5d4:0:b0:3fa:9e61:19ed with SMTP id n20-20020a7bc5d4000000b003fa9e6119edmr16894535wmk.23.1689153168720;
        Wed, 12 Jul 2023 02:12:48 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003f90b9b2c31sm15013711wmq.28.2023.07.12.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:12:48 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 2/3] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date:   Wed, 12 Jul 2023 11:12:39 +0200
Message-ID: <20230712091241.3668454-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
References: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add support to read DTS for reading Intel Sapphire Rapids platform.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
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

