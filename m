Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96FBC0015E
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 09:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbjG0JYL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 05:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbjG0JXe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 05:23:34 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19B276B2
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 02:14:02 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99342a599e9so97156966b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690449241; x=1691054041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSbeOsHfiUld6B49i7Ndaigaf8fAMe9my2pbTspOITI=;
        b=CrcpKTAK+dFo2oeWmUWocOhIgUFNAdbmBLE/wBkHZB2u0i7gnyKuUCcatBT3KWz0bp
         ssWzmJvgFiZYNCqAmECC+OPzX70xG88ikKECxmShfli1HBAWjAt9F5FMIyRP6BGvysYG
         5Do1PE6iJMo/6zfldZGJfwWc03YxiHlOpZwKTDrPRcmNHSHQ62cpBPWxiqGvPiaLbWeX
         HtPk5CzTEeSeHZjtQz+8IB2djX/hcXFEiARUSOnVFiH9UrAVuknEbX3rOVhII3Z7KJqu
         HX+5TFpubLcUxFzU1rV6Q2E06DfQ5adf30rZRkV7mFnq1zuoF6HAVda+xFI87S3vZpi5
         H+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449241; x=1691054041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSbeOsHfiUld6B49i7Ndaigaf8fAMe9my2pbTspOITI=;
        b=kcvO9HW//EPtUEr2q26WlRbgJB9BBPMaoFTfrKhbZzDO7MepvSHEZKL1pCAssN5FvU
         IMm4vjd/TcWvIsDp0w+Cce+BbOlO/IRsrzbFb2adCMyi9sTTETw7RQEQoXYJGqbPkfTE
         1aAAXpRBhfwqQdiWjIMvGtstESVDchFb0uyssBIb2i2sStL8jO8L8HPYj/lThj8AW3If
         gaSi1eGGOeWN8da6cLRuFR96HKoyM8oqvty4VL9c1o3Vhdf+sQSw38Brkfw8to0D1LGI
         2/gNMRebGgJ+vFq8tJCmz6RJdvkuvV3ggfoQXM0yPmjFX4lwWC8DNFg40USWJj/ddLDL
         SHiw==
X-Gm-Message-State: ABy/qLavbn6ug/AQpoafIl4G5OtgvlYdF6JQ/PXCIojaCX1G0EuAgmO8
        Ya6WAsrjJpW+wYD6AMHPOcY8cQ==
X-Google-Smtp-Source: APBJJlEq/O/XUyOsGRhtX+o0id/G6Yc1biCF/nZIu+TZrwnc8hLgLtP4H5JUzXTHsqgOrYZcBILIEg==
X-Received: by 2002:a17:906:7a46:b0:99b:cf57:11e3 with SMTP id i6-20020a1709067a4600b0099bcf5711e3mr1471594ejo.59.1690449241381;
        Thu, 27 Jul 2023 02:14:01 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id q26-20020a1709060e5a00b00992b50fbbe9sm523100eji.90.2023.07.27.02.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:14:00 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (pmbus) Add ON_OFF_CONFIG register bits
Date:   Thu, 27 Jul 2023 11:13:56 +0200
Message-ID: <20230727091358.3274620-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
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

base-commit: 60a6aa5742fa499a918b66d80c9baabef56c3adc
-- 
2.41.0

