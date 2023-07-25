Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2015EC0015E
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 10:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjGYKoB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 06:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjGYKoA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 06:44:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211D910CC
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 03:43:59 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso52808465e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690281837; x=1690886637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2+LOkmbRzocNLGHFc65c1vCZRpwTkaqodGNOPSIAJU=;
        b=QRAUr/fNWYjB0sOxrI8MMRk87D1j2LMRs7ByIWGHV02Y+iFcHv5AnkKaJ4jo/3WkQQ
         gTIpW4yMlpTKWW00bLhLpD9HCS08121iceRfhHIFqs4FQoAxpigzlblcApJfliU0DLu1
         Fww/vuWbs/HhGvYYWb0vhdVa2Ygo7nbMcT200KrrjHVYquOhuDxB6vu0knKLJaamkmLp
         ToUTTPiG5CFN1T18MkEQofHAuNUr9aUIqLf7fmmDz8GMJKr0Rfb3QZvr8yZDcaRveY3u
         mIaZBorI1JvKm28Eb+aGIMu9mZCvSisgna8BS0deWIhMMwlk4OuZgBewSalsTvHtKZ8n
         Qt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281837; x=1690886637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2+LOkmbRzocNLGHFc65c1vCZRpwTkaqodGNOPSIAJU=;
        b=jG1RAr2Dx4prM+kQDZcDZp+uBo7EtNVjiI8YE3MLX2gVwSrsoP2764iE7Wo3nTrOjz
         bXHN89DVXOtmj2uq9n3TdbMCFBCeZQ1dqSkXt0mvA9ZcDQCdG0BqBy4QCCpur2Y1j7Jj
         e+kqXEme6YI/Rrxq7OutXMo2S59OGP732gyv57e1P+aJ79ktVY44eD2PDg4MIGH+BupH
         6Tn+j4JZF2aTWn8U8jLlHKUxJhAuTChIHbpdN2p1hCncbz8ILpi4enp1uKdBzwMBmYuC
         N39/349XdrEeTBSziHmQCeBfWj7Ca6UFR4ptUY4gWTaDISBWqYIy6D4AbGHckTJPLi7p
         uNog==
X-Gm-Message-State: ABy/qLYkswP5bjgBISaoCeACZBPNQ64TPt92LAs7qkDBhsZg9NJkMRVG
        uVRehVOuU/cV5rCvLENldIL8ehtnKikbzikb/c2CtQ==
X-Google-Smtp-Source: APBJJlFgnYys6xLwEPqvMSaNFLz0aaGFAQiC1lUMCbKi1QUfpXLwHlZMzXcC3NjQhAM4FS+FHyhNCQ==
X-Received: by 2002:a05:600c:2a54:b0:3fb:a917:b769 with SMTP id x20-20020a05600c2a5400b003fba917b769mr9567467wme.21.1690281837646;
        Tue, 25 Jul 2023 03:43:57 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b003143c6e09ccsm15793723wrx.16.2023.07.25.03.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:43:57 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/3] peci: cpu: Add Intel Sapphire Rapids support
Date:   Tue, 25 Jul 2023 12:43:51 +0200
Message-ID: <20230725104354.33920-1-Naresh.Solanki@9elements.com>
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
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
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

base-commit: 55612007f16b5d7b1fb83a7b0f5bb686829db7c7
-- 
2.41.0

