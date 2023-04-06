Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C4BC7618D
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239150AbjDFUbZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbjDFUbV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:31:21 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D904C3C
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:31:20 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id by26so4204873ejb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sIWqsMomKx2PnPBWMVAcd7l87EB+JZ4zJtWBb4tmtA=;
        b=QiBjZo+smpaLDZPnZQ79Z/dEAr4MqaFcZVqqqialTjCXWVvpLK1kIifHK2HcJ4B3N7
         +VLEpX1SSwbzuzq6H3Rf+w5o/msSwZvE0mw+kJbt6rQTkz623WyZ1ca+vUy0UrEPwrop
         WaIxfowNxoYjnRYmFKtXGuhqHnASBsfU6CZV0Igr7sejZ92V+4V4QYLKQrMWtrRDlQOP
         lzm5MdIqkJDNdy9ppfSFbNTHyIhXQShGgadcfbODs49sL8uEem8nYlKfIjzTE5c7s9de
         db0FX8r1RpncYzo+w0IY734Uzhvi4pjTjVhTXqamE6hsP6uGZhyEkVVtGdWZci1BVJrv
         1bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sIWqsMomKx2PnPBWMVAcd7l87EB+JZ4zJtWBb4tmtA=;
        b=FiwUP2JgwIIXu4T23q1IYc95I09/bUdqk8TN5LfgftSy4J1Y7O3Zsys7ZEfqMOngHQ
         Znnf58HsKt34Y6Xj7HMYCBYsoIy/vdU7AHfQWyb22q+LwhPv9VQBGTZkszIqeBW0Cbt+
         jo7vpw0XTanHhGtArLMh/KgwVhfwUtSZslpkTOW0Y/mN+ddgZSdq/TBOX3bDX92x3F+T
         d1/hPKHNZXOW+Mwe93gTIN7p4NWzw1kB2NYDC6L5FvvfmHHk4fClmmOWJvIJZhlf4Mei
         5upGvKqFS8VI0cerHPxyi0clFLBFf18PMjXkb2EhLf1ejFbdtRAIQD2cVm0OyEnnUvBA
         npVg==
X-Gm-Message-State: AAQBX9cmxMm/QV1dl5/7s89sicJocDGlNEx+5mtLQo/tRWRKbox2I9ZC
        +S9BhuBsaAyAQMi1ysTegBFLGQ==
X-Google-Smtp-Source: AKy350ZBPO6m6MZm+LGsb3QXB/VIdy6OyRxsTcyuYHJsvXj1X/J1jphOn0rvZiVk7Bg1a2y8pNsePQ==
X-Received: by 2002:a17:906:bc4b:b0:947:55ad:dd00 with SMTP id s11-20020a170906bc4b00b0094755addd00mr147468ejv.26.1680813079290;
        Thu, 06 Apr 2023 13:31:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:31:18 -0700 (PDT)
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
Subject: [PATCH 02/68] hwmon: adm1177: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:29:57 +0200
Message-Id: <20230406203103.3011503-3-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/adm1177.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index be17a26a84f1..bfe070a1b501 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -168,7 +168,7 @@ static umode_t adm1177_is_visible(const void *data,
 	return 0;
 }
 
-static const struct hwmon_channel_info *adm1177_info[] = {
+static const struct hwmon_channel_info * const adm1177_info[] = {
 	HWMON_CHANNEL_INFO(curr,
 			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
 	HWMON_CHANNEL_INFO(in,
-- 
2.34.1

