Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6446AC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 14:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244143AbiEPODu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 10:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244069AbiEPODt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 10:03:49 -0400
Received: from smtp11.infineon.com (smtp11.infineon.com [IPv6:2a00:18f0:1e00:4::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8935A3A70E;
        Mon, 16 May 2022 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1652709827; x=1684245827;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=636FGaXaQXwgfi1XFO/H9eecxAz+PzvmLT0pqxtsHVg=;
  b=e/9VMzk5VmaVJziSA0cH430BN/eltZkhVsmB2IUqt1U+qxCHTNWq0YOu
   EFbCNIVfkNOmeMs+mW+Jw7hkI+MfBymv+PrnFGC8dgCNbsG2bz4SRRTq3
   gVXpgGsmHGqzesmaIKuTNVmVzdJtcVaP0TnGnoLmZ0xJIQoLPKQIXXMKG
   M=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="295016285"
X-IronPort-AV: E=Sophos;i="5.91,230,1647298800"; 
   d="scan'208";a="295016285"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 16:03:44 +0200
Received: from MUCSE812.infineon.com (MUCSE812.infineon.com [172.23.29.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv002.muc.infineon.com (Postfix) with ESMTPS;
        Mon, 16 May 2022 16:03:44 +0200 (CEST)
Received: from MUCSE816.infineon.com (172.23.29.42) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 16 May
 2022 16:03:44 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE816.infineon.com
 (172.23.29.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 16 May
 2022 16:03:43 +0200
Received: from MUCSE820.infineon.com ([172.23.29.46]) by MUCSE820.infineon.com
 ([172.23.29.46]) with mapi id 15.02.0986.022; Mon, 16 May 2022 16:03:43 +0200
From:   <Greg.Schwendimann@infineon.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Topic: [PATCH v5 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Index: AdhpLYgADYGwpyOnQaWeHDYnP9drqg==
Date:   Mon, 16 May 2022 14:03:43 +0000
Message-ID: <1a600fd51db942389a5078a72c3bf411@infineon.com>
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
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Docum=
entation/devicetree/bindings/trivial-devices.yaml
index 550a2e5c9e05..c11520347a9d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -143,6 +143,10 @@ properties:
           - infineon,xdpe12254
             # Infineon Multi-phase Digital VR Controller xdpe12284
           - infineon,xdpe12284
+            # Infineon Multi-phase Digital VR Controller xdpe15284
+          - infineon,xdpe15284
+            # Infineon Multi-phase Digital VR Controller xdpe152c4
+          - infineon,xdpe152c4
             # Injoinic IP5108 2.0A Power Bank IC with I2C
           - injoinic,ip5108
             # Injoinic IP5109 2.1A Power Bank IC with I2C
--=20
2.25.1

