Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260A9C04E69
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 11:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbjGYLlC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 07:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbjGYLku (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 07:40:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A7A1FD2
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992f15c36fcso925034266b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690285234; x=1690890034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=cYToPYjk35PirQBwQx8NE3OVoFdb2pztaQ5bfC/OWBAdEiyHG2ot3SaseXH3+8zh/s
         zeu39mYeFkkyabzPpyRttmL4hapAwNo8OEKlRmb1geJTTieV2esQtH7w2lEp9cEzvCHR
         ir1XdGJCd7UWDP8mlJlFMczth2qG7Ibif4ZSWQ56oMuoUVujyOp7UxTeLsgwDHorGsyN
         gWsTLFNDQAjeLSjqyxooiHyMRFlpdReL3dUJAVTHnZoDotCXA6Ht5mBMJINufi+R0hr/
         i0qyhLOkNuYkVEDRM9yEpHS8+i7mPFzzYB9cSBaqOoeSAPEzcjAtfgjhI1x1EICLzAAf
         DmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690285234; x=1690890034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=AnKfoEWpcLYjxDYTjAUWJIyYuts+v2rHU6dCn64VCbReP9hfxNaiJ/27vQpWJ7Z67m
         k1EUFCsAZUB4ALyDIfofH1Kqf/PLA+g0cGTtQtWNc9DFDgt7c8WEqKQgQoG4RDatOZRP
         y1dMkMRvJcebJUexgNzUOb9RSS1eezTpB0zc11686dK5PwVw/jAYLLOI08SByKmitO25
         vfVYLGfJfZB7foz/W+2o455Vm9MhMtSxex81qIn1lKS7JSoqXpJAQkn1ADT72BMnm8TQ
         2npDWyt5N6HhM9Lg4V5vycIkHGEW6aTJ8fULbm7f+zJdMvEKQb/l+0e6QDXydIwydqwX
         CsPw==
X-Gm-Message-State: ABy/qLavZthJaas1e4BaI/DmQzzo9wc6K1Qw30lgPHUlNV1jwTyjrGTx
        yg8LRncME3GHVFtbBqVg2fqztQ==
X-Google-Smtp-Source: APBJJlHdTrdKDN3QHK37zBnlfxTsGeEnuQPKPszxCG5So9c4ue9V0GUISNjAv6fhrva4zHO2Y2kpgQ==
X-Received: by 2002:a17:906:318d:b0:99b:b2fb:27b3 with SMTP id 13-20020a170906318d00b0099bb2fb27b3mr1323318ejy.41.1690285234773;
        Tue, 25 Jul 2023 04:40:34 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d6-20020a1709067f0600b009925cbafeaasm8088206ejr.100.2023.07.25.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 04:40:34 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (pmbus) Add ON_OFF_CONFIG register bits
Date:   Tue, 25 Jul 2023 13:40:27 +0200
Message-ID: <20230725114030.1860571-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
References: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add bits found in the ON_OFF_CONFIG register.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b0832a4c690d..7a28bac7f171 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -243,6 +243,15 @@ enum pmbus_regs {
  */
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
+/*
+ * ON_OFF_CONFIG
+ */
+#define PB_ON_OFF_CONFIG_POWERUP_CONTROL	BIT(4)
+#define PB_ON_OFF_CONFIG_OPERATION_REQ		BIT(3)
+#define PB_ON_OFF_CONFIG_EN_PIN_REQ		BIT(2)
+#define PB_ON_OFF_CONFIG_POLARITY_HIGH		BIT(1)
+#define PB_ON_OFF_CONFIG_TURN_OFF_FAST		BIT(0)
+
 /*
  * WRITE_PROTECT
  */
-- 
2.41.0

