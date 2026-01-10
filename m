Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D8342C93;
	Sat, 10 Jan 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768047314; cv=none; b=KG3EmfBNzJYAV6sjpOSHYhKEJPfOHA+IPWn7joRIMPYJ4cMOKd54dTIsAhQruejBtYliccsX/iyUzRUt3jV8UpQ8P+MALWgURIWpQajT226dlLamcWhJtTvPVUPn1GLypLe8CI6YQ28rIJ6GLpIXWOifh2XAzBdFwGjDv6viYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768047314; c=relaxed/simple;
	bh=wv+KwB4TpsvG37CZJ2x5T2lkkwZZRllUZi7LzIwgB5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfeKtZq6RAjzP+2TFEDrlDM/hnkXcrzwk26xn0H7TCMIUnMw8nD5bqM3XsW08ixxST8madJ41tkLVVKL4mNhDPlEO6tB6aoVTJcv8IKawvzoDk3HOfOhqYTaJ2h1wuP/KPxltreITF4N+WKjOvWeaZf19CbIBYMqX/0sCQUKjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KJ+/HTcq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KJ+/HTcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768047296; x=1768652096; i=w_armin@gmx.de;
	bh=/wSg9qLWXf+BDwqgE9pfnbVuq5U65mA9QuLm9LAblpI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KJ+/HTcq9oB5laLWUN692IlZgUURHN2erf2dSWFNsqOGi/VKVLittRC7+Jb4MieK
	 +Vi4aNqD3vzx6PNYi+blIG565ich2UHe0cbGC4QBQV+H5OtizR+6F7cyyBsZbonLl
	 haSOh9nKBxoSQ/xvrLlffPt50KhLTBZe7a/UwoG+eJfuVWgZ01Rm7a9cLwSYMi4eC
	 d7Odu9PnOpV+yrIdkfkUqoFrZrHdv6QvlgXgUxOEpAUm0SSQafc2BD8zTnTgPj/iB
	 S1LP0n9rVyz/KeD0HP/H5meyTxHgnfYt2wkgJpAZq9aPN7+4kcUxnhWFj6bufKOeG
	 CIP9XoToIARdq7uU8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1vjn3Y2dR1-004741; Sat, 10
 Jan 2026 13:14:55 +0100
Message-ID: <85794882-64c2-4eec-ba40-82d534f01c3e@gmx.de>
Date: Sat, 10 Jan 2026 13:14:52 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Extend fan support to 5 fans
To: Andrew Mark <android606@gmail.com>, pali@kernel.org
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260110034732.236285-1-android606@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260110034732.236285-1-android606@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qWiKYQVXTh6kWbP3n0qRkjrpgpNThgGgAL1jr9MRMSCd+QbjvnP
 sRo0l8n7mErDELIcGDfZuXJAxhGrgkHlnRIr9dTEQhuzGw1ykkSIED9mR/9LWzbb5quKfwY
 mxHSDgWBuB1QFbliw9z4PoFrxUfrkPejZw146qlRZNGODxMwPDDS7mHPdmeRt79CQohJ8DC
 ck7U/qx9kNSSUwfMl2Hsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FdacCW20BDQ=;WMc+9kQrcLjl2HRHezXNOLstdYQ
 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
 DEX6xWser7NOlhGxTzap505W7FxFn

Am 10.01.26 um 04:47 schrieb Andrew Mark:

> Dell Precision Tower workstations have 5 fan connectors, but the
> driver was limited to 4 fans after commit dbcfcb239b3b ("hwmon:
> (dell-smm) Increment the number of fans").
>
> This patch increases DELL_SMM_NO_FANS to 5 and adds the necessary
> hwmon channel info for the fifth fan and its PWM control.
>
> Without this patch, the PCIe/GPU cooling fan (fan 5) is not
> controllable, which can lead to overheating on systems with
> high-power fanless GPUs that depend on chassis cooling.
>
> Also adds a DMI quirk for Precision Tower 5810 to provide accurate
> fan labels, as the BIOS reports generic types for these fans.
>
> Tested on Dell Precision Tower 5810 (BIOS A34) with all 5 fans
> responding correctly to PWM control.
>
> Fan mapping for Precision Tower 5810:
> - fan0: CPU heatsink
> - fan1: Second CPU (dual-CPU systems only)
> - fan2: Right DIMM bank
> - fan3: Left DIMM bank
> - fan4: PCIe/GPU cooling
>
> Signed-off-by: Andrew Mark <android606@gmail.com>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwm=
on.c
> index 6040a8940..b112e6fbc 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -74,7 +74,7 @@
>   #define DELL_SMM_LEGACY_EXECUTE	0x1
>  =20
>   #define DELL_SMM_NO_TEMP	10
> -#define DELL_SMM_NO_FANS	4
> +#define DELL_SMM_NO_FANS	5
>  =20
>   /* limit fan multiplier to avoid overflow */
>   #define DELL_SMM_MAX_FAN_MULT (INT_MAX / U16_MAX)
> @@ -175,6 +175,14 @@ static const char * const docking_labels[] =3D {
>   	"Docking Other Fan",
>   };
>  =20
> +static const char * const precision_tower_5810_labels[] =3D {
> +	"CPU Fan",
> +	"CPU Fan 2",
> +	"Right DIMM Fan",
> +	"Left DIMM Fan",
> +	"PCIe Fan",
> +};

Hi,

please use sensors3.conf to label you fans. Otherwise this driver will qui=
ckly
almost exclusively consist of DMI quirks for such labels.

The other changes are fine.

Thanks,
Armin Wolf

> +
>   static inline const char __init *i8k_get_dmi_data(int field)
>   {
>   	const char *dmi_data =3D dmi_get_system_info(field);
> @@ -991,6 +999,12 @@ static const char *dell_smm_fan_label(struct dell_s=
mm_data *data, int channel)
>   	if (type < 0)
>   		return ERR_PTR(type);
>  =20
> +	if (dmi_match(DMI_PRODUCT_NAME, "Precision Tower 5810")) {
> +		if (channel < ARRAY_SIZE(precision_tower_5810_labels))
> +			return precision_tower_5810_labels[channel];
> +		return "Unknown Fan";
> +	}
> +
>   	if (type & 0x10) {
>   		dock =3D true;
>   		type &=3D 0x0F;
> @@ -1129,12 +1143,15 @@ static const struct hwmon_channel_info * const d=
ell_smm_info[] =3D {
>   			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>   			   HWMON_F_TARGET,
>   			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
> +			   HWMON_F_TARGET,
> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>   			   HWMON_F_TARGET
>   			   ),
>   	HWMON_CHANNEL_INFO(pwm,
>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE
>   			   ),
>   	NULL
