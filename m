Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C47C001DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Jul 2023 09:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjGaJYU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjGaJX6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jul 2023 05:23:58 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E9E19AE
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jul 2023 02:22:11 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98df3dea907so621230266b.3
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jul 2023 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690795330; x=1691400130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvA4s9P3xdtnzACs7zx36srPHY2xosHFCEdn6jvHAMA=;
        b=ONNl6rkGIzDE7tCT2Y+18Sqg5EC3k8ugs7hE6pi+8CmpINAWuCHJftXecKXI0j4BTT
         xL8gtLwRgkhnofWyqLo8RAnH42UIpstzBWqWnV6+2PE25zk4ud29EfHSFMBZ8wFOoAcf
         c1ljNJMKy3MnVzq47fD/wy5BX9oq+xp8h7Nx1Z+HxQpwAF+xtjAYKVEQWTZZe7MhR/6S
         HT+qy+qQCO7KZ/ORV/FGDpmge7hMstQB5mtbNuNBFQ4Apq4534hOmgKnkoh5fju842GV
         Rc8en1QpDA9kPKxBiRHpH2UD+OZAACtG6clXcdlPi7PP1K/1O/njkBZBUjqSkfjcEUf2
         MkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795330; x=1691400130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvA4s9P3xdtnzACs7zx36srPHY2xosHFCEdn6jvHAMA=;
        b=eU6Mwigga4JiiVoKg1+3u3y9VBhyiDDFh956sLuKIIzQDY2YE6SOSyx5BfnpOxngxD
         jNteTVUBAK7Vlcits2yzwaZettV2Xuswi/1AUp6s6oXF9c12hUxYV5nBJO9esWk6xtOx
         IQtN7abMj2lr8p8RiiioyMrrz/6fPAGl4JkD4yBbi1G7HS52QLNPa5hkgtiKA9r1jPKc
         T/pxy9OSjd8fbYe7J1reVE+ObQuXUJC9wCCA9Urid91OXVdeE708Xg1oBVZwzpaIKaGc
         Yap4O72AXFLCg2F3Cl9jAGt+EhICkjItadXoZ687dx5UxhcBlBv0IOq9LldbJ3Nzo/2Q
         eBew==
X-Gm-Message-State: ABy/qLatmJDKjXmur5qJ6YPnKcbtcyhmYP6GKY+MpC4a6JLPDU/zbpa9
        DLCbI5+HrMCxfsyhhIzk5jHBiw==
X-Google-Smtp-Source: APBJJlEzFdpsoShncRswUwM1t9cqXHZc5wsmCQapBKBD5aGyN0+S672gkD3WADS7v/lLjyWpfUUOaQ==
X-Received: by 2002:a17:907:b13:b0:997:eab5:f1c3 with SMTP id h19-20020a1709070b1300b00997eab5f1c3mr5313306ejl.73.1690795329728;
        Mon, 31 Jul 2023 02:22:09 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090685d600b00992ed412c74sm5837785ejy.88.2023.07.31.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:22:09 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     vadimp@nvidia.com, Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (pmbus/mp2975) Fix PGOOD in READ_STATUS_WORD
Date:   Mon, 31 Jul 2023 11:22:04 +0200
Message-ID: <20230731092204.2933045-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

MP2973 & MP2971 returns PGOOD instead of PB_STATUS_POWER_GOOD_N.
Fix that in the read_word_data hook.
MP2975 might be affected but needs verification.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 28f33f4618fa..27bb39370662 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -297,6 +297,11 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
 	int ret;
 
 	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		/* MP2973 & MP2971 returns PGOOD instead of PB_STATUS_POWER_GOOD_N. */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		ret ^= PB_STATUS_POWER_GOOD_N;
+		break;
 	case PMBUS_OT_FAULT_LIMIT:
 		ret = mp2975_read_word_helper(client, page, phase, reg,
 					      GENMASK(7, 0));

base-commit: cb7022b8976e3c4d12cea2e7bb820a2944e2fd7b
-- 
2.41.0

