Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290D1EB64DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jul 2023 16:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjGJQrP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Jul 2023 12:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjGJQrO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jul 2023 12:47:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DBAF4
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jul 2023 09:47:13 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso60614635e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jul 2023 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689007632; x=1691599632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/t6qi+ZyC/g4PTUhHmZaN3Bd0vINMuJ9GK/6w6tG3Y=;
        b=V1OY1iakMDqwmTsPidEnik2bW4XQPEfQTlKGXnR6DntnWGM9nQ6OTH48seUGb92Z+U
         ijjbTIy/sx9vD90XypKgtbEF6jZaw+kcCltr/KrQzGnNrY5mf11v+YaLXgYJW21crfh5
         LYRraPw94Ds60uV2jNH49ETwBrWE/f7bMy/ce326mc4LWHBQY3Jp0MXJyWVZSVk0wdyL
         noxFjfWKjKC1Mm4AMB2+g8cfadTsT09TgcBWslOQFz1Hv0oFF0k1oTaILGyWnN/YJRdI
         LkKF8/bZlQwa96jxM2Z5GbEohPyqpEMd2rptUrvgzrO73X4WR7pJCTjFnZZXANlDU6yT
         LFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689007632; x=1691599632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/t6qi+ZyC/g4PTUhHmZaN3Bd0vINMuJ9GK/6w6tG3Y=;
        b=IoOCwyTHmegwWnGMPgqoP3WIJBFNtthRIMALd6uVZTaOiNMxZsHT4zOnJ0b/QAeBEK
         PED+SY5U2AMTjE5TfDKrVNJW/jRR3WC/Y/o3MDti42qop5efjf7iawHKu7LGPHiciOYa
         TNbStU0K7mcdZ4ITYvDnoJoRFzC+FkwxzheYN77tEbxSSao/iHZSYZAPhi59YdnmSa7N
         JH61/ONY9hJtMgL073mBMi+sXdp0XOtuhLjS6RkafSiwj4XkuXAt45vV0CN0S6iShCwA
         BA8oURwNxJxURF/C29I53ZVWw7kcxwKZ2j1cv2yIzLSSTAegbx22lI0OwkfT2Fd3Yk3b
         TE3A==
X-Gm-Message-State: ABy/qLbTbuXfqHem74XA7VM9uqhVU6v8yWNQ9sEMUT9OkXBvzisIK1nl
        7IMYFm8AXADpjFNT0MIsUWQEgPLsOc6XJzFws7X7wg==
X-Google-Smtp-Source: APBJJlE7AnlZK1RZo5W0XD+eszpl4R8XQAZAgpYb4pdp/gmgV/vbap7e6x7nIqCaMoyNeSDIomMr/w==
X-Received: by 2002:a7b:ce18:0:b0:3fb:b280:f548 with SMTP id m24-20020a7bce18000000b003fbb280f548mr16210018wmc.0.1689007631860;
        Mon, 10 Jul 2023 09:47:11 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fbe791a0e8sm394704wmd.0.2023.07.10.09.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:47:11 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 1/2] hwmon: (dimmtemp) Support more than 32 DIMMs
Date:   Mon, 10 Jul 2023 18:47:03 +0200
Message-ID: <20230710164705.3985996-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

This patch introduces support for handling more than 32 DIMMs by
utilizing bitmap operations. The changes ensure that the driver can
handle a higher number of DIMMs efficiently.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/peci/dimmtemp.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index ed968401f93c..ce89da3937a0 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -219,19 +219,21 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 {
 	int chan_rank_max = priv->gen_info->chan_rank_max;
 	int dimm_idx_max = priv->gen_info->dimm_idx_max;
-	u32 chan_rank_empty = 0;
-	u32 dimm_mask = 0;
-	int chan_rank, dimm_idx, ret;
+	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
+	DECLARE_BITMAP(chan_rank_empty, CHAN_RANK_MAX);
+
+	int chan_rank, dimm_idx, ret, i;
 	u32 pcs;
 
-	BUILD_BUG_ON(BITS_PER_TYPE(chan_rank_empty) < CHAN_RANK_MAX);
-	BUILD_BUG_ON(BITS_PER_TYPE(dimm_mask) < DIMM_NUMS_MAX);
 	if (chan_rank_max * dimm_idx_max > DIMM_NUMS_MAX) {
 		WARN_ONCE(1, "Unsupported number of DIMMs - chan_rank_max: %d, dimm_idx_max: %d",
 			  chan_rank_max, dimm_idx_max);
 		return -EINVAL;
 	}
 
+	bitmap_zero(dimm_mask, DIMM_NUMS_MAX);
+	bitmap_zero(chan_rank_empty, CHAN_RANK_MAX);
+
 	for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
 		ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &pcs);
 		if (ret) {
@@ -242,7 +244,7 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 			 * detection to be performed at a later point in time.
 			 */
 			if (ret == -EINVAL) {
-				chan_rank_empty |= BIT(chan_rank);
+				bitmap_set(chan_rank_empty, chan_rank, 1);
 				continue;
 			}
 
@@ -251,7 +253,7 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 
 		for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
 			if (__dimm_temp(pcs, dimm_idx))
-				dimm_mask |= BIT(chan_rank * dimm_idx_max + dimm_idx);
+				bitmap_set(dimm_mask, chan_rank * dimm_idx_max + dimm_idx, 1);
 	}
 
 	/*
@@ -260,7 +262,7 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 	 * host platform boot. Retrying a couple of times lets us make sure
 	 * that the state is persistent.
 	 */
-	if (chan_rank_empty == GENMASK(chan_rank_max - 1, 0)) {
+	if (bitmap_full(chan_rank_empty, chan_rank_max)) {
 		if (priv->no_dimm_retry_count < NO_DIMM_RETRY_COUNT_MAX) {
 			priv->no_dimm_retry_count++;
 
@@ -274,14 +276,16 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 	 * It's possible that memory training is not done yet. In this case we
 	 * defer the detection to be performed at a later point in time.
 	 */
-	if (!dimm_mask) {
+	if (bitmap_empty(dimm_mask, DIMM_NUMS_MAX)) {
 		priv->no_dimm_retry_count = 0;
 		return -EAGAIN;
 	}
 
-	dev_dbg(priv->dev, "Scanned populated DIMMs: %#x\n", dimm_mask);
+	for_each_set_bit(i, dimm_mask, DIMM_NUMS_MAX) {
+		dev_dbg(priv->dev, "Found DIMM%#x\n", i);
+	}
 
-	bitmap_from_arr32(priv->dimm_mask, &dimm_mask, DIMM_NUMS_MAX);
+	bitmap_copy(priv->dimm_mask, dimm_mask, DIMM_NUMS_MAX);
 
 	return 0;
 }

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

