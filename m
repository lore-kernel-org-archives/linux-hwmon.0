Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873448;
	b=HLEUwxtGSJdphNRTsGz4Np4lbXd//RIYwiFSu0MfKXCtgSjyyBNBxf1biFDWBkvarprE
	 nQSnCOp819Z1xYRY+PyDsp/gALjXgCYBjmaxfRDfMrv/Tcoz3YpVaOt3yBfSqsieZBFkB
	 GLbL85De0Pr0tVg0y/PGJfE+gNpbUaenrq9nPN1qpG2Q0qX8JDJjKUdn0TeBRv1zozzuO
	 wkRt6d+UFs0weuXfS+Dgjn1QBKpW5+dvMSZQ5Kc+4dNQJYQdQslcqjgQsTux/2pxm1jcC
	 2P7rsreSNTuUFUJb8jiG822KLfoRH1dQi8jUrf+UOH1q1bJOGNnkdpJ41pbfQn1iFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ODr818MjqLrZGi6aZyEEcKnX5mKhFzUwFFZGkVIdIN0=;
	b=rkgw6cSEiokYS/K9xGfBqLbLCC80xDsqPOY3KuWUzg8lvr66yhkMAYPbn6lPZHX+wxVV
	 L+FOXD2sergZN/3m7fjeWjrO61q7w8/Dc1xNIHMsbY4AkqElz8XET4E9MUS2VYJd53+fP
	 0dzaw2DsRvrpnu3YQzg7Jl8mGDY3rGR+m7J4Zf8oN32mAdIfG/ocMaffzBdC0s4wL7NkN
	 1v4DzuTI41Ox3ZmONGDfHAxgu82ZpE4cgK8HY4sKBnBtL6hVHUptC/HLh/zlLdPZQM9eK
	 dDM2ibE00VjkPbcuF/1xhBrE39K4QJVZ7ghAu7FfpeHO4L91ZdqSG8b/T6R0JVmpwmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ct4Ehldu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCA606A329;
	Mon, 16 Nov 2026 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ct4Ehldu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE01F000C4;
	Mon, 16 Nov 2026 23:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873448;
	bh=ODr818MjqLrZGi6aZyEEcKnX5mKhFzUwFFZGkVIdIN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ct4EhldukJ5EdGvSveCLKz1A7+Fd25kR0cNqR27s9E8e3aDfPENw1lvYfEaaVAWBE
	 SIldIDo/tJwfi6Mq2/cqLx/YrxFMg3qGUYgAlOkB8oXGVHC22m2n2Vm0/AEbxC4xpS
	 Bk9VYiUpVQmqfnc5MXW1EmUlK6ozGWEL7OGKNViPWy4s3kmgCZuhQTxTLYZQ+FVzBA
	 Xl+g/QflJQPXK1ZjFeYbj/PjrvUeS6/v9prx59fh/vyHj177nLYDUeAouYpNa6k+Ek
	 cWPBVSAuTIUbxpJji1K5o4AIE/Nk3Qbcl3MR/spnqppsHbI5GRKWpa5qnsK9/4KiCN
	 IOGR6CwQmRGQA==
Message-ID: <sashiko-outbox-217953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:57:27 +0000
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

commit 7ec1ccaaf4e78fdfa9c9d3aeff900e6713c1dd94
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: mfd: Describe the BCM6846 PMC complex

This commit adds the Devicetree binding schema and header constants for
the Broadcom BCM6846 Power Management Controller complex and its Power
Management Bus providers.

> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> new file mode 100644
> index 0000000000000..eb01797f82622
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
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
clock-controller, reset-controller, and hwmon modeled as separate
address-less child nodes rather than putting the provider cell properties
directly on the brcm,bcm6846-pmb node?

These child nodes partition the PMB keyhole interface by Linux subsystem
rather than independent hardware blocks, encoding the Linux MFD driver
split into the Devicetree ABI.  In the driver patches in this series, the
power, clock, and reset drivers operate on shared BPCM slave devices over
the same regmap: brcm,bcm6846-pmb-power and brcm,bcm6846-pmb-clock modify
different bitfields of the same 32-bit BPCM zone control words (at word
offset 32 + zone * 8), and brcm,bcm6846-pmb-reset writes word offset 5 of
those same XRDP and Runner BPCM devices.  Likewise, the clocks and resets
properties on the hwmon child node point to BCM6846_CLK_PVTMON and
BCM6846_RESET_PVTMON, which toggle bitfields (bits 12:8, 2, and 0) inside
PVTMON's own PVTMON_CONFIG register (bus 1, device 6, word 17) rather than
separate clock or reset hardware blocks.

Folding #power-domain-cells, #clock-cells, #reset-cells,
#thermal-sensor-cells, and the reference clock into the brcm,bcm6846-pmb
node avoids baking the Linux sub-driver split into the Devicetree ABI while
still allowing the MFD driver to instantiate child devices internally.

[1] https://lore.kernel.org/r/f1c24a603964302ec1462b1cea790a2a7079fb3d.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D1
