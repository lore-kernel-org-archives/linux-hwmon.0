Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795379969;
	b=Phx75u3wztKqCLhpkpVdsxLN71tl5+lMgYRMooRXgYP9qrK6vu1M/Q3TXJ3hFtm3ak7k
	 7+GijA64vTjXJqI8DOurZRyTzmopAszSYGXtNId487WeoBhaDkXoLlmGDiQq2LE3YHTP0
	 I4vvysJyE/kYwyRZ8qnH2xMhBbcPtrqlW0NXwNrasgwh2yoiiwM9+uCNxAfqJdTojrHun
	 AMcBtyq8zm9kYH4b/k9PdYxK5V2ssWm0NDkNC63i9m8TBeSAybNJPLZ7/0oF63350ZYWI
	 cYKRu8oikF3nLGxu5d2ldmfY5KiG/8oq/ZnH+x2YOgGs60aD4yOZoKn+vrn05W2nv8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xjGjlzQOGxkHPrGuRUyuFFkNCgtqCfk+N7S2jegyUHs=;
	b=wH5FeXNEIuRcd1QNJx2/Aw5JrepEHryUVhpCBfs9GnhfNd5AhB8jyM8r3nIx7qXtCN3J
	 jN0pIZm0OYqD/WKIRffZAGQEzpKEkMoM6MVUW5TCRcGVK57PQXQEmheJHe0yB7PYLCFyc
	 7udA3NgUWbU51P+9y5xZqKIll+whsQWino7N6T9qC2KU2rjnKv2ydh85sk1FK7Za0hR7j
	 AFejMtV1SCGp2hyAOJ70gyO36ZvFiKm7qMmO+qxI+tWPQTZGVh20CkILSu6uiFnPJGIfx
	 zv5aXsQZYxKFNMqtwbV5nGU5e6yvyFVEa+yalJP8HffK4l+3EFqIHfc/2JRY5Ogn/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vm0L13HN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE3606A31A;
	Sun, 22 Nov 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vm0L13HN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D923D1F000D0;
	Sun, 22 Nov 2026 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795379969;
	bh=xjGjlzQOGxkHPrGuRUyuFFkNCgtqCfk+N7S2jegyUHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vm0L13HNgR3uTsdH7yDUm/wZtcXZ1P0EMJvxxEagYE25FZmVpdx6Qechgmv8eEwzo
	 ydTCzmTHUI5yRkUtfWcHRUJIgBP9OJKQnZ5Pi0tNieNfILgWIyQiSCckTvcqqd/KbK
	 i/nqWC+ouVroJ2lBr5Gib3P0IQTCwj3aDuTRDhYdhxiLFEmFyLdM+ykS4jwar5mjoh
	 K9HBuRid/lJRUlDGtk3ke7revjd1cWLQgvOnRwF/ltoUD3A74ug9iU0/KYknO+kMRo
	 TbnqeMSwzWSpS53XAgt6MpQvJEqw2zA3FlXwZ5v72p1HJncoVjP/TcESMvYvfI+CoJ
	 CfhMoJp+txtXw==
Message-ID: <sashiko-outbox-228331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org>
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 20:39:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
  subsystem
--

commit 1ef708faa6e24bb930c8332cea06fc31592108ce
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: mfd: Describe the BCM6846 PMC complex

This commit adds the devicetree binding schema and header definitions for
the Broadcom BCM6846 Power Management Controller complex and its Power
Management Bus providers.

> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> new file mode 100644
> index 0000000000000..eb01797f82622
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> @@ -0,0 +1,238 @@
[ ... ]
> +patternProperties:
> +  '^bus@[0-9a-f]+$':
> +    type: object
> +    description:
> +      The Power Management Bus (PMB) connects the third generation Power
> +      Management Controller (PMC3) to the control registers of miscellan=
eous
> +      independent hardware blocks.
> +
> +      The controller provides configuration, arbitration and four keyhole
> +      interfaces for indirect register access.
> +
> +      Child nodes describe independent hardware blocks accessed over the=
 PMB.
> +      These provide global resources and even resources for each other.
> +
> +    properties:
> +      compatible:
> +        const: brcm,bcm6846-pmb
> +
> +      reg:
> +        maxItems: 1
> +        description: PMB configuration, keyhole and address mapping regi=
sters
[ ... ]
> +    required:
> +      - compatible
> +      - reg
> +      - power-controller
> +      - clock-controller
> +      - reset-controller
> +      - hwmon

[Severity: Medium]
As reported by Philipp Zabel on RFC [1], why are power-controller,
clock-controller, reset-controller and hwmon modeled as separate
unit-address-less child nodes rather than exposing #power-domain-cells,
#clock-cells, #reset-cells, #thermal-sensor-cells and the reference clock
directly on the brcm,bcm6846-pmb node?

These child nodes partition the PMB keyhole interface by Linux subsystem
rather than independent hardware blocks, encoding the Linux MFD driver
split into the Devicetree ABI.  In hardware, the PMB targets are BPCMs,
PLLs and monitor blocks addressed by (bus, device): brcm,bcm6846-pmb-power
and brcm,bcm6846-pmb-clock modify different bitfields of the same 32-bit
BPCM zone control words (32 + zone * 8), and brcm,bcm6846-pmb-pvtmon,
BCM6846_CLK_PVTMON and BCM6846_RESET_PVTMON all operate on different bits
of the same PVTMON_CONFIG register (bus 1, device 6, word 17).

[1] https://lore.kernel.org/r/f1c24a603964302ec1462b1cea790a2a7079fb3d.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-xg6846b-bc=
mbca-xrdp-reset-v6-0-bf2104a25095@kernel.org?part=3D1
