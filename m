Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC62C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 18:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGSSmI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjGSSmH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 14:42:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B592C6
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:06 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so6919417f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689792125; x=1692384125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrjkymWQEytm3ZEsWHkhp23Z4KQxMO3ORXG0AjMGsDw=;
        b=TckggQyziPAn3xmiAQXv2PciXO8X0PSzmy1GiTSSOloJ7PmzNRhVBvXIi+OhxGxCOt
         V1WYDpZ63YvfAhahRBeXrP/iloLgg+25SIJTIhmNG2J8MvnsroBwF+jgYI9wtWAzwfaQ
         BM4ZD6Ti9JGApvDzpH9eRgomPW6sjk0GEvRQRsSh8tCPs+symP4f95Fseaqp1vFEAGgT
         jEEeMuH+Hm4ORkGTHZ1C0n2ESPtJRIZsm1sPTInc2Ej+mN1VcxuOAbaCM9VaDoQnvP5A
         ATVIwPoHgYMF/aYMu27RntJ17ZmOaqkccb5GfY8l+0P7Ve7MMHydJg8sjrpmc59lCHOc
         PvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792125; x=1692384125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrjkymWQEytm3ZEsWHkhp23Z4KQxMO3ORXG0AjMGsDw=;
        b=YVfVpug0Vg2NCGwp33+LvtPCi2sNKiT/JC8qq4zWzpsYYe9qHeZci7ojUvaDBYMXm/
         fUBvuHEOh1AUrc9w9ouijOZRr97dQ2DYCNw+H1piZc7dfc9RCcFo5qfqIOEGKsFDJZei
         hr5sRd1ViVLYarbkiMNhK1VWNTNjUV0mNguKJyTITFV/7DmK2+Z5TJp/gr12+oF3F375
         yLBeECybjn73m86Yh8dC77wrm8ES/UXhW4nfhR136otWp7SFn+s9pEkIvODhJfSViPV2
         FOEU5WNzT2fR51gNf9EyIwAET3W2KmvMcDTSeyDTWCp030JGo7A4mxHDXsBaKmw6vqCS
         6CUg==
X-Gm-Message-State: ABy/qLYL55pP9zuoadBZxdwzD8kx5DkRVH5ArwaaZPj+GiGgtE2aPesS
        EeRR7PdINeUh+Ya1298RR6R+iA==
X-Google-Smtp-Source: APBJJlHbdMsb7I2HjGqQtfegpmV8gfoG0PItgVLH8qX6gTM3nRUo4n++u3Rie849H2AllpORTMgs0Q==
X-Received: by 2002:a5d:4561:0:b0:316:e325:fd92 with SMTP id a1-20020a5d4561000000b00316e325fd92mr531092wrc.55.1689792124801;
        Wed, 19 Jul 2023 11:42:04 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm5948877wrr.58.2023.07.19.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:42:04 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/3] peci: cpu: Add Intel Sapphire Rapids support
Date:   Wed, 19 Jul 2023 20:41:52 +0200
Message-ID: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for detection of Intel Sapphire Rapids processor based on
CPU family & model.

Sapphire Rapids Xeon processors with the family set to 6 and the
model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
is "spr".

Tested the patch series with AST2600 BMC with 4S Intel Sapphire Rapids
processors & verified by reading cpu & dimm temperature.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V3:
- Move spr entry at end of struct peci_cpu_device_ids
- Mention test with the patch.
Changes in V2:
- Refactored from previous patchset as seperate patch based on subsystem.
---
 drivers/peci/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index de4a7b3e5966..bd990acd92b8 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -323,6 +323,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.model	= INTEL_FAM6_ICELAKE_D,
 		.data	= "icxd",
 	},
+	{ /* Sapphire Rapids Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.data	= "spr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

