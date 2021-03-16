Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BD0C4332E
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 20:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C34E864F77
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 20:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhCPUay (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 16:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhCPUar (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 16:30:47 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1048BC06175F
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Mar 2021 13:30:46 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1F90F891AC;
        Wed, 17 Mar 2021 09:30:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615926643;
        bh=pOGq5hgGfCf67z265HD7B4d8xp/11sp5yGd9B2e4SaA=;
        h=From:To:Cc:Subject:Date;
        b=QDbVNr2BEWayIxf0t30Tyua06+W93QlUmlkUqZ+8G2lTHVAXCnrbSAaNjaMW+MuYa
         jm0SO6IRTGmmLbHcZMAFf/uQ4we+kx90C7Z4nB217N70jVzFLAsEmMvsdZXs3F67e3
         PWnUt/HpZP4+rw2XqfLojygzsYVf+yjM6eJ4fioK/F0K36r0vyv/mtCYQFfdiJ1SLi
         bhc6hMi5YvHfO35rAxLO5TfzOi2vn0URyOpqfw1rrJObn7yTihS1AzGKW11pyKIGoj
         hTcIhjitXrWFBzBjzsfLLoTUkw3BSY1uNgF+IjcTRKlE1kPaPSqYyxVMje9z6gRqny
         SiZ7S11XxgpHg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B605115720000>; Wed, 17 Mar 2021 09:30:42 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id D942313EF08;
        Wed, 17 Mar 2021 09:30:56 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id D4831284092; Wed, 17 Mar 2021 09:30:42 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/3] dt-bindings: Add vendor prefix and trivial device for BluTek BPA-RS600
Date:   Wed, 17 Mar 2021 09:30:34 +1300
Message-Id: <20210316203036.17674-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=ueuSTYl9OFj5rdJX3qQA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add vendor prefix "blutek" for BluTek Power.
Add trivial device entry for BPA-RS600.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - None

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..569236e9bed0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -50,6 +50,8 @@ properties:
           - atmel,atsha204a
             # i2c h/w elliptic curve crypto module
           - atmel,atecc508a
+            # BPA-RS600: Power Supply
+          - blutek,bpa-rs600
             # Bosch Sensortec pressure, temperature, humididty and VOC s=
ensor
           - bosch,bme680
             # CM32181: Ambient Light Sensor
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..d9d7226f5dfe 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -169,6 +169,8 @@ patternProperties:
     description: Beckhoff Automation GmbH & Co. KG
   "^bitmain,.*":
     description: Bitmain Technologies
+  "^blutek,.*":
+    description: BluTek Power
   "^boe,.*":
     description: BOE Technology Group Co., Ltd.
   "^bosch,.*":
--=20
2.30.2

