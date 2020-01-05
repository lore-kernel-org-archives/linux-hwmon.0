Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3FEC33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D847222C4
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgAEK6l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 05:58:41 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45663 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726143AbgAEK6l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:41 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:39 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmQ020934;
        Sun, 5 Jan 2020 12:58:39 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 4/5] dt-bindings: Add TI and Infineon VR Controllers as trivial devices
Date:   Sun,  5 Jan 2020 10:58:32 +0000
Message-Id: <20200105105833.30196-5-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200105105833.30196-1-vadimp@mellanox.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add Texas Instruments Dual channel DCAP+ multiphase controllers:
TPS53679, TPS53688, SN1906016 and Infineon Multi-phase Digital VR
controllers XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C, XDPE12250C
as trivial devices.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 765fd1c170df..dbd71d01ede0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -104,6 +104,16 @@ properties:
           - infineon,slb9645tt
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Multi-phase Digital VR Controller xdpe12283c
+          - infineon,xdpe12283c
+            # Infineon Multi-phase Digital VR Controller xdpe12250c
+          - infineon,xdpe12250c
+            # Infineon Multi-phase Digital VR Controller xdpe12254c
+          - infineon,xdpe12254c
+            # Infineon Multi-phase Digital VR Controller xdpe12284c
+          - infineon,xdpe12284c
+            # Infineon Multi-phase Digital VR Controller xdpe12286c
+          - infineon,xdpe12286c
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
             # Intersil ISL29028 Ambient Light and Proximity Sensor
@@ -354,6 +364,12 @@ properties:
           - ti,tmp103
             # Digital Temperature Sensor
           - ti,tmp275
+            # TI Dual channel DCAP+ multiphase controller TPS53679
+          - ti,tps53679
+            # TI Dual channel DCAP+ multiphase controller TPS53688
+          - ti,tps53688
+            # TI Dual channel DCAP+ multiphase controller SN1906016
+          - ti,sn1906016
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
             # i2c trusted platform module (TPM)
-- 
2.11.0

