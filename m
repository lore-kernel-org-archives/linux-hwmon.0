Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3411FA859
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 06:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781938439; cv=none; b=izhmqHccMeAdsLtYkRtI1N37wAUjlxWBr4PB6SftWiGTZdoh4KazuE5OHPwJpRdwGTsJULifw8wy/zDYKqdSyOSKIQU8W+nJtmpaXtjMyvI69pP3sGR2vLZRnFuL3cnMnhy5/v2blaCoZNIXXR/a35v+pEhdwDdnRTXHfkDUqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781938439; c=relaxed/simple;
	bh=M3hvdjP/bS8KL4tIUypPobOA7Mc4xnW5JifSJNmxv/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oty/77Kfe2/KtrXrQgdpGmOd95ANv5pQCglnRwzfVDD8/WuI+RC7wb9Jfgb+5/m3oHoOhGUUsGbUvT/1PtJYShTx8v4gdiXjsL95FnOCnqG5SWXA/W9iHhG5wYj7NMa7S7JqZlgXSnFggUBbhgXt1bcC3N8dGlEpMEqFVcNekng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5rXXXUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5rXXXUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA801F000E9;
	Sat, 20 Jun 2026 06:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781938438;
	bh=MXxcmVLULj8oX4ptLIuAWReXUdOmrscCK8f1oBl7GsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J5rXXXUBu/dUKGp2hGj0KcqkpACU9DAZ6YU9wQO1hyiOrmMoAVqcHVb2Dt4SLZdZk
	 K+QpnYvzPSb6HpBtvgTLYvhCxOWD0vbUAO1Li7hOGbxVUNRXdaHo/34S6TdzqtpK0O
	 +ydNKpjIjxyRIomGO048cIT9MKXFoPk2xPOg4rnmKkRtd3IBFhMz7rvvpoV7+E9YE9
	 Ls2+uohOfW9Fj0fxDYrLhKqNeoqJpyFpfiWp7Tv8zlyw0VB4iPj+98rsLqXnc9qJEL
	 WH3s8HrpHzeOySEXZwZxeDKco3Syat4xTID9BrgDYZpzTuL2cBXSuse06pHpjkbER2
	 yjPsOa1bWNm3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/xdpe1a2g7b) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
References: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 06:53:57 +0000
Message-Id: <20260620065358.0FA801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but the PMBus co=
re function `pmbus_data2reg_vid()` hardcodes the VR11 VID calculation formu=
la and completely ignores the `vrm_version` parameter configured by the dri=
ver. When the `xdpe1a2g7b` driver operates in `nvidia195mv` VID mode, calls=
 to `regulator_set_voltage()` will convert the target voltage to a complete=
ly incorrect VR11 VID code. For example, a request for 200mV is incorrectly=
 clamped to 500mV and converted to a VR11 VID of 0xB2, which the hardware i=
nterprets in `nvidia195mv` mode as 1.08V. This applies unexpected and poten=
tially destructive voltages to attached components.
--

commit 970e2131ac4cd9e077822790586db122a481d9fb
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/xdpe1a2g7b) Add regulator support

Register both dual-loop output channels with the regulator framework by
populating regulator_desc[] and num_regulators in pmbus_driver_info.
This exposes the standard PMBus OPERATION-based on/off control and
status reporting to consumer drivers.

> diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1=
a2g7b.c
> index 971e7b73752ea..9455ef443b2b3 100644
> --- a/drivers/hwmon/pmbus/xdpe1a2g7b.c
> +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
[ ... ]
> @@ -72,6 +79,10 @@ static struct pmbus_driver_info xdpe1a2g7b_info =3D {
>  	.func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>  		   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
> +#if IS_ENABLED(CONFIG_SENSORS_XDPE1A2G7B_REGULATOR)
> +	.num_regulators =3D XDPE1A2G7B_PAGE_NUM,
> +	.reg_desc =3D xdpe1a2g7b_reg_desc,

[Severity: Critical]
This is a pre-existing issue, but does enabling regulator support here expo=
se
attached hardware to destructive voltages when operating in nvidia195mv VID
mode?

The core PMBus framework translates microvolts into raw register encodings =
via
pmbus_data2reg_vid(), but it currently hardcodes the VR11 VID calculation
formula and completely ignores the vrm_version parameter configured by the
driver.

For example, if regulator_set_voltage() requests 200mV, the core does:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_data2reg_vid() {
	val =3D clamp_val(val, 500, 1600);
	return 2 + DIV_ROUND_CLOSEST_ULL((1600LL - val) * 100LL, 625);
}

This incorrectly clamps the request to 500mV and converts it to a VR11 VID =
of
0xB2. The hardware interprets 0xB2 in nvidia195mv mode as 1.08V.

Writing these values into the PMBUS_VOUT_COMMAND register of an nvidia195mv
compliant device translates low-voltage requests into dangerously high phys=
ical
voltage output.

Could pmbus_data2reg_vid() be updated to branch on vrm_version before expos=
ing
this regulator interface?

> +#endif
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-xdpe1a2g7b=
-v1-1-428c3847be0d@nexthop.ai?part=3D1
