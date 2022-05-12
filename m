Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D192BC43217
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 13:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354370AbiELN0p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 09:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354404AbiELN0n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 09:26:43 -0400
Received: from smtp11.infineon.com (smtp11.infineon.com [IPv6:2a00:18f0:1e00:4::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116294A3DF;
        Thu, 12 May 2022 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1652362003; x=1683898003;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=scQuBtZwAD3ryuQq3jSgTOJJI9J247B/LOMCJ6OFjUY=;
  b=kEchj86xM/iWvQx8zhS0tSk/QcLjWLVnkwaz9sW0vwNoDzkDgCUE0KwZ
   xHRKFB4/yiH9f5UwQOFFyfeaIHEfZd6QG+ZtGW+Eyiy7tVVHJkII5z2/9
   zkBYOIQmo9T3GwOa+YEbhVRdwRpzmv9FtqyFX3myXS7wuBk1GKmRVY1ss
   Q=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="294335229"
X-IronPort-AV: E=Sophos;i="5.91,219,1647298800"; 
   d="scan'208";a="294335229"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 15:26:40 +0200
Received: from MUCSE819.infineon.com (MUCSE819.infineon.com [172.23.29.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv002.muc.infineon.com (Postfix) with ESMTPS;
        Thu, 12 May 2022 15:26:40 +0200 (CEST)
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 15:26:39 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 15:26:39 +0200
Received: from MUCSE820.infineon.com ([172.23.29.46]) by MUCSE820.infineon.com
 ([172.23.29.46]) with mapi id 15.02.0986.022; Thu, 12 May 2022 15:26:39 +0200
From:   <Greg.Schwendimann@infineon.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Topic: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Thread-Index: AdhmAatZX66DKqDsT+mZz8c2P2pFMw==
Date:   Thu, 12 May 2022 13:26:39 +0000
Message-ID: <052c9885e92243fb99ada46e6a263c09@infineon.com>
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

