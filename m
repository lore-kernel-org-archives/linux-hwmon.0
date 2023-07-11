Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD31EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 16:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjGKQFR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjGKQFQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 12:05:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EED10DF
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so64396035e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689091513; x=1691683513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGMbrwgBLKOnv+M8jwXMoAH8jG/gfbhQBZp4iiCWWRg=;
        b=X1599FXgOL00p8CKDohLXF9Zr3cMKIazjOaQ+wr9ok+tpfYrW3HSzeLD+mMpSJ0TaX
         mMnlzicef3CocM5gYd0StuU7RNfloN3Zl4ZqLrExv+rUuDepUtcTazZDAEgL8hd9ggbM
         VAorHcH+daZIPqCqK7nkF/upz8zdjMz1hOsUErmsnMGZfhv6CEp2rJuYo4aC9ftjwsPd
         Oo+YJl9PUJVZ8r2POSjKBvS8gc7kGaXAk6vCCUiDug0M7e2EBDE+EQpPpBFJnbQ4CO41
         qtV5jPobJP8hL7/CeIhm9jBl5tMCbfFUoHVkY6/pPvYgKPMafArs3B7iaqDo8WMzOw3c
         jZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091513; x=1691683513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGMbrwgBLKOnv+M8jwXMoAH8jG/gfbhQBZp4iiCWWRg=;
        b=MWI90mZmsiGMjPOlgF2kqQM/SWsYNsyI35aeuI3/uOHF55JF32WhVQOsuzc07eU1SJ
         AN3GoWfNqcHTMhrn7DqUMtQxdpDN9IyGFintfthf+Plw4Tpozuq4oSAqBuNhBEeeBHMv
         s/8WsDLFtUMwkoa6El/IsDAhVUcJoWiRgGR2PYm4yqOil6E1jDliygzROVB7fwkiDyxy
         6arr1fzgD27qPqd83F+4ZttdynAi/RAtYlyVRNNmVTZZEcUcs8FJTR1lTBpc/tc65pAO
         pWT+WyOV2Y0vlGk5qHOOjOBGzYrti83APaOJsr+HzPERF1ce5ljC7AwFhnqnM333ihFf
         IqCg==
X-Gm-Message-State: ABy/qLY8aq54Lp8l4fnKODd8JCWmlNu4ema1CsVJe+7/YWWwalOBtTDG
        BQ9oswH1K7z4Bb/4m6U5JQLIIxKLd5dzZOxFhE2tvQ==
X-Google-Smtp-Source: APBJJlHgLwp34UlDfRu8lFzyRofn21j1gWYc7T4ZYRT5xVced3YXYwegULEStCbhjNSRooP0I+B8Yw==
X-Received: by 2002:adf:de90:0:b0:313:fbd0:9813 with SMTP id w16-20020adfde90000000b00313fbd09813mr14916631wrl.28.1689091512709;
        Tue, 11 Jul 2023 09:05:12 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm2590377wrr.94.2023.07.11.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:05:12 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH 1/3] peci: Add Intel Sapphire Rapids support
Date:   Tue, 11 Jul 2023 18:04:49 +0200
Message-ID: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
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

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/peci/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

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

