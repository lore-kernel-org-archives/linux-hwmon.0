Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD540D57A
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186828; cv=none; b=YtKNf65cFhR3MXi8CHaeKDcCM/eH6b4UdBuw/VrRXIELW1nRw5Anva3KBOD0wKquo2Rgp9okNlcy3mWSH3e5pjyTZxgLU274PiKBg+Z2dDVF28bSniWOE60W7dbYFyVXnMlWdvLFfp2IKsQa0vdfau4dp28T1bU8oPqu5Y9vOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186828; c=relaxed/simple;
	bh=FkLMZqypGruYbrA1G7dDdjiLV79ibp78Ghg6kaOQwZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdLrtebp6VTHqWHhnk1ZSK/uMkZVEZ2DYFaQNUaEcSQZoyWdldaJm20uCNm4z97y1PgY22dibYVlrlBHyNYaaDtMRmc63tX/nMn9OnWzbOf7cEHqE5Nlsz6EKuFb7hqISDRbiuGiq1eM3rbDsDNp3tS6K1NP85Yydy2zByMiYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsBied+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsBied+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD961F00893;
	Thu, 11 Jun 2026 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186826;
	bh=ML3pogfSq1j7y/ouS6X4JiqBnxNnMw2Ga8XIPlgKmkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nsBied+vpAjchA3IPmaDoycarCSmbkFZOuw5S9oI3Gh9OUCFy3uaftU3LkvCu2dz5
	 GVnhhWwgYzQwD9aOl9pz9EdtkpUmhxO+wZ7osSTBzP/Hqa95YmHM8+gDuFHSzMgZNB
	 jz+V7BwEwo/DDZtzAt8KduM5iZb3ofqZYzQr1KLNyWDdF2mMqPV2wAiGb5IlTiArT/
	 ZfjUZbPeZCh3u1ywIQvHxZHzPl+Bbp4um89Uh1GfJkRO8I8DLJtjMU1ePAkJVg62i8
	 SMPxte6kImRSyDCn6YwHBfqKzDKSdO/7tvnqEX9It8ur4Bbp2tqL72QzfshkDj0f/4
	 e6Zb+XVvC6t4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611135706.826074-1-linux@roeck-us.net>
References: <20260611135706.826074-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:07:06 +0000
Message-Id: <20260611140706.7DD961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clamping to LONG_MAX/LONG_MIN before DIV_ROUND_CLOSEST guarantees =
signed integer overflow/underflow on 32-bit platforms.
--

commit 6fb047c808b5329542311277defe6fdce7b455f0
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ina2xx) Fix overflow issues

This commit fixes several integer overflow issues in the ina2xx driver
by upgrading intermediate calculations to 64-bit and adjusting the
clamping limits. It also updates the return type of ina2xx_get_value=20
to long to better support 64-bit systems.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c

[ ... ]

> @@ -283,12 +285,13 @@ static int ina2xx_get_value(struct ina2xx_data *dat=
a, u8 reg,
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);
>  		break;
>  	case INA2XX_POWER:
> -		val =3D regval * data->power_lsb_uW;
> +		val =3D clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
>  		break;
>  	case INA2XX_CURRENT:
>  		/* signed register, result in mA */
> -		val =3D ((s16)regval >> data->config->current_shift) *
> +		val64 =3D (s64)((s16)regval >> data->config->current_shift) *
>  		  data->current_lsb_uA;
> +		val =3D clamp_val(val64, LONG_MIN, LONG_MAX);
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);

[Severity: High]
Can clamping to LONG_MAX and LONG_MIN here cause a signed integer overflow
on 32-bit systems?

Since val is clamped to the absolute limits of a signed long, when it is
subsequently passed to DIV_ROUND_CLOSEST(val, 1000), the rounding macro
will add 500 to positive values or subtract 500 from negative values.

Could this operation overflow LONG_MAX and underflow LONG_MIN, causing the
value to wrap around and return the opposite sign instead of the intended
clamped maximum limit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611135706.8260=
74-1-linux@roeck-us.net?part=3D1
