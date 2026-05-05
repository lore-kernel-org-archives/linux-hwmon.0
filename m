Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B03ECBCF
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984875; cv=none; b=L8yXJsDlkRdjcUdHC/nl5K/prrMGx9juKCwYy050UbLgq/lMiborbycNZUn2TVN8S1CRgxrm8JdUKECSadTZGnZIF+FaqqdrsrkWEF35QCAra55q7eYR5y/8zUgXl95+qpJ2w54SBTEUH+8A+Nb/1A9tn/muT1iryr7nZiZ5nU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984875; c=relaxed/simple;
	bh=dlwyggPkvrM8b/uD45FaumG2KGnCvn8Fgk+gtkqdZaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=so7RiAKmk2h9g84CojdAxwGbrzTgmgm0UJ4ZQUKJIO5l065IKHz06Ev7xpu4yiSGR2gTv/EfvVdi4wyqwY6lymmVAK8bibNOss7dBgbxDcD5S+Etmooc1/w2iD85sBKYMC0uqzvw9j2LvVbcx86BDIWZpWC3oLlryAR1pqeN9Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhfKbLwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhfKbLwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E85C2BCB9;
	Tue,  5 May 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777984874;
	bh=dlwyggPkvrM8b/uD45FaumG2KGnCvn8Fgk+gtkqdZaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dhfKbLwNpiFWZmhrNK/6udmXUaVkgri405Om9L+TNIlAQ+SWMQaCnVD9mubZNMW5H
	 3eKLN5RVAzB5tm3eF5nRv2Y+z12ReKuTrOblwu6cP0jxHYqW406vj8kG7w+Drjf2oU
	 Hd7o5klFp3GNT7Nhs4Y4FNRt6aiVJEL7LnJFdlpCP+nvWeQtNPMnwzcG+NrGuZ//DO
	 OtRc8yMlaOR9EiP8bDb8ey/WMweergP1KoU4g5I8p0odCg22afjffVO10o8Ngb3LUz
	 8iJ1rCHvVQMWFCBNVxZSS84v6ql/Fnj6s5XK+yYhG9rel4T+pmdz7zkHBMasnXCwDK
	 VlNiXqgqELd8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
Reply-To: sashiko@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <3070412.e9J7NaK4W3@rafael.j.wysocki>
References: <3070412.e9J7NaK4W3@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 May 2026 12:41:13 +0000
Message-Id: <20260505124114.87E85C2BCB9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Changing the hwmon device name and splitting aggregate devices=
 breaks userspace hwmon tools and configurations.
--

commit ef04f4845b76df7ab7442699654ee8214cc3a4ea
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

thermal: hwmon: Register a hwmon device for each thermal zone

The current code creates one hwmon device per thermal zone type and registe=
rs
it under the first thermal zone of that type. This commit addresses removal
issues by registering one hwmon device for each thermal zone individually,
appending the zone ID to the hwmon name, and giving each its own temp1_inpu=
t.

Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@gm=
ail.com/

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 597c33c8a5550..223ae1571655b 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c

[ ... ]

> @@ -137,54 +101,39 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
>  {
>  	struct thermal_hwmon_device *hwmon;
>  	struct thermal_hwmon_temp *temp;
> -	int new_hwmon_device =3D 1;
>  	int result;
> =20
> -	hwmon =3D thermal_hwmon_lookup_by_type(tz);
> -	if (hwmon) {
> -		new_hwmon_device =3D 0;
> -		goto register_sys_interface;
> -	}
> -
>  	hwmon =3D kzalloc_obj(*hwmon);
>  	if (!hwmon)
>  		return -ENOMEM;
> =20
> -	INIT_LIST_HEAD(&hwmon->tz_list);
> -	strscpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
> -	strreplace(hwmon->type, '-', '_');
> +	/*
> +	 * Append the thermal zone ID preceded by an underline character to the
> +	 * type to disambiguate the sensors command output.
> +	 */
> +	scnprintf(hwmon->name, THERMAL_HWMON_NAME_LENGTH, "%s_%d", tz->type, tz=
->id);
> +	strreplace(hwmon->name, '-', '_');

Could this change to the hwmon name attribute cause a regression for usersp=
ace
tools?

Tools and configuration files, such as sensors.conf, typically use the name
attribute for matching devices (for example, matching acpitz-*). Appending =
an
instance-specific ID to the name might prevent these configurations from
applying correctly.

>  	hwmon->device =3D hwmon_device_register_for_thermal(&tz->device,
> -							  hwmon->type, hwmon);
> +							  hwmon->name, hwmon);
>  	if (IS_ERR(hwmon->device)) {
>  		result =3D PTR_ERR(hwmon->device);
>  		goto free_mem;
>  	}
> =20
> - register_sys_interface:
> -	temp =3D kzalloc_obj(*temp);
> -	if (!temp) {
> -		result =3D -ENOMEM;
> -		goto unregister_name;
> -	}
> +	temp =3D &hwmon->tz_temp;
> =20
>  	temp->tz =3D tz;
> -	hwmon->count++;
> =20
> -	snprintf(temp->temp_input.name, sizeof(temp->temp_input.name),
> -		 "temp%d_input", hwmon->count);
> -	temp->temp_input.attr.attr.name =3D temp->temp_input.name;
> +	temp->temp_input.attr.attr.name =3D "temp1_input";

Does splitting aggregate devices break existing sysfs access patterns?

Previously, a single hwmon device might have contained multiple temperature
inputs, like temp1_input and temp2_input. Since each zone now gets its own
hwmon device with only a temp1_input, scripts or tools that explicitly read
temp2_input from the old aggregate device path will likely fail with a miss=
ing
file error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6017595.DvuYhMxLoT@=
rafael.j.wysocki?part=3D2
