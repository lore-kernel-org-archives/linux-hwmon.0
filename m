Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A249CF5D;
	Mon, 31 Aug 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193978; cv=none; b=cu8d9sJ9ntC7KoTEq48TqZ3w+fzQJbuBE27H86rWi6M6lsu1ARDr5eI/W1UzcNZDVtlaLqVdIZWbQnGsbjb4eBQex3s3vr1Mlkk0pgsbAmIkc+DThvlAvaKghMdw64GlR3neuD9MXxH2kPDXwOuTAoxKTJhcZndN0BeYrgkeahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193978; c=relaxed/simple;
	bh=BNNX1ajrBO8EKZzIPFBjbSzjORauQbhS3/GWcciEIFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jG2lTQHHTDTqqlcTt/JgNoQFVgJygyTmbp/qjEnIicnlIhC9VvjIdGs0OoMLryLviXcqPvLfjpwtvc/KE86iR8/5kBU+HUSba08Eiflq+V050vz0/kpQ6hppy0TpB2iCawquQod8Q3fwaA6/budUcaI86QPPwfOeb0Kx2/0cB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFRAqnqF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFRAqnqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784771F000E9;
	Mon, 31 Aug 2026 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193977;
	bh=gE4DXtoO/m+u5zlqRBb3rtMzg0ZuzjzaJRXzc/vjykI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mFRAqnqF+9cIQxp2eGf8rsbnxupMcm5osRvzRtKpXwQrt5GPTpyPGIXjiwJkRqasV
	 aIaNJ6NiMEtZKpSq6QTxPRQQ+PlPWznbNYrvCySKy22psIYmc941p/Ttd9rpnpQ/Hh
	 Sls3Z3gmvKIRnP77kU7gou27j/7bSmtZZTCECNS+4FKhSKUCt4REDzs71/J0vv2nD/
	 6OHeBUuQyP6mD+TTR8nxQKVFFTQt2aymxN1iv6W4I18bW6ckP1YcO2kF9atmNTIamD
	 sZ3lKCFqmBsftqb44s+58MAKMaTumD/71nPngO9OWBU78h6rNzowNscvOvXxSytDYs
	 AdiOp5t369sYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-ctl2301-v4-4-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-4-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:32:56 +0000
Message-Id: <20260831163256.784771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] TEMP12_TO_REG and software caching logic fail to align with 12-b=
it hardware truncation, causing sysfs cache inconsistency.
--

commit c4469f3bd5935eebd0d31fe1d782461f5b52c354
Author: Troy Mitchell <troy.mitchell@linux.dev>

hwmon: (lm63) Add Sensylink CTF2301 support

This commit adds support for the Sensylink CTF2301 to the LM63 driver. It
registers an optional thermal cooling device when the device tree node
provides #cooling-cells and implements the specific temperature scaling for
the CTF2301 chip.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
[ ... ]
> @@ -121,6 +126,9 @@ static const unsigned short normal_i2c[] =3D { 0x18, =
0x4c, 0x4e, I2C_CLIENT_END };
>  							    127000), 1000)
>  #define TEMP8U_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), 0, \
>  							    255000), 1000)
> +#define TEMP12_FROM_REG(reg)	DIV_ROUND_CLOSEST((s16)(reg) * 1000, 256)
> +#define TEMP12_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
> +							     127937) * 256, 1000)
>  #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
>  #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
>  							     127875), 125) * 32)
[ ... ]
> @@ -594,6 +692,21 @@ static ssize_t set_temp8(struct device *dev, struct =
device_attribute *devattr,
>  		return err;
> =20
>  	mutex_lock(&data->update_lock);
> +	if (data->kind =3D=3D ctf2301 && nr =3D=3D 1) {
> +		temp =3D TEMP12_TO_REG(val);
> +		err =3D i2c_smbus_write_byte_data(client, LM63_REG_LOCAL_HIGH,
> +						temp >> 8);
> +		if (!err)
> +			err =3D i2c_smbus_write_byte_data(client,
> +							CTF2301_REG_LOCAL_HIGH_LSB,
> +							temp & 0xf0);
> +		if (!err)
> +			data->temp1_max =3D temp;

[Severity: Medium]
Does this sequence cause the sysfs cache to become inconsistent with the
hardware state?

The TEMP12_TO_REG macro scales the value but does not align or quantize it
to a 12-bit hardware boundary, leaving fractional bits present in the lowest
4 bits. Here in set_temp8, those lowest 4 bits of temp are masked out with
0xf0 when writing to the hardware register, but the unmasked temp is saved =
in
data->temp1_max.

If a user writes a temperature limit that is not a perfect multiple of 0.06=
25
degrees Celsius, will this cause the sysfs interface to return the
un-truncated value immediately after the write, but later shift to the
truncated value upon the next device poll?

> +		mutex_unlock(&data->update_lock);
> +
> +		return err ? err : count;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D4
