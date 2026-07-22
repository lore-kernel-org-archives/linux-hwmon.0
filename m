Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169B470E9F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784747261; cv=none; b=Yh5I3jPav604+z50/UEbgaSFenm5/tRftAwcJN1oQWPvV+YDYWfhYUoCzx1f6Plxwzz3ku/tsKRUdPAcBZHGFEW9m8hF3IeR+yHabmu9xMuegFpjsT+kwoamEoEDu6eZ90mQg8whKU0beJS7VTdHFtE3QsBLPLD33zqtJXM2QI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784747261; c=relaxed/simple;
	bh=PDSFfYEEwh2KkhUzT2JmxFr9nVtpIOOHttGbjIVIWu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GwjjhIpn7LzXafQxthbKZqWAwJ4Yzu3kcKeIjkW2ancRyKzhft+B7uWVcadJtGsWzG0wDEwWMkEICV0wngIl/FzGlfk/xrLvsZ1m3WSrHCakFj5GPidxzC12WMSjT5BDH5aSusggUZ1P9r+kn5c/isrsk47gAyAC7oh170oIXgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awpVSviS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awpVSviS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED891F000E9;
	Wed, 22 Jul 2026 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784747259;
	bh=u0uo5Oc+KWh8THr9HpMyIRqYq4KqI3ue7WIBcIUS4E8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=awpVSviSyBWnxKV/XPYs+NgCjOCo6davTwS+6eU5mBNxknNf7Vkzbxd8jMP2wv54N
	 oktXV/FZmFxwSZ/HXZ84ABKwm56172hoMgwwLbcI0JccDbRzPbbxXKP5HqmjbHyq2q
	 Mg29FULh6xLsucnEzSTKPJgciZCyIhLN2IVGHruyr7afQj/8CP9hK63UKxmfjtRmZn
	 DHvOWI2v/NfnXjHLPzAWPyeqMkq8S3J3h11zyxjFbWrW5IPmQXQFw5HZ3qE+EjfIJi
	 w1WFrEOk+KacfuL2naz/XteVR+fsoaf0TtNM/z9g/ba2RTzVbZF0scu07+cNKjoyzg
	 RDzNy7vDxgYNQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH] hwmon: Add support for currX_emergency and
 inX_emergency attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722185749.2313572-1-linux@roeck-us.net>
References: <20260722185749.2313572-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 19:07:39 +0000
Message-Id: <20260722190739.9ED891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `_alarm` attributes for new emergency limits.
- [Low] Orphaned duplicate `inY_input` entry in sysfs ABI documentation.
--

--- Patch [1]: [RFT PATCH] hwmon: Add support for currX_emergency and inX_e=
mergency attributes ---
commit d42d90a3ffe54304e60c7c4aa212e4dd46adefe6
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Add support for currX_emergency and inX_emergency attributes

This commit introduces support for currX_emergency and inX_emergency attrib=
utes
in the hardware monitoring subsystem. It updates the sysfs ABI documentation
and adds the new attributes to the hwmon core templates and enums.

> diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/=
ABI/testing/sysfs-class-hwmon
> index b185bdfc7186a..42fd89305101a 100644
> --- a/Documentation/ABI/testing/sysfs-class-hwmon
> +++ b/Documentation/ABI/testing/sysfs-class-hwmon

[ ... ]

> @@ -647,6 +659,20 @@ Description:
> =20
>  		RW
> =20
> +What:		/sys/class/hwmon/hwmonX/currY_emergency
> +Description:
> +		Current emergency high value.
> +
> +		Unit: milliampere
> +
> +		RW
> +
> +		If a current reaches or exceeds this limit, the system is
> +		expected to take drastic action such as immediate power down
> +		or reset. At the very least, it should report a fault.
> +
> +What:		/sys/class/hwmon/hwmonX/inY_input
> +
>  What:		/sys/class/hwmon/hwmonX/currY_input
>  Description:
>  		Current input value

[Severity: Low]
This isn't a bug, but should this What: /sys/class/hwmon/hwmonX/inY_input
line be here?=20

It appears to be an orphaned duplicate entry.

> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 55a9a3ddd4aac..a07bfe7ac7dbf 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c

[ ... ]

> @@ -621,6 +621,7 @@ static const char * const hwmon_in_attr_templates[] =
=3D {
>  	[hwmon_in_max] =3D "in%d_max",
>  	[hwmon_in_lcrit] =3D "in%d_lcrit",
>  	[hwmon_in_crit] =3D "in%d_crit",
> +	[hwmon_in_emergency] =3D "in%d_emergency",
>  	[hwmon_in_average] =3D "in%d_average",
>  	[hwmon_in_lowest] =3D "in%d_lowest",
>  	[hwmon_in_highest] =3D "in%d_highest",

[Severity: Medium]
Are we missing the string definition for in%d_emergency_alarm here?

Without hwmon_in_emergency_alarm in the hwmon_in_attr_templates array,
drivers will not be able to use the hwmon_device_register_with_info API
to expose the voltage emergency alarm status.

[ ... ]

> @@ -644,6 +645,7 @@ static const char * const hwmon_curr_attr_templates[]=
 =3D {
>  	[hwmon_curr_max] =3D "curr%d_max",
>  	[hwmon_curr_lcrit] =3D "curr%d_lcrit",
>  	[hwmon_curr_crit] =3D "curr%d_crit",
> +	[hwmon_curr_emergency] =3D "curr%d_emergency",
>  	[hwmon_curr_average] =3D "curr%d_average",
>  	[hwmon_curr_lowest] =3D "curr%d_lowest",
>  	[hwmon_curr_highest] =3D "curr%d_highest",

[Severity: Medium]
Similarly, does hwmon_curr_attr_templates also need a string definition
for curr%d_emergency_alarm?

> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 77a6f2bffcba7..2cd433966723e 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -134,6 +134,7 @@ enum hwmon_in_attributes {
>  	hwmon_in_max,
>  	hwmon_in_lcrit,
>  	hwmon_in_crit,
> +	hwmon_in_emergency,
>  	hwmon_in_average,
>  	hwmon_in_lowest,
>  	hwmon_in_highest,

[Severity: Medium]
Should hwmon_in_emergency_alarm be declared in enum hwmon_in_attributes
alongside the other voltage alarm attributes to complete the API feature?

[ ... ]

> @@ -178,6 +180,7 @@ enum hwmon_curr_attributes {
>  	hwmon_curr_max,
>  	hwmon_curr_lcrit,
>  	hwmon_curr_crit,
> +	hwmon_curr_emergency,
>  	hwmon_curr_average,
>  	hwmon_curr_lowest,
>  	hwmon_curr_highest,

[Severity: Medium]
Does enum hwmon_curr_attributes also need hwmon_curr_emergency_alarm declar=
ed
to allow exporting current emergency alarm statuses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722185749.2313=
572-1-linux@roeck-us.net?part=3D1
