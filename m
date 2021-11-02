Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9CEC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 05:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFFCF61051
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 05:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhKBFa7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Nov 2021 01:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhKBFa5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Nov 2021 01:30:57 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E82C061714
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Nov 2021 22:28:22 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id f5so19112629pgc.12
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Nov 2021 22:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=lJnV+kITEwNEZxgW0EEwkSDW1MfbZOcjYoFW6kKKYcY=;
        b=NK3AXJ9sUzOeFZfFNuCSHsmgcdy5famNh4IOfV6dhZgSoUIpg/TuKxSy7ZTYJ4U4qO
         IebE1+JsyfP0bYZgtagN/MelZcQVHSQKmaeq5aCRBY1V6j1uO3sHLRTvcV4e+y37uf+z
         hoRuOym/BqkyB7GQLiEvjT+ZO+CMxR5sMjWbItd3lQPd87dMjdq6JH5x4hucyNE+bwKx
         LOEBT4XRMdTOAFh/2HaB3oMNPoNiESg/DIPZrxQZEJxITE18nJkXNLK5ymxZR++nZ98f
         271jN5J0N+Fyh2wmq4TwusK0JmWLh49ByveFULqBPkyescoMNno6cTTY+eQYil41O3M9
         NWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=lJnV+kITEwNEZxgW0EEwkSDW1MfbZOcjYoFW6kKKYcY=;
        b=eronPtmY7ry22kfz7Ug23rBSEAVUsdy+4j69JX49/xWPVYBW1SYqPGYxhY2RHnUExi
         8ZkqVb2seLXHqH61y/HhjmbEitZbn1Lr0YuzmlN1Yv88bjFLeaep1NlwDUQK4NSH2T3D
         jughVmThA+8b0xDnLqf7y6HlaphfEG6DIpDt6wlY9up+Tz5z3L+SlPaCBXbgYDih7P+A
         sjJ321dxPW2fV4/C9836BDj54gDK0BtVO09PQH1K3DrInduJMD0G8OTxeXaamh/geMqy
         GRX8SnQl3ZNB/981aU5pi2Phf20DTNatrfa1V8IUiJe8heh1G2Sp0u3Ro8xz0Wzp2vaY
         h6XA==
X-Gm-Message-State: AOAM5334IIHUzbX5a7kSjoPFKDshMvAhABAJzVA4wmmJDnhm3VWDKNqH
        yzI5Wq8jJF61F/OvRWUsxO389g==
X-Google-Smtp-Source: ABdhPJy06dW+UZGRFNKjWP1TfKaeRYJreAi0Y/kXtrqrJJd8UVUeVYdEolF2DcqQvkJFgp+4ppjzvg==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr17864964pgh.199.1635830902444;
        Mon, 01 Nov 2021 22:28:22 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id mp16sm1109758pjb.1.2021.11.01.22.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 22:28:22 -0700 (PDT)
Date:   Tue, 02 Nov 2021 05:27:54 +0000
Message-Id: <20211102052754.817220-2-nathan@nathanrossi.com>
In-Reply-To: <20211102052754.817220-0-nathan@nathanrossi.com>
References: <20211102052754.817220-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: hwmon: ti,ina2xx: Add ti,shunt-gain property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Add a property to the binding to define the selected shunt voltage gain.
This specifies the range and accuracy that applies to the shunt circuit.
This property only applies to devices that have a selectable shunt
voltage range via PGA or ADCRANGE register configuration.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
Changes in v2:
- Added binding for shunt-gain

Changes in v3:
- Fix schema error, setting $ref to uint32
- Improve the description to detail exactly how to define the property
  and how the property affects initial device configuration and
  calculation of values
---
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 180573f26c..47af97bb4c 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -36,6 +36,27 @@ properties:
       Shunt resistor value in micro-Ohm.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  ti,shunt-gain:
+    description: |
+      Programmable gain divisor for the shunt voltage accuracy and range. This
+      property only applies to devices that have configurable PGA/ADCRANGE. The
+      gain value is used configure the gain and to convert the shunt voltage,
+      current and power register values when reading measurements from the
+      device.
+
+      For devices that have a configurable PGA (e.g. INA209, INA219, INA220),
+      the gain value maps directly with the PG bits of the config register.
+
+      For devices that have ADCRANGE configuration (e.g. INA238) a shunt-gain
+      value of 1 maps to ADCRANGE=1 where no gain divisor is applied to the
+      shunt voltage, and a value of 4 maps to ADCRANGE=0 such that a wider
+      voltage range is used.
+
+      The default value is device dependent, and is defined by the reset value
+      of PGA/ADCRANGE in the respective configuration registers.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+
 required:
   - compatible
   - reg
---
2.33.0
