Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29731F4634;
	Sat,  2 May 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748662; cv=none; b=trCJ5pe8o+at8GBWktiU5GHACMigPQcS20j2DxIhE3Ra/c62VNPaX5KW95ODErlQuvThY50/Jk7NDBM0oDMSyyIB2xnjrCZ4PWhbMcOU024NH9Pmoo/N9PWEBQuXlfTl+mNgkb9nq/FT29B1/4GOHj9bUWOlA/zVjm1dSlGDMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748662; c=relaxed/simple;
	bh=kNcQnNHbLq0IP8nl0BVpliBdl3nN0cEukD9ADBlCKX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZgnlN7YhYTbVDfG5CRR4mF9kAOBkbYbtEM8HAoXoR54XuoafCDvGOqXAvJQU2cwkUzxl2syBtw0/SmI01ZuH+QDmZPl0vuJCzRiPJnMT3pp5Ke9GxEaPSEjUVguyBJJ5CxWYIFSY59d0xDqM649x5IMVpAxZT8FTi+pzgKMH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=Xi4gGDEC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="Xi4gGDEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777748659; x=1778353459;
	i=markus.stockhausen@gmx.de;
	bh=GyLT3H7HKoqSo2Br8XVU8Fa92JbQNL2ynlASQ3827vw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Xi4gGDECPvE9lo1XG8qCSXe6eWL+mmGzltqDYNSCjI/U8pgww714nfHtRuFL8gTZ
	 TTFbJU+evNH43mtHuzHnkuQvgJponX5LNLAZnfyJgEDq8ViMc2Wg1t76B3a647wpy
	 M1rTImYFr3GkNL0aMZnoPHqg2MZEKFAa7loete0ZYuVgfAQvLf2R0HYLk20lQ2PHb
	 v2DPmuFh/cbbtY18kvatp0i15OObnZI2yfmF5ddj5v1b1NTCk+uHSGnUXyI88ru6w
	 AB/iSwUSgZJ+8KzvVRrw+qZ5KyD0cOYEffFkkwrh0J/QYZcJOrDN5n5b5U15QL/F4
	 Sh4K0pAHMTKEgxaL4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Daq-1wH3m7118i-009qr0; Sat, 02
 May 2026 21:04:19 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: lm75: Add ti,alert-polarity-active-high property
Date: Sat,  2 May 2026 21:04:07 +0200
Message-ID: <20260502190408.3577731-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
References: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:roCwcFMYAHBUHXCcYv9obfsyEPLtSQPmB6WxsXWUf1dPqLngdP6
 4C0Rv6rnPHcFPUFFznd5LpIuJtU47ahJY2YiQW1eqCf3+JASEhrrsGuB96nHgK7J+4npgzV
 Oz1JUAjmGZV4dSNzkV+w/m9szoprf6CsAUnN+GLnFT/89GejtQmfaWtzW0BLgWJjzfngIjJ
 SHocFpZA3TQwmdb55Hz3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OlDSH3eg6Vo=;lB+um9ozOHSYGcuQDdpf416sMib
 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
 DnD8KQ==

The LM75 alert pin is asserted based on the value of alert polarity bit of
the configuration register. The device/driver default is 0 which means ale=
rt
pin is configured to be active-low. A value of 1 maps to inverted (active-=
high).

Add an optional boolean property "ti,alert-polarity-active-high" to
override the alert pin polarity. When absent, the default active-low
polarity is kept.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
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

