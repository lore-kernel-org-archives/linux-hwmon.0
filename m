Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C09EB64D9
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jul 2023 16:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjGJQ1g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Jul 2023 12:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGJQ1g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jul 2023 12:27:36 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D663511F
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jul 2023 09:27:34 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31297125334so3478475f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jul 2023 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689006453; x=1691598453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVlZJd24DRUTRrQURnZ7yN63fxP+eJTyjrLPGCN3yY4=;
        b=Bnwq/Qi/JmJjvgrXJcJ4mxBmPQeRQvv390HGFGyUuTvK+3qjIUcYFRnHUurd+gHv3i
         USKmOQi84077zEMtO7p2FhECnBcE9G7vjQgZ19Kds60m7VHN0MpNvyJc4V5XavGlJpQm
         tjZrqL2UC/kdcEONl+g1Uc+2eRQ7ftePacgIlBr5xUWoDde/to5RoEqMdvh8dD0JioYY
         Z79ws2GNv5acVnlc8DqjGQE8i58IFkKYB/YyLALneu1RcQGXdztWFuVVlVueOY/+fE7A
         6tajkBjIlsf57ytcpElDPl7q4gUgmS5UOyD7x10Y4Kew82jwdMv5HIQAswHYrbSUZ1md
         X7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689006453; x=1691598453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVlZJd24DRUTRrQURnZ7yN63fxP+eJTyjrLPGCN3yY4=;
        b=OFwVBBOdDwuZ8oF+Jzy8yQWLGqQsCxjClkkMvr8Qyx19BhHuexuDK5CpHKEVsFrSSf
         tqjAH2KDhkdRTqYVLW2hLdJt04lneINZiMf8V/+FiluWgnM5jzwh1/lTnni4UnBs3Ilg
         RP+xxuvYKIt/V2Ok9o2yXE1tdroSo8y08VeAdu9OMVNCEAoh+mrqXZwzdHRXE0SryyRN
         vw6qm6OnvFk2T6hE+q1MUupjpNUWCKAvaytghp9sffEaXOMySQmgitd1Nqfx2k0pYeIf
         GihwRAZ20zAfwj8etcgJva9YM2MsO7iE/T+aiFOVdAOIzSyNLzSZ0wXMfBkgHCijlMhx
         nKPA==
X-Gm-Message-State: ABy/qLaVMun+uih0V7lSnU8eh9uDMomlCbpyN2ZL2+B6Sgy0giSN/nm6
        m3ItniV7XenRMpip+MHmeM9Upw==
X-Google-Smtp-Source: APBJJlFhwyy6ydGp2WjaMZUpUK1JbYJNqOtWi+1SPoy1P4WD5lmV5bX0C2TlnZFlc4ZK4sKA1DrIFQ==
X-Received: by 2002:a5d:65ce:0:b0:315:7f1d:7790 with SMTP id e14-20020a5d65ce000000b003157f1d7790mr6145269wrw.6.1689006453352;
        Mon, 10 Jul 2023 09:27:33 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h16-20020adff190000000b003144b95e1ecsm12029064wro.93.2023.07.10.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:27:33 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon: (peci/cputemp) Add Intel Sapphire Rapids support
Date:   Mon, 10 Jul 2023 18:27:23 +0200
Message-ID: <20230710162724.827833-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
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
 drivers/peci/cpu.c           |  5 +++++
 2 files changed, 23 insertions(+)

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
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index de4a7b3e5966..3668a908d259 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.model	= INTEL_FAM6_ICELAKE_X,
 		.data	= "icx",
 	},
+	{ /* Sapphire Rapids Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.data	= "spr",
+	},
 	{ /* Icelake Xeon D */
 		.family	= 6,
 		.model	= INTEL_FAM6_ICELAKE_D,

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

