Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F927C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 20:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241786AbiEQURp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 16:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347953AbiEQURp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 16:17:45 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCEA51E63
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 13:17:44 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-e5e433d66dso46649fac.5
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxHA764ru6JwjO+ukw6Ys4prusKtB4QFPAsSxPUHX60=;
        b=d/cJMaGfYXIu0WtgKY9VXqLgqXLkyFQsHTbXBF8j6ZGuY+M7gDfUx7T7KGoinExmxJ
         KGpdI6SiVae27z72PjaPeUTfLKCXolXB7uWr5ytI4RXqXWN1heU/O9itSk7KwLVqcjTT
         JlRYIE8KJ4V4nlgeN+gk4c1+WGHZOjyk87mU0M3dPfETC5jGePOiIw1fojkhk2kQiOZG
         4eRjhH/ICb9NbWWLZVXxIEuY2baueBtpm8jCI7nW23iTo4teQ5MMwXmEj54k61o2D3Eb
         wxatUmKW7iY35XjFnIK2ECuyN4IqX+5yj6taCl4tDqwP5Pf7Ntk0QNTyXpxAp5cHoA+F
         6Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FxHA764ru6JwjO+ukw6Ys4prusKtB4QFPAsSxPUHX60=;
        b=qiGmkaQaPsbLMQHZAPBay70cp5w0a1iMT2LdSFLG3eHYIaoRTle3kz08ECK4crHPee
         soEsUR5MhWjRwLd0qZpz/GggqQihUVnBzaps5wltx5V1svH/uX7b48r5RCvx9Cn/S8La
         uclGdQgC2QvB++1tYyI5TRlgDafFEc2R6QhSBCe4kBpkA4aNubG8m79Y7sErKJ9b84JY
         Np28Le4bA7H/QsaFBY4lw9qsU3dYumbfZzLHIK1M54E1O7T/WukkvN8dZG9lMSaBrNoQ
         6k9UGOLcbEAHz4Ez81GOEfLtw03X3AKIMgw9pidtXXD12gkeTVqS5zLPECAm0FRlWxmQ
         NJQw==
X-Gm-Message-State: AOAM532oL7DmayPoqJzFMC/A2ttazEm7u8S3vu/nKQ25mzcs8gsrQ4M0
        eLC1iIfrOrmeihPvWKNiRwAyG/esN8jTyA==
X-Google-Smtp-Source: ABdhPJxoSlpeE30nHRZWO7MT6zPikvxKBF3ruC1GKACu/tejsoYB4oancBEf80J02HPxFdvR+vg1MA==
X-Received: by 2002:a05:6870:434d:b0:ed:5822:c104 with SMTP id x13-20020a056870434d00b000ed5822c104mr13965375oah.236.1652818663226;
        Tue, 17 May 2022 13:17:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x17-20020a056820105100b0035ed382fb5asm177133oot.15.2022.05.17.13.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 13:17:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH] hwmon: (dimmtemp) Fix bitmap handling
Date:   Tue, 17 May 2022 13:17:40 -0700
Message-Id: <20220517201740.1020831-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Building arm:allmodconfig may fail with the following error.

In function 'fortify_memcpy_chk',
    inlined from 'bitmap_copy' at include/linux/bitmap.h:261:2,
    inlined from 'bitmap_copy_clear_tail' at include/linux/bitmap.h:270:2,
    inlined from 'bitmap_from_u64' at include/linux/bitmap.h:622:2,
    inlined from 'check_populated_dimms' at
	drivers/hwmon/peci/dimmtemp.c:284:2:
include/linux/fortify-string.h:344:25: error:
	call to '__write_overflow_field' declared with attribute warning:
	detected write beyond size of field (1st parameter)

The problematic code is
	bitmap_from_u64(priv->dimm_mask, dimm_mask);

dimm_mask is declared as u64, but the bitmap in priv->dimm_mask is only
24 bit wide. On 32-bit systems, this results in writes over the end of
the bitmap.

Fix the problem by using u32 instead of u64 for dimm_mask. This is
currently sufficient, and a compile time check to ensure that the number
of dimms does not exceed the bit map size is already in place.

Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/dimmtemp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index 3c71b5546bcb..0a633bda3668 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -220,7 +220,7 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 	int chan_rank_max = priv->gen_info->chan_rank_max;
 	int dimm_idx_max = priv->gen_info->dimm_idx_max;
 	u32 chan_rank_empty = 0;
-	u64 dimm_mask = 0;
+	u32 dimm_mask = 0;
 	int chan_rank, dimm_idx, ret;
 	u32 pcs;
 
@@ -279,9 +279,9 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 		return -EAGAIN;
 	}
 
-	dev_dbg(priv->dev, "Scanned populated DIMMs: %#llx\n", dimm_mask);
+	dev_dbg(priv->dev, "Scanned populated DIMMs: %#x\n", dimm_mask);
 
-	bitmap_from_u64(priv->dimm_mask, dimm_mask);
+	bitmap_from_arr32(priv->dimm_mask, &dimm_mask, DIMM_NUMS_MAX);
 
 	return 0;
 }
-- 
2.35.1

