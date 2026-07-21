Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B92415F14;
	Tue, 21 Jul 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661443; cv=none; b=rKoB9BH/+Zf2AvDvah/IsYSav/HQyeMZeG0ubT8zemZ44/SN+iTZUidD9zthWG47ozbmnNa0+j3tmVPFj5X7HbMkpQ7LABCKmaGkiMMF84hWHKtWutA37XsP/P7QR/3c8SotHFCFd9QS6aWU8riynF3oXYbFZ3vdW/At5Pqrncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661443; c=relaxed/simple;
	bh=+Oy7zscXy6Jnk+6maYbmu/NpvB3uxlX2XjDwwHt6+4k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GA6Bty0kfBRi6NHWypL7TaKpQkBiRRmMPqIge9SqM4nxJFbMCBApa8GuQDi6AbJ3u1Q4kMn2sqIIf5Z7xPztzJ1aFdfheuWpqcGx5nP9oewXf4hji6Q/z1vxv2hWtOyUH8/bTedu0vhUzu2nRvxXEQBVka9EerO5/i7pPLUOh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODOMUzjt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODOMUzjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7541F00A3D;
	Tue, 21 Jul 2026 19:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661442;
	bh=eQE0oQHaqcgXHunV4NFBHy418GGpAxdRc5gD/C1p1vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODOMUzjtB+psNmEGsrWtwD/TFsr7Imnve5Lb9ZWCLm2b9DwXUiQhlEb34QEISfOKQ
	 nVKbNuCXEFjfm6rIMc5DbGZJwqjLd0ibHiGcKCUraLOZ+KzAmE9XCnduuOEb5r1+Z5
	 1ke78l4n6D/pX1b9kHU3IQAcPmXrr6IAtVWTZx+SyMLMgatvggSGrhE4vr4hRfKTlJ
	 YaZTdZOqR4/QHCRm2LXrgui9yCT3dM3o46ai1YGMR2vYnZRmCi/suusqLMH8/w+iOW
	 I0v1MpAS3mH7TeA1en+dI0THR8dXSn81IP2ACCr3Npng5C3RtnmofuefLe2fWV1hDb
	 QXmmXYgNzbEtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enable
 BCL sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:17:21 +0000
Message-Id: <20260721191721.EE7541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The BCL hardware monitor node is added to the `pmih0108-kaanapal=
i.dtsi` variant but omitted from the base `pmih0108.dtsi` PMIC definition f=
ile.
--

--- Patch [8]: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enabl=
e BCL sensor node ---
commit f763d763d5dd94fa5bdd7efdfec8819781ecf122
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node

This commit adds the Battery Current Limiting (BCL) hardware monitor node
for the pmih0108 PMIC in the pmih0108-kaanapali.dtsi file. This enables
battery voltage and current monitoring with hardware interrupts.

> diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm6=
4/boot/dts/qcom/pmih0108-kaanapali.dtsi
> index b73b0e82c3d31..67b77272b0cf9 100644
> --- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
> @@ -49,6 +49,15 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells =3D <0>;
>  		};
> =20
> +		sensor@4700 {
> +			compatible =3D "qcom,pmih0108-bcl";
> +			reg =3D <0x4700>;
> +			interrupts =3D <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "max-min",
> +					  "critical";
> +		};
> +

[Severity: Medium]
Should this BCL sensor node also be added to the base pmih0108.dtsi PMIC
definition file?

It appears the node is being added to the pmih0108-kaanapali.dtsi variant,
but omitting it from the base pmih0108.dtsi might prevent boards using the
standard PMIC from receiving battery current and voltage hardware interrupt=
s.

Without BCL monitoring, those systems might not be able to proactively
throttle the SoC during high current draw or low voltage, which could
potentially lead to unexpected shutdowns under heavy load.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D8
