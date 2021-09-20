Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B39DC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3878661B74
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359525AbhITSZN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:25:13 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51066
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378104AbhITSWv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 14:22:51 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE68040197
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632162083;
        bh=+yYpY0bTQCprkzpDe095FfeHits+DFt9BKBgw/pr/fI=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=onyEwh1fxRTW6x18akBYBr2Dm+kVidRIsThrD1tfkwmK3TTjBtGUrcDyBUrBq9Nno
         qeYwMqEN7H5NkqxHbwAEEqWLmXDUk5qBEKrY1Hfq5WanMeJ/5KjQUhMmhDHyO0sVIO
         vg9mhbmgAR4BV4i6VPwWP8fqtQpeBZIk3HsxIW2eDCfl5X3mEyDVqUBk7UwbsuiJsl
         XSqJVfZSb+UX7xUlVgqZ4bPywvm4mPgP9F3BZejVH37cVkLmabEIcpTkKubGBnwNgI
         quEEYUMI+r710pVmiGKCVt0/rxZ3FH4+sXswZ+JFFLysbVz/KCKf948m13oGY9rWRl
         ZpVktQmEc1Etw==
Received: by mail-wr1-f71.google.com with SMTP id i16-20020adfded0000000b001572ebd528eso6796064wrn.19
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 11:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yYpY0bTQCprkzpDe095FfeHits+DFt9BKBgw/pr/fI=;
        b=4xYEc8f1jnFm1X/mQIBmBN0q1WoKC5mHh2SvTwhZ6Mzh8s7+IGVPEifKrLaapmEHsy
         1/PF4FWNWIhL7HIYx6PALC6YWiwKjTY0Vq8OWbqv3bGiq/3QShFquG1IaDF6os7K2Cby
         SU5rm86rlpFfW8OJQA4d20XexE61tzB5n7NZRSr8ruOSCOH6qQOGQ39WKaL3M4foyKHh
         hu6eMejHf/cyQfiAxvCZarOdVgu4aU+fGAkflIOxcEIczG3zTEZIP0cr74C1bw96kzEG
         KYrHXrZJk0Y0MwR/iwfDnZi2jdN/ArXe67fYlB9RF1aINLFXWsZY440kMwk1FFOxZ/Cf
         2PIA==
X-Gm-Message-State: AOAM532YSg4+bV0Nu7lBEn1SQpjmX5CMT6ferKULzI9kyNuvVKEWclil
        YYrclV99nCNBnV8IlgMM8MrcxLRGKbiikNzLaMax3+mbWMRSCRdxAsYaNcK5MmZgB+jSo5ezi7A
        MK2uBO4bWiRvHbd5HtDxqlpQw0eQrlDM0zNkCW+sa
X-Received: by 2002:adf:f884:: with SMTP id u4mr29322856wrp.411.1632162083540;
        Mon, 20 Sep 2021 11:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3hZvPR1xLQRHEbFwJFMfji+eLy88hIeF1v2xPgZqajAjlE0iGWvbL2fqHTmYlXmC+sI2PjQ==
X-Received: by 2002:adf:f884:: with SMTP id u4mr29322840wrp.411.1632162083396;
        Mon, 20 Sep 2021 11:21:23 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id e5sm10515285wrd.1.2021.09.20.11.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:21:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: hwmon: dps650ab: move to trivial devices
Date:   Mon, 20 Sep 2021 20:21:11 +0200
Message-Id: <20210920182114.339419-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
References: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The dps650ab bindings are trivial, so it can be integrated into trivial
devices bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt  | 11 -----------
 .../devicetree/bindings/trivial-devices.yaml          |  2 ++
 2 files changed, 2 insertions(+), 11 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/dps650ab.txt

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
deleted file mode 100644
index 76780e795899..000000000000
--- a/Documentation/devicetree/bindings/hwmon/dps650ab.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-Bindings for Delta Electronics DPS-650-AB power supply
-
-Required properties:
-- compatible : "delta,dps650ab"
-- reg        : I2C address, one of 0x58, 0x59.
-
-Example:
-	dps650ab@58 {
-		    compatible = "delta,dps650ab";
-		    reg = <0x58>;
-	};
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 1bbfa98a85d8..b1bad299ec66 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -73,6 +73,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+            # Delta Electronics DPS-650-AB power supply
+          - delta,dps650ab
           # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
-- 
2.30.2

