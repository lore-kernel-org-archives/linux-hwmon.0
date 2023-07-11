Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26386EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 14:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbjGKOG4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 10:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbjGKOGz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 10:06:55 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B5010C7
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:06:53 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-98de21518fbso747229066b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689084411; x=1691676411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N965r1LiRlzqpIPkWrXRkG/YYqy4C5xJjhawubMWy6Y=;
        b=rONPtswhqguHo0lBu+m67uFyBW+yErTLl//B/XKK65t69avobTfAQm7OFUWB49ub5/
         NAfi+0RDU6nxqOsVj6lWOCJd9fe22XgVEOQqPmnDlAAPOE8GhmPqkIrJAxkgfCMD1lX6
         EsCYspexcO0en2ZNk+3faJtxSaCtWVrgRGeCIobtAdtGoaM/04Zj6VUht+ICoPvdS9Lp
         nHTfUMKlW8MjLXGx8mmDJsP8ZEP5jDGu4g7LgvUUIFuH454CqR6jROzlBckNYQCOBMUu
         O7u9Sd+1iFbMxSdwH1l5/VnYcFi1443P/EwtbfZ/XmMXLHH8U9zt2gmgZSWkpEnEg5ka
         rZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084411; x=1691676411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N965r1LiRlzqpIPkWrXRkG/YYqy4C5xJjhawubMWy6Y=;
        b=ivCVPGBmLbCaeqUQyBiqvbeJy5zAcDgIfUoY0lxn/8AuoZkxa7ZtO7D8EVSkY2nxXu
         xUBPmGUA7gAlhbsDw0j6iWNXpYrPrh1X0vcF+5WanN1RXWIoRM/cBaKMEJ0FlUAzcWka
         DRp0OaIfMCVjuYGcfrY5KRSCJp36QhTHoJ9J6BBWqqzIlKWXqygBIg4J7i5uuxY9wMug
         iGhKZFujzQ5Iokz+rabBSQc05N3fX4nNYMi5y+t4B0uC1kW2qs31eV7TdnlGoLF10XTV
         8yt5Bekzb2Z8SNISlDELwq0kUo61C+IcFxaqBxThD7f1RXe9+gf8dTyUSXnaOX08EGJf
         NSRA==
X-Gm-Message-State: ABy/qLaJfr/RSCrQFGC9Lygu/LgvC7B6U/nQHQufieXvJEHfX/zeJwwO
        L/K1Wztcn05J7p+NszYrc7XJ3Q+QyoBOOd1Evi0=
X-Google-Smtp-Source: APBJJlHeesCvmcH+pQzDCub48ATKfTl/efSuBXA3JSTA2YEhzUrCunD5EJ51Qil9yOy2Ve4uszgTWQ==
X-Received: by 2002:a17:906:1ecf:b0:982:30e3:ddcb with SMTP id m15-20020a1709061ecf00b0098230e3ddcbmr12107497ejj.65.1689084411409;
        Tue, 11 Jul 2023 07:06:51 -0700 (PDT)
Received: from ws-565760.systec.local ([212.185.67.148])
        by smtp.gmail.com with ESMTPSA id bi3-20020a170906a24300b0098d2f703408sm1212222ejb.118.2023.07.11.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:06:50 -0700 (PDT)
From:   Andre Werner <werneazc@gmail.com>
X-Google-Original-From: Andre Werner <andre.werner@systec-electronic.com>
To:     jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: [PATCH 2/2] dt-bindings: hwmon: Add description for new hwmon driver hs300x
Date:   Tue, 11 Jul 2023 16:06:37 +0200
Message-ID: <20230711140637.4909-2-andre.werner@systec-electronic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711140637.4909-1-andre.werner@systec-electronic.com>
References: <20230711140637.4909-1-andre.werner@systec-electronic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the initial description.

Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
---
 .../devicetree/bindings/hwmon/hs300x.yaml     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/hs300x.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/hs300x.yaml b/Documentation/devicetree/bindings/hwmon/hs300x.yaml
new file mode 100644
index 000000000000..7a9b3ee3738b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/hs300x.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/hs300x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas HS300x humidity and temperature sensor
+
+maintainers:
+  - Andre Werner (andre.werner@systec-electronic.com)
+
+description: |
+  This driver implements support for the Renesas HS300x chips, a humidity
+  and temperature family. Temperature is measured in degrees celsius, relative
+  humidity is expressed as a percentage. In the sysfs interface, all values are
+  scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+
+  The device communicates with the I2C protocol. Sensors can have the I2C
+  address 0x44 by default.
+
+  The driver does not support the sensor's configuration possibilities.
+
+  The driver is able to be read out using lmsensors.
+
+  Datasheets:
+  https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
+
+
+
+properties:
+  compatible:
+    enum:
+      - hs3001
+      - hs3002
+      - hs3003
+      - hs3004
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          humidity: hs3002@44 {
+              compatible = "hs3002";
+              reg = <0x44>;
+          };
+    };
-- 
2.41.0

