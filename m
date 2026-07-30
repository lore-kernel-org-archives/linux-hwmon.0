Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595926056C;
	Thu, 30 Jul 2026 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447572; cv=none; b=Dy/BzfQaaOz0jynsCoWt8LqgC8zaJ+ZKlxN6ZP0394x6ZbiafrXkDbsAT5erHXAeRpEkkgtAJcmgaf06PFk0n79wPLXniAi8DMFY3eFLA1AvYNzgGJm4aYr4Y25EbwP0ZN2jnOTCp2JdX1XmRBqxqVTl9v1BlzRiTi7d9XcoT+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447572; c=relaxed/simple;
	bh=+0qOB90OYthR0tuDqK6+HVGdatp9Yi2b2xrXTKlEpzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDde4wynzcmjGb22n9ls6oCXkJ3zbnTxbvHevugiMqUa34Pav2x1Yel371sPDSYQ2Gi7G+3eO5cKdN4vcIIApnDSc+i1Nr8qa5krrzv3R9TmDhFP9Yy6HANOwUZT4StHxNMoGo3UF2+HUG8q1AzlD/GA18y/InDUp3ApGmBu/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQJT8jDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQJT8jDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FBA1F000E9;
	Thu, 30 Jul 2026 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785447570;
	bh=rocnL+uE5TuAdn0rNv7OyzgO2uC/Sa6xnqZbEfCu6fE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQJT8jDq5zzBkqdfYPN3hmUyREcDxbpRV9Z6p6h7H+yVlkgSIiOmGiW7mIiibGBo+
	 XBGtnrwllGuG7/8vlzDD3quD7MfxCUo3OMh5hSIvdVC5s0WnTjeBMzXL/0LRKVzxJh
	 MIQymQcr6CqvO6HshIzbAd9RrhOXgGT14mvngipkzzZPDr6bIa5aaWUVwD0SEdLjnd
	 atM9CnSzRgkpT2Bxfz8WFjxzbbIsCLGfGK7HcMXK0m/V4YVzpWNbTt6TYICN8BDAfZ
	 TzK0EhBprpmiHMafbkJFkTUqPJ6osnQXJyHy/kdGiazZrb9hjc9RdGLkZtyTSY7ULs
	 E1FJB3+qEWhPA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v5 3/4] hwmon: (adt7470) Expose fan control
 via PWM framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-adt7470_thermalzone-v5-3-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
 <20260730-adt7470_thermalzone-v5-3-42995a6bb8c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 21:39:29 +0000
Message-Id: <20260730213930.66FBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ADT7470 driver implements and registers secondary functional=
ity (PWM) directly in the hwmon driver, violating subsystem layering guidel=
ines.
--

--- Patch [3]: [hwmon-next PATCH v5 3/4] hwmon: (adt7470) Expose fan contro=
l via PWM framework ---
commit 8476b17bbf277543f8b1034721091c420371204b
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Expose fan control via PWM framework

The ADT7470 features four PWM outputs designed to control fans. This commit
exposes the ADT7470 fan control lines through the generic PWM framework,
allowing generic PWM consumers described in Device Tree to manage the fans.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 87ddd7b8ddaea..eeec3db0da88d 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
[ ... ]
> @@ -1328,6 +1497,29 @@ static int adt7470_probe(struct i2c_client *client)
> =20
>  	data->pwm_freq =3D (u32)freq_val;
> =20
> +	data->use_pwm_framework =3D false;
> +
> +	if (device_property_present(dev, "#pwm-cells")) {
> +		if (IS_REACHABLE(CONFIG_PWM)) {
> +			struct pwm_chip *chip;
> +
> +			chip =3D devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
> +			if (IS_ERR(chip))
> +				return PTR_ERR(chip);
> +
> +			chip->ops =3D &adt7470_pwm_ops;
> +			pwmchip_set_drvdata(chip, data);
> +
> +			err =3D devm_pwmchip_add(dev, chip);

[Severity: Medium]
Does this violate the hardware monitoring subsystem guidelines?

The guidelines state that if a hardware monitoring device supports secondary
functionality (such as PWM in this case), the secondary functionality should
be implemented as an auxiliary device, with the driver residing in the
appropriate subsystem directory.=20

Could this PWM functionality be split out into a separate driver under
drivers/pwm/ using the auxiliary bus, rather than implementing the PWM
operations and registration directly in the hwmon driver?

> +			if (err)
> +				return dev_err_probe(dev, err, "failed to register PWM chip\n");
> +
> +			data->use_pwm_framework =3D true;
> +		} else {
> +			dev_warn(dev, "#pwm-cells present but CONFIG_PWM disabled. HWMON PWM =
attributes not hidden.\n");
> +		}
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-adt7470_th=
ermalzone-v5-0-42995a6bb8c5@gmail.com?part=3D3
