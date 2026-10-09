Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3836B934
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561387; cv=none; b=LBKs1xLNM9qaV9fv2CintGwdhtrt+go2rUC8pecxyF5JdIyYQ6sWTaeWkp6d9maSChHkz8KKDvq1H3d16Kjwd9mv2yYAswbOfeTCdW4yUdNXmbIXDitE0BhQvCbB9xM4tkFVdgILJ8L9ogXJ2/J+sa06smQDrH4y0dZKCZEWDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561387; c=relaxed/simple;
	bh=7YT7+wWj6G1VKqXxxpoY54JVtQTCQw3psKrE+9gHR/w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QljrEYj5clBNWIQEQlnDrFjeMPNqbkRzYZozW0sk9rbj6XyFo7P2l8AnhOmzm5yWbSomMV+lU6V9lwLzYAZqFLZVa0agu6GFTroHVavtrFTzQmGxblEAJyQL+o3o0REEJYCfpHvZumapnfTRtwAZyB4hy06fn+ZE449PCbkdprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esCsSVZj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esCsSVZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C40C1F000FF;
	Fri,  9 Oct 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561385;
	bh=Ad/IvRX99/TF+Y8MWflVjAqFUaWTvNHvn3z0Iz8DChU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esCsSVZj4FMgjo7dCnRLjMb4LVZydYpdkH1EFwhny14qClox0yd2ldMW7aiwWDVZ8
	 OLmCsrroq+ve5klTHVhAnDsMrW7VmvP2T/+Taz82uk7XFCypXPRiGltCbb+GHgOck/
	 z6KXxhLVmGmrxvWmVAfcH/+hLbpaUfXv4ZVynby8LJHaa5zZra+nG+KK1mzkyKLM9A
	 XtKMblvj97qP5a+XUhtVCK/rOckX7z7ZutitfY5h6X1J0xF2MWDPM/g/3gv/OlyobD
	 2MzuwjFKgzfjzSXgbSO4Wjk2WojSkUK3GBwgIpAblnl4nnyJ+vWk6DoUfnXts2LJy+
	 c6TzX/Qaha7SA==
Message-ID: <sashiko-outbox-165801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: Add a generic interface for userspace
 implementations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <27071a389536dfbc35b628a50e90636ce012c21f.1791559095.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <27071a389536dfbc35b628a50e90636ce012c21f.1791559095.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:56:25 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] hwmon: O(N^2) attribute validation loop causes CPU soft lockup
- [High] sysfs: 1-byte buffer overflow in hwmon_attr_show_string due to PAG=
E_SIZE limit
- [Medium] driver-core: invalid teardown order in uhwmon_exit() destroys pa=
rent before children
--

commit c2824f78f1fac4c2c5b17a97b2a2b5679a625be3
Author: Jihong Min <hurryman2212@gmail.com>

    hwmon: Add a generic interface for userspace implementations
   =20
    Add /dev/uhwmon so userspace drivers can expose standard hwmon
    attributes. Use the shared hwmon identifiers directly and forward
    numeric values or labels through read and write requests.

> diff --git a/drivers/hwmon/uhwmon.c b/drivers/hwmon/uhwmon.c
> new file mode 100644
> index 0000000000000..1855c87f06d9d
> --- /dev/null
> +++ b/drivers/hwmon/uhwmon.c
> @@ -0,0 +1,641 @@
> [ ... ]
> +static int uhwmon_create(struct file *file, void __user *arg)
> +{
> [ ... ]
> +	for (i =3D 0; i < data->num_attrs; i++) {
> +		struct uhwmon_attr *attr =3D &data->attrs[i];
> +		u32 type;
> +		bool string;
> +
> +		ret =3D -EINVAL;
> +		if (spec[i].attr >=3D 32 ||
> +		    !hwmon_is_valid_attr(spec[i].type, spec[i].attr) ||
> +		    !spec[i].mode || spec[i].mode & ~0644 ||
> +		    spec[i].flags & ~UHWMON_ATTR_CONSTANT)
> +			goto out;
> +		if (spec[i].type =3D=3D hwmon_chip && spec[i].channel)
> +			goto out;
> +		/*
> +		 * N is a zero-based channel index: channels 0..N need at least
> +		 * N + 1 attribute slots, plus a NULL terminator. The core uses
> +		 * int counts, so N + 2 <=3D INT_MAX. The full count is checked below.
> +		 */
> +		if (spec[i].channel > INT_MAX - 2) {
> +			ret =3D -EOVERFLOW;
> +			goto out;
> +		}
> +		string =3D hwmon_is_string_attr(spec[i].type, spec[i].attr);
> +		if (string) {
> +			if (!spec[i].size || spec[i].size > PAGE_SIZE ||
> +			    spec[i].mode & 0222 || spec[i].value)
> +				goto out;

[Severity: High]
Does this PAGE_SIZE check leave enough room for the newline character appen=
ded
by the hwmon core?

If a daemon writes a string of length PAGE_SIZE - 1 plus a null terminator,
when read via sysfs, the hwmon core passes this string to
sprintf(buf, "%s\n", s) where buf is exactly PAGE_SIZE bytes.

This would write PAGE_SIZE - 1 characters, followed by the newline and null
terminator, totaling PAGE_SIZE + 1 bytes.

Could this cause a 1-byte overflow and memory corruption?

> +		} else if (spec[i].size || spec[i].text) {
> +			goto out;
> +		}
> [ ... ]
> +		type =3D spec[i].type =3D=3D hwmon_energy64 ? hwmon_energy :
> +							spec[i].type;
> +		for (j =3D 0; j < i; j++) {
> +			u32 other_type =3D spec[j].type =3D=3D hwmon_energy64 ?
> +						 hwmon_energy :
> +						 spec[j].type;
> +
> +			if (type =3D=3D other_type &&
> +			    spec[i].attr =3D=3D spec[j].attr &&
> +			    spec[i].channel =3D=3D spec[j].channel)
> +				goto out;
> +		}

[Severity: High]
Can this nested loop cause a CPU soft lockup?

Since uhwmon_create() accepts a user-provided num_attrs bounded only by
kmalloc limits (which could exceed 100,000 attributes depending on max slab
size), this loop compares every attribute against all preceding attributes =
to
prevent duplicates.

For a large number of attributes, this results in billions of iterations.

As the loop lacks preemption points like cond_resched(), could it hold the
CPU exclusively for multiple seconds and trigger the soft lockup watchdog?

> +		attr->spec =3D spec[i];
> +		attr->spec.text =3D 0;
> +		counts[spec[i].type] =3D
> +			max(counts[spec[i].type], spec[i].channel + 1);
> +	}
> [ ... ]
> +static void __exit uhwmon_exit(void)
> +{
> +	struct uhwmon_device *data, *next;
> +
> +	misc_deregister(&uhwmon_misc);
> +	list_for_each_entry_safe(data, next, &uhwmon_devices, node) {
> +		uhwmon_unregister(data);
> +		list_del(&data->node);
> +		uhwmon_free(data);
> +	}
> +}

[Severity: Medium]
Is it safe to deregister the parent miscdevice before unregistering the chi=
ld
hwmon devices?

Calling misc_deregister() destroys uhwmon_misc.this_device, which is the
parent of all registered hwmon devices. Destroying a parent device before i=
ts
children violates the driver core's topological ordering and lifecycle rule=
s.

Could this cause sysfs warnings and potential use-after-free when the child=
ren
subsequently attempt to unregister their sysfs directories from the
already-deleted parent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791531025.gi=
t.hurryman2212@gmail.com?part=3D3
