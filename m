Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1F40D582
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 02:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781835382; cv=none; b=pp8o8Rgu30rrT8Uwrju99kmdcGWN5rUxPpc1ie0bxZpSSKz6++iBb1lcQ3IH3clRxCK3sEvhwZKikae10xBffv7PCvVAWStRc4eHA6+9ebO47sAHI6ziG/KGnrOdVCj2DdMW8RQO2kcOH50bsspwYeIx+zi96FEZrWcKJddznEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781835382; c=relaxed/simple;
	bh=xBCwkjtU1fwkXOOPjW+PljR04QoRHvyE2Js1mtotJDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JZLO+F0HlYy1dzVvIVC2ZtzsN0sQOo2gbeoNttqyRmWp7zghpjcILE9sxZvb/3iixdHpgV/ZmiZDtKk6Mtf6OvFSF3QupDF3B3ojfx6HkctNfL4uGbNwPS+yHr0cPW+laSRk4Mf9a7cZO039TQoL21Jo8mmH2hlRV6Jz6T03HYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVvwUItA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVvwUItA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF521F000E9;
	Fri, 19 Jun 2026 02:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781835380;
	bh=EZv9dDr31STxF+M0KQSwaoegwB8A8tM5/9HM1fawX/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVvwUItAdBJPy37iA3b55eydFRxnQFDz/mjdvBwBP+MffRBK704Tt/o5FWOprpjtU
	 6psVFlb/PdarKO4NGD6cGr/YJOg58gYY8HWMhOGc0Vhm4f8QpkvZR5N3LgoruE9eGR
	 j5isOhgOB45fnIbIrn26/qp5Xzh9HycshGJWtZaDYdZLSH0HiHaG5q6QWK0HUzPf+s
	 lUU1GBkH39yCmbtI1ilxlm/A6H20Xq7og6FqKOgjFWVA01HfNWI7/fUb+frHvTU2uh
	 7yG73pgtfqkNVJEnRw7W+1OpcgWIqrDtgEvHZI9Ctx1lT+4Ipor3U3zzvfrdRuCAhN
	 dYTDJwqOshdhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (occ) unregister sysfs devices outside occ
 lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260619015938.494464-1-runyu.xiao@seu.edu.cn>
References: <20260617150859.741453-1-runyu.xiao@seu.edu.cn>
 <20260619015938.494464-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 02:16:19 +0000
Message-Id: <20260619021620.6DF521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Repeated toggling of the `occ_active` sysfs attribute causes an un=
bounded memory leak due to unbalanced `devm_kcalloc` allocations.
- [High] Concurrent sysfs activation during device probe causes `occ_setup(=
)` to fail, leading to a Use-After-Free of the `occ` struct.
- [High] Missing validation of `sensor_length` from untrusted OCC hardware =
response allows an out-of-bounds read, potentially leaking kernel memory to=
 userspace.
--

commit 56e5ee484ac45f4849cdd68d58d6bdab8f0530ab
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

hwmon: (occ) unregister sysfs devices outside occ lock

occ_active(false) and occ_shutdown() unregister sysfs-backed devices while
occ->lock is held.  hwmon_device_unregister() and sysfs_remove_group() can
wait for active sysfs callbacks to drain, and those callbacks can enter the
OCC update path and try to take occ->lock again.  That gives the unregister
paths the lock ordering occ->lock -> sysfs callback drain, while a callback
has the opposite edge sysfs callback -> occ->lock.

Fixes: 849b0156d996 ("hwmon: (occ) Delay hwmon registration until user requ=
est")
Fixes: ac6888ac5a11 ("hwmon: (occ) Lock mutex in shutdown to prevent race w=
ith occ_active")
Cc: stable@vger.kernel.org

> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 89928d38831b6..567b7bc2a6e91 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c

[ ... ]

> @@ -1106,11 +1112,16 @@ static void occ_parse_poll_response(struct occ *o=
cc)

[Severity: High]
This isn't a bug introduced by this patch, but does occ_parse_poll_response=
()
validate that sensor_length from the hardware response matches the size of =
the
mapped structures?

In occ_parse_poll_response(), the driver computes the block size as
num_sensors * sensor_length and verifies it fits within the 4096-byte
response buffer.  However, it fails to verify that sensor_length matches
the expected size of the C structures mapping the data.

A malfunctioning OCC firmware could return a large num_sensors and a small
sensor_length (e.g., 1), easily passing the bounds check.

Later, sysfs show functions like occ_show_power_a0() perform pointer
arithmetic using the sensor index and the fixed struct size:

    power =3D ((struct power_sensor_a0 *)sensors->power.data) + sattr->inde=
x;

For a large index, this calculates an address far beyond the end of the
occ->resp allocation, causing an out-of-bounds read of adjacent kernel
heap memory that can be emitted to userspace.

> =20
>  int occ_active(struct occ *occ, bool active)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does repeatedly toggling the
occ_active sysfs attribute cause a memory leak of occ->attrs?

When occ_active(occ, true) is executed (e.g., via writing '1' to the
occ_active sysfs file), occ_setup_sensor_attrs() dynamically allocates
memory using devm_kcalloc():

    occ->attrs =3D devm_kcalloc(dev, num_attrs, sizeof(*occ->attrs),
                              GFP_KERNEL);

When the device is deactivated via occ_active(occ, false), the hwmon device
is unregistered, but the memory allocated by devm_kcalloc() is not freed
because it remains tied to the parent device's lifecycle (occ->bus_dev).

Can a privileged user repeatedly toggle the sysfs attribute to continuously
leak memory from previous allocations?

> -	int rc =3D mutex_lock_interruptible(&occ->lock);
> +	struct device *hwmon =3D NULL;
> +	int rc =3D mutex_lock_interruptible(&occ->hwmon_lock);
> =20
>  	if (rc)
>  		return rc;

[ ... ]

> @@ -1171,6 +1185,7 @@ int occ_setup(struct occ *occ)
>  	int rc;
> =20
>  	mutex_init(&occ->lock);

[Severity: High]
This is a pre-existing issue, but can concurrent sysfs activation during
device probe cause a use-after-free of the struct occ?

occ_setup() exposes the occ_active sysfs attribute before attempting
to activate the hardware.

If a concurrent process writes '1' to occ_active, occ_active_store()
successfully registers the hwmon device and sets occ->active =3D true.

The probe thread then resumes and calls occ_active(occ, true), which
returns -EALREADY because the device is now active.

occ_setup() treats this as a failure, removes the sysfs group, and
returns an error:

    rc =3D occ_active(occ, true);
    if (rc)
        occ_shutdown_sysfs(occ);
    return rc;

This causes the platform/i2c probe to fail and the driver core frees
the struct occ memory via devres cleanup.

However, the hwmon device registered by the concurrent thread is never
unregistered on this error path, meaning any subsequent read of hwmon
attributes will dereference the freed occ pointer.

> +	mutex_init(&occ->hwmon_lock);
>  	occ->groups[0] =3D &occ->group;
> =20
>  	rc =3D occ_setup_sysfs(occ);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619015938.4944=
64-1-runyu.xiao@seu.edu.cn?part=3D1
