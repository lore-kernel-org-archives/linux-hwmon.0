Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDA3C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 16:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244990AbiHIQ2B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 12:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244596AbiHIQ2A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 12:28:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EA111C3E
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 09:27:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x19so9436087lfq.7
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AR+nnS9UZD6P2Hs8ZDImw5TD7p9NQC+KnqHa3zocRvk=;
        b=scwhCRJP2cX92hQGoRkNYm1CP1o41FrEej53GLl6u8y5tLL91RoPRZ7d6703rgd6z4
         y4xGg04FcmAIUHsFZQoz3WCYKNxzaLl/PR8KdfKG3pssC1Ay0wa0QlWGw/CoiJHSId30
         hd2EyCkjzIer0sV5O8xkfFRvGUJS2udkZLP+LgpUOsffdh6Ohnu9uFOfrWIMHTe8lNIt
         DcZEoqWOYX3F4kMr76HXbsT2Moht6G1fCn39Xyon/Lq04771JDKk12dmYO1wKfeq7bEo
         IAX75aMK5gnpn0hTmsCJekxKFQfTF8tAtJGgWwg6FDMsH6NiNiY5SGBvidLvPPdbFP1v
         gydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AR+nnS9UZD6P2Hs8ZDImw5TD7p9NQC+KnqHa3zocRvk=;
        b=tvm82kB7J0yYqlSm4GUfkeTLu3nR8k07tUjDRMltJ/gWDnERjXjCuehAkU3MQzSaUB
         VUYWAkU0VLB09D8YoFB2SXdS74cYMGywq4SlRmAUMzboAeFcO3F+XDjY/MwM6QMPuDr0
         ymo6q2JwKcz67xG4q5OE3GOycf5ZttukXvIZ4ggTbmxWPIGmTEl8Dg8POUXHCQVPVerL
         ewDs5X0pQsjlXFg8xOSomSNMYzMfgfz7qwGJi538ga9GqeWV7LLXhqJT5rBE7dSNcgv7
         smXU4X7hJxTN/jiDzcVgEKaDzRUYvcC+yGXLgNv7NKldp/BNugzEUweeCnhNVm07lffR
         G2Qg==
X-Gm-Message-State: ACgBeo139/aGsN8zmVz444ymtNFUCdlzesjNUREDnHuFmO+LwJxlniFc
        Pvq5RKmWK2L/xeMBSnwRHACWAQ==
X-Google-Smtp-Source: AA6agR5TRVjeZwahd7WkFhqyuhqfwiPBYep94z8LyDAT7HAxO3MZrTjHFZMuFjki+w1nYUDsee4f8A==
X-Received: by 2002:a05:6512:2a8d:b0:48b:7f1:fe46 with SMTP id dt13-20020a0565122a8d00b0048b07f1fe46mr7624887lfb.261.1660062476861;
        Tue, 09 Aug 2022 09:27:56 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:27:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Andrew Davis <afd@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few stale maintainers cleanup
Date:   Tue,  9 Aug 2022 19:27:47 +0300
Message-Id: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Changes since v1
================
1. Patch #5: Drop also Ricardo Rivera-Matos and assign TI bindings to Andrew Davis
2. Add acks.

A question
==========

Several of the bindings here had only one maintainer and history does not
always point to a new one (although I did not perform extensive digging). I
added subsystem maintainer, because dtschema requires an entry with valid email address.

This is not the best choice as simply subsystem maintainer might not have the
actual device (or its datasheets or any interest in it).

Maybe we could add some "orphaned" entry in such case?

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: iio: Drop Joachim Eastwood
  dt-bindings: iio: Drop Bogdan Pricop
  dt-bindings: Drop Beniamin Bia and Stefan Popa
  dt-bindings: Drop Robert Jones
  dt-bindings: Drop Dan Murphy and Ricardo Rivera-Matos

 Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 1 -
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml    | 2 +-
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml      | 3 +--
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml   | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml    | 2 +-
 .../devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml        | 1 -
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml    | 2 +-
 .../devicetree/bindings/leds/leds-class-multicolor.yaml        | 2 +-
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml        | 2 +-
 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml       | 1 -
 Documentation/devicetree/bindings/net/ti,dp83822.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83867.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83869.yaml          | 2 +-
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml    | 3 +--
 Documentation/devicetree/bindings/power/supply/bq256xx.yaml    | 2 +-
 Documentation/devicetree/bindings/power/supply/bq25980.yaml    | 3 +--
 Documentation/devicetree/bindings/sound/tas2562.yaml           | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml     | 2 +-
 20 files changed, 16 insertions(+), 23 deletions(-)

-- 
2.34.1

