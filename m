Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A26C76196
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240168AbjDFUew (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240071AbjDFUeS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:34:18 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1E4C652
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:32:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j22so4227548ejv.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ9T/kpTs3+G1fhFIIx9oKlSAleOFgKL5NAv0H+g2QE=;
        b=LaBtgceZE8cV6EyJxI34ydQeqmL2JrBiiWsn3ljlZadN0XYLm7dNSfZ8T2h7UC7VSY
         R9iZRsxoetgZjnylmORQEdDnSHn343WSLF4dOBaoqkVgRW6dtZ2faaea4Kt8geQPfDek
         /EwK30ybidaDD/kGorrww59rn3A2FTkEbUot+QlP7YzQtM2UpQAcJVut2PtnALeUklta
         dTsI92V3Uimpw1MV1wMDiPWs61lB7jEYVWygbgNBDtVSGxMsK2MZlztYUo+PXECn4IL/
         Ku6OIg7VNoAvLLvyl1xcyz4St3iUxms9yT4uLNi7quHCHlt+jC8Gqr+654B8kSikeLAP
         FzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZ9T/kpTs3+G1fhFIIx9oKlSAleOFgKL5NAv0H+g2QE=;
        b=syYY/C+LM5LWTExCO1cJ3XZzBXDJBYUrVkMN2poHKjHsuD0WE7aFDl1bSnZsfuZl1L
         DQ+ivNZau4bLvaIOdE75D0PM6Hwcw4QThmw/qmG2ozSQ4Tlsq59me9u3sCqTGWZtKqY0
         alLuSsvUMteOtTSv85D9k8vns8uKV2MAr3BQpfpg6pD2d2N7FCJykT2dUH61NwfaNT/n
         v6ST/pMVm5qjS4hNom7r7DPaAznq2CbCtDB2ld6lIUQSGXdJRxy5RDKXLumdOxM2aBnP
         5rWayYbhpwZrq6UBcDHyWEeu6Q2g43GJsrG+4YRik7HmhmWd4+jwnMpsiuWtc+hByn6f
         I2ug==
X-Gm-Message-State: AAQBX9ciBX2F485pKVPWiV3WKz/qHcSrKdT9C/+w5di2LguY6/Yyannw
        KJC/Yno9khL/Y1lh5awWPvyIjA==
X-Google-Smtp-Source: AKy350bzSrWUeiQT+mO4fswYuEyv5WnNzuhH3RCOB7Fm42Z4puqXwvSFTWLi8fBKTQEgfQDSFBEQfw==
X-Received: by 2002:a17:906:c9d7:b0:933:1b05:8851 with SMTP id hk23-20020a170906c9d700b009331b058851mr170737ejb.16.1680813157439;
        Thu, 06 Apr 2023 13:32:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:36 -0700 (PDT)
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
Subject: [PATCH 35/68] hwmon: max127: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:30 +0200
Message-Id: <20230406203103.3011503-36-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
index 0e21e7e6bbd2..49de1d2be294 100644
--- a/drivers/hwmon/max127.c
+++ b/drivers/hwmon/max127.c
@@ -285,7 +285,7 @@ static const struct hwmon_ops max127_hwmon_ops = {
 	.write = max127_write,
 };
 
-static const struct hwmon_channel_info *max127_info[] = {
+static const struct hwmon_channel_info * const max127_info[] = {
 	HWMON_CHANNEL_INFO(in,
 			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
 			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
-- 
2.34.1

