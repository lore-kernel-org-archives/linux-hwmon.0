Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B33C65FE
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693772; cv=none; b=ogHtglpSdoyoE4KRj94cMaFa+8dXcJJlqvLDeeMvSE2Y2jGa+6Qmc+cC/ThxXXCf+LCfn024BhDoFdCm/5eQLPGmc6a6/GKt3qz6YtFHQe5rFItbfV5ZmLhSgYcit7R7tQxQXBLol5F0iNh6h6MI5eRqUN/EaggvbCgnRnJzcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693772; c=relaxed/simple;
	bh=oTS9WdpFwyj9Cx4tkyJ2nw9cP+qFDs+6JuCOVtZCkb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aqbx3YwkJGtWgKE/5JtWqBwBTPyz0bXFR5Y0EZ/sVsjsllSM3AcNVtAgnbylawOuggyDzFwV6ifvATHI+eJvMVvrOzaACgyDY3Z636GhgaaO6aI1vIoyD5TFZRh8GmZj+DD6uR+5C9gxUSHNIhNcFJVm67zJhBAQz9AEgJb6uKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn4qqMmR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn4qqMmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C12B1F00893;
	Fri,  5 Jun 2026 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693770;
	bh=2NM/RuPLzpqInOKPSQL5vkJRN+HWG3ufEk8PmOsKe0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zn4qqMmRXoRKSZ8N0gNXOQ5p0Ce7pbzEo8ATwDjFvIYR1bO/y9T1fhV0Vgt8LiKI3
	 Rqe4jUrEE0mT2JRnGjJ2aKdc/mcMEpPULfGfR6taT4E34ocou0ueI3ILasrrn3I0rG
	 qqgpRR9UQXDHBdp/3nvIX7gJkFCR3NhvaxF0DpCMwhvXbzWGeNqfqCDnu4Kv3NvBbz
	 ChVSffyQfO5hSthltOkSPn6TT3XrbyZwV5VcYFXjylGQWZI+aX68o4dYQ7S5JwXW9U
	 75ZDo1YnP5KVxC258C1L4UrJAVDBwc1u+0iHfJ4UDcosC26LsIyl3EUrk7MRub+tyv
	 omT6Ko0Y4g85Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/9] platform/x86: dell-wmi-base: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-5-W_Armin@gmx.de>
References: <20260605205937.530897-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:09:30 +0000
Message-Id: <20260605210930.7C12B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Accessing `buffer[2]` when processing extended privacy events in `=
dell_wmi_process_key()` can lead to an out-of-bounds memory read.
- [High] Missing driver unregistration and resource cleanup on module load =
failure path in `dell_wmi_init()`.
--

commit 4cf1ebf24373946a98a04cc13f3df7ed1e23a5ad
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-wmi-base: Use new buffer-based WMI API

This commit updates the dell-wmi-base driver to use the new buffer-based
WMI API. This allows supporting ACPI firmware implementations that do not
use ACPI buffers for the event data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform=
/x86/dell/dell-wmi-base.c
> index 2a5804efd3ea8..1070df0658073 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c

[ ... ]

> @@ -446,15 +448,15 @@ static int dell_wmi_process_key(struct wmi_device *=
wdev, int type, int code, u16
>  	} else if (type =3D=3D 0x0011 && code =3D=3D 0xe070 && remaining > 0) {
>  		dell_wmi_switch_event(&priv->tabletswitch_dev,
>  				      "Dell tablet mode switch",
> -				      SW_TABLET_MODE, !buffer[0]);
> +				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));
>  		return 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000c && remaining > 0) {
>  		/* Eprivacy toggle, switch to "on" key entry for on events */
> -		if (buffer[0] =3D=3D 2)
> +		if (le16_to_cpu(buffer[0]) =3D=3D 2)
>  			key++;
>  		used =3D 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000d && remaining > 0) {
> -		value =3D (buffer[2] =3D=3D 2);
> +		value =3D (le16_to_cpu(buffer[2]) =3D=3D 2);

[Severity: High]
This is a pre-existing issue, but does checking remaining > 0 guarantee that
buffer[2] is accessible here?

If the event payload leaves remaining as 1 or 2, could accessing buffer[2]
cause an out-of-bounds read?

>  		used =3D 1;
>  	}

[ ... ]

> @@ -825,10 +827,10 @@ static struct wmi_driver dell_wmi_driver =3D {
>  		.name =3D "dell-wmi",
>  	},
>  	.id_table =3D dell_wmi_id_table,
> -	.min_event_size =3D sizeof(u16),
> +	.min_event_size =3D sizeof(__le16),
>  	.probe =3D dell_wmi_probe,
>  	.remove =3D dell_wmi_remove,
> -	.notify =3D dell_wmi_notify,
> +	.notify_new =3D dell_wmi_notify,
>  };
> =20
>  static int __init dell_wmi_init(void)

[Severity: High]
This is a pre-existing issue, but looking further down in dell_wmi_init():

	err =3D dell_privacy_register_driver();
	if (err)
		return err;

	return wmi_driver_register(&dell_wmi_driver);
}

If wmi_driver_register() fails, the function returns an error without
unregistering the privacy driver or reverting dell_wmi_events_set_enabled().

Since this is the module init function, couldn't this leave a dangling
dell_privacy_wmi_driver registered when the module is freed, potentially
causing a use-after-free later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D4
