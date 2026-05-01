Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63639395D84;
	Fri,  1 May 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777637179; cv=none; b=PIrOXC9m8xHFLv1Oc1rNWLc+YZ3IpNTWDemPPO2clMihTgUIOhJNfnZBpD0RxLyuTWggFawmtwsjpuZptVMscRP1ar91P1W5DCDXuQM4Vw9gTvk5IxRzC6CZaXqj01CpaYUyaQaH1J9hiHOuQCDNt4KIqpM53HKxCbt9wDcoYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777637179; c=relaxed/simple;
	bh=lI+P8t893kET5s8oimG+EsPvh1OhUdcFqu8SrNU87YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIDGZx+HdIdo0h8nwgxsjFQJ1/xJC6rCnQay2aNK6H+GtHQGCZH5ohZhlahuAyy5Z9hvxVFcGut6fB/lwQyA+fGB59VslvQjsJr+jrFtL/MZqgHk/pO6wFxSKcbw2X47aj/gDe63YrHxkOYWp0L4YR7FYupgVQ1JgofhaAGHpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=IV5wupES; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="IV5wupES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777637133; x=1778241933;
	i=markus.stockhausen@gmx.de;
	bh=5jOIKkNEJFZ1UD7x4jlemtaEhYeDzWIQPTnfD4PdY10=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IV5wupES4MegqsJ/yrKgo0BSgEdcFyFE2ob3wxxD0mwXp9vOhui/46ya20sA5ref
	 Iy1Yujm5VRKc8+uWgNzS4Nn5r6ARcL9VYUe5bhKpZwZRNZ1ufovq7Vg9weUgI+3Tw
	 hZaztZmz3PIPYOYMYO22ZS2AvSImcfxTBgCAprSoBMUz7kVHRlM00GvWH5PTQrmXd
	 zXgQHWUB6xynk1X3u7Yimncz3H3cwP6tIBlbuudODbBNrhemjHJVBlKysO+V5AlKE
	 LMc7qlgtw5RMOxA5GdyaXNggyg8UZdGj14kJZzROfgcljnoDapCkaqetS4EwC7Qa8
	 dosqpftM/ErZhlPb+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1vzrnT43pL-00SjQa; Fri, 01
 May 2026 14:05:33 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 1/2] dt-bindings: hwmon: lm75: Add lm75,alert-polarity-active-high property
Date: Fri,  1 May 2026 14:05:17 +0200
Message-ID: <20260501120518.3085501-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n7NWy7Qrfxoi6eNsui3SIjzp6JHqJOD6Okznm9xW4QPkWvNq2MP
 KIeLuH3sATzXlphFSs1exGNpH+SS16+aa54qoCEoOwbpE8eo7PogIcRSxLjUwg+BD1K0kVB
 BDh5TAfz1PobY/bVDtmKNggtOiQ4cIfyJoeERnzC+RweI2DPtxRxbR2DZJWc+cILcnYlejq
 W926finoRm4L+XtFLqjwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xwbkUWqRDig=;k79Q/VQE2c9YMFTbUhfLPA2ZDc1
 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
 X5dBMIgxRHzM8fw==

The LM75 alert pin is asserted based on the value of alert polarity bit of
the configuration register. The device/driver default is 0 which means ale=
rt
pin is configured to be active-low. A value of 1 maps to inverted (active-=
high).

Add an optional boolean property "lm75,alert-polarity-active-high" to
override the alert pin polarity. When absent, the default active-low
polarity is kept.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documenta=
tion/devicetree/bindings/hwmon/lm75.yaml
index 0b9fda81e3ec..173751a726f3 100644
=2D-- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -54,6 +54,13 @@ properties:
   interrupts:
     maxItems: 1
=20
+  lm75,alert-polarity-active-high:
+    description: Alert pin is asserted based on the value of alert polari=
ty
+      bit of configuration register. Default value is normal (0 which map=
s to
+      active-low). The other value is inverted (1 which maps to active-hi=
gh).
+      Specify this property to set the alert polarity to active-high.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
=2D-=20
2.54.0

