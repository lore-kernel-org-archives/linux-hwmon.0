Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D5C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Mar 2023 11:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbjCKLSY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 06:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjCKLRZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 06:17:25 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119E613F570
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 03:16:25 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id j11so30743699edq.4
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Mar 2023 03:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCzg8SfNWOR6ZGwqRQLrQy1Mo0FTE4MlBOnbJtRBfZ4=;
        b=x6ny6ewhdLvAMEqWw/3v72kyLaxkOEQQMYQmghS2Psgll1Kl6XAJkbVe7IVZPOjRQ/
         Lz19EHwiTGVBsfi94BuHFfz+ITLVvmLB/R4E+rcM9UEvXuPZo1cDnpmuQ89F9w68mVsg
         jz+hHWlyHpmFzs4utE+du/L35nyBCVtkBHAgqrna5CADgVdD6RI0KmqUuT67/dfwqUlA
         xJkNduPizZaltQC3JRZtvS05az6SpWXuk/M/kfUQnOjd4E2OcZKO23x+Y7ucRZ3mKmcM
         hO4wBI3KXesk2mGPJoUKDBaNN7hPlXnByOVo5dpEjuOqzqtNmR1U5Zyqm+u536bHkG0Z
         jkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCzg8SfNWOR6ZGwqRQLrQy1Mo0FTE4MlBOnbJtRBfZ4=;
        b=4jRPf4m3v5b2r6SeHggo42SErFwUn0NZKaDxpfvongCiY3lJM41ybAHBd/mG1N3EfA
         hb/n0eDKq6OwhNshABJuFsHTsq+Wk1perGS8uMTPhpiRdTPwdO10Xc5T+4/N4U2665bR
         xo8Pxt7pGSRVW0HWx0e8CqaEVVlqKrGUMtAKJ/5Lrqmm52Ssvmk267KA8KeYkes+LxAM
         XY0oUwhPZZrcuIY6F0FqWa6YXsCC+d0WTmQ1LX9hseHeBOygVxgoDcgEvCibgZ1fSU19
         vNWgMrcwJBe9ms9hCXfciIkEpI1+8hHBW4CdT36JB8ZR8qZxbpupNK0fPpSu/xPTJvJp
         xueA==
X-Gm-Message-State: AO0yUKUexWNLiJkZaVrytu959GKsosHUGA79fy7rHnlqbWxX/AeZwPA2
        3xURSZtfJor8PWm0P3VwElF/iQ==
X-Google-Smtp-Source: AK7set9cjLbbYo2UOa5RfYgrzvA4oeSfkxQ06b+0q09ZBj03pG80CWlkc8SXf/95ocSPl0c1+DXLfQ==
X-Received: by 2002:aa7:d149:0:b0:4fa:dad6:4b63 with SMTP id r9-20020aa7d149000000b004fadad64b63mr573298edo.37.1678533373699;
        Sat, 11 Mar 2023 03:16:13 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id a20-20020a1709065f9400b008be0b7242d5sm994267eju.90.2023.03.11.03.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:16:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] hwmon: gpio-fan: mark OF related data as maybe unused
Date:   Sat, 11 Mar 2023 12:16:09 +0100
Message-Id: <20230311111610.251774-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/hwmon/gpio-fan.c:484:34: error: ‘of_gpio_fan_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index e75db6f64e8c..be7f06fb7f78 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -481,7 +481,7 @@ static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
 	return 0;
 }
 
-static const struct of_device_id of_gpio_fan_match[] = {
+static const struct of_device_id of_gpio_fan_match[] __maybe_unused = {
 	{ .compatible = "gpio-fan", },
 	{},
 };
-- 
2.34.1

