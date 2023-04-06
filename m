Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AF7C76196
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbjDFUdW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239643AbjDFUcx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:32:53 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4557CAD1F
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:32:07 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id by26so4208692ejb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNHFEWZE2izMo2eONaxZOZH9mOc3OpiNVeO39Ug9Z/c=;
        b=ZoD/OTkABYZ0aA1MRcHeIcK7uDNGCJaLBZMiRQKM5KVhVJxZJFIclNEyGRxL9XRvkS
         cIyw6RpS276Iu+tFnk7f4ww+TNKvOaqa/2Tx2FtZGbAPoDRaGr+Xwa7iqOrf9rklzUZr
         2A29SMrSzU7EjqK5SlV9oQtlSghV1HJQUMJzdLn3i6eXYwdK5bhx/e437w+x+9gc5yhe
         ow2aRQMaGQGFl6Kt6uIKgRJ66jzn6uyKggl+bvEPLFyXNONVWyVPXg+B5o+q59E0pEa5
         4S/Vvfj8AM2V5v50Ot7caixW+ZjzHqCnv57G5IdXvcEVSf94wuQtXLTBN/6je+YKAo2h
         lJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNHFEWZE2izMo2eONaxZOZH9mOc3OpiNVeO39Ug9Z/c=;
        b=SCV6anKxUurt+AoeXQYRAQ+FosYQ3o2pildGKNYNIBilfXSvafvUKhmIEesXHlPkA3
         24JNhsLHbM0Tvd8rdixoB3UMQ8dFqnnoM8NxL5pxt7islbDrFO2M0KP5A7a3u3AG59RY
         2UhEVh4FWCzvC3OR9pdYVWXk4obG9OvWm6tPAc7U8cz3s0UKSQ6mubafa75D5ezZcyRQ
         RugyAExxrlNEytzYRS4YYQi9VWgKib25K2fOkWKJd1rMNVaX3r92sJAdwA+m8FOTy6l0
         D+XUVTJVsVLgqTPnGaPsoSvzGzQhJK20hmKXkZ9TlKn7XoJ8t0zSRVXcNSycr4t140QR
         BlSA==
X-Gm-Message-State: AAQBX9dEv03kQhDgJfHQzEWcYLSPAv3CgHJhsKwfs18bdNCxnOBAJVPV
        c18J1rfDPeyUOlqlrpkvnz5oBQ==
X-Google-Smtp-Source: AKy350ZcgjGKivvgvq+rEQGqcwWvcyLCWLsGzdryLHVXKEQtzAXO3j8S/kYDxAPo+7yEF+TFzQk5Dg==
X-Received: by 2002:a17:907:210f:b0:948:a975:c79c with SMTP id qn15-20020a170907210f00b00948a975c79cmr227039ejb.15.1680813125719;
        Thu, 06 Apr 2023 13:32:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:05 -0700 (PDT)
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
Subject: [PATCH 22/68] hwmon: jc42: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:17 +0200
Message-Id: <20230406203103.3011503-23-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/jc42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 8523bf974310..4c60dc520b12 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -450,7 +450,7 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
 	return -ENODEV;
 }
 
-static const struct hwmon_channel_info *jc42_info[] = {
+static const struct hwmon_channel_info * const jc42_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

