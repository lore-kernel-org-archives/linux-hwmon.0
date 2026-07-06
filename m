Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A931B101;
	Mon,  6 Jul 2026 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354563; cv=none; b=L7riSwXqUQ5rCN5A83Kllkk0K4YKEjfnDuUNusaSAAh5UK18uajsxlreu37tnvI0X6xy1E6VFANPKFMCNhyWbD3g5A8HRIrpa/weD9MWHYxT+9YMvdYDKIYZ/DR3uljBf7fmuukK0E6wptxJBAzIe01u/ahG5bnymqp1mEuMLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354563; c=relaxed/simple;
	bh=N91VeW+ubG7x5vnljqP+WP6nDnCalzi8wLn+azKCEkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZnzkNpiI8I4BqrUo+riI7alaC8TUZ0hKw1WS3TSBOQCwGt6wcHTo+nD07H4NDG1AcrgSXVRQVKxX7Ud0lrFhTvUOX4BTnyvhOPLCqR23rFBzvtz1Xd+xLe5RuBMtHa0f6Zk2bApz34KmrTse3Ui6K0pQYUoihwMuOwGr234m3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrtDmefA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrtDmefA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FE31F000E9;
	Mon,  6 Jul 2026 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783354562;
	bh=26eQQ0ZLM1UldWuXMtiJ00Vxg17kW/7dE/yA5OpapZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrtDmefAIUaxTaOimph5oLyrhhyKLlvWnWcX3wP132DFrYy2+nCPcQ0Lxmn4ePl/P
	 C4VqkZ+stua1g4t9QqfZJ5TIA28rnAkKYUzwoqcKLQSPE4PesmHir3PgPeOaNKP/f4
	 WGm/bUObabyBUVwsOaOc9T7duHVPsytTevrnemHNanNpG0qoVLWdrEOQ2qQmSsbAke
	 +iusuRrWLuZrLZ4n6TWxGUQ6gJEu6sjX2wpDCJ1QbAeJ3Ou+Flb6ga9/BAX/2DF2cr
	 vQop1dxCC64hLyWuRXaTg8Z2SVEJBupTFnR8WD61p2oWmeEdO8XH24Yk53snNz6l4M
	 qXpsim9nOT9iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
 <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:16:00 +0000
Message-Id: <20260706161601.22FE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds the `#thermal-sensor-cells =3D <1>;` property to the=
 `embedded-controller@28` node without a corresponding update to the device=
 tree binding document (`lenovo,thinkpad-t14s-ec.yaml`), violating the DT s=
chema.
--

commit 6785b707e0b11ce8dd5032f0c96a9debef8c413f
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and ch=
arging sensors

This commit exposes the Lenovo ThinkPad T14s embedded controller as a therm=
al
sensor provider and adds thermal zones for the keyboard skin and charging
sensors in the device tree. It allows the thermal framework to apply CPU
throttling when the charging circuitry exceeds passive thresholds.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 5d49df41be02a..ed5ba3a428a8d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -979,7 +979,7 @@ &i2c6 {
> =20
>  	status =3D "okay";
> =20
> -	embedded-controller@28 {
> +	ec: embedded-controller@28 {
>  		compatible =3D "lenovo,thinkpad-t14s-ec";
>  		reg =3D <0x28>;
> =20
> @@ -988,6 +988,8 @@ embedded-controller@28 {
>  		pinctrl-0 =3D <&ec_int_n_default>;
>  		pinctrl-names =3D "default";
> =20
> +		#thermal-sensor-cells =3D <1>;

[Severity: Low]
Does adding this property to the embedded-controller@28 node without a
corresponding update to the binding schema cause make dtbs_check to emit
validation warnings?

Since the lenovo,thinkpad-t14s-ec.yaml binding does not define this property
and uses additionalProperties: false, it seems that adding it here will
trigger a warning. Should the schema be updated to allow this property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706160830.1769=
8-1-daniel.lezcano@oss.qualcomm.com?part=3D2
