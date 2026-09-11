Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B948351C11;
	Fri, 11 Sep 2026 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112456; cv=none; b=hWfSVv9hgwrWTCojw80rlIU2QCrN6ueT0+Tzu/6+3Z1YJ5w2aitWFoV2RelR5eCB1+9fZYXpjc9r+WnU6tYA8J0Xon7cBngdvdBSTYRCELZUOpAgPbSase06biBfv+BtY0+LABjPJRFqQpXq3ltV4S7MpYQVKTKtUUsg5/FW2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112456; c=relaxed/simple;
	bh=R5wxaNKrg71z+75jammPME83OCmUpIl8l0z5l0+4eNk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cyNWH0Lihe/ALMoi2BRMOCubHg/3O9vVBJn5rbbRyYP67IqSIeU3K6WLwU+ve1GcFgz/TLqxFs4IgHE400/KP/9ET9DHTDMfDX+dduO+NQ+QNPgBGASUg0zYHkaHlz/uv5WH0F/pDIrJu7N2IxlMToEbd6PzjotB7Ilzxy7aZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/VvUQUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/VvUQUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E8D1F000FF;
	Fri, 11 Sep 2026 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112454;
	bh=3X4Q/qVSKTvwNUXG/DimCnGpYGGuhCfxpDGtJtnHIXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/VvUQUq+117PpIonPG4VCdlurKp522tgSHO7aRtSW12vVlXizVBFRVOLesdO4+9R
	 lqlX9yWl4YT7r1ChkOODSC+x07WkudeuqVp75bWFzCSRIxkjudm3NsrMqhr3JRtHrh
	 TGl+vI23NDZ7nZ3kQhelzZb/R7ubKkJTuZ1Z3uIepqa4a7Pja/X8ye308KThk7RjA/
	 7NR3WgWNaonSBLfKyVjuQJYMLmGYFu3plXJL8DHHyYlvQBStnJDIFn/cJPiFBA7uzL
	 LbxIIdnFyiGleeVSe4SLPWRHwLuHBv5z2LxXDXgnZivy122N69MXHPJkvKwNrDtHro
	 +APwUUWqsD8+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (lm75) Add support for Nuvoton NCT7715
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyemail2@gmail.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260911072654.15722-1-syhuang3@nuvoton.com>
References: <20260911072654.15722-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:40:52 +0000
Message-Id: <20260911074054.65E8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect polarity mask used for 16-bit configuration registers, m=
odifying a reserved bit instead of the actual polarity (POL) bit.
--

commit 7db614efb67592440d087e96063e9c50c4ebec00
Author: Sheng-Yuan Huang <syhuang3@nuvoton.com>

hwmon: (lm75) Add support for Nuvoton NCT7715

This commit adds support for the Nuvoton NCT7715 sensor, which is largely
compatible with the LM75 layout. It introduces a 16-bit configuration
register handling for this specific chip, including unique conversion-rate =
and
shutdown bit mappings.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9d..ad7128629e56c 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
[ ... ]
> @@ -770,7 +805,7 @@ static int lm75_generic_probe(struct device *dev, con=
st char *name,
>  	data->orig_conf =3D status;
> =20
>  	/* Enforce polarity active-low (default) or active-high (devicetree) */
> -	if (!data->params->config_reg_16bits)
> +	if (!data->params->config_reg_16bits || data->kind =3D=3D nct7715)
>  		pol_mask =3D LM75_ALERT_POLARITY_HIGH_8_BIT;
>  	else
>  		pol_mask =3D LM75_ALERT_POLARITY_HIGH_16_BIT;

[Severity: High]
This is a pre-existing issue, but does this logic in lm75_generic_probe()
apply an incorrect polarity mask for existing 16-bit sensors?=20

By adding the bypass for nct7715, it avoids the issue for the new chip, but
it appears the mask used for other 16-bit chips like TMP112 or AS6200=20
(LM75_ALERT_POLARITY_HIGH_16_BIT, defined as BIT(10)) targets Byte 2, bit 2=
.=20

Since the SMBus word read natively places Byte 1 (containing the POL bit at=
=20
bit 2) into the lower 8 bits, using BIT(10) might modify a reserved bit=20
instead of the actual polarity bit.=20

This could cause the thermal alert polarity configuration to silently fail
when a device tree configuration sets ti,alert-polarity-active-high for an
existing 16-bit LM75-compatible chip, breaking thermal alerts.

Could the mask for 16-bit registers be corrected for all devices instead of=
=20
just bypassing it for the nct7715?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911072654.1572=
2-1-syhuang3@nuvoton.com?part=3D1
