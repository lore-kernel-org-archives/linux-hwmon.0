Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFF7C7618D
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239611AbjDFUcT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239490AbjDFUb5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:31:57 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360338A7D
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:31:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id sg7so4211428ejc.9
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMh9pMv1c2N5CZKj6o4hVDzOl36SVdvTrKYi4l5Ys4M=;
        b=bpvK+tpA6trKtvJrV4DZCtbwNaI1kDImEVeVQL637eqQHty8z4Qq9fSRbGNcHRWRG/
         FPMf9aY2qxiCS6r+3ssc+K9dV71SFj0TYCnZ2GHj5F16M/z752xuBwB8YxPNXqAuuARn
         TZrkjmRJ/rQCutKuBNz2TU/i/xu064lmxWLYCKcWS54oyvpm2JboWOLAXeyI8hy8SoVK
         pjZ3tPar2gZ6Gfrpr+nUYGX2MDmRbgg2z/AKPjwETZd3VjfaMa47TfTd9QpVeKAgh4c7
         D91heJ9XLjTA52/d2UQYgc+iTqtGkcUYCtjf6kKM9ouXIhYev1rb5rlvfNp/wprEAqHK
         ip/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMh9pMv1c2N5CZKj6o4hVDzOl36SVdvTrKYi4l5Ys4M=;
        b=qgFxB2XryK6BFGuGQULtIVAdQ4EPFjJezJnBq49fVVF4uUD3pD6gDJ3U93RDT3hz2Q
         KiKSnfW8QOuOMRTzC7xQgDaRZxDdsJzqr6r7jwp/rG0+UY5BRW8sBYtD+qPt2fahsobX
         SfmQs0uTQJHIE+B4Ob49CXd/d/lgVFPp29g6X5dbF/UDSl2ivQIPGZRB79m4Ssh52iWG
         rzMsHSe1B3GWtdaZ6ShWK0a/cwcAyMWAZ7zTb46cJDsPTu2AOvVaS1Pi9hxOxZHRsbtJ
         iIK9IW/EL4k+nido9o+nDJowL5YCMo+7hO6suKqUbUNuZD2pU0CN5S7J39j/nNeqWA7r
         ArMA==
X-Gm-Message-State: AAQBX9eOf08fr9LEEfeWIDBhVb6YvRWxrBnWU2cdTaJv2g6ElF/jc23E
        QToLmAib9bQzdFnWC2c16pa8dQ==
X-Google-Smtp-Source: AKy350Yud0CdyQeRWD/f32T/icmKifXpYmvMz9y9aU59vYOZT5+tyTqiYLMimp0uRkG+9Xvbh1C6OQ==
X-Received: by 2002:a17:906:24d7:b0:932:2874:cc5 with SMTP id f23-20020a17090624d700b0093228740cc5mr235929ejb.16.1680813099901;
        Thu, 06 Apr 2023 13:31:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:31:39 -0700 (PDT)
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
Subject: [PATCH 11/68] hwmon: bt1-pvt: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:06 +0200
Message-Id: <20230406203103.3011503-12-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/bt1-pvt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 21ab172774ec..8d402a627306 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -379,7 +379,7 @@ static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 	return 0;
 }
 
-static const struct hwmon_channel_info *pvt_channel_info[] = {
+static const struct hwmon_channel_info * const pvt_channel_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
@@ -523,7 +523,7 @@ static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 	return -EOPNOTSUPP;
 }
 
-static const struct hwmon_channel_info *pvt_channel_info[] = {
+static const struct hwmon_channel_info * const pvt_channel_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

