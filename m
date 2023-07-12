Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81924EB64DD
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 11:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbjGLLtg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233390AbjGLLtE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 07:49:04 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18D61BEB
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:48:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so74029955e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689162494; x=1691754494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBRkWVB0g8Qm8dyh6//o7Lwn4Q/uU6uVP9gh0M6sy3E=;
        b=fTIJA5YWg1SqPJuzssiDs0yYHsqNJ66pstFXEt7VlU1tk8rVnITiG8JTQmwgl6hV8a
         pSBRdwZaQ+pYkTnPGFrXvqEz+lRTDiG8MO4k6cwQYV4EgsNIJhNSKcferBqERRW+LZZE
         kd3O9+1koszCdxgeP8kAK39Kq/PzenfZSPuF+rBe/vpMRKIWGzyAL+40FTlmqOI3Go5D
         TO9WAlj//Q2nTbFJQyIS+GoVuevgITahxz53lRKXA2KUbC8IoLTKYV8omFo7KymmqicB
         d29bf/G5ipf67kPN342AatvB+Z/5HHMT4ENfjMif5A7HM9J5hH6exDsDBPd8LoyyX9Gt
         M0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162494; x=1691754494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBRkWVB0g8Qm8dyh6//o7Lwn4Q/uU6uVP9gh0M6sy3E=;
        b=eXaaUBuoPwc9JjaQVqjB/chK3RgL1lx/H3my/BYZg8Gl6hI+Dw7tJULpkOxbcsVMJm
         SoywFldDUNu3ZyYle629/akWB1cGH9IsRiEP7xydxxZO9pZvOcMVZFFCUh1usjxacHk9
         a7NtRyywPRVKDBz3c2/qHsBAEO2JRc7N4eDor8Dxwbx+WvaZMiMQGklFM9i4IOYFa8id
         OnhANVf5AAGWt9aRl3jq7R6RxCadQCQpdZFUSGxsgOvlrkn8KyopcJKFe+FItIsvESN0
         eCtwwpZCOPfc6A7H/DJRrCLOmJiQiHvciXZoJJKSgtjmKwLraCQnspUBV6rM4Nj9/r26
         S2IA==
X-Gm-Message-State: ABy/qLYi4cHW5ucpjg+5ftPp5S8Uh8mnbBJWjiGXKBMvlop+DvbcNfZD
        ydkO0c4LtUtL+2iGHUUKAaoc+A==
X-Google-Smtp-Source: APBJJlGcJ3tEr6V0Cb+m/2D2hJhmyD6Y5xsrI4FPimHxiVjapWiwFvDjPqdbTOabDiu5YYe0P/y2oQ==
X-Received: by 2002:a7b:c7d9:0:b0:3fa:964e:e85 with SMTP id z25-20020a7bc7d9000000b003fa964e0e85mr18987790wmk.5.1689162494106;
        Wed, 12 Jul 2023 04:48:14 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d4482000000b003143867d2ebsm4867463wrq.63.2023.07.12.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:48:13 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 1/8] hwmon: (pmbus/mp2975) Fix whitespace error
Date:   Wed, 12 Jul 2023 13:47:42 +0200
Message-ID: <20230712114754.500477-1-Naresh.Solanki@9elements.com>
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

