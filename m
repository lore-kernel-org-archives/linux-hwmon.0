Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F43DC7618D
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239904AbjDFUdy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239905AbjDFUdR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:33:17 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314DDBDFB
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:32:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g18so4216468ejx.7
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC4Ho9XQ3A1dG1FAYoaY4HIO2BIpL4alO+9K6+BTsgs=;
        b=kDGvTw0hmJmsnDrCz4hIVuZXLdBm39eCoSAUCsNnQg/ef7BuVqZJOAJLxaorLP1g5c
         FqP8AFOG5V4h57aeO1SH1OG0iRNKG/UwpwU+zxenNLmvjc3bbsyIJRuUjYd4UPPqALkx
         +es0NaQxAxlg+LntBNBgolGWFOjQjRrxoEJ6DyiPRhzz7igCAAhdknQFcufPtMs/QPAC
         85DB88Vwi+1FqQLJK7MixKZvY87hBymdrF36NXftIt7B+AZH0E9KzxEscKCehOGtfaPi
         1veKJgR6762YXAHvIbES1oqlPZuUZDuNPxoTpsb/LOeHGTyS9klp9q4Y0sVnMh2QxHCG
         4eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC4Ho9XQ3A1dG1FAYoaY4HIO2BIpL4alO+9K6+BTsgs=;
        b=xRwAoVSQrPWkxhNNKd+3OnNKw42cOuyKClwzjMX9l6CDZAkhp+gLkAg6w5TpcSauci
         PhpiusQDctYXGjr/naZNxYKOdDnCK5N9/cSWJyR9OC276Qbu7O/zvgqS+lv9zd5o/pLK
         3EiDkPsfOyO5/OfyKx7XQZmPF7a3UWIB3vOLxPkDXRz5tNVNIoBL2iDsFXKjybR4RHsa
         gB5bY1Jj/ePIzhYjYz9OdpA7JG9eKdf7xmTgRp/sBWJ4tF9bVJasLLh9uzEdGaKXY7kM
         MWxz+6T6A2V+ygegjGVzj4z2gA7U3MDwUX9Dym0BRmycUSWIPCSdG7wwY5gBoZzzhFd2
         fd+A==
X-Gm-Message-State: AAQBX9dKK1WOwRA5Oyw333muaQwqHLNlpvjAZgNuiPPfSzklC20w0Bdj
        0vDtp90sNXggG7rrnG5T5InIxg==
X-Google-Smtp-Source: AKy350aHb3PgCA9WvGm/QYvu5iU4JMu9zHtbpU+PZbRoKdnmqSGADefm7bmbUEKuKYu8clGcXbSX6A==
X-Received: by 2002:a17:906:605:b0:889:58bd:86f1 with SMTP id s5-20020a170906060500b0088958bd86f1mr182249ejb.14.1680813135402;
        Thu, 06 Apr 2023 13:32:15 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:15 -0700 (PDT)
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
Subject: [PATCH 26/68] hwmon: lm75: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:21 +0200
Message-Id: <20230406203103.3011503-27-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index bcc3adcb3af1..dbb99ea4a0ec 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -512,7 +512,7 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static const struct hwmon_channel_info *lm75_info[] = {
+static const struct hwmon_channel_info * const lm75_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

