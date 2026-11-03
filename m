Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713379;
	b=MQhWnEBolTCIXoC4kaX85LtjGHEO8z1O9nXe5AIt68Vw7aj5kGCzdIsirHh3uxaYCYx6
	 0f0GFwjs86+Nk6Azc8sN0akJC4qWS6ZVfZoQRGJWIeA1kbWnUZeRhyKDwtkF3EZt/02ku
	 TPUZMvg/qwEhdVVMYj/UGxIpoBYG4KZguHLEaQlXCi3sTGu23U3Jvu6a5Vf147AQe7C7N
	 f+ZUdmMuh8xKScLkvtT2WzywHAwzTeXJVLGDUxtOPygG7nzBtVRMDk+TX9Cxe+IIESvG1
	 6Ef2sNwHrZGHbFbjb0nvwFshiM5HdkNbnmfeetNNjlX3wEW2hto0+SYCyEgo25ZEjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=11Qj61z5lLpd3NrgWFSFh6udsjTU6BzEfDQuLC7IOLI=;
	b=pTazUS9HJ+ecPA84LpSqept48hgn00TQq+37Aag1fDqr4VgI5u9b83/zHKotosEyJ419
	 wK2A1IFnT17Pgo7TZ35K1JJXH+0TQJt29C/6+RM4VvHI8oJ7IZ7caVDjG2Xhs30cUqPpI
	 +Gj8ZdUnUV60hKii6ljvAvwkgw8IO1kT80goYfQiRx/mJMgcmhBrz2nSurfLD5E90FK9v
	 svXA5JBKlrRlKMazx4J3I1BDuaE2C0yFLFhpAN/XMaVGrApfXDKdSBjuU6JcGkJI82pfz
	 jViKyle0OUlg9ps4ASopAvtoAH0LYttC+nb2jlcQRSAPnNWHLZAgkXG2z3Nct9TtuWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qj2ODaSF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2185F606A332
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qj2ODaSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AD31F00A15;
	Tue,  3 Nov 2026 13:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793713378;
	bh=11Qj61z5lLpd3NrgWFSFh6udsjTU6BzEfDQuLC7IOLI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Qj2ODaSF8MdVKN1983xhcwkgrpyMsr5v+fK6cKNvr6YQEoBq7KC+S/q/4XNIeWAKv
	 uoGi92h5n5mk9pKHS8D+JsYvN8UMLsjV7vomEA0G4ZDNW3Uu5+U8X9mHtnKCBE/HRu
	 FhdZgApr+HY2ZYshAznxHwnGYGn1efd6VI9MzvKDDaQrUmwIPplMNlJvkjnV1QlsBR
	 reu7CLUcH1F/6OiNDRdv/rVSoLkcGO7AJ58TrOfl8egLyKSvcNjwVy6Dp+NL6m60iA
	 5wg/HxsC6pUdC0KV5tymuS8UmYXhCqzZ2OPqEeYb0dS+GAk8ej/rdAzEf40loNI1rb
	 gAyc04UQOTxIg==
Message-ID: <sashiko-outbox-195388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anton Lundin" <glance@ac2.se>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261103132948.144216-1-glance@ac2.se>
References: <20261103132948.144216-1-glance@ac2.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:42:58 +0000
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
- [Medium] hwmon: (nct6775) nct6775_reg_is_word_sized() corrupts NCT5525 ta=
rget regs
- [Low] hwmon: (nct6775) no-op fan_debounce handling in nct6775_platform_pr=
obe_init()
--

commit b2c50b829c2c187ba7bd478ebf5b2095ec0b4f6d
Author: Anton Lundin <glance@ac2.se>

hwmon: (nct6775) Add support for NCT5525

This commit adds hardware monitoring support for the Nuvoton NCT5525D
chip to the nct6775 core, platform, and i2c drivers, as well as the
device tree bindings and documentation.

> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index cf27b9c7a89ed..fb99bdf16764a 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c

[ ... ]

> @@ -1191,6 +1224,10 @@ bool nct6775_reg_is_word_sized(struct nct6775_data=
 *data, u16 reg)
>  		  (reg >=3D 0x59 && reg < 0x69 && (reg & 1)) ||
>  		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 ||
>  		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D 0x131;
> +	case nct5525:
> +		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D 0x28 ||
> +		  reg =3D=3D 0x59 || reg =3D=3D 0x5b || reg =3D=3D 0xe0 || reg =3D=3D =
0xe2 ||
> +		  reg =3D=3D 0xe8 || reg =3D=3D 0x111 || reg =3D=3D 0x121;

[Severity: Medium]
Should registers 0x111 and 0x121 be marked as word-sized in
nct6775_reg_is_word_sized() for nct5525?

In drivers/hwmon/nct6775-core.c, nct6775_probe() configures nct5525 with:

	data->target_temp_mask =3D 0xff;
	data->REG_TARGET =3D NCT6106_REG_TARGET;
	data->REG_TOLERANCE_H =3D NCT6106_REG_TOLERANCE_H;

where NCT6106_REG_TARGET is { 0x111, 0x121, 0x131 } and
NCT6106_REG_TOLERANCE_H is { 0x112, 0x122, 0x132 }.

When 0x111 and 0x121 are marked as word-sized, nct6775_read_value() performs
a 16-bit big-endian read across reg (high byte) and reg + 1 (low byte), and
nct6775_write_value() writes value >> 8 to reg and value & 0xff to reg + 1.

However, nct6775_update_pwm_limits() and pwm_update_registers() treat
REG_TARGET and REG_TOLERANCE_H as separate 8-bit registers:

drivers/hwmon/nct6775-core.c:nct6775_update_pwm_limits() {
	...
	err =3D nct6775_read_value(data, data->REG_TARGET[i], &reg_t);
	if (err)
		return err;

	/* Update only in matching mode or if never updated */
	if (!data->target_temp[i] ||
	    data->pwm_enable[i] =3D=3D thermal_cruise)
		data->target_temp[i] =3D reg_t & data->target_temp_mask;
	if (!data->target_speed[i] ||
	    data->pwm_enable[i] =3D=3D speed_cruise) {
		if (data->REG_TOLERANCE_H) {
			err =3D nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
			if (err)
				return err;
			reg_t |=3D (reg & 0x0f) << 8;
		}
		data->target_speed[i] =3D reg_t;
	}
	...
}

And on write in pwm_update_registers():

drivers/hwmon/nct6775-core.c:pwm_update_registers() {
	...
	case speed_cruise:
		err =3D nct6775_write_value(data, data->REG_TARGET[nr],
					  data->target_speed[nr] & 0xff);
		...
	case thermal_cruise:
		err =3D nct6775_write_value(data, data->REG_TARGET[nr], data->target_temp=
[nr]);
	...
}

Because REG_TARGET[i] is read as a 16-bit big-endian value spanning 0x111
and 0x112, masking reg_t with target_temp_mask (0xff) discards byte 0x111
and reads byte 0x112 (REG_TOLERANCE_H) as the target temperature. Similarly,
writing an 8-bit value to REG_TARGET[nr] in pwm_update_registers() writes
0x00 to 0x111/0x121 and overwrites 0x112/0x122 with the low byte.

> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-pla=
tform.c
> index d359c28f3e0f3..3bc7a27d58a60 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c

[ ... ]

> @@ -919,6 +926,8 @@ static int nct6775_platform_probe_init(struct nct6775=
_data *data)
>  		case nct6126:
>  			tmp |=3D 0xe0;
>  			break;
> +		case nct5525:
> +			break;
>  		case nct6775:
>  			tmp |=3D 0x1e;
>  			break;

[Severity: Low]
In drivers/hwmon/nct6775-platform.c, when fan_debounce is enabled in
nct6775_platform_probe_init(), the nct5525 case breaks without setting any
bits in tmp, and then falls through to write the unchanged tmp value back to
NCT6775_REG_CR_FAN_DEBOUNCE and log "Enabled fan debounce for chip ...":

drivers/hwmon/nct6775-platform.c:nct6775_platform_probe_init() {
	...
		sio_data->sio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
			     tmp);
		pr_info("Enabled fan debounce for chip %s\n", data->name);
	}
}

Should nct5525 either set the appropriate debounce bits in tmp or skip
writing NCT6775_REG_CR_FAN_DEBOUNCE and logging that fan debounce was
enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103132948.1442=
16-1-glance@ac2.se?part=3D1
