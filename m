Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284121;
	b=vsjt8U5FF7dNJ+/WTstvGaZ1Xs9OCOBwevp7VAublWeC36wGjcQpyitHyC4cTSzdQ0MC
	 XGw03zaHpa3RVLompIavXsrdSJqqq4YqEgDNpH6dsLNcYyI7oEE3GYQh+OyRwatuQ2EuP
	 2nBhwIXxiiXl5qlOQginXZX6yrouft0ZSzmwNWJ5MM9Tv4BmC1/UQnrV+ehIJpMQQ7WrI
	 CCcW/Enfql0kT7M17wFf08DmGmEAkfxZKQkR+4Hia+leVcOjdd/nA3smomrD9dW/56L/w
	 5yNDEOJp2d/mb4xLfwkMF5IjKiL4fsimTHq2ftORlQSnbDdOMwfujHBLjgozZN/9OAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284121;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sknkV/zRhFYs8UwOIYp7ieUtaq/HMq+smXlSs5iswKs=;
	b=YaHbQ/p3+wmHWrSxFLvUEb44zFZz98ZdK/qF53Qn+nZovI4qREXfgl/FIcnSfvcniQbM
	 1/De/g/PdpN8yl1XLrqbQDbWoITc40Js7m4M65aTVzHgGq7J337YhmXMmidVN/1/L0FCP
	 pf8icRKH9znXIj3HCDOpMwdjRx1sydvEAr9ikJbB1NnWeJSR5mWOnKTLyszaLhbgSXKJy
	 5DQApVWB9I0cCt14Oo0tE9JEF+ezaHrWO8IFFLRro0wH8X0Z3OC4BtRqEB9d3qOApALSj
	 FetzFebF1Zpi0pa0I8puYAND8tifqMleIjFi5Kdq/LsyzBeP0NfhBdVK8jb7o9ZAL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QAoBzU/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225C606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAoBzU/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338B11F008A1;
	Tue, 10 Nov 2026 04:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284121;
	bh=sknkV/zRhFYs8UwOIYp7ieUtaq/HMq+smXlSs5iswKs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QAoBzU/+l4VzydhWh0+J8oZlJS9HLiTGPrYqlkuRYGMckopEaOpROkhlJA64X71Hp
	 ZClvgP6wquDl3LM7hKO41Z8sEYolfgRwpZRMWXxmsa2wIBGWWm4v8k6OYigftcdkuY
	 uZ5a16H77OlQ4IKT6dbH/lLFba1UUcFceQdX7uVcQVFff7VJvwYphlZwD8wOrbdwie
	 9ElO58I1VFP0MwnQJqCWebxwODjNZnTcxTUkV01PIIalmukuZW5uzAPvS5JO/PWLdp
	 98fA0Ld759mM8xKwge22ZwO8XIvWHDY3Cc/dOvNni2koaJA5Uw17IwgAsWqDYF6piY
	 ZZ4ox+3JoQ7kQ==
Message-ID: <sashiko-outbox-206182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 1/3] hwmon: (nct6775) Fix target temp and tolerance
 for NCT6106/6116/6126
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261110035955.3968731-2-linux@roeck-us.net>
References: <20261110035955.3968731-1-linux@roeck-us.net>
 <20261110035955.3968731-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:15:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] hwmon: (nct6775) REG_TARGET marked word-sized in
  nct6775_reg_is_word_sized()
--

commit 7460f66a45ab993c8409879e58f676a24f6e5ad1
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126

This commit initializes target_temp_mask, tolerance_mask, and
speed_tolerance_limit for NCT6106, NCT6116, and NCT6126 in nct6775_probe().

Link: https://sashiko.dev/#/bug/linux-76f191d0-4c79-4982-887e-e5c9a2ed7136

> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 6e97e4f08b90b..9340525689cff 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -3574,6 +3574,9 @@ int nct6775_probe(struct device *dev, struct nct677=
5_data *data,
> =20
>  		data->fan_from_reg =3D fan_from_reg13;
>  		data->fan_from_reg_min =3D fan_from_reg13;
> +		data->target_temp_mask =3D 0xff;
> +		data->tolerance_mask =3D 0x07;
> +		data->speed_tolerance_limit =3D 63;

[Severity: High]
Does setting target_temp_mask to 0xff expose that REG_TARGET (0x111, 0x121,
0x131, and 0x191, 0x1a1 on nct6116/nct6126) is marked word-sized in
nct6775_reg_is_word_sized()?

drivers/hwmon/nct6775-core.c:nct6775_reg_is_word_sized() {
	...
	case nct6106:
		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D 0x24 ||
		  (reg >=3D 0x59 && reg < 0x69 && (reg & 1)) ||
		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 ||
		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D 0x131;
	case nct6116:
	case nct6126:
		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D 0x24 ||
		  reg =3D=3D 0x26 || reg =3D=3D 0x28 || reg =3D=3D 0x59 || reg =3D=3D 0x5=
b ||
		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 || reg =3D=3D 0xe=
6 ||
		  reg =3D=3D 0xe8 || reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D 0=
x131 ||
		  reg =3D=3D 0x191 || reg =3D=3D 0x1a1;
	...
}

Because nct6775_reg_is_word_sized() returns true for REG_TARGET, a read via
nct6775_read_value() performs a 16-bit big-endian read across REG_TARGET
(placed in bits 15:8) and the adjacent REG_TOLERANCE_H at reg + 1 (placed in
bits 7:0).  In nct6775_update_pwm_limits(), masking reg_t with
target_temp_mask (0xff) then discards REG_TARGET and stores REG_TOLERANCE_H
into data->target_temp[i], while also corrupting data->target_speed[i] in
speed_cruise mode.

When writing pwm*_target_temp in thermal_cruise mode, pwm_update_registers()
passes the 8-bit data->target_temp[nr] to nct6775_write_value(), which writ=
es
0x00 (value >> 8) to REG_TARGET and overwrites REG_TOLERANCE_H with
target_temp[nr].  Should 0x111, 0x121, 0x131, 0x191, and 0x1a1 be removed f=
rom
nct6775_reg_is_word_sized()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110035955.3968=
731-1-linux@roeck-us.net?part=3D1
