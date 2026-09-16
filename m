Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDE2857F0
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519136; cv=none; b=LZrDmmdGKOmv5H5zN61F5UBWmaB3UCyUJunWLa78u7FTH6RUBBeWW1SgNYkv1REQdg6VPm+MKMxyh9UeL9VW5nSlsvQARLQ5VcxoVvdbP+Ifnp13tkDyZhYTS3FvUIiNVdFS0JbG/+BArXmnx1jbY8SjJ3EZxRCyGQW2zOwmedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519136; c=relaxed/simple;
	bh=crrUgIbZi6EMi1JsWT0RadoDWUiu5ya0l7t/I2NI57E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKFIpIu2iBwACCeloF2z0SqX5YzKM3rQd60JGNXhrYOVcsK7e6XpRRVDQbpqeWd//Fip3RN5QZAAXw+T3okfGh9vNfjaheb2vqvDJKkepbman18SyjY5YRZP+tm8fvwsHo1O5QUiqrx+iMIaXpOTdgPkCsi1Oka/WRJloZgUwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G723WZjq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G723WZjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65751F00893;
	Wed, 16 Sep 2026 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789519134;
	bh=2ws2mSxVVwjGeja2f7s1rdTiQQaezZ3FTfEsrwIECBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G723WZjqSyENu6GHoEQ8kwIP08GGWWnqKuTHDduJcEIAGksd1wyd2d8FFitb8ytz9
	 FJMae1YdlEAM7wOW3HLBxvMjeuSWMA0kCAa/jcaq85UcwGutaI6JrwJ/70Goqa3aXP
	 Lrtg+cX+ywltSx8bbIGMVHy3YXkZPs3boy3Gdr46jxdzCYGQ3qvENpp+Jt34dzqdk3
	 j8v9z/9dY5MJ9kOkzULbXgsoiX6HhOmefp00gefI1V4cHHSwnmJms0ulPauU4Kscqz
	 K9z/1w1j+5asa9dfyXFL+HC3ln6aAZ+E9lIBEP5YTUZMNFf2Ys9O0u0zzM5WORmoEH
	 zHsW9eeMUw74Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Accept raw WMI strings in
 numeric sensor properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Bilal" <meatuni001@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260916002907.161210-1-meatuni001@gmail.com>
References: <20260916002907.161210-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:38:54 +0000
Message-Id: <20260916003854.B65751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] hwmon: hp-wmi-sensors: arbitrary pointer dereference due to skippe=
d switch block
--

commit ee807beabcd26889b2a01e5199b2f1dec6b26303
Author: Muhammad Bilal <meatuni001@gmail.com>

hwmon: (hp-wmi-sensors) Accept raw WMI strings in numeric sensor properties

This commit gives check_numeric_sensor_wobj() the same is_raw_wmi_string()
exception as check_wobj(). This allows BIOS-reported WMI strings encoded as
a length-prefixed UTF-16 ACPI_TYPE_BUFFER to be properly recognized.

> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensor=
s.c
> index 03c684ba83bd6..a4bb4dadb5f39 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -631,8 +631,14 @@ static int check_numeric_sensor_wobj(const union acp=
i_object *wobj,
>  	for (i =3D 0; i < elem_count && prop <=3D last_prop; i++, prop++) {
>  		type =3D elements[i].type;
>  		valid_type =3D hp_wmi_property_map[prop];
> -		if (type !=3D valid_type)
> +		if (type !=3D valid_type) {
> +			if (type =3D=3D ACPI_TYPE_BUFFER &&
> +			    valid_type =3D=3D ACPI_TYPE_STRING &&
> +			    is_raw_wmi_string(elements[i].buffer.pointer,
> +					      elements[i].buffer.length))
> +				continue;

[Severity: High]
Does this continue statement inadvertently bypass the switch (prop) block
that follows it?

The switch (prop) block is required to advance the loop index i when
consuming the flattened PossibleStates array, and to adjust the prop variab=
le
for property reordering.

By skipping the switch block, the loop validation could become desynchroniz=
ed
from the actual ACPI elements.=20

If a malformed or maliciously crafted WMI object maps an ACPI_TYPE_INTEGER
element to a string property during validation, could this desynchronization
cause populate_numeric_sensor_from_wobj() to process the integer as a strin=
g?

This would result in the integer value aliasing as a string pointer in
extract_acpi_value():

    hp_wmi_strdup(dev, strim(element->string.pointer));

Could this lead to an arbitrary pointer dereference and kernel crash when
parsing untrusted firmware data?

>  			return -EINVAL;
> +		}
> =20
>  		switch (prop) {
>  		case HP_WMI_PROPERTY_OPERATIONAL_STATUS:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916002907.1612=
10-1-meatuni001@gmail.com?part=3D1
