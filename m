Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA477C7618D
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240118AbjDFUfI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239647AbjDFUeh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:34:37 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02438C67A
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:32:43 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id jw24so4222061ejc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yu09rRuq25z5vSgNy1uvwATC8+EvP1JWMz5329MS+70=;
        b=Er6spU2uAbZju8iYd4yhN6tt1CtOtNQzNFT+yYRHnRP/5jjQX8N7RirDF6DGIA2kQC
         83ax5VbrN5FgKerCnIzVQRZMjJexJomDZ6LtuwTtKSTbMwGHrnnNVDHjqvBC/EN8X/Av
         wjwSqiHeFGRx+IcD7T0WLfTlgtbcbe3vbzRL0pdLBB81Ib+1n7Bs9v01REshrVjYUxiS
         UhPaAOfCNuKPtZn1KxaQw0H3ZXwUYN1XNJRTjDD/yoH9gkq2ZblWiqGCH1tWaQABrTzS
         8aRY2nKPl6D1rzBKjoDf4j6OlLG0MYNalyJU9fGGy0+Oos2YirdAkawRLXpdBI96qpZ5
         utOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu09rRuq25z5vSgNy1uvwATC8+EvP1JWMz5329MS+70=;
        b=1EOFwaGCeuOAKOM7O/DPlOwwU0l7zUftdy4j3KQ87lxNQkeyg63rLacuLNb53ONU69
         AQ7mZYtMGqDNDu2v/snlQiR5GkLHs0G5TKCpHztnxfV2TIugOElBqg0xWzvFFrnVLvKd
         sklvd0vLFu3B6OZhiLHt9klQQDNF8bfhBVTbcDii80N0ylT1GcwvdTZPsWFkWhy5pGDS
         xY9j13eaIqk4md3hLw5UHMbLdlmmzBvkweWimDkVP+1mIUrzypM0GshFocAUk3Ao6DwP
         WWLbiTh1Qra79+KZhzZsf1ln2LPdNj6m4D2q+n/Ob5ODtrrWvmgH8ynDrTJIAdDN2N8c
         +pKQ==
X-Gm-Message-State: AAQBX9cCGX8tfX1E7s8VsnxlQzQ50PAjUNEQ6lJaMJxfv31TiUjLM6mP
        1N2OJWqFB3zNxY6PK1K/+LM2Wg==
X-Google-Smtp-Source: AKy350Y2U0dgGwrPTwBB5Jgq8qLRVpEH7+smPCxiK1hop12hSkAyhsBX5i0qbVARF5sKL2C+fHU+5A==
X-Received: by 2002:a17:906:b206:b0:932:5f7d:db33 with SMTP id p6-20020a170906b20600b009325f7ddb33mr128737ejz.34.1680813162311;
        Thu, 06 Apr 2023 13:32:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 37/68] hwmon: max31760: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:32 +0200
Message-Id: <20230406203103.3011503-38-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/max31760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 06d5f39dc33d..4489110f109c 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -318,7 +318,7 @@ static int max31760_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static const struct hwmon_channel_info *max31760_info[] = {
+static const struct hwmon_channel_info * const max31760_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-- 
2.34.1

