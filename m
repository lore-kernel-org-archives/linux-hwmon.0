Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E239021F;
	Sun, 23 Aug 2026 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517006; cv=pass; b=cc22d9QByud9lMK/B4JB0mywrD/NkKJD3TfVARLW1PYV1DXHYv9xaA9pHiTChtWy357xRJyGfcf/oXf3k0U6hqwG1Icfk77gmO3narBIy9gRqgVs12uNQSSfexkhOb0lSHqBeRBfQlieZAdX3YGR26vOGYUoACa09JCTXNS7DlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517006; c=relaxed/simple;
	bh=mPAXQb5cLxEQWiywYFh0+YwWkdUa7UQs8BcynNTz/eQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QuqRouaO1aNGrGnksWFLFAIHHtEmk0F0XGbsAy2+IpFVsYueH2jUrXIz73aog2v8DdbK6rmGhbEleKvy0fKwgDVvu8eHaRXSQ3Ayb4Au8DXZYeLDLpk0M4vlvPexGaLwTcW/Vq/Xpv2/iwkjw+4X6OdhLPzmISDf8qd3Zx+cIhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Pp+WMdSV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Pp+WMdSV"
ARC-Seal: i=1; a=rsa-sha256; t=1787516982; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S9M/0kvRQYVphSFpyWhdwWczYeGAMpJjSJXdcbo6QY5Dy61VR867EpeU1OTxCk//61usDHX+N+ybCH2MZ2SMvLFcMlOSCqy/ZvnNR7uyWHhnmD7eTsnFGulv9CAyCRS8ExgaYMwkFElYDpsHYQLMmM2GxnGNv0c+GoxGmuIIX4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787516982; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z8WhSxGKsUDe8vqMKRZ0/F6e2d4Nok4EuhTZfJNqbxk=; 
	b=SJdUYHioCKvc5G5TBuxQvN3g/udPCr8f4XVM6UjVc9mNr542z3RUmfK8a22aCSRs82a6sJmSyFdQ2AUiShOT9xTOA8pdehlXNM37YFWq2ZFzrT3lJo+Lo4of81CYuv20cx7tBckaI+FzAY/N55cd+NkVLCJOoBmezvvE/gEijzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787516982;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=z8WhSxGKsUDe8vqMKRZ0/F6e2d4Nok4EuhTZfJNqbxk=;
	b=Pp+WMdSViY5P9F44Ga78va8TjIbdGyVF86DrLykHoeizk/l8ivEJS2SgB2BoWzcu
	NtJQSEi3p3CPtpg71duyHPqnsQtuIzwPfIv4yfVTfr60j3hA8lXP/0o7kAld0Fxkl8O
	w5MDEYYXTvOWfr7qN0cPdPuIjJaq954DLdXE+Wry5UQm8hrO6QFYcEfyQXBiqaCqg5C
	diBU47UsC4NY9APk8MFrGZzHJtdOS2bixVjHdVJQB3gK5bFF8tap7v4mQnQ0tgLf1Vq
	mcrx2ZCQHCBAsQIhqo/uDc4Vpb3jbG2xCRFxLEHlSnWaVBss5fMGMhUFVC/yw0z+f4Y
	A4BMbG3W7g==
Received: by mx.zohomail.com with SMTPS id 1787516979716711.5612850224984;
	Sun, 23 Aug 2026 13:29:39 -0700 (PDT)
Message-ID: <04855f0232f530ae2b051bda9e5f07a58f8a4a4a.camel@rong.moe>
Subject: Re: [RFC PATCH 2/3] platform/x86: lenovo-wmi-other: Add Legion Go
 fan RPM fallback
From: Rong Zhang <i@rong.moe>
To: Aditya Dash <mradityadash@gmail.com>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260821214728.87773-3-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
	 <20260821214728.87773-3-mradityadash@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 04:23:40 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Aditya,

On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
> Some Legion Go firmware does not mark fan 1 RPM as readable in Capability
> Data, although Other Mode feature 0x04030001 returns the current RPM. As =
a
> result, lenovo-wmi-other hides fan1_input.
>=20
> When the normal VALID and GET flags are missing on a supported product,
> try one read from the Other Mode feature. Expose fan1_input as read-only
> if the read succeeds and does not return 0xffffffff. Treat a later
> 0xffffffff reply as an unavailable reading.

U32_MAX

>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-other.rst |  4 ++++
>  drivers/platform/x86/lenovo/wmi-other.c        | 14 +++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 75f2deaaef16..c93e9e6f3fd0 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -56,6 +56,10 @@ On supported Legion Go models, Other Mode feature ``0x=
04020000`` controls
>  Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. V=
alue 0
>  enables Full Speed, and value 2 returns fan control to firmware.
> =20
> +Some Legion Go firmware does not advertise fan 1 RPM through Capability
> +Data. In that case, the driver reads Other Mode feature ``0x04030001`` f=
or
> +``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
> +

The documentation does not mean to record the implementation details.
Drop the paragraph and tell your LLM not to ramble.

>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c180933e1d18..b4be7739b243 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -98,6 +98,7 @@ enum lwmi_feature_id_psu {
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> =20
>  #define LWMI_FAN_DIV 100
> +#define LWMI_FAN_RPM_NORMAL_SUPPORT (LWMI_SUPP_VALID | LWMI_SUPP_GET)

Inline it.

> =20
>  #define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
>  #define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
> @@ -195,6 +196,7 @@ struct lwmi_om_priv {
> =20
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>  	bool fullspeed_supported;
> +	bool fan0_input_fallback;

You LLM was over-engineering things. Shouldn't overriding fan_info being
enough?

   priv->fan_info[0].supported |=3D (LWMI_SUPP_VALID | LWMI_SUPP_GET);

> =20
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -343,6 +345,8 @@ static umode_t lwmi_om_hwmon_is_visible(const void *d=
rvdata, enum hwmon_sensor_t
>  		return 0644;
> =20
>  	if (type =3D=3D hwmon_fan) {
> +		if (channel =3D=3D 0 && priv->fan0_input_fallback && attr =3D=3D hwmon=
_fan_input)
> +			return 0444;
>  		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>  			return 0;
> =20
> @@ -419,6 +423,8 @@ static int lwmi_om_hwmon_read(struct device *dev, enu=
m hwmon_sensor_types type,
>  			err =3D lwmi_om_fan_get_set(priv, channel, &retval, false);
>  			if (err)
>  				return err;
> +			if (channel =3D=3D 0 && priv->fan0_input_fallback && retval =3D=3D U3=
2_MAX)
> +				return -EIO;

Don't over-engineer it. You can safely interpret U32_MAX as -EIO in any
cases.

Therefore, please move the check into lwmi_om_fan_get_set().

> =20
>  			*val =3D retval;
>  			return 0;
> @@ -542,6 +548,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chi=
p_info =3D {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +	u32 rpm;
>  	long enable;
>  	int i, valid;
> =20
> @@ -563,6 +570,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *p=
riv)
> =20
>  	priv->fullspeed_supported =3D
>  		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +	priv->fan0_input_fallback =3D
> +		lwmi_fan_supported() &&

???

Don't call it again. Simply consult priv->fullspeed_supported.

> +		(priv->fan_info[0].supported & LWMI_FAN_RPM_NORMAL_SUPPORT) !=3D
> +		LWMI_FAN_RPM_NORMAL_SUPPORT &&

!(priv->fan_info[0].supported & LWMI_SUPP_VALID) ||
!(priv->fan_info[0].supported & LWMI_SUPP_GET)

> +		!lwmi_om_fan_get_set(priv, 0, &rpm, false) && rpm !=3D U32_MAX;

And that's why moving the check into lwmi_om_fan_get_set() makes things
easier.

Thanks,
Rong

> =20
>  	valid =3D 0;
>  	for (i =3D 0; i < LWMI_FAN_NR; i++) {
> @@ -580,7 +592,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  		}
>  	}
> =20
> -	if (valid =3D=3D 0 && !priv->fullspeed_supported) {
> +	if (valid =3D=3D 0 && !priv->fullspeed_supported && !priv->fan0_input_f=
allback) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
