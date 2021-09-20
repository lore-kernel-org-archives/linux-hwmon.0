Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17259C43219
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00F7E61B73
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378512AbhITS0y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:26:54 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51196
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378523AbhITSYv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 14:24:51 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5875A3F32A
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632162089;
        bh=392DGrLNIruEKZ82iDFDDSFrn2e1XRvH9Fknb6uNRpM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Jqk75P3FghYeVCdAPi4EEg0+mmwyEEemFF/NITbzTRWFq20pnViRRnMxFgsE2dIXL
         JAdBye+dnWpLdvDrm7vYGsH5/AR4Z4hZK5rCfFeYrmQudfk6rhJmmj+o2jeRkefg59
         Askak5fAXmlTPYUbBt/5S52UQsAkKYnbLdw9EpzzLH9UZNDGUiUetEzfEV36Z7SloO
         SK4P9OTN9QoQJh9k08hu0MZDvvEYJpmRLFfBo5wcuPrbvS3qZreYBogGhROCd/pwXx
         Yb+Wnvyw7Mg+1yKuQoraflBL8rvGpMklGeRhYqElHBNqTpbwyzfRrJjuTT5SEKvsq7
         hP6U7slqFAKdA==
Received: by mail-wr1-f70.google.com with SMTP id h5-20020a5d6885000000b0015e21e37523so6795623wru.10
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 11:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=392DGrLNIruEKZ82iDFDDSFrn2e1XRvH9Fknb6uNRpM=;
        b=Fjun28IKGhA7hHeXe/+4xWIdyiJaCdLHkMiC+3xcOLORcFP0KF6IzHG/h+JvyVbgCY
         zPdyGIy2SCmmlYYZxZ+u+1CjM7DWwAoLFiqoEBUzhD8m4Fo5xF65qLAdqERhavwK8Fuj
         BR1+FEkIHBCgovR+QOwgmKt6uZir3/F7xDF+dtb919kQnT5ULBC1qw2V+4zrIvNdY9Vz
         nLEiLsqVjkwqapmImqikoDfeZl983oen/AvUXBh2WLExtIhBLvnorR/9ZhSIsDkVpDdr
         wALMAZOb63+XgO7Ye13Jdj1qtuPBVn8vn84AYCGJ+RYorebwcXJreL+Jika5wUF3v0Yf
         hQNQ==
X-Gm-Message-State: AOAM5319iPmgvy1J0M+gGs5XziPYlJzdqKlWRjK/QNnS5fWV/xqM6b7I
        Ts4leyevYL+UE6llw1kK3Ysr3GZemDOrhshYw4KLuqTuecQw1DIotbbOgfL6LOHKHfr3YYMRybu
        DCCCzrwh2vypszdxszK6GnB7OyudQbydJS+1ozpq5
X-Received: by 2002:adf:f48e:: with SMTP id l14mr30940412wro.109.1632162088996;
        Mon, 20 Sep 2021 11:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRMPpAIRUuFY+N/fgxtfYjgdOXqjwE/V3P9AsXXFvbBbsggZfj/+s1dljcDHu9J4kwD+8IWQ==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr30940395wro.109.1632162088862;
        Mon, 20 Sep 2021 11:21:28 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id e5sm10515285wrd.1.2021.09.20.11.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:21:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] dt-bindings: hwmon: jedec,jc42: add nxp,se97b
Date:   Mon, 20 Sep 2021 20:21:14 +0200
Message-Id: <20210920182114.339419-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
References: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document bindings for NXP SE97B, a DDR memory module temperature sensor
with integrated SPD and EEPROM via Atmel's AT24 interface.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
index a7bb4e3a1c46..0e49b3901161 100644
--- a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
+++ b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
@@ -10,6 +10,14 @@ maintainers:
   - Jean Delvare <jdelvare@suse.com>
   - Guenter Roeck <linux@roeck-us.net>
 
+select:
+  properties:
+    compatible:
+      const: jedec,jc-42.4-temp
+
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:
@@ -31,6 +39,7 @@ properties:
               - microchip,mcp98244
               - microchip,mcp9843
               - nxp,se97
+              - nxp,se97b
               - nxp,se98
               - onnn,cat6095
               - onnn,cat34ts02
-- 
2.30.2

