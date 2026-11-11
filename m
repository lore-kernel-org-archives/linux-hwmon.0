Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395498;
	b=157E9mkVrDyXMOsTV29pW3Tmq6G3cT/a3/HEfBcyaXn+CqOckC+X54yZIWkwHeciMqNj
	 pO4Y1mKElWYrvdUIWjt5kZ1dDq498oSKktQgjEJAP2fd7uMRtyyM9fuMVAEyO5Sfcgldw
	 z31bHdsUnJrdKn1sr2VoA+MDkEKJBUyDuKPmFblm3L0xzv4fqAOZExBgM09h8JGDviFEY
	 lim2Qk7Gy/ErhJyJLROhvJRzQtEH3wK5izolSPDWl/mzrHNgS1kYVzbG1tiV0Z7Bg8CQd
	 H1oyNcniWG13IpeReDhGkZ931jqVLzydDGR45jTtjYIxflFpjfk96gbDBlxl6d3mysQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EI9+1Pe94rNtVU2rxTjoVk3Y5vhG9a5UQwsxZ4gexcc=;
	b=XXTryxnOoRJLkW8US1jEQOMBZUQpGCOddQj/NOX52J83bkjCys7WlyyMJhKT3UE2OMQG
	 sWGuvHdAD9YX9heB+vFOMGXztk+9WHoP2UKaYoeI0IoTHnuoVgx75zlturWY0+I/hRrTw
	 uPDuw8FBei1BgpHKXf4cQ+ZHCYRnpyCfm1zWk5sApnrNNV+MXdCmvl5cajdDbB+eKiJcy
	 NPuPBNTZ4qurxJFSWxMppVp3RjotP6Xd5vknul16zwv+Ivk7V8DXCwxkDl/J4bNHNah7I
	 mDelVBng/ZdTwCMQt9sXumkp/hYRjuG739cVbl1lJBJ0mtFWUGLp7RXG5o4XVpODqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7Xvs7ZD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862EF606A886;
	Wed, 11 Nov 2026 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7Xvs7ZD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C8E1F00A06;
	Wed, 11 Nov 2026 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395498;
	bh=EI9+1Pe94rNtVU2rxTjoVk3Y5vhG9a5UQwsxZ4gexcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7Xvs7ZDxNVnMJ0ZIIycs9v/TtpvkBrWaObuv4N6qSqAPR5r6UweMDwMd787l00r7
	 UBEB54efQFJZ0OeEtll2xBMzGeK2b6y5zV7sooKArSlAZUB0krGwenBklUYIXtzf/a
	 ALFNb24trK525Mp7YMlfQd4Y1SCJ8X9SHDfKLGStpDF1xRF+x/ZvNMU/7P+Ok6gH3+
	 /Rw4YZEUFab8vHApcPnowwD57USqV6tgSNzJRVq+5fDfrMkojY323tL6V75CJiBbcl
	 8fQgPjVGQDVTAdlj0Inwp0cakMz18+YHuKohjDlVXpk1lyK9X1kaN3XA0zb6mCTTjK
	 FLPxvjgRtfezg==
Message-ID: <sashiko-outbox-208856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: soc: Describe the BCM6846 Power
 Management Bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:11:37 +0000
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
- [Medium] dt-bindings: soc: bcm6846-pmb: child nodes split single PMB
  by Linux subsystem
--

commit 6235ca071e36f4e363a6b36688dc2c4a38089eb7
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: soc: Describe the BCM6846 Power Management Bus

This commit adds Devicetree binding schemas and header constants for the
Broadcom BCM6846 Power Management Bus (PMB) and its clock, power, reset,
and PVTMON child controllers.

> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.y=
aml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> new file mode 100644
> index 0000000000000..9782a27ff0759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml

[ ... ]

> +  Child nodes describe independent hardware blocks accessed over the PMB.
> +  These provide global resources and even resources for each other.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6846-pmb
> +
> +  reg:
> +    maxItems: 1
> +    description: PMB configuration, keyhole and address mapping registers
> +
> +  power-controller:
> +    type: object
> +    $ref: /schemas/power/brcm,bcm6846-pmb-power.yaml#
> +
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/brcm,bcm6846-pmb-clock.yaml#
> +
> +  reset-controller:
> +    type: object
> +    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
> +
> +  hwmon:
> +    type: object
> +    $ref: /schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#

[Severity: Medium]
As reported by Philipp Zabel on RFC [1], should #clock-cells,
#power-domain-cells, #reset-cells, #thermal-sensor-cells, and the
reference clock be placed directly on the brcm,bcm6846-pmb node instead
of requiring four address-less child nodes?

The child nodes have no hardware address space of their own and partition
the PMB keyhole interface by Linux subsystem rather than independent
hardware blocks, encoding the Linux MFD driver split into the Devicetree
ABI.  In the driver patches in this series, power-controller,
clock-controller, and reset-controller all access the same BPCM slave
devices through the parent regmap, with power-controller and
clock-controller modifying different bitfields of the same 32-bit BPCM
zone control words (offset 32 + zone * 8).  Similarly, the clocks and
resets properties on the hwmon child node (BCM6846_CLK_PVTMON and
BCM6846_RESET_PVTMON) toggle bits 12:8, 2, and 0 of PVTMON's own
PVTMON_CONFIG register (bus 1, device 6, word 17).

The Linux driver for brcm,bcm6846-pmb can still instantiate child
platform or auxiliary devices internally while exposing the provider cells
on the parent PMB node.

[1] https://lore.kernel.org/r/f1c24a603964302ec1462b1cea790a2a7079fb3d.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D1
