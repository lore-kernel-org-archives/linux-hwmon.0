Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD63A9618
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438257; cv=none; b=s0Q9JWjpm+1fhSm0EwfooMGdjBloz85Up+1cVL25W4Nv9GI1b8dhkGR34YMD1gAtFWTZaRvx/eWvteBpQZ6LEy8AxhXJc7H5ywrZ4sIXWMDKZiJB+EyvXmHwveQRRyTZgLCO2Bz0euHRlbYNGvQ8sBE3Vio+7wAhnmY1NfrHT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438257; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7B15VQuqv3Wl1dVsV0HACJS5KQsKV5e9utWOmScEUoKE+pKRxIHiZjwHBKyKHQyTTMNhAjK0/tCqxrQGnBoO3j6D0LH25LtZErregNZF8RhTbCnOEgRIKj9LW+hiHLqSjkPFmklpdfTci957/kv1pwNVMS7Eoy4tZX8TV24Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XuRpK3F8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XuRpK3F8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e7c636e74so3842220f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438255; x=1780043055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=XuRpK3F8JcOQENl+OadbHzE7Kd+lY/zVqGFNMXrcQ+dZ52ys3ewfzO2sgSTDeQjKZd
         z+jgJr+mHMapo0V2MWWsG5EC5xI2XXwUIDn2lyup35yORAIBiXmiQ+2lpMaQi4Y/ZO1w
         iv6cnTzOxpHXdOOcueuvPsbe5yoCpZnzAeCCGxxutjuNYUMiPPrmY0S2KUHhDLbW0u7n
         xq8Y0ELLjA14kNHgiEnvps7CJVKa3ofW4ucgsx5sQ4i1T4Rm948hlAlZtsKUBv0B6paJ
         2XymPJSgpQZgm76TlzbTYNPDUsl1F4610p483KdPiU0PnDqZWpEpGfkRtujZOCHUwrRD
         9ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438255; x=1780043055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=d+P6vbRBgjnlTssBJVUePRTLRf7x540z0/xxLfE1DYEYKC6/ajIcBhOGwcrKM+VGYx
         GEmnPeRLbhv3M2x+iqdQyVo9uTg6Hx3V1TwlZDQrbJ/ox8D8WcmDHBXcm5rfsjVORpCk
         8EA6B3/2Ehxp68CoZORW20JS4M/LzdYb2ux156lAWaosSR9uOJL5/Ipd1R2LXqY1dxUy
         DxovoRFI5fDMna410IOSVXTWPmFgxZ7OfDYAem92bG6sYEp5OEVqv68jZ154myMrhWvp
         z61NS+drsPcq9Hv5bZTI1B3+s4e6PnkybT6UObuEoJjirGWJ7uJYA2qW/a4ibdUFVVDK
         fLOQ==
X-Gm-Message-State: AOJu0YwtgUO5fSyAQnGfABqXsAQC9pLbU89Rp62RR0F/8p5cViDwmdqN
	0VZFE0mivyqGbAMG8eSRhAIikZ7LNshyii6b/i5CVn4XzabNEZ8jAHIBTRrkJEDd5+Q=
X-Gm-Gg: Acq92OGRdAULwp7Z89b0Wpf+X/6U5e6OONPz9ek4CDCg2uJaedzpLmx20KRmR+5+TbX
	JCY2msBjLPXLhcbtfGxXxjGeWEBbwzAk/t92NgFk4PaTs+uBX+ZRljIXXT8nqoZP3T3TsRQkw/a
	T7sUEfDy/xZHzqK/lGONXqZ3jJErBvVq3ChKI3RwbItHB2pWFpvHUIIcLCjDqhaCP1Zv6WrV2c+
	9GHeVwLmcfx2C4qy0i1g6LgjxO5vCMfUV8UfacutL14Gf+43iQEfSC57NwbfBXoSvE5CI9W0iKj
	kNqtp137lxuOlh30ol5CCpiEgTTfqdKu3FHszf5ANpeO58DP1ipxzMZxYHB4O5C54F814EtrFFM
	L01Ldkk/F9aoVcn8yWqD9DYUoFG7UPO9nUDXwPiQf2ZqK0pdlkSQx59bo7hGUUb+ARspAc4D2e7
	QCILLPFlI3yFpg4bQMNyJ5Cg8ipulH3C6VrOaQ6u/lJ1feGynkxTLaGwFnlusUR00+JwDu4chog
	A77ohRd5cA=
X-Received: by 2002:a05:6000:4905:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-45eb38a66d6mr3096802f8f.27.1779438254651;
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Fri, 22 May 2026 11:23:38 +0300
Message-ID: <20260522082349.2749970-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0

