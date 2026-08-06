Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618733FE644;
	Thu,  6 Aug 2026 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007616; cv=none; b=SLiWxeX+JwS50MBx5rWuTQRhIhci2y/7/Mrfzvb0dZhHMeQ7nbVOm6OuJOeXFw2R9BdsqWNIq6bCRo1epSMMDU3o/qqNMo97ncSO1PQdHmi2UZfLNJGXsnTqevh2e6gXFupZFNiNSpgEYPSBpKxgy0EUro9AVQtTJk+Gi6Rybio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007616; c=relaxed/simple;
	bh=h+AVlee1Sm2hW784BM85RYgL0vctPLmQRWjdwXnIBNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MMnee94jc+8B2XBr97UuLTaIIwLvqVn4UqzqdTzcAUsEdf5jswLO5Tl9GBRyKrqralZy+wb46m/G5GAkx+8jJTi7+YymhJliKkS4boaxVeWWOLHPqEeRh8yaaaTYdfxifFa/8Bk1hd4yGeCycaEiCek4CfrJh/51c59RQj1m8ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URCjUWQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URCjUWQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23541F000E9;
	Thu,  6 Aug 2026 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007615;
	bh=CM7DKCts9xfG0x4kJbiMfQzrokJhFI/PF1iAhmA8LZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URCjUWQzJXF/wHL3krtqH3YEeQUGHem1aaBhp+hcDISsYayFI3+LPJCt9+KRM2EiF
	 CcNuKctDWfmg2T84g99R3SmZub0eUCP2hqOBBvJAM6UADxsp5ZuqEF2rlay5sHE+6w
	 mGx9vogyN5Gg0JsVG2sC1mNtmGLIKIgpoaqiFaO7lvgPLbwRzMY82xIceqdgnTr8dN
	 d2qacnkSwD6JrvDtvED6t7SMeRrf0fA/UVp+uk/CQSjJcbn8RGqaIE1VyG1CRA4XOo
	 dY0J1ZCnAntDG0BOzzY7OWNZCrxFUSkhsEO9sp0cjgNPiO2fhr0VsOW05lPU+hk03t
	 tDIYayEfuqDEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:13:34 +0000
Message-Id: <20260806091334.C23541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The devicetree binding schema misses standard fan cooling proper=
ties (`#cooling-cells` and `cooling-levels`), breaking thermal zone integra=
tion.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005=
 PWM fan controller ---
commit 34174063599786fae2685438f00eb273f5ba7c0b
Author: Petar Stepanovic <pstepanovic@axiado.com>

dt-bindings: hwmon: add Axiado AX3000 and AX3005 PWM fan controller

This commit adds a devicetree binding for the PWM fan controller on Axiado
AX3000 and AX3005 SoCs, which uses a hardware tachometer and external PWM
controller. It also updates the MAINTAINERS file.

> diff --git a/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fa=
n.yaml b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - pwms
> +
> +additionalProperties: false

[Severity: Medium]
Does this strict property check prevent thermal zone integration?=20

Setting additionalProperties to false without a reference to fan-common.yam=
l#
or explicitly allowing #cooling-cells and cooling-levels will cause schema
validation to fail if standard fan cooling properties are added.=20

A devicetree node attempting to integrate this fan controller into a thermal
cooling-maps block will fail dtbs_check with a 'node has property not allow=
ed
by schema' error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-axiado-ax3=
000-pwm-fan-v1-0-f6db4cf2166b@axiado.com?part=3D1
