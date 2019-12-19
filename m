Return-Path: <SRS0=pEIx=2J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206C0C2D0D2
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAE8B24650
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="0IHvTuoV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfLSDcT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 22:32:19 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57241 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfLSDcT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 22:32:19 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5CB39891AA;
        Thu, 19 Dec 2019 16:32:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576726338;
        bh=QGGuWEOejvib1KsFRFTsduKYUrHgNswonePH3+UT11o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=0IHvTuoVrB772z+i4BADQf2BQ85AQAyJ4wtE2MCsHos+5pWyhPKOQ2H6UWKcpieur
         +jWW28xstDrPCXqka44WRVRxDis6D90WqUl0DJ1pzxker3QI86xnu9KU8uWUNn2842
         ahU0qrECGTot4rC7MysIm4L40ddPvsb0niyqrx3dxA9R8QGCfGUEY2TsLiHRUxC49T
         f58arASHqefut8ka/QElL97zFvRa/9LTB9+61Fw8M6of0d8Ke9UX4Doi4GENq8Xz7Z
         BhDg0IL1m6fr0XQJuVADOlOh18GIJ445etIol/29FPODpN1e+OEaIPxIDWnwddkWZA
         vC1SSiAT2F9TQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dfaef410001>; Thu, 19 Dec 2019 16:32:17 +1300
Received: from logans-dl.ws.atlnz.lc (logans-dl.ws.atlnz.lc [10.33.25.49])
        by smtp (Postfix) with ESMTP id D8CA613EEAF;
        Thu, 19 Dec 2019 16:32:16 +1300 (NZDT)
Received: by logans-dl.ws.atlnz.lc (Postfix, from userid 1820)
        id 30F2EC03C3; Thu, 19 Dec 2019 16:32:18 +1300 (NZDT)
From:   Logan Shaw <logan.shaw@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     logan.shaw@alliedtelesis.co.nz, joshua.scott@alliedtelesis.co.nz,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Date:   Thu, 19 Dec 2019 16:32:13 +1300
Message-Id: <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added a new file documenting the adt7475 devicetree and added the five
new properties to it.

Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
---
---
 .../devicetree/bindings/hwmon/adt7475.txt     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Docume=
ntation/devicetree/bindings/hwmon/adt7475.txt
new file mode 100644
index 000000000000..388dd718a246
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
@@ -0,0 +1,35 @@
+*ADT7475 hwmon sensor.
+
+Required properties:
+- compatible: One of
+	"adi,adt7473"
+	"adi,adt7475"
+	"adi,adt7476"
+	"adi,adt7490"
+
+- reg: I2C address
+
+optional properties:
+
+- bypass-attenuator-all: Configures bypassing all voltage input attenuat=
ors.
+	This is only supported on the ADT7476 and ADT7490, this property does
+	nothing on other chips.
+		property present: Bit set to bypass all voltage input attenuators.
+		property absent: Registers left unchanged.
+
+- bypass-attenuator-inx: Configures bypassing individual voltage input
+	attenuators, where x is an integer from the set {0, 1, 3, 4}. This
+	is only supported on the ADT7476 and ADT7490, this property does nothin=
g
+	on other chips.
+		property present: Bit set to bypass specific voltage input attenuator
+			for voltage input x.
+		property absent: Registers left unchanged.
+
+Example:
+
+hwmon@2e {
+	compatible =3D "adi,adt7475";
+	reg =3D <0x2e>;
+	bypass-attenuator-all;
+	bypass-attenuator-in1;
+};
\ No newline at end of file
--=20
2.23.0

