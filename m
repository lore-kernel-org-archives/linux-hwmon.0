Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3EFC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 18:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiD0SzC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 14:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbiD0Sxz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 14:53:55 -0400
Received: from smtp14.infineon.com (smtp14.infineon.com [IPv6:2a00:18f0:1e00:4::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84413D827A
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1651084817; x=1682620817;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Y+29G8uYUBfj4Ivz6hVazGQtot5C+ZCnmy5ECXTC/qk=;
  b=lyT+CFVqQHmHZjshJCGXlFPYBXM9e7h2Rv56p9qXk+M/6MLWH/qDhUzt
   9GPkfU0dWFc27TCVA/YbKP/EyyFZB5acuLXK6lkNLDFRyBNMyNvwo+Tpw
   sdFU8rWPohm3ww6zcJFhZLUcpmEw9GC0vXEJRPeN3wAJgJ1W8pz6EYKG8
   I=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="118491656"
X-IronPort-AV: E=Sophos;i="5.90,293,1643670000"; 
   d="scan'208";a="118491656"
Received: from unknown (HELO mucxv003.muc.infineon.com) ([172.23.11.20])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 20:40:14 +0200
Received: from MUCSE819.infineon.com (MUCSE819.infineon.com [172.23.29.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv003.muc.infineon.com (Postfix) with ESMTPS;
        Wed, 27 Apr 2022 20:40:13 +0200 (CEST)
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 20:40:13 +0200
Received: from MUCSE820.infineon.com ([172.23.29.46]) by MUCSE820.infineon.com
 ([172.23.29.46]) with mapi id 15.02.0986.022; Wed, 27 Apr 2022 20:40:13 +0200
From:   <Greg.Schwendimann@infineon.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <Greg.Schwendimann@infineon.com>
Subject: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Topic: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Index: AdhaZYbAD7zkzN9iSWSk88UI7yJf+w==
Date:   Wed, 27 Apr 2022 18:40:13 +0000
Message-ID: <871b255e183e4468a9affce6defb0292@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.8.247]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Add Infineon Digital Multi-phase xdp152 family controllers.

Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>
---
Separated the device tree bindings documentation

 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Docum=
entation/devicetree/bindings/trivial-devices.yaml
index 550a2e5c9e05..fc2164c4d108 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -143,6 +143,10 @@ properties:
           - infineon,xdpe12254
             # Infineon Multi-phase Digital VR Controller xdpe12284
           - infineon,xdpe12284
+            # Infineon Multi-phase Digital VR Controller xdpe152c4
+          - infineon,xdpe152c4
+            # Infineon Multi-phase Digital VR Controller xdpe15284
+          - infineon,xdpe15284
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
--=20
2.25.1

