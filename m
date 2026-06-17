Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE83101B0
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 20:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781727504; cv=none; b=tAjHOjJQd/Talj2iS/HFn65gHpEVdzOGhHFKMih0sN1qxnpxgsGtJfisSr1rDUYrwqwW78RXNNHXEWoB2MDBS0zzKDi0Tf6l7zC45DNFKBDOrZkAYyGi2F9/XMIOpxPQ0NwTMLLoB3vNst9DNZ0vy9FFhduqalZsjiKCWE19q94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781727504; c=relaxed/simple;
	bh=j+lr9joQCDT9BGga/fS0GkqanS3MkFCCgQ3p7a9PhhU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QSv9vp1UMqpNLS5ftBnV2ptG3SNwLhZeMxqz2C8kgAV40TZptLJa+7HeTlkw7VwQeLFS++FkokiN/+EwvJ8xkw/Cas9zqiIg7U/2H5SofYDwYP0dgB6aKl6o6TFFMghLenc4pYZ6fW2yv06LbfQLUbkGK89J6uwi+0EMCCaY46E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Po3TZTF4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Po3TZTF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B46E1F000E9;
	Wed, 17 Jun 2026 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781727502;
	bh=bJ5Hxvuv/M7LPvegMQXZqJJOGW68ryVKE222aOCSKpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Po3TZTF4vo10cwF0WJUlB0saCGy7I+TYKXdRgrEnzNJFNpGhs1qWdsfeZv/RmFRg9
	 d54tHE16IG/oqfMUqyDuT3eY04tr3V0I6NfdQmbJ3bu7btJ35j2v9uOMZTkf9s3mzv
	 lSWbdwgMjGa2NUlyvtflSwTjS8gQKTSHjz38Kvs1zqwEhRlZ7O69nGpDDXipuM4wBd
	 Cv4HC6Ej5Lckgws6leEPqMo9htQK8NM/0XZmJv/sB3a4hP66N00ktUsamHxVWeCCEZ
	 MhQbtJu2JOcW93XWGr7oaSM1dWseYmHpcgBPn1FepMHBxdQV3n/V5eXmhfkDZ9x0MW
	 ypopz3iXw7ltA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (occ) unregister hwmon device outside occ lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260617150859.741453-1-runyu.xiao@seu.edu.cn>
References: <20260617150859.741453-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 20:18:21 +0000
Message-Id: <20260617201822.3B46E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Sysfs callbacks can initiate hardware polling after the device has=
 been deactivated.

Pre-existing issues:
- [High] The patch fixes an ABBA deadlock for hwmon sysfs attributes but le=
aves an identical deadlock for the driver's own occ_sysfs attributes.
- [High] Unbounded memory leak when toggling the OCC active state via sysfs.
- [High] A NULL pointer dereference crash occurs during sysfs group creatio=
n if the hardware reports multiple capability sensors.
- [High] Malformed device responses can cause an out-of-bounds kernel memor=
y read when parsing sensor data blocks.
--

commit c52f29d2e70bdddb1a59be767e0322ae3c29585d
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

hwmon: (occ) unregister hwmon device outside occ lock

Serialize hwmon registration and removal with a separate hwmon_lock.
Under that lock, detach occ->hwmon and update occ->active while occ->lock
is held so concurrent OCC state changes still see a stable state, then
drop occ->lock before calling hwmon_device_unregister().

Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 42cc6068bb08b..b8461da29e36f 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1105,11 +1105,16 @@ static void occ_parse_poll_response(struct occ *o=
cc)
> =20
>  int occ_active(struct occ *occ, bool active)
>  {
> -	int rc =3D mutex_lock_interruptible(&occ->lock);
> +	struct device *hwmon =3D NULL;
> +	int rc =3D mutex_lock_interruptible(&occ->hwmon_lock);
> =20
>  	if (rc)
>  		return rc;
> =20
> +	rc =3D mutex_lock_interruptible(&occ->lock);
> +	if (rc)
> +		goto unlock_hwmon;
> +

[Severity: High]
This is a pre-existing issue, but can this cause an unbounded memory leak w=
hen
toggling the OCC active state via sysfs?

When the device is activated, occ_setup_sensor_attrs() unconditionally
allocates the sensor attribute arrays using devm_kzalloc(). Because devres
allocations are bound to the device's lifetime, the memory is not freed when
occ_active() is called with active set to false.

Will repeatedly writing '1' and '0' to the occ_active sysfs file continuous=
ly
allocate new memory and overwrite the pointers?

[Severity: High]
This is a pre-existing issue, but does the hardware reporting multiple
capability sensors cause a NULL pointer dereference during sysfs group
creation?

In occ_setup_sensor_attrs(), the driver expects sensors->caps.num_sensors
attributes and allocates array space accordingly, but it only populates the
first capability sensor because it uses an
if (sensors->caps.num_sensors >=3D 1) condition instead of a loop:

occ_setup_sensor_attrs() {
    ...
    if (sensors->caps.num_sensors >=3D 1) {
        snprintf(attr->name, sizeof(attr->name), "power%d_label", s);
    ...
}

Are the remaining attributes left zero-initialized, causing
sysfs_create_group() to read a NULL attr->name and crash?

[Severity: High]
This is a pre-existing issue, but can malformed device responses cause an
out-of-bounds kernel memory read when parsing sensor data blocks?

In occ_parse_poll_response(), the bounds check is performed after reading t=
he
block header:

occ_parse_poll_response() {
    ...
    offset =3D (block->header.num_sensors * block->header.sensor_length) +
             sizeof(block->header);
    size +=3D offset;

    if ((size + sizeof(*header)) >=3D OCC_RESP_DATA_BYTES) {
    ...
}

If the response buffer is almost full, will the next iteration read the blo=
ck
header out of bounds?

Additionally, the driver trusts the hardware-provided sensor_length without
verifying it matches the C struct size. Could a malicious or faulty OCC
provide a large num_sensors and small sensor_length, passing the bounds
check but causing sysfs functions like occ_show_power_a0() to read arbitrary
out-of-bounds kernel memory?

[ ... ]

> @@ -1154,14 +1159,17 @@ int occ_active(struct occ *occ, bool active)
>  			goto unlock;
>  		}
> =20
> -		if (occ->hwmon)
> -			hwmon_device_unregister(occ->hwmon);
> +		hwmon =3D occ->hwmon;
>  		occ->active =3D false;
>  		occ->hwmon =3D NULL;
>  	}
> =20
>  unlock:
>  	mutex_unlock(&occ->lock);
> +	if (hwmon)
> +		hwmon_device_unregister(hwmon);
> +unlock_hwmon:
> +	mutex_unlock(&occ->hwmon_lock);
>  	return rc;
>  }

[Severity: High]
Can sysfs callbacks initiate hardware polling after the device has been
deactivated?

By moving hwmon_device_unregister() outside of occ->lock and occ->hwmon_loc=
k,
pending hwmon sysfs callbacks that were waiting for occ->lock can execute
after occ->active is set to false.

Since functions like occ_update_response() do not verify occ->active inside
their critical sections:

occ_update_response() {
    ...
    if (time_after(jiffies, occ->next_update)) {
        rc =3D occ_poll(occ);
    ...
}

will they proceed to call occ_poll() and send hardware commands to the OCC
after it has been deactivated?

[ ... ]

> @@ -1190,15 +1199,22 @@ EXPORT_SYMBOL_GPL(occ_setup);
> =20
>  void occ_shutdown(struct occ *occ)
>  {
> +	struct device *hwmon;
> +
> +	mutex_lock(&occ->hwmon_lock);
>  	mutex_lock(&occ->lock);
> =20
>  	occ_shutdown_sysfs(occ);

[Severity: High]
This is a pre-existing issue, but does holding both occ->hwmon_lock and
occ->lock before draining sysfs callbacks in occ_shutdown_sysfs() create
a deadlock?

If occ_shutdown_sysfs() blocks in kernfs_drain() waiting for active sysfs
references to drop, and concurrently a read/write to driver attributes
(like occ_active_store()) holds a kernfs active reference and attempts to
acquire occ->lock or occ->hwmon_lock, will this result in an unresolvable
circular dependency during driver unbind/shutdown?

> =20
> -	if (occ->hwmon)
> -		hwmon_device_unregister(occ->hwmon);
> +	hwmon =3D occ->hwmon;
> +	occ->active =3D false;
>  	occ->hwmon =3D NULL;
> =20
>  	mutex_unlock(&occ->lock);
> +
> +	if (hwmon)
> +		hwmon_device_unregister(hwmon);
> +	mutex_unlock(&occ->hwmon_lock);
>  }
>  EXPORT_SYMBOL_GPL(occ_shutdown);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617150859.7414=
53-1-runyu.xiao@seu.edu.cn?part=3D1
