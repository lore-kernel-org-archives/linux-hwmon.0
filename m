Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E6340400
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754400; cv=none; b=IwSTVqcgKT0Jszl33tZNnX9TSsctRHvEHYsCvbnCtmtp4hZo/09HldLQ7Qz5LguaZXHaF8aS7YIDadJ2V6PjWfiXsFR+buLZ+hoKbQY/7dhr7LuAVHeIPBle/4Io51IYm4RdMPiC7pqJWqv0XAtC84gZ6lBe69Gba3hDKEtflWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754400; c=relaxed/simple;
	bh=uH9tOgxdDnzLT1oQ3U/U7emXSV8JbUuE+9VQZi21kio=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f+ydWhdO+KdyS41JFYBpCJ8eU4UxMv05Pyu24e3+rVoO4hXtd3Go/uigtpm0NDmsYjXE3MnzgeJiHP+5u9zIUtWV5FyLc/YHlzUwH+d8uFlp/p5ND5PFqEyOAqMKBYCJLZyN2T/1RgcKsh5WZWOPalQMN/eHlcEWf2rxGIJl1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=aI3S6Qv4; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="aI3S6Qv4"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202607222106253abad1d43f000207ee
        for <linux-hwmon@vger.kernel.org>;
        Wed, 22 Jul 2026 23:06:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/Tx4FUfIsblq/Zswf5P0eREfvzod3xoZ0U/Z5VWoe+g=;
 b=aI3S6Qv4K9gsYewIQGtAfLzXAtLdU0ldec4gSMzYMeKf+9p5Mnd4r0GMZYf9ptOaptnEe7
 O+4iDiNQJ/WcCIPgM7KFpe5EZsyCGBOcakUiOKhTRF9UgK8gQsbiZMWRx3MUtZ6YHBpvMv4H
 yg2D3kZd6smlaXq62N6SfYfS3ZtvLKgsUutR2P3suovRxQiFikGCUGMVu36O85CjtyyyjfZw
 Sn3s1RN4GzECvevn87fWQVbf9PFoALPtlGCOv6VtWDfAnpa5kQNsDHeJBVpnwrfMGxfflcbw
 mpcTiBd/yRs7Do/dJqkR9ASxu02HBMVG0jdD0B/sXIZ5kAvKlgv2FcWg==;
Message-ID: <b89e04deaef5e6612649c77700c089005f1410f9.camel@siemens.com>
Subject: Re: [PATCH] hwmon: (nct6775-core) Fix number of temperature
 registers for NCT6116
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Date: Wed, 22 Jul 2026 23:06:25 +0200
In-Reply-To: <20260722142846.2302075-1-linux@roeck-us.net>
References: <20260722142846.2302075-1-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Wed, 2026-07-22 at 07:28 -0700, Guenter Roeck wrote:
> Unlike NCT6106, NCT6116 only has three temperature registers, and with
> it only three temperature source and temperature source configuration
> registers. The register addresses match those of NCT6106 and can be
> re-used.
>=20
> The code used a separate array to list the temperature source registers
> for NCT6116, but used the size of the NCT6106 register array to set
> the number of registers. The NCT6106 register array provides six addresse=
s,
> while the temperature source register array for NCT6116 only provides thr=
ee
> addresses. This causes a KASAN report.
>=20
> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x936/0x46f0 [nct6775]
> Read of size 2 at addr ffffffffc19561a6 by task modprobe/954
> ...
> Call Trace:
>  dump_stack+0x7d/0xa7
>  print_address_description.constprop.0+0x1c/0x220
>  ? __kasan_kmalloc.constprop.0+0xc9/0xd0
>  ? __kmalloc_node_track_caller+0x194/0x5b0
>  ? nct6775_probe+0x936/0x46f0 [nct6775]
>  ? nct6775_probe+0x936/0x46f0 [nct6775]
> ...
>=20
> Fix the problem by hard-coding the number of temperature and temperature
> configuration registers to three for NCT6116. Drop the unnecessary
> NCT6116_REG_TEMP_SOURCE array and re-use NCT6106_REG_TEMP_SOURCE.

Thanks a lot for taking over and the super fast response/fix. Highly
appreciated!

Have you checked how far we get with the auto-stable apply process? I'm
expecting that 5.10 (and maybe 5.15 in addition) will need some manual
backporting. Happy to help there, just let me know.

>=20
> Reported-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> Closes: https://lore.kernel.org/linux-hwmon/57cfc3fa-d4e9-4c10-8aa7-4ad0a=
f7ebebe@roeck-us.net/T/#t
> Fixes: 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
> Cc: Bj=C3=B6rn Gerhart <gerhart@posteo.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>

> ---
>  drivers/hwmon/nct6775-core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index d668dc390def..51253acff4b0 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -846,8 +846,6 @@ static const u16 NCT6116_FAN_PULSE_SHIFT[] =3D { 0, 2=
, 4, 6, 6 };
>  static const u16 NCT6116_REG_PWM[] =3D { 0x119, 0x129, 0x139, 0x199, 0x1=
a9 };
>  static const u16 NCT6116_REG_FAN_MODE[] =3D { 0x113, 0x123, 0x133, 0x193=
, 0x1a3 };
>  static const u16 NCT6116_REG_TEMP_SEL[] =3D { 0x110, 0x120, 0x130, 0x190=
, 0x1a0 };
> -static const u16 NCT6116_REG_TEMP_SOURCE[] =3D {
> -	0xb0, 0xb1, 0xb2 };
> =20
>  static const u16 NCT6116_REG_CRITICAL_TEMP[] =3D {
>  	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
> @@ -3652,7 +3650,7 @@ int nct6775_probe(struct device *dev, struct nct677=
5_data *data,
>  		  =3D NCT6106_CRITICAL_PWM_ENABLE_MASK;
>  		data->REG_CRITICAL_PWM =3D NCT6116_REG_CRITICAL_PWM;
>  		data->REG_TEMP_OFFSET =3D NCT6106_REG_TEMP_OFFSET;
> -		data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;
> +		data->REG_TEMP_SOURCE =3D NCT6106_REG_TEMP_SOURCE;
>  		data->REG_TEMP_SEL =3D NCT6116_REG_TEMP_SEL;
>  		data->REG_WEIGHT_TEMP_SEL =3D NCT6106_REG_WEIGHT_TEMP_SEL;
>  		data->REG_WEIGHT_TEMP[0] =3D NCT6106_REG_WEIGHT_TEMP_STEP;
> @@ -3666,13 +3664,13 @@ int nct6775_probe(struct device *dev, struct nct6=
775_data *data,
> =20
>  		reg_temp =3D NCT6106_REG_TEMP;
>  		reg_temp_mon =3D NCT6106_REG_TEMP_MON;
> -		num_reg_temp =3D ARRAY_SIZE(NCT6106_REG_TEMP);
> +		num_reg_temp =3D 3;
>  		num_reg_temp_mon =3D ARRAY_SIZE(NCT6106_REG_TEMP_MON);
>  		num_reg_tsi_temp =3D ARRAY_SIZE(NCT6116_REG_TSI_TEMP);
>  		reg_temp_over =3D NCT6106_REG_TEMP_OVER;
>  		reg_temp_hyst =3D NCT6106_REG_TEMP_HYST;
>  		reg_temp_config =3D NCT6106_REG_TEMP_CONFIG;
> -		num_reg_temp_config =3D ARRAY_SIZE(NCT6106_REG_TEMP_CONFIG);
> +		num_reg_temp_config =3D 3;
>  		reg_temp_alternate =3D NCT6106_REG_TEMP_ALTERNATE;
>  		reg_temp_crit =3D NCT6106_REG_TEMP_CRIT;
>  		reg_temp_crit_l =3D NCT6106_REG_TEMP_CRIT_L;
> --=20
> 2.45.2
