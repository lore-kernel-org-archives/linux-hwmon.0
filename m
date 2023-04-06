Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606E0C77B6F
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbjDFUbr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239384AbjDFUbf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:31:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1AD9ED1
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:31:30 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id g18so4211256ejj.5
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4v5eQ6uNtmwpFMgRe8EaIBJb4MZtfu8baTOThAbc48=;
        b=mZkZh2ihElAmXpc+gvjW4iyD3G81bS1xcX04W3p0yGmEl952kZ2/BbZgOSgXRno2bu
         LbMW/sOWeNFx7qYlS/RztN3Yy1WPTkHmt+hy8oQk1S3Baf38fEh//h6KtNqfzb2auHaf
         2i6k50L8ETVq26xxcqZcWiy5dD+bCuG96xUCuMF2mbOmTareYO0GEtyq7RP0G9auMukK
         Mt4nPxyBGmLPCXYSVf0Ioa/IkDR/NGu3KeRuYr9Inc51Z+2zSfr/q4Btkp8buGWHEJYP
         aDtJcUQ5X6zyKD70mz49SiphGZhB6Fa6OYtNUhxYEHpjbeEsEj+X2oUdxGYXHSsiCZ8x
         1dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4v5eQ6uNtmwpFMgRe8EaIBJb4MZtfu8baTOThAbc48=;
        b=NDBBHRuNVlRawOY+/kFvXsKLB4rvI1kgvqf4dUWTvThYYO1XOc2kwSExk4vY6Bm7SO
         3nzCOiSFNU6WGNaLoS+hxoLhY2JB487HuqSDtGo4AvDT3Gvm7TIsQlXs/Z/HfZcdjKF9
         Jf1sKFYwt2yeS6Ik9AC/pLXOnJjytBMQwHpFlnG1bGg10tCyRwSmXQDT4hIuhGQN6OfW
         3kI9TlzWwbAKirWaIE+0dcwOdSgqlRGSEkBx85t2U6frPmRY5xLp6P3KMtKMgoI9tLav
         w9Pkch/pMehmL24/pNcLDmuMk0zYN41Nxrf7F1MYCAiS51iYPx4xHdRlVScgplTl11Oi
         CqcQ==
X-Gm-Message-State: AAQBX9cWaLmMbz6ExJPbNWMJY+uEOSe2R1Xj043Z2FxkumUsMRlzWaiE
        3bIRnk9lG6nfTweo3ELrZigVwA==
X-Google-Smtp-Source: AKy350Yudjg1cQz744cj4XdN94KceoalOMB5GdOd9sJA+cB9OFNaDOxgIsWxQXir9sQGWZ45/o8++w==
X-Received: by 2002:a17:906:2414:b0:931:42d2:a77f with SMTP id z20-20020a170906241400b0093142d2a77fmr221247eja.15.1680813088528;
        Thu, 06 Apr 2023 13:31:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:31:28 -0700 (PDT)
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
Subject: [PATCH 06/68] hwmon: adt7x10: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:01 +0200
Message-Id: <20230406203103.3011503-7-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/adt7x10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index da67734edafd..6701920de17f 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -309,7 +309,7 @@ static int adt7x10_write(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static const struct hwmon_channel_info *adt7x10_info[] = {
+static const struct hwmon_channel_info * const adt7x10_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
 			   HWMON_T_CRIT | HWMON_T_MAX_HYST | HWMON_T_MIN_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
-- 
2.34.1

