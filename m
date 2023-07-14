Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996D2C0015E
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 13:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbjGNNvf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235759AbjGNNve (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 09:51:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8229F35A5
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6f943383eso29055401fa.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689342690; x=1691934690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBRkWVB0g8Qm8dyh6//o7Lwn4Q/uU6uVP9gh0M6sy3E=;
        b=Zi6m+bT1LbXG3N25RVbGeYgxQ56d0Diy7az6zxJQxnUUTzeZKdpCWT7EexnOSqVO+I
         +PKvpO1facfQ0DHxNSVICdVH0UOesiAUkHlDUZswzriCZh1MMZx/VLuA+BCG61YXZLrU
         qTHBjc4AL/ao7lyeiEBPpYloHZuoBCM2m9O++P2qXnW+DUKvV+5JucEo/jSwIb5LxQx4
         SU3zMn1ha3oYgC/JpSKD/tAt11u5tdVyN4IVUubZIoGsZXkuOtkX+k5EKBjc0EbViE5i
         K0Yrj5PdZkNkSOTb5GUB6KiGXpSu34fIpNmT36pS4yJC7egfxF1UMZPNwacDKqkQfDzi
         f/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342690; x=1691934690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBRkWVB0g8Qm8dyh6//o7Lwn4Q/uU6uVP9gh0M6sy3E=;
        b=OdRgG8offgVZvDG6Egi3dEIrAedjXOI/8HBCSPQ39i2tKbhzjN0lcWa69orlE8pv2D
         H2Kq2mwUA3H7z+CWRgnDZNZtDECnJIZ3fA4c2unZ33zmP56s7M8YOCa3xi+wx1TfmXjg
         9NXcWlCzvP+gwjq9cPfsaMFXaRJkG9ep8aNWQzIpBhxH0qVfKIuQ2iz/yKFaACEf0liK
         hYmbWb5M6xhHRBZaqu9g7F/A6n8lGxBZ1dfRuFMW1aRRaKGWu8psAPO1D03u7sZt8cIK
         DtNl8MLDk1/L2V1jqsvdur3RpPC792bj9Y1oT8GhN6rL9kkVBzyCZ5wuJkg2ucRBXXwZ
         MrJA==
X-Gm-Message-State: ABy/qLbNosa2dBTe6dKf3/USm2p0ojWskyePNGjuVslQZbcmpudfRrR0
        +EwYZP2WFY0pIeIcG4IG0TcJiQ==
X-Google-Smtp-Source: APBJJlEuLw1IGzH4fZS1r8RK5XTuiItRrFc/00qhHzD6ekUP9PRWebDQk9UN1vFtpSECd0OXh3o4nA==
X-Received: by 2002:a2e:9c97:0:b0:2b6:dec9:2812 with SMTP id x23-20020a2e9c97000000b002b6dec92812mr4342904lji.33.1689342689670;
        Fri, 14 Jul 2023 06:51:29 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906261500b0099236e3f270sm5405991ejc.58.2023.07.14.06.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:51:29 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 1/8] hwmon: (pmbus/mp2975) Fix whitespace error
Date:   Fri, 14 Jul 2023 15:51:09 +0200
Message-ID: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Fix whitespace error reported by checkpatch.pl

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 2109b0458a8b..130cfde52e42 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -600,7 +600,7 @@ mp2975_vout_ov_scale_get(struct i2c_client *client, struct mp2975_data *data,
 	if (ret < 0)
 		return ret;
 	thres_dev = ret & MP2975_PRT_THRES_DIV_OV_EN ? MP2975_PROT_DEV_OV_ON :
-	                                               MP2975_PROT_DEV_OV_OFF;
+						       MP2975_PROT_DEV_OV_OFF;
 
 	/* Select the gain of remote sense amplifier. */
 	ret = i2c_smbus_read_word_data(client, PMBUS_VOUT_SCALE_LOOP);

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

