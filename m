Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623658;
	b=l+/fCnC5xMnHvXRPn/Zw7ycFfYjmccoC1YinmrBFQOu8ih3TiribWVUyMmfxuszaMYsF
	 sLjZB3I7dQJQ6rvMNJt58ByVF4d9bthnPm7CRrMpg6Erv0fTiklMuSsg/5/GSDfeXyBCP
	 RaRLq1cnxrNOXwck2U5//JKVXJuyDlTipyONN5tjsydh8ZydlIAhPVslJ5J66Nj7kHfqk
	 5oSlJnO3iiFev+Cvj87Yj2d8AAPuEZFVn84EjJjs8FFJFvk++4XV/IMkvMU0EcDhZiq0N
	 r8/w1lz08/nCeIbSutD0HDdk59aIXsqggBsyhGRMHBmEQZY7Nm6UEWbKwiRXO9kbhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=3uqGrJfz9cDBzPCihwIMV8BnGeGQyjslEBvqwSJUrbwEeEIlleEm2r+NEdL3nZ1Mi1Y+
	 sA1ubTZsgu4yfGrZjzP1PziTqunBkxbMPXDaKR0NVW82Eb6er25+Tq4kvwyz4Y1sAYmdh
	 yrrVe85ak7++xUbb6yLCF9HgCzqRYyzyRPeE+Ynb6Sg4QK7Vyq/JHWvasIc3WDe5D5wyB
	 yoDgWPOTff01tgahBfVOeuMtGdiRI4iZU3WsXpUH2Mgrsxx9xZGbOLRh72w2bWSmrfjcM
	 bWAW45bIiREBDTG+yTRGPSl9unPodcI9DGPypEY5JN/WxCoFoDvqn70UFhltwN19e2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091B1606A680
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 16:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091B1606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4231701f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623656; x=1796228456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=OBXIaj7E1HmGWo9JqM9tqua3DNXDb8TFTkplpSggBDuhUhjA3PjuQqAh3VS9LOr/V7
         6soddrf7dewKxXTzQGhzqshKPUfy0pCHiYnR9hQRMNFFXJA+WQtkId771Bj8BT7vmh7L
         CdMqnmCJ/KTXoCYC4v0nGDUUeVRLyW/a9jIRAcLwHKJjS0uHVeg21VOqrbQ+RnkJvNiy
         U7o6ebtUYeNot2iP143VpKd9aFrme9o+rpvSqeuk1DnoEr/fQum299YO//4YxxLlvgFl
         IfFgz5WArV2/xWf/P+mGycorCWHhayDZCEK9AfEw3doma3Xoh8RAFTE+ttKGc9To5Wrf
         7xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623656; x=1796228456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=g3YQO3dpY20+D/jNf53U9H6IQsMwRPf5ctZ5Sa3GFUW+I8zcfrqXN7irDC1QJ6+gwo
         k55pusv6/HOZwjn2C0uOcYPHFAbqaMvdMTKZCuLwVpVoi2ivPiaEfDcW4FEfUhSxM0mr
         /mkbkb0d8xOZkuAIf6x2hqu5fU/zbaSXAs1YzY+RKOGbEF8cM29jRNl/rkBiZltc04d6
         C5r8pwSyVoCkfqPr2pPNeV/uQzCLfmPlbbJ0K6sLh+vh3s1zFVeF9xe9Dn6rAW/ourw+
         L0w6yon8UL7P4GV0HOpsJAZk2y2Awp4WTi5+Io1BcjiwTMaTW5uKuHG8z15uldzGOjlw
         lJUQ==
X-Forwarded-Encrypted: i=1; AL+hErFr1L71hVy8Y80cH3eFZmWmXzFVzJMNO81KW9lcG0AaI0j7h/PRcCn3eg2ycNY4t5GKHMD2fJLPZXtO3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z91UxHn8CZSQEMUPL02m49TIF2HTFYWmGucECyYvgnUIf2R7gj8
	qv1GKMDQxMWBeFRw1998bTbK98gnNqlO4TkielsRTwvgVvf7LpP6Ky5bmow8npVJqa8=
X-Gm-Gg: AZFdTZcv+J0mQ0kf7yB1DFxTSzevs47hHLn9xM7pELAL+LHolM7aLSyNRJ10hLL8h1I
	JbFz2uPpKI4pCxNzAW1YTtr4NvU2cYUj/HknkyF9YpZ7pr8hhoGqgYMrAMah8RHNMpz+APYydwv
	56QHeyEzicPeFQLfQYDdghLfOAA7Hv3hfg7NSGIyTQPJZus17ORXB0PXr3UWSOMj1cw3BI4Lnoi
	2bqAnhUGogE9ESyBmHMV4G8pv80GotrQpx95uKtn4N7xo7hACK5ZHScjNU3+1MOecleA/AR6d3g
	ASBqbu8GicjNuWWNSaAahcNob72P+/gYqSlS8TuHYjtdtZ0AhiZwc2+cVOLRcdfb3CJf/jF5Gcy
	7XJeR6TRk1P0SRZjRkbKYfSOsib8aIQaiBGqdG7jozJct9i7aiiOEucW+kmXJh03Ebww9dqGWpX
	fH1KYuVhY6Ge0ToVq62WSLKLjipQlhDv0cLPI9AE/zshhJ2F9VymVwPWXU91LEtsX768FNDDkoP
	58v276BMV1RNgiiTJW5dnI1TFajXTTvyI1qH5IbTfP7YwGaIn0UWYmbVYrjgf7jk0ieE1s4yZtr
	Mp2w1X9kCyYQ3mP3UuiXrqZ9wJuJ9FS0q0aCyjHmC5QIakFPpw==
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr24317570f8f.44.1795623656351;
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm40286290f8f.24.2026.11.25.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed, 25 Nov 2026 17:24:50 +0100
Message-ID: <20261125162453.23573-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
The DT binding has been applied by Rob (see [1]) for consistency tov7.4
and is part of v7.4-rc2: as a consequence, this patch is included only to
make this series apply 'logically' on top of v7.4-rc1 and can be dropped
when rebasing.

[1] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 000000000000..be020583fd0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.51.0

