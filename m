Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C310883F
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 00:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630808; cv=none; b=Y8llgDFkNlgpk2u4sH1n75MdxTqBJn210Oc4P99o+GZLobvX1xeXUAK7X84SlZ+xnU+5zH/TiX8sk0WweFbqRhZ7lE1GFJrWRW6roi5Joq+7Gn040U3KDaMNDskRpLMujI4YxD8c3YiglNJGA/6aK8s4VsQKfF/bZJDTHbtyNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630808; c=relaxed/simple;
	bh=ZoYpHfxtyoOcX5WEtVlauRaiK4TfCJxzlQu9fnje2hA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GK8n7mm64sx0mTFMvuKs8JaWYVJqMh9uaKZS4S2WKsPXdBgewMKpSdwsudPogRoknfgwSXKDi0/VE5MSMQwYcyFUp+r2YWsgtmZDyjrIOGUsamwwjnnpYmwZ77eF5zB6V3TV3UFcPMUrV6Vxa5SXrQ9anyvTYSgoN5ko8tZfJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dosM3W6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dosM3W6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0C0C2BCB0;
	Wed, 13 May 2026 00:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630807;
	bh=ZoYpHfxtyoOcX5WEtVlauRaiK4TfCJxzlQu9fnje2hA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dosM3W6CdSffxDixY7PPBajdwXTGgIvS1WfQS5Z7dxUy37Nqm9OU7v3yxlwvC2pS7
	 3/C7GePU7lNr1wHy69F38ygK2GAkZ0KZH90Shk+/I/68bdEd1H13yafuhMtqHizB0c
	 Lr54UNl5vYjwf9vXEkN238fHgYTroQAp7u/U0zJEI9zldnWdKi9dLSkzObHeGncnL1
	 5KlfDaZkBOG+Clp/e22pdANo/n4Q/Q0TMeFj9jlnuqCA7D60EoHefxtipNmAX8AIBJ
	 OOPDRzMBZ0hEEvMCW3JqB76nsgAG3fIgkvFc5k+B1lsXiutObgJQljYl3VdK1yNE8Z
	 D8TNtu6vBx38Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (asus_atk0110) Check ACPI_COMPANION() against
 NULL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2261594.irdbgypaU6@rafael.j.wysocki>
References: <2261594.irdbgypaU6@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:06:47 +0000
Message-Id: <20260513000647.8E0C0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Concurrent sysfs reads cause data races and potentially unsafe ACP=
I evaluations due to lack of locking.
- [High] The logic for restoring the EC (Embedded Controller) state on driv=
er unload is completely inverted, erroneously disabling the EC if it was pr=
eviously enabled.
--

commit c755ab3a5c2ef6bd47ed195b3ed8df92657bc3c8
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

hwmon: (asus_atk0110) Check ACPI_COMPANION() against NULL
   =20
Platform drivers can be forced to match a device that doesn't match its
list of device IDs using device_match_driver_override(). This commit
adds a requisite check to ensure the ACPI companion object exists before
continuing with the probe.

> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index 5688ff5f7c28d..109318b0434d9 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -1273,15 +1273,20 @@ static int atk_probe(struct platform_device *pdev)
>  	struct acpi_buffer buf;
>  	union acpi_object *obj;
>  	struct atk_data *data;
> +	acpi_handle handle;
> =20
>  	dev_dbg(&pdev->dev, "adding...\n");
> =20
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
>  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> =20
>  	data->dev =3D &pdev->dev;
> -	data->atk_handle =3D ACPI_HANDLE(&pdev->dev);
> +	data->atk_handle =3D handle;
>  	INIT_LIST_HEAD(&data->sensor_list);
>  	data->disable_ec =3D false;

This isn't a regression, but is the logic for restoring the EC state
inverted?

In atk_enumerate_new_hwmon(), atk_ec_enabled() returns 1 if the EC is
enabled and 0 if disabled, and this result is assigned directly to
data->disable_ec:

drivers/hwmon/asus_atk0110.c:atk_enumerate_new_hwmon() {
        ...
		err =3D atk_ec_enabled(data);
		if (err < 0)
			return err;
		/* If the EC was disabled we will disable it again on unload */
		data->disable_ec =3D err;
        ...
}

Later, during atk_remove() or error paths, the driver checks this flag
and disables the EC:

drivers/hwmon/asus_atk0110.c:atk_probe() {
        ...
out:
	if (data->disable_ec)
		atk_ec_ctl(data, 0);
	return err;
}

Will this incorrectly disable the EC on exit if it was running before
probe, and leave it enabled if it was initially stopped?

Also not a regression, but does this driver need to implement its own
locking to serialize sysfs reads?

The hardware monitoring subsystem requires drivers registering attributes
via hwmon_device_register_with_groups() to implement their own locking.
In atk_read_value(), fields like sensor->is_valid, sensor->last_updated,
and sensor->cached_value are accessed and modified concurrently:

drivers/hwmon/asus_atk0110.c:atk_read_value() {
	if (!sensor->is_valid ||
	    time_after(jiffies, sensor->last_updated + CACHE_TIME)) {
		...
		sensor->is_valid =3D true;
		sensor->last_updated =3D jiffies;
		sensor->cached_value =3D *value;
	} else {
		*value =3D sensor->cached_value;
	}
    ...
}

Could concurrent reads bypass the cache, trigger concurrent ACPI method
evaluations, and cause torn reads or writes on 64-bit cached values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2261594.irdbgypaU6@=
rafael.j.wysocki?part=3D1
