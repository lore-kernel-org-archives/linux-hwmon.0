Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6812DC001DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 16:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjGKQFT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbjGKQFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 12:05:17 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DEF9B
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:16 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-314172bb818so6368057f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689091515; x=1691683515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VNB55+Kj0EnFZI/6YA+WsjU8eHtTcvYjmA+69rBlFU=;
        b=V0CL4KppxA7FXEGPQn5AbE9Edqfb6QVfaGTeFJsRyl8EZbGVgDnQzmuUl4+YIE1+98
         bzrrNWKjYbZXYHxau15yEYhtx5dK1vVKgt5Vg7gVjtoqTi3w0/nwVpoMf/He50w1pVhM
         BtWqlGKXO2nEyElPGsSTRb99Kr5ws5yT5Z/+oEKVDFxscTJY5ffZCF/r9rjIhQZDN5DS
         MzlWZVejVnDzX3TmXQrnl1kS35ImQ7V8IvUE+Xdr5A7FHq8o81OYNPEZ4VjfS22yEssT
         f4Nl26KoNxPDRqfxsJmoy3fBkcubmuwmQNToFHbJbjBx5yNXqsZH+Q3k2DQQQYAc6ZCR
         XcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091515; x=1691683515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VNB55+Kj0EnFZI/6YA+WsjU8eHtTcvYjmA+69rBlFU=;
        b=IaXeaoKaG94gOJT7ztyFMUWptXjX/i2DyAbFV9qWBWfM1z+PVWJoqEaQUxzzF1OON+
         4mKqVGS+DW5d0WygN6Le4Sz/nGNOtM6I8sSvtZBsc8lXs7T7sscvCOfC+a+AF0mxHYZa
         6wvNm5mDKiVzZYbFZiDJ9KmQg/3rtc35HQIMcveVl6k7iFviOJDqapn5WS5mvvhcWDBo
         ti29Xw7vSy/C1XLccvX5IYDUjwXD9X+2nyLMDR/1b4biBX+m4935PUzqF6o+ixgHwgPS
         YJsjUPmByXyIF6yFsUFY43vtyktLEk+PqhuwU4oQdaEGpi0N9BcsxrMmxYbhC95prKg/
         yTXg==
X-Gm-Message-State: ABy/qLYEfHMCvO/7oPYiB6quQVkhYWoR/ki1yKXqmVpMjdb+196mbKEa
        0h/hdHsLg7nKsf+GEpXBGX3Tcg==
X-Google-Smtp-Source: APBJJlFSmv5mhuu2nFtdTbkI81Uwo9zlsf1jpmKSUjRjHpww7prtSSW2+g+SpsfUtRyvqpDnRFEnTg==
X-Received: by 2002:adf:ce01:0:b0:314:36c5:e4c0 with SMTP id p1-20020adfce01000000b0031436c5e4c0mr16432328wrn.11.1689091515075;
        Tue, 11 Jul 2023 09:05:15 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm2590377wrr.94.2023.07.11.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:05:14 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 3/3] hwmon: (dimmtemp) Add Sapphire Rapids support
Date:   Tue, 11 Jul 2023 18:04:51 +0200
Message-ID: <20230711160452.818914-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
References: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

This patch extends the functionality of the hwmon (dimmtemp) to include
support for Sapphire Rapids platform.

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

