Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541584;
	b=QnJdq8JCXxZrbh519HJJ1z/tZbEe9VjAysr3xQawrh2fFdrYbisv+jEiD1nI45vpJjyi
	 uQwaV/A2MAim72es4lpZqZWM28hx4dM/OAW9Yozs5qsxn3nJj7Z4ldJNcEQPal3ElQ2L9
	 bzpEmSW6Nga+3zYYyh+bnM28d4yJL1V/dp71e0WTTryYb1ZFwu1P95vOz4feye024NOKz
	 UhIXBZgMCYvFZJ2S03u7eu6hNecbcvEjEPCTXD+/LL9YqwYT59LBuJOaYcgruKxpG6xrg
	 qDNUbJPdyGBEDVLA9iy9ye72vU1IaxmBmcUKZSZrPBrfk8/D4dQ0BTyTOHQnquAFUdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=wcnRg/m3AsUPevHJ6Xvu/ZN1SheWLj3Zzl5d9pff0kFqjdtjOBwwV0e2Mhsfpa9abwF0
	 6gU2hg03ge6Pz+ZC0FwfwNyzjTgM2bGihVxiU2bHtFS3XGM0Tw4p/yd60nCk+TzK5jcKZ
	 LaxAMQQbh/O0YdILQzl3mmquTeFZSO8r77go214ckAqBl5sXR3lslvQSY0ltlh9bnzJUk
	 9lbiZSB1hLpISm+VJn9bQlCIWfbvIMJK/fRhOgldMxqa4WY+c9B4p37BsQNzkwY1HY7JQ
	 UIYqbC84HhIefE20suKnw6ijxGoeywy7i3CdNLrgXjumPU53cDbkDCi0BaX5Brco2kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634860A2630
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9634860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so46061045e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541582; x=1796146382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=YBeE8QUOOp51AgJ3SsRNyTURxzAxaIkVckh1C02xLsmCc5ezSk3lgZBSqW1dJ635jV
         EonCr68RcWbdREMNRZhlFzjZ92CDDH+sWWLhhDxs3Rvrfy2xtO4TY8827SYovhpAv4ai
         zfHU2mTEcOK48CP1YZVDzt+2gvjjHnPIED0Mpgu/kl1a5y24Kmf/+LulxSTtfsBUTgPC
         fdSmdHmMuFMEhTSbA3ymlevkPfvIQylu33tqvIY2GIw4W5p/0wmv4C4mRoBT8qinY5h7
         jW5hZHDl+h27oOREs94urwC5xSNzEh8OxlwSwZ1brBoFZooBUG4gfxpCZZBxvrWeEtxV
         8TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541582; x=1796146382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=0n9oPOSz+HgiaqdiAX/mz29QNOrZnuu+1v6qHACoSLZbjZYsS/ym1M4DBpzYgDIfYg
         nxEcUI6VupHjfcdrLDaY6AOH4FM3utFOfGlcLi/ylWIrYCzCzsiYrshaIIebgB3jwv4G
         VttPCHVM2tIivaww1HpZMPIrKJYLmxbLydbImThKSmnqCA1SbfTqPns6vbpgkhJNC6Gi
         eh6tOoO3yn06mz/Xy1Z45+pnEQ4W4hM8rtO1TLFCjlcYaDnVvpK/iIF8yrqh3rRwNs9U
         dD7C1oJwCUYkb3MTaVfIITRe46/1EhlGM9c0Bl0YNNx/RpaMyCzCNd7vwE5e0SWsNjJ6
         4mBw==
X-Forwarded-Encrypted: i=1; AL+hErEVDcWcU4qfjsaaZT8ZY8M40dH08tI/Iq8H/1gA5OFNkzLqNL7smstUsiNWkA0ZOrwxJglDrAHCJqso8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/w3B0S9RaTZwB1WO5hdTkh80mb9xwWV+QaOHXWWGp8Lrr599vW
	/XOoOraMtzbelqMS6oF50hrmaYGmbwhFMBVrfBIXC4HXB1xEIwkqtEUfYg1mNvrdIAU=
X-Gm-Gg: AZFdTZc6/RiUdb3ttAZkOTrHvJt350HBjh1z5dSuv00NlsvdWXny0SKD0n6hTYUj3Df
	piU79MPmi5pofobjWYHOmVvZdWtzRP2OvLubPCm9o/HYF5T4dYk9GCrLsmf4cGXOHMj3EaeQrOL
	JsB7ZN7Hwflf5TSccdNYINR85RxHPGFuEocHFKmIIXoSMFAyYRU2aoAqJBr6/sOEygSOeiMxls0
	wOBTkvJJc5FKDv+4pXdBvUyk+JOTlCFxOWMzvVt3+7wHJAp2D6JywV8ykIGVf+AGbeS18geu0zQ
	ODuL1bijwpoahYYnAMg3ujWuLGhQbBFP29NvIWbGy/RdL+pJnw+xl6jiheNOH+2d19KfPXhPycF
	yS6gDXD6hqZdSZPTPwSaRUj+blYLWU+3i8EIS0RbxlcHrO2/29RIx4QNeT/1L6DhegeeYk481R0
	Ycrqjb2hOKoZTjdqM+gcWO2np5UJ8mWoDkFuvlxEnGfeS5zFp6Epq2ulr9omud6gXUP4lrRDZ+T
	5IkxK5EKe9lE9pfOvmj79EoiSRBy/hMuECrpPJUNQ39p7mNINTNyAxeREpPDEP5GMGOPtkllcXu
	buFDnUpb01/KTWDELdiJzdC/yCg=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr309983845e9.34.1795541582068;
        Tue, 24 Nov 2026 09:33:02 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm439552155e9.6.2026.11.24.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
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
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 24 Nov 2026 18:36:55 +0100
Message-ID: <20261124173658.31030-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
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

