Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D23E0230;
	Mon,  4 May 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907438; cv=none; b=D5Qy1+7JuL2GMP5echrH5qDmb8qdhYQrfK3bYzzgovHpGxT22SPK3KO6ypcQ69/w/gokLz+EOIXOyrqjg9dUSDsJIS4pcPtvlwHWF0ooJ/ld3DRiDFBFJOixk2dhEmwRc0zOhn45QqzPo4ClWX2hSTRqrkK8dXIJvXOHSZRc+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907438; c=relaxed/simple;
	bh=rtfiF8KgeYluU0X4Y1XfIE/Ud7nQ/sxzA47FX9WMzYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwYtdxFpZg1xnSZwGjcMwmgXVRQuPaMi3KRdK+i9GB20oqxLu4c1l8rqpqa+v0jFccF8a2vsI+Qa2OjU8RkgkUl9FlZVQ68zjQSr8qctt/A9QKZArDih5hZlHlogirYrjD3K+2bpJPQvrWQ19cafdphblGek8xV5Fp8COhUJbVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=EWB5Z5Iz; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="EWB5Z5Iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777907431; x=1778512231;
	i=markus.stockhausen@gmx.de;
	bh=GVHzcZOkGYzXkm1uqb8e0FVztRRygLW9iewVIVR5Jjo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EWB5Z5IzCuO86w0dTAjLTUSDzqoX8eJsGYDSqMrZm9fxUs7ae8f+V0s4Os0tHkyN
	 NTaIszxpNnZZGygwRSIbC3a4PgG/Dp08pzz6VO9GQwDOu9aLAEs/niZtbg4K7ESI5
	 FMSCnMnsaOSp2hEIm2WbHlV5EyCRwJoaPI2Q96SM1L51kcipol2kJ9i/4mz82Nnuh
	 X5XsScO6uMsXDGhqRH9nw5xr0pfd0iD0e3KYpPyCjMLogwhC8O1GUQPD8qxubxP4Z
	 ie0brI/l2mVUfgb0yKl9m3mEFGRP6oVLbNdvBFPXs+a0mOQVVLCK6YpzGxKVjdThd
	 7fHjd8lVil12L1DDgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1vgiF23Fh4-00iSu3; Mon, 04
 May 2026 17:10:30 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: lm75: Add ti,alert-polarity-active-high property
Date: Mon,  4 May 2026 17:10:19 +0200
Message-ID: <20260504151020.462342-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504151020.462342-1-markus.stockhausen@gmx.de>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6rtm2H51cQt5qXMP85a9CsIgI+qnZbZt6/wZU6ItDOQ6xGa5L9F
 /c6SMXYSWM7+7f+Ptt21/+AJzirI5+pOMMq4kYqnp630mlvaByqFnDIDTCsAXH7UjpjXyce
 71Rpl+0vB+UwlbIg4fhLK6/BgUYlKjjpif1wBpMPhQzdVNPPtTMowSf4A+3lTkE9owLpH4X
 6X+CbZhcSsTOmTuwDd5/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GWG3ovLP6LY=;Jxfk+zYW8AINr9q4kT9cGyyr3Io
 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
 MmQA4un1ITwFRah5thk6Sk/wkCc=

The LM75 alert pin is asserted based on the value of alert polarity bit of
the configuration register. The device/driver default is 0 which means ale=
rt
pin is configured to be active-low. A value of 1 maps to inverted (active-=
high).

Add an optional boolean property "ti,alert-polarity-active-high" to
override the alert pin polarity. When absent, the default active-low
polarity is kept.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
=2D--
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documenta=
tion/devicetree/bindings/hwmon/lm75.yaml
index 0b9fda81e3ec..b48bf3fd721f 100644
=2D-- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -54,6 +54,13 @@ properties:
   interrupts:
     maxItems: 1
=20
+  ti,alert-polarity-active-high:
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

