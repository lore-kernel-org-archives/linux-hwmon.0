Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDDEC00528
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 18:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjGSSmL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGSSmK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 14:42:10 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0CD171E
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso72678435e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689792127; x=1692384127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKnRhR7SITJIXe1vnVFks13dyzhvxpmyGiR6BjT9xJM=;
        b=NmNkf+DRDYzm5b1OTfm96Wl1eiAht1ady4xiYxiNSgU8CB9ZR+xngnXbhZqVatugDU
         8I0BWNcR8fyfxW+Z2izS/RO1kXH/RkhTSjO0NH9jUXMTVrMF3voUFAUNoGra/unRKffF
         PUOtHxztCR4WiWOo3nCp+sVGwXxvaUFIcrFXPkpY3u2xQd05pOxK0UWUsEumCkIvx/uE
         sRhK0lWG0NdyfzRuEgcrKQpoXzLCC8Zfsw+zwKUPdZCUdwZ/sWlFQUX7YelWfMpTnEdQ
         f56lnd3mGoreGO3ENq0bWUN2yKcoGwSJSwMR3jX0HWayZ/Ib09DXK93mjRiZsXXDyYQW
         WoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792127; x=1692384127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKnRhR7SITJIXe1vnVFks13dyzhvxpmyGiR6BjT9xJM=;
        b=WoifWQjIMgdLYPnuRqRxpb0Gdrva1zLas2wcTiUyRe3ugzIWqzMOXkaAzgChSMRQKq
         eYDiNjzn0q1l9api7gra7wQ2dcNohSNMTV0nTuJjDQBECZaJhbi2VtcuPubSBNxf/bB5
         qxwHQAl/i6kISDA9dzFl27+sbNVDKTCOtP93Vj1WNYKkOpi5ZXctHTMyoc6sIazGBg2/
         7QXpVJ4dFOslvbcvpgFKTVMF3leZgttlZNSXSBWSdqRlrQSREUSi/W9xwFe49wByYBQd
         iHf0hSmXc9Kes7iY+xXzXda2mzo4XHqwdteNPZX9NAYH3KVM/6d8eIRY8Mtder/NhbcY
         UAAg==
X-Gm-Message-State: ABy/qLb+fQNmE43iE+zvj/ZXxWPG/B5apPLro9xOc5CbyfE3okGy/cqJ
        guluUsxKBKBpyB8UBn/xASB6qQ==
X-Google-Smtp-Source: APBJJlF5XQQ83QnSlsJ/G3DODSNDYpBEW7lGEoRF0OGmD0iZLAH2sT5nlf+kshDVz02Czb9io0/XKg==
X-Received: by 2002:a05:6000:10d2:b0:314:350a:6912 with SMTP id b18-20020a05600010d200b00314350a6912mr547850wrx.36.1689792127211;
        Wed, 19 Jul 2023 11:42:07 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm5948877wrr.58.2023.07.19.11.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:42:06 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 3/3] hwmon: (peci/dimmtemp) Add Sapphire Rapids support
Date:   Wed, 19 Jul 2023 20:41:54 +0200
Message-ID: <20230719184155.59375-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
References: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
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
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in V3:
- Update Acked-by in commit message.
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

