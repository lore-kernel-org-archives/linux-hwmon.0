Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2565C33CAD
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98B20207E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgAMPJA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 10:09:00 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58671 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728871AbgAMPJA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 10:09:00 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 13 Jan 2020 17:08:54 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 00DF8hqe006851;
        Mon, 13 Jan 2020 17:08:53 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 5/6] dt-bindings: Add TI and Infineon VR Controllers as trivial devices
Date:   Mon, 13 Jan 2020 15:08:40 +0000
Message-Id: <20200113150841.17670-6-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113150841.17670-1-vadimp@mellanox.com>
References: <20200113150841.17670-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add Texas Instruments Dual channel DCAP+ multiphase controllers:
TPS53679, TPS53688, and Infineon Multi-phase Digital VR controllers
XDPE12284, XDPE12254 as trivial devices.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
RFC-v1:
 Changes added by Vadim:
 - Drop others than xdpe12284, xdpe12254 devices, since there is not
   clear confirmation from Infineon regarding availability of the
   others.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 765fd1c170df..dfe22e0a82eb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -104,6 +104,10 @@ properties:
           - infineon,slb9645tt
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Multi-phase Digital VR Controller xdpe12254
+          - infineon,xdpe12254
+            # Infineon Multi-phase Digital VR Controller xdpe12284
+          - infineon,xdpe12284
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
             # Intersil ISL29028 Ambient Light and Proximity Sensor
@@ -354,6 +358,10 @@ properties:
           - ti,tmp103
             # Digital Temperature Sensor
           - ti,tmp275
+            # TI Dual channel DCAP+ multiphase controller TPS53679
+          - ti,tps53679
+            # TI Dual channel DCAP+ multiphase controller TPS53688
+          - ti,tps53688
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
             # i2c trusted platform module (TPM)
-- 
2.11.0

