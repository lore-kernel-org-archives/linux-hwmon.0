Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C830E0F2
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179494; cv=none; b=kLvXngrTJgCfRIYzfh0IumGAaivJyBSLEIAPceJ8+d0vtCvqWT/tqJDFAWiU8ukwJWkYH+/StR+caN5kIjUCz6PGuREQjT0ExUfqtNbmlnuj/bwaah62dm9QjggFbZMhih68KoCtMOxBbk3P3c6VT6/CsIPTJXS3SJhqxaAO7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179494; c=relaxed/simple;
	bh=71U+QTZPltOvfFqt6cEafp9YcsIQUqBs4wGkUUkzLtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VJj5PCt7ajjAZYv+eyMymmsl/C/EO3rgQ4z9N0bI4e/xRtNUGE17rLFVCH7DhtCVil7C1uX6okRB0+iyYV2PplieKjc6u0P51GlmepHv8nmIlpojFTRBTKwm+ljNPKsLRZgBYYg5YiXoum0RNe3sHLaTCHoz7irw37XYky5b6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv9pQ9rM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv9pQ9rM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB651F000E9;
	Sat,  8 Aug 2026 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786179491;
	bh=3dRmSqFNxvR7pZrOVJVDdJ+zqukO1hkm9asPWdX7iz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fv9pQ9rMTS1C/JGMSomM3vm9kkkIAfoiWlt7G+ErfdVa3s20rJ4/qqe+hZxnvcBH+
	 zKWrlCTZlLJ7xKz164eILlr3rOIBfPBOaON16w2bmGwZflV0CfOrN3OI682Sx6JMHh
	 CXvaAoBpz6dswc+9bVreSTQRzmEPoP06toYwMVG4p3qz6tSWYoFakYpOTyKHcXCMXd
	 q+krZuumgMyES4w1zFv/PCQqVEDzVvTcj89kLtFiltn2Dv8Y+32LGoo+qTYXGyOcik
	 CYwKCJhaHm+lstvQzytJ4v3rj1cqCw6Cp9iKpbV2/nBCnzSkE/epL0XCDn/x2cVCDU
	 2XwonwK0X3BiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and
 crit readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260808083718.2612205-1-congnt264@gmail.com>
References: <20260808083718.2612205-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:58:11 +0000
Message-Id: <20260808085811.ACB651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Writing the maximum allowed temperature of 128=C2=B0C to hwmon_tem=
p_crit silently wraps to -128=C2=B0C in hardware.
- [Medium] Fractional temperature precision is discarded due to shifting an=
d integer division before scaling.
--

--- Patch [1]: [PATCH] hwmon: (max6621) fix negative temperature offset and=
 crit readings ---
commit a073f1d4838dda93adf9b46f8e3cc16f1b662f82
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (max6621) fix negative temperature offset and crit readings

This patch fixes temperature reporting for the max6621 driver. It
addresses an issue where negative temperatures were reported as large
positive numbers due to missing sign extension before scaling the 16-bit
register values.

Cc: stable@vger.kernel.org

>       - temp_input used an s8 intermediate, which is correct for the
>         -127..127 range but reports the documented +128 degrees C maximum=
 as
>         -128 degrees C.

[Severity: High]
This is a pre-existing issue, but while fixing the read path for the +128
degrees C maximum, is it possible that the write path still wraps to -128
degrees C?

When writing to hwmon_temp_crit, max6621_write() in drivers/hwmon/max6621.c
clamps the input to MAX6621_TEMP_INPUT_MAX (128000) and divides by 1000L:

drivers/hwmon/max6621.c:max6621_write() {
    ...
    case hwmon_temp_crit:
        ...
        /* Clamp to allowed range to prevent overflow. */
        val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
                MAX6621_TEMP_INPUT_MAX);
        val =3D val / 1000L;

        return regmap_write(data->regmap, reg, val);
}

If a user writes 128000 to temp_crit, it gets clamped and divided to 128
(0x80). For an 8-bit two's complement alert register in the MAX6621
hardware, 0x80 is interpreted as -128 degrees C.

Could this cause continuous false thermal alerts and potential unintended
system throttling?

> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> index e86ec6d237ca6..9becd098d840b 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c
[ ... ]
> @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_ty=
pes type, u32 attr,
>  			 * The temperature is given in two's complement and 8
>  			 * bits is used for the register conversion.
>  			 */
> -			temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> -			*val =3D temp * 1000L;
> +			*val =3D (sign_extend32(regval, 15) >>
> +				MAX6621_REG_TEMP_SHIFT) * 1000L;

[Severity: Medium]
This is a pre-existing issue, but does this arithmetic right shift discard
the hardware's fractional temperature precision?

By shifting right by MAX6621_REG_TEMP_SHIFT (6 bits) before multiplying by
1000L, the lower 6 fractional bits are lost, dropping up to 0.984 degrees C
of precision.

Would it be better to multiply by 1000L first and then shift or divide to
expose the full fractional precision provided by the MAX6621 device?

The same precision loss also happens when writing hwmon_temp_offset in
drivers/hwmon/max6621.c:

drivers/hwmon/max6621.c:max6621_temp_mc2reg() {
    return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808083718.2612=
205-1-congnt264@gmail.com?part=3D1
