Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FFC7478
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285173; cv=none; b=mhSPmUp8+bbSrmjz3NfIU6DEEbLX7mBeRiHZ19AmTzv9y31C5Pph4VAUcIWyd9FhWI9u7be+3R4cfhmH8fuoGx/UhXZha27E7Cpsow8tm41e/7xl0bBCiha6h+h+sgYe3FGQRXOhDUaTRrCyl/Ip10m37UZhdzVoaYe0XVA2/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285173; c=relaxed/simple;
	bh=XqE7jC4BcQW4A5gb4SuDkA+AtRbgKcKSlp0cI+SMCtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h2Ou28n+DFmshBIqy+PTWd29zqOVcCDkUp5ao8eggKOE9/5oDcux42FugSaQYgTmdbSTnj7E8IL5g3P5lsMFKMkQPVUKGysYUBwIkQ5lml2Hog2Crujct44oczr/B5ZlNCpVEd9EL+gtPTk1aNgNZ2I437D1pYI/AickcBzcJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvlGh6T9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvlGh6T9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91314C2BCB0;
	Sat,  9 May 2026 00:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285172;
	bh=XqE7jC4BcQW4A5gb4SuDkA+AtRbgKcKSlp0cI+SMCtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LvlGh6T90P0SnpuU/13SLnKCrvA4db9GjINy9tfWS+sf2GCRIPoGWRovPnjwtVZSh
	 3fewh+8zBXUCb8pY61cM2EpnQMp6vWuszFWUhAJ/fUPxWtJtf9QyNRnhYyaRj+6GAq
	 n5YNv2KKV6SSVQyac87+ts64hqfD5Ajoatr2Nj6rOwRPU0xgy0Kidt6ERFKKU7s93G
	 qRZJtdjrENci5e0287W8dZP1RHg1xFtgGQTVgAvU3dzQhJsD4cf9BdW8oGVNbfLpPp
	 XCgoKxZHFL9tOhVx8CLF9mr7XbbboplvOpXjT1mpquDEZplJC6n9zDzUlejdrt+ZI3
	 Y/UjBgOWuZxig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] hwmon: (pmbus/adm1266) write fractional-seconds
 field of SET_RTC
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-2-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-2-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:06:12 +0000
Message-Id: <20260509000612.91314C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] 64-bit division using the `/` operator will cause build failures on=
 32-bit architectures.
--

commit f0fa424ad89f6e68ea279a8fd355cf480c9af8fc
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) write fractional-seconds field of SET_RTC

This commit updates the adm1266 driver to write the fractional-seconds field
of the SET_RTC register. It samples wall-clock time as a struct timespec64
and converts tv_nsec to a 16-bit fractional representation using 64-bit
arithmetic.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index a86666c73a5e9..ba8a025095287 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -428,16 +428,23 @@ static int adm1266_config_nvmem(struct adm1266_data=
 *data)
[ ... ]
> +	/*
> +	 * SET_RTC frame layout (datasheet Rev. D, Table 84):
> +	 *   bytes [1:0] =3D fractional seconds, LSB =3D 1/65536 s
> +	 *   bytes [5:2] =3D seconds since 1970-01-01 UTC
> +	 */
> +	frac =3D (u16)(((u64)ts.tv_nsec << 16) / NSEC_PER_SEC);

Will this cause build failures on 32-bit architectures?

The compiler lacks built-in hardware support for 64-bit division on 32-bit
architectures and emits a call to an intrinsic like __udivdi3, which is not
available since the kernel does not link with libgcc.

Should this use the div_u64() helper function instead, such as
div_u64((u64)ts.tv_nsec << 16, NSEC_PER_SEC)?

> +	for (i =3D 0; i < 2; i++)
> +		write_buf[i] =3D (frac >> (i * 8)) & 0xFF;
>  	for (i =3D 0; i < 4; i++)
> -		write_buf[2 + i] =3D (kt >> (i * 8)) & 0xFF;
> +		write_buf[2 + i] =3D (ts.tv_sec >> (i * 8)) & 0xFF;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D2
