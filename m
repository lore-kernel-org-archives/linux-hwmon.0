Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466165;
	b=I1TLOXeTyEffD8s90UJiKBGOhAFCre+APDtqb/Z6CYAoMvV/HqRbWUAYBUt5Spe0OK8N
	 t+iOcZ5JRA5Rua0YzRGBUPAztDgW3spLpTEFUSxoOGSp6RW/y4TvwfST+/sCzwZpYeatE
	 Lo+x5V6oiu952PS1FGpDfQsztdw1aci+Mvnn+Aiq8rtlpFHxCrnTha306m7uk61hCdt4C
	 5W2ikvkWGxKxfVlbh/1Hxd0vL2uaK54WjfbIjP/AyDUdvLsp0GRwPdkz5V/lSuyxR2THw
	 LyuMMVRq3LU1aJczfWrYbNSAQxhau6wEwDy08dwUvAIi539ULXPxTBGSKj6HJep7fNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466165;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DBpQQRKqncxaaQWTNf/Lbx4IIR2Pe/nOEgW4Gdo7yrE=;
	b=sF1NZrf5uCs+zPcHwf0l4W92mh91Kswll82q/qu7XWBVxVRxLXJPVSyeGewsGJG18Gsh
	 SnQsQ8jzoIPt34iQCpD57w2N5EA0UpH5c3Skjc8FAh8q23v7T5TlH9nmC7f6TtdVCcLGx
	 5BZBObY8uw31SMPtEyHF0gYq/vE4GItdxPBJqOOvVad2frdm61iMnwWmiAPTP1qxkAld7
	 Ook4UbQIEgNKFPVn/U8pmam7nwttEWgI7QArJLGK/UscuBkJ/GCDnmZShRzTAdA4wUNi9
	 /VmTp1iIsyZFOIl4XsYiQ+CA5yAlQOPNG+cFsou8lz4GDIdE1DADPke3QhNDI8I6r+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjuFh6ct;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9499606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjuFh6ct
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF4C1F000C1;
	Sat, 31 Oct 2026 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466164;
	bh=DBpQQRKqncxaaQWTNf/Lbx4IIR2Pe/nOEgW4Gdo7yrE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=LjuFh6ctuQnz2YKYML75Cu0+Z8nV4QDmxZsu2tvhRHHbQ4DkHnRo51JVhmyFVIPSu
	 VqKk8NJYWWDAouU/6RVb2BfIH6OwkOKL8w+wpL/pljS2TtmYmYMVwf9OI2AKrJPdPQ
	 MSz4/8rms/eIN6quVLBETqJnYyCyXCSAEDdI4CoHG5gRfdNc3xjQ9Oyw3G7UTLxNmT
	 msuvgrxn4qavW6yQOtZ6dTeUAaC1AuUesanjCY9rgbs+MJZrVRrdaQ4muM5hOy4ZPb
	 96pAR4IRfTssX9ZXp805jXdhqfUO1oKyO3/pyldVj+upgIV7PTWvdPwhE6AAUrFDtM
	 seglLY1w+Vwuw==
Message-ID: <sashiko-outbox-192054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (acpi_power_meter) Prevent spurious power
 alarm when power is unknown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031165447.1771473-3-linux@roeck-us.net>
References: <20261031165447.1771473-1-linux@roeck-us.net>
 <20261031165447.1771473-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 17:02:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: acpi_power_meter: get_power_alarm_state() re-latches soft=
ware alarm
--

commit f84e0084ffbbd96f84c563d4aa65b6dcc7bb7480
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (acpi_power_meter) Prevent spurious power alarm when power is unknown

This commit updates get_power_alarm_state() to return a boolean alarm state
and ignore unknown power readings (UNKNOWN_POWER_32 and UNKNOWN_POWER_64) as
well as meter or cap update errors when evaluating the power alarm.

> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_=
meter.c
> index 38d6a1e56ffcc..1f1d58995693c 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -377,28 +377,30 @@ static int set_avg_interval(struct acpi_power_meter=
_resource *resource,
>  	return 0;
>  }
> =20
> -static int get_power_alarm_state(struct acpi_power_meter_resource *resou=
rce,
> -				 long *val)
> +static bool get_power_alarm_state(struct acpi_power_meter_resource *reso=
urce)
>  {
> +	bool alarm =3D false;
>  	int ret;
> =20
> +	if (resource->caps.flags & POWER_METER_CAN_NOTIFY)
> +		alarm =3D resource->power_alarm;
> +	resource->power_alarm =3D false;
> +
>  	ret =3D update_meter(resource);
> -	if (ret)
> -		return ret;
> +	if (ret ||
> +	    resource->power =3D=3D UNKNOWN_POWER_32 ||
> +	    resource->power =3D=3D UNKNOWN_POWER_64)
> +		return alarm;
> =20
>  	/* need to update cap if not to support the notification. */
>  	if (!(resource->caps.flags & POWER_METER_CAN_NOTIFY)) {
>  		ret =3D update_cap(resource);
>  		if (ret)
> -			return ret;
> -		resource->power_alarm =3D resource->power > resource->cap;
> -		*val =3D resource->power_alarm;
> -	} else {
> -		*val =3D resource->power_alarm || resource->power > resource->cap;
> -		resource->power_alarm =3D resource->power > resource->cap;
> +			return false;
>  	}
> =20
> -	return 0;
> +	resource->power_alarm =3D resource->power > resource->cap;
> +	return alarm || resource->power_alarm;
>  }

[Severity: Medium]
When POWER_METER_CAN_NOTIFY is set in resource->caps.flags, does assigning
resource->power_alarm =3D resource->power > resource->cap at the end of
get_power_alarm_state() re-latch the polled comparison result into the next
power1_alarm read?

On a first read via power_meter_read() -> get_power_alarm_state() where
resource->power > resource->cap, resource->power_alarm is set back to true
after having been cleared at the start of the function.

On the next read of power1_alarm (with no intervening METER_NOTIFY_CAPPING
ACPI notification):

	if (resource->caps.flags & POWER_METER_CAN_NOTIFY)
		alarm =3D resource->power_alarm;
	resource->power_alarm =3D false;

alarm becomes true from that prior software comparison. If _PMM now returns
UNKNOWN_POWER_32 or UNKNOWN_POWER_64, or if update_meter() fails, the early
return:

	if (ret ||
	    resource->power =3D=3D UNKNOWN_POWER_32 ||
	    resource->power =3D=3D UNKNOWN_POWER_64)
		return alarm;

returns true even though no hardware capping notification occurred since the
previous read. Likewise, if resource->power has since dropped to or below
resource->cap, get_power_alarm_state() still returns true for that second
read.

When POWER_METER_CAN_NOTIFY is not set, writing resource->power_alarm at the
end of get_power_alarm_state() has no effect because the next call
unconditionally resets resource->power_alarm =3D false. Should the end of
get_power_alarm_state() simply return alarm || resource->power > resource->=
cap
without writing resource->power_alarm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031165447.1771=
473-1-linux@roeck-us.net?part=3D2
