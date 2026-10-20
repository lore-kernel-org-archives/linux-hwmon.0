Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497293;
	b=yki7Zoj/HMfvbxIFohuM6y1/tdCqjpkHlhvffoRf03Mx/HapGYFvRqpA/HKDEATQj8nb
	 bO47t0xAncbkuXFDjcsv3oSDZCka6hTPoMuO9/reiWX3ed4WlmEKefHRTHVloz4cx9eHj
	 YlF4pe4KDNnNg7GwNL3UDcrYOxlaq3iSzvfHMWtzLiU9U8R+slRjYsYNrVT0oiaFrkxTm
	 YNzd5bKc7GUKwDARhvveWySxxJzqMCGV9w+Zh0vWVoXxL+TKzMZv358y+GVarCVzGHNkE
	 xwr2Xz8kCRcBn+j4CcsxM+y1Ta7dYI58Q3+WB4M6eji5Zn7VmTZz9zsiEYDPqCASb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xfRwG8X+ykUW8NNjFRur+IdHQGPwptgNmDIzfO/YArU=;
	b=xuTkOSiN55CO+VXA3fL+9aJihvD8P96VjYZBSH4R4Ja7dYL47QCCOInRjh/KevYBR+qP
	 wLzqwdPzheZIidUyuDI9ZRoWPq3nXN0zndK42vaICBRpVruThYDmkwrSbJlKvAWJWW+ya
	 bF/PoLF3NU+itSxlFNmQyG7GOCc0R69c8YSuAeoDIZenj4oHMi3euyNTnWH4V+BjMwE3I
	 dz8XhvpQJnZ1fI5cvVqu4KKFonFwqhAj6A3tTbNaVGCYH1wa1ZbzkfYFFC2m0OSx2NpxF
	 H+jRodd4pmTbcgnhC+/vt7Bdq64tknMp/gEII20nRKGFPE5GW04NdhHfKBEYGpoRgDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFoAmWWG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162C606A31C;
	Tue, 20 Oct 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFoAmWWG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E313D1F000C4;
	Tue, 20 Oct 2026 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497292;
	bh=xfRwG8X+ykUW8NNjFRur+IdHQGPwptgNmDIzfO/YArU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFoAmWWGhU3ygcZ03TkaiePrO3W2Ap7Q7Mg/qxyHIBlBPH8IFd1X6bYd4tEeJToyR
	 114etl/bgwMJkCNxprNm+4xEozV7xda7qO1pinaF1EbBt6ZPDTOpGDlNElGARg2Z8U
	 TkN9lIbwHOUIZDgMTUUZu5+lSaE3EwBbSte1UI4YM5utfndytYA5LNIXqaDk0PE5qn
	 Tso7MDpyD5L2uEBf8q6k+/3SETJ6ddkMqbDBxne00G7NDAZVqlFxJUu1S53KwSB3Tj
	 uO8xgzoq/DPbjJdV6+15UsnOgTQzn/YDAEeOB8BQ/0R2ZVhsB60IoeCMNh7o+HviKS
	 AW5M7YHubzlgQ==
Message-ID: <sashiko-outbox-178910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: ltc2978: Document LT7175 and LT7176P support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-3-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-3-86b9b728b95d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 11:54:51 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: (pmbus/ltc2978) uninitialized stack read in ltc2978_get_i=
d()
- [Low] hwmon: ltc2978: incorrect curr1_label documentation for LT7175 and =
LT7176P
--

commit 920a8e47ce82192a2f0425722db911c23eb2b4ca
Author: Christopher de Guzman <christopher.deguzman@analog.com>

hwmon: ltc2978: Document LT7175 and LT7176P support

This commit documents support for the LT7175/LT7175-1 and LT7176P/LT7176P-1
PMBus buck regulators in the ltc2978 hwmon driver documentation, which were
added in commit 51707b022513 ("hwmon: (pmbus/ltc2978) Add support for LT7175
and LT7176P").

> diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc297=
8.rst
> index 0b72d566cac70..3d30ce5cac95d 100644
> --- a/Documentation/hwmon/ltc2978.rst
> +++ b/Documentation/hwmon/ltc2978.rst
> @@ -21,6 +21,22 @@ Supported chips:
> =20
>      Datasheet: https://www.analog.com/en/products/lt7171.html
> =20
> +  * Analog Devices LT7175, LT7175-1
> +
> +    Prefix: 'lt7175'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/en/products/lt7175
> +
> +  * Analog Devices LT7176P, LT7176P-1
> +
> +    Prefix: 'lt7176p'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/en/products/lt7176p
> +

[Severity: Medium]
In the preceding commit 51707b022513 ("hwmon: (pmbus/ltc2978) Add support
for LT7175 and LT7176P"), can ltc2978_probe() -> ltc2978_get_id() in
drivers/hwmon/pmbus/ltc2978.c read an uninitialized byte from buf[6] on the
stack when checking for "LT7176P"?

In drivers/hwmon/pmbus/ltc2978.c:ltc2978_get_id():

	if ((chip_id & LTC2978_ID_MASK) =3D=3D LT7170_ID) {
		u8 buf[I2C_SMBUS_BLOCK_MAX];

		ret =3D pmbus_read_smbus_i2c_block_data(client, PMBUS_IC_DEVICE_ID, buf);
		if (ret < 0)
			return ret;
		if (ret < 6)
			return -ENODEV;

		if (!strncmp(buf, "LT7170", 6))
			return lt7170;
		if (!strncmp(buf, "LT7171", 6))
			return lt7171;
		if (!strncmp(buf, "LT7175", 6))
			return lt7175;
		if (!strncmp(buf, "LT7176P", 7))
			return lt7176p;

pmbus_read_smbus_i2c_block_data() in drivers/hwmon/pmbus/pmbus_core.c copies
only ret bytes into buf without NUL-terminating it or initializing remaining
bytes.

Since the length check only enforces ret >=3D 6, if a device returns 6 bytes
with buf[0..5] containing "LT7176", strncmp(buf, "LT7176P", 7) will read the
uninitialized 7th byte at buf[6]. Should the "LT7176P" check verify ret >=
=3D 7
first?

[ ... ]

> @@ -432,9 +450,9 @@ power[N]_input		Measured output power.
> =20
>  curr1_label		"iin".
> =20
> -			LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886,
> -			LTC3887, LTC3889, LTM4644, LTM4675, LTM4676, LTM4677,
> -			LTM4678, LTM4680, and LTM4700 only.
> +			LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883,
> +			LTC3884, LTC3886, LTC3887, LTC3889, LTM4644, LTM4675,
> +			LTM4676, LTM4677, LTM4678, LTM4680, and LTM4700 only.
> =20
>  curr1_input		Measured input current.
> =20
> @@ -452,7 +470,7 @@ curr1_reset_history	Reset input current history.
> =20
>  curr[N]_label		"iout[1-4]".
> =20
> -			- LT7170, LT7171: N=3D1
> +			- LT7170, LT7171, LT7175, LT7176P: N=3D1

[Severity: Low]
Should LT7175 and LT7176P be omitted from the curr1_label "iin" list above?

In drivers/hwmon/pmbus/ltc2978.c:ltc2978_probe(), the lt7175 and lt7176p
configuration sets:

	case lt7175:
	case lt7176p:
		...
		info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
		break;

Because PMBUS_HAVE_IIN is not enabled for these chips, curr1 is "iout1" (as
documented in the curr[N]_label N=3D1 entry) rather than "iin".

>  			- LTC2972: N-1-2
>  			- LTC2974, LTC2975: N=3D1-4
>  			- LTC2977, LTC2979, LTC2980, LTM2987: not supported

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-upstream-l=
t7175-lt7176p-v1-0-86b9b728b95d@analog.com?part=3D3
