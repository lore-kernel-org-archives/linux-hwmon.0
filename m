Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D988A3E3D92;
	Thu, 24 Sep 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240051; cv=none; b=UgUCgn30SsuL5fDg9bcWzN6/3eS8alxBAjBVcHe7qDCopeDM17d1NR6grZb6VS4TXI1RPPEdUT4JY37IzX+AeX/kRj3lwMYUdG/tuBOfv+s43aGkH+3fBEVUZq1OE1t4558wGNWiQn7w3XLcZEGmWT6c96CqmDa+ZEs4mmA74rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240051; c=relaxed/simple;
	bh=Cx1crZg02Bxn5Uwa0Ku/dIN3DwHrqo6qGUKSE4jIjt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gW/qaOBOaYxAxPHN4xYyYHVummlnYEmW8HjEfGivQpt16RGqYHVYlHXDcCZNnzuaW26V9sEammhx7Qb220cpVztEXehuydSxEe6+N4+IXhWRP2TrITAcXwG+fvMn8wedngfuj4MK0X9tV01gCZx9ZCr9f5XWk9mcUjSMQ9N3D7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZErrGoMK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZErrGoMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141B71F00893;
	Thu, 24 Sep 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240049;
	bh=krr2x0udYkPFmKkFm24MumfKmR0EC0aV0NUPyy6RiiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZErrGoMK4gjJtUpHXYQ8VjfztrLp/wmbwFH9Z16vABjVklbffIzGt5HVtriBCSalP
	 InmEiywRqHIPYVtouVNl7rWQk6C6p57ZDspZ+hUp8JypSdVpjSEjWH5NfMzyocfEzZ
	 bsRNZrhHZju7iVRKW7+6xo3PyN4KpJfDMUkxoS6N4jwiKCLDFhjEFcLp18PZPsNqRb
	 cOG2t7bQbVu/liWrJWQrgtYff98lEzBtxj/aBYPH8x+AuM57gwff0QuyE5zq+WB490
	 4VrHPkapYj0xvFI08kqtbfbS/HywkjxKoMrHuWXAbcQqOK9PmTWiOuPoTn909Zkw8/
	 k3La74MKoFJxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (lm75) add MAX31875 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260924084121.82-4-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
 <20260924084121.82-4-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:54:08 +0000
Message-Id: <20260924085409.141B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: lm75: incorrect bitmasks due to 16-bit byte-swap for MAX318=
75
- [High] hwmon: lm75: missing resolution state and hardware update for MAX3=
1875
--

commit db9c8895125f3a1241021e25bc19bc84126cb9c6
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

hwmon: (lm75) add MAX31875 support

Add support for the Maxim MAX31875 I2C temperature sensor by extending
the lm75 driver. The MAX31875 features a 16-bit configuration register,
configurable resolution (8, 9, 10, or 12 bits), and selectable conversion
rates (125ms, 250ms, 1s, 4s).

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 104149a03bad0..886f83c8b0420 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c

[ ... ]

> @@ -223,6 +224,15 @@ static const struct lm75_params device_params[] =3D {
>  		.default_resolution =3D 16,
>  		.default_sample_time =3D MSEC_PER_SEC / 20,
>  	},
> +	[max31875] =3D {
> +		.config_reg_16bits =3D true,
> +		.default_resolution =3D 10,
> +		.resolutions =3D (u8 []) {8, 9, 10, 12 },

[Severity: High]
Does the custom switch block for max31875 in lm75_update_interval() bypass
updating data->resolution, rendering this .resolutions mapping dead code?

Without updating data->resolution or the hardware resolution bits, the soft=
ware
would truncate or misinterpret temperature data (since it remains stuck at =
10
bits), and the hardware would be prevented from achieving higher sample rat=
es.

> +		.default_sample_time =3D 4000,
> +		.num_sample_times =3D 4,
> +		.sample_times =3D (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm =3D true,
> +	},

[ ... ]

> @@ -421,6 +431,9 @@ static int lm75_read(struct device *dev, enum hwmon_s=
ensor_types type,
>  			case tmp112:
>  				*val =3D !!(regval & BIT(13)) =3D=3D !!(regval & BIT(2));
>  				break;
> +			case max31875:
> +				*val =3D (regval >> 7) & 0x1;

[Severity: High]
Does this correctly extract the alarm bit? The SMBus word read returns
byte-swapped data (MSB in the lower byte, LSB in the upper byte).

Because of the swap, hardware bit D7 (alarm) maps to val bit 15. Shifting
regval by 7 incorrectly extracts D15 of the hardware register instead of D7,
returning garbage state when reading temp1_alarm via sysfs.

> +				break;
>  			default:
>  				return -EINVAL;
>  			}

[ ... ]

> @@ -495,6 +508,13 @@ static int lm75_update_interval(struct device *dev, =
long val)
>  			return err;
>  		data->sample_time =3D data->params->sample_times[index];
>  		break;
> +	case max31875:
> +		err =3D regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					 0x0600, (3 - index) << 9);

[Severity: High]
Does the conversion rate mask 0x0600 apply directly to the byte-swapped reg=
val?

With the swapped value, hardware bits D10/D9 map to bits 2/1 (mask 0x0006).
Using 0x0600 mistakenly clobbers the alarm polarity bit (D2) and fails to s=
et
the conversion rate.

Also, as mentioned above, this block bypasses the default resolution update
logic (data->resolution =3D data->params->resolutions[index]) and never upd=
ates
the hardware resolution bits, silently breaking the configured resolution
mapping.

> +		if (err < 0)
> +			return err;
> +		data->sample_time =3D data->params->sample_times[index];
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924084121.82-1=
-johnerasmusmari.geronimo@analog.com?part=3D3
