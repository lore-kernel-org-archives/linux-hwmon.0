Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31610C001DE
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 10:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjGYKoC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 06:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjGYKoB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 06:44:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FF210E6
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 03:44:00 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso3998755f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690281839; x=1690886639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQL70qcpHVJtjXXrjcL8pHbenCmiHSNwdzBLMHcDPF0=;
        b=PHuasKoTSBC0QMQvXfABeSOEYeM8DDzDnBcVpK7+caqAeBQjHNpkL0tvdC+mm+3RG8
         Q5y43essKVx39/Ph5CLC8EcH6jg4PZBifCltmg1gBP3Bk3CgXiMCG4aWoqiwa4FL0k8b
         yA6cLh8qJOIECYj49SWXVjaFLDW7d1hlnu7UtN62cOrqU8rZSybZ1DDi3btNvM33ZsBI
         VEDluzb+45ZPixohocX/0fBjgVusO9PsqDD2nuKaRBatCNh8PurponKdcb9EKmT1BxP9
         k9NnuICa8rffTW+ipnef/aAMqpQI50ClehaNks1hYJ32fDBUn9ieoUbOfwvua5CZP6h6
         XSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281839; x=1690886639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQL70qcpHVJtjXXrjcL8pHbenCmiHSNwdzBLMHcDPF0=;
        b=PJPr11H1CZk17G+k5cbgPIqAYaUXgOapDNs63eXRrVSuXECiwUJJno9d4OPjO2Eri2
         K6mlKEgXRFY3s31EUsxpmfVEcmrkWeLTE06Z3yVjph2pluGPusfglfCl2mGdI6EQu6iC
         4KV9LpNW9Lx0st85H+a42N01tuy4sPJAaWnsNNvOGbNCncEJVZHO0ESpgMeXu5zmSn5E
         VSaqpY2Orlbp6F7Xtb/fWCDi9NWdWFI9WlcunewP2QOKWX1St5hHp4iWfi6wtj9SmEsZ
         Rvzp+5QNBPjLE3tgOItJzrjEmpQkygNu+DvOxw8o3kQ+g2t2mZhfE8jkm4PytKAamk5X
         eagQ==
X-Gm-Message-State: ABy/qLYkel0JEXaNL/jxBhfqDhkpfKmNW1DD0bw/oLpBd2PejHaDwRya
        f2VSHzavRzP/Lii2doQmKSAoZ7nZo/n1TF7rXUvi7430
X-Google-Smtp-Source: APBJJlGGRHvBlQf1jjqQ05LnBmIHx3SJKzrmBQUPxZIrjsmSt+Ko0VpcmiGahSEUVSA6Zk2Pzhyj8w==
X-Received: by 2002:a5d:53d0:0:b0:313:f33c:24c4 with SMTP id a16-20020a5d53d0000000b00313f33c24c4mr7669482wrw.39.1690281838826;
        Tue, 25 Jul 2023 03:43:58 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b003143c6e09ccsm15793723wrx.16.2023.07.25.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:43:58 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v4 2/3] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date:   Tue, 25 Jul 2023 12:43:52 +0200
Message-ID: <20230725104354.33920-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725104354.33920-1-Naresh.Solanki@9elements.com>
References: <20230725104354.33920-1-Naresh.Solanki@9elements.com>
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
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
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

