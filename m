Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A48377AAC
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561351; cv=none; b=Yc9vJsmzxqd84zX44g6uo/hlj0n5G/SXpN2mMMdAVlpQjGN3/AdQGmVnZMDj4PDUml3LdPGbmIvmwPm1iI/o8tre+tLyP/iPmQI0z0BFF6KrrEL/8XjFgVDG9OAs+ViDRmv1KY2xWqKs/4HKklMe94e4VCdC5Hp0lREjuAyUYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561351; c=relaxed/simple;
	bh=KVQdeN+DX01QFLnBja+VYVrxllq+Jrnkw+JMubZ6Xu0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dwpdfky+BwndKg+IIcwzJ1pk7ESXC0rl37y4oobfpLUaO2nSgAs2jYUgMuv3pmYrVHGrynX/AWZxrCGS+gy83MrwK+68j9W+COmdAdPOBMpIKkhUlvfjGQLH1g5qB9pPvsA1+olHlW1WRGmHk2Z6cUVll59/IJyIAX4aWcoq7g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1VCNVzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1VCNVzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51C81F000FF;
	Fri,  9 Oct 2026 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561350;
	bh=OBYiyaI/QXTFs7zGpAYyVUGPnwil0UopBghuOiZXyYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1VCNVzonBLPW5XbxWR1/qM+VPEw9OUnL9AZqECimf/1LYOaI0xHNyqo6SkkIG1Xs
	 BjwCDOU3pYlM0lJSceLAkPMDZQpn7YVhU/pSrdgeUOzR8LYRohr7PycrExUK8dwdAI
	 916jZhHDKNkItX6t/ahUYmkgdiW0bdka/bHNwI+bHx9RRLaitbwPBv0uwUi4wuyhBF
	 GWAjwgD5naAMpi+kB2Ik5NwgiGUUhXiLoacvGp+E5G3givZSVyMV9eNdZv2mWY0t/j
	 AkQk5I1q/dS/gNEhtf/ECxXslVbtboh4t28c1Gb8lmVLOfROynq09MvvKqJWigeoY/
	 HsCpgH7noZCww==
Message-ID: <sashiko-outbox-165800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:55:49 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] hwmon: uhwmon: userfaultfd-based unkillable hangs via copy_to_user=
 under mutex
- [High] hwmon: uhwmon: name collision logic blocks multiple devices and sc=
hema updates
- [High] hwmon: wait_event_killable() in uhwmon_request() allows daemon to =
hang sysfs
- [Medium] hwmon: uhwmon: uhwmon_exit() destroys parent miscdevice before c=
hild hwmon devices
--

commit b2f6043289b80f507b7c7bd6ff84bc7129c9ba48
Author: Jihong Min <hurryman2212@gmail.com>

docs: hwmon: Document the uhwmon userspace interface

This commit introduces the uhwmon userspace API documentation, which connec=
ts
userspace drivers to hwmon_ops through the /dev/uhwmon control device. It
details how developers can register devices, handle requests, notify change=
s,
and manage device lifetimes.

> diff --git a/drivers/hwmon/uhwmon.c b/drivers/hwmon/uhwmon.c
> new file mode 100644
> index 0000000000000..1855c87f06d9d
> --- /dev/null
> +++ b/drivers/hwmon/uhwmon.c
> @@ -0,0 +1,641 @@

[ ... ]

> +static int uhwmon_request(struct uhwmon_device *data, unsigned int index,
> +			  u32 op, s64 *value)
> +{

[ ... ]

> +	ret =3D wait_event_interruptible(data->wait, READ_ONCE(pending.done));
> +	mutex_lock(&data->lock);
> +	if (!pending.done && !data->readable) {
> +		/* Once delivered, only fatal signals may abort the wait. */
> +		mutex_unlock(&data->lock);
> +		ret =3D wait_event_killable(data->wait, READ_ONCE(pending.done));
> +		mutex_lock(&data->lock);
> +	}

[Severity: High]
Does wait_event_killable() here allow the daemon to hang sysfs?

Because TASK_KILLABLE only responds to fatal signals, monitoring utilities
(like sensors or prometheus-node-exporter) that catch SIGTERM or SIGINT will
become unkillable and fail to shut down cleanly, delaying system reboots by
up to 90 seconds.

Any user with sysfs access can read the sensor, and any bug in the daemon
can trigger the hang. Although the daemon requires root to open /dev/uhwmon,
a buggy daemon shouldn't cause unkillable kernel deadlocks.

[ ... ]

> +static int uhwmon_create(struct file *file, void __user *arg)
> +{
> +	struct uhwmon_device *data, *existing;

[ ... ]

> +	data =3D kzalloc_obj(*data);
> +	if (!data)
> +		return -ENOMEM;
> +	mutex_init(&data->lock);
> +	init_waitqueue_head(&data->wait);
> +	data->name =3D strndup_user(u64_to_user_ptr(create.name), NAME_MAX + 1);

[Severity: High]
Could this strndup_user() combined with memdup_array_user() below cause
an unkillable hang?

uhwmon_create() is called from uhwmon_ioctl() which holds the global
uhwmon_control_lock. If a daemon issues an ioctl(UHWMON_CREATE) providing a
buffer backed by userfaultfd, the kernel will block indefinitely while hold=
ing
uhwmon_control_lock.

This freezes all device creation, notification, and release, causing a local
denial of service.

[ ... ]

> +	list_for_each_entry(existing, &uhwmon_devices, node) {
> +		if (strcmp(existing->name, data->name))
> +			continue;
> +		ret =3D -EBUSY;
> +		if (existing->online)
> +			goto out;
> +		ret =3D -EINVAL;
> +		if (!uhwmon_same_schema(existing, data))
> +			goto out;
> +		mutex_lock(&existing->lock);

[Severity: High]
Is it possible that this rigid name-matching logic incorrectly rejects valid
registrations?

It appears to block multiple independent devices from sharing the same name=
 by
returning -EBUSY, breaking standard hwmon functionality.

Additionally, if a daemon crashes (leaving the device offline) and restarts
with a modified schema, UHWMON_CREATE returns -EINVAL without attaching the
file descriptor.

This permanently locks out the device name because the daemon cannot issue
UHWMON_DESTROY to clean up the old offline device.

[ ... ]

> +static ssize_t uhwmon_read(struct file *file, char __user *buf, size_t c=
ount,
> +			   loff_t *offset)
> +{

[ ... ]

> +		if (mutex_lock_interruptible(&data->lock))
> +			return -ERESTARTSYS;

[ ... ]

> +	ret =3D -EFAULT;
> +	if (copy_to_user(buf, &data->pending->request,
> +			 sizeof(data->pending->request)))
> +		goto out;
> +	data->readable =3D false;
> +	ret =3D sizeof(data->pending->request);
> +out:
> +	mutex_unlock(&data->lock);

[Severity: High]
Can this copy_to_user() while holding data->lock allow userfaultfd to block
indefinitely?

If a daemon issues a read() providing a buffer backed by userfaultfd, the
kernel will block indefinitely while data->lock is held.

Since hwmon core serializes sysfs accesses, any standard monitoring utility
(like sensors) reading the sysfs attribute will invoke uhwmon_request(),
which calls mutex_lock(&data->lock) and blocks in TASK_UNINTERRUPTIBLE
(D-state).

Standard kernel design strictly forbids holding standard mutexes across
userspace memory accesses if those mutexes are shared with system-wide read=
er
processes.

[ ... ]

> +static ssize_t uhwmon_write(struct file *file, const char __user *buf,
> +			    size_t count, loff_t *offset)
> +{

[ ... ]

> +	mutex_lock(&data->lock);

[ ... ]

> +		if (size) {
> +			if (count < sizeof(reply) + size)
> +				goto out;
> +			ret =3D -EFAULT;
> +			if (copy_from_user(data->text, buf + sizeof(reply),
> +					   size))
> +				goto out;

[Severity: High]
Similar to the issue in uhwmon_read(), could this copy_from_user() while
holding data->lock also allow a userfaultfd-based unkillable hang?

> +			length =3D strnlen(data->text, size);
> +			ret =3D -EINVAL;
> +			if (length =3D=3D size)
> +				goto out;

[Severity: High]
What happens if an invalid string reply is provided here, does it permanent=
ly
strand the sysfs reader?

If the daemon sends a non-null-terminated string, length =3D=3D size evalua=
tes
to true and the function branches to goto out without setting
pending->done =3D true.

This permanently strands the sysfs reader in the killable wait from
uhwmon_request().

Since hwmon core serializes sysfs accesses, this single hung reader deadloc=
ks
the entire hwmon device.

[ ... ]

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
Is it safe for uhwmon_exit() to destroy the parent miscdevice before the ch=
ild
hwmon devices?

uhwmon_create() registers child hwmon devices using uhwmon_misc.this_device
as their parent. These child devices persist even after the userspace daemon
closes the control file descriptor.

During module unload, calling misc_deregister(&uhwmon_misc) before iterating
the uhwmon_devices list to unregister the child hwmon devices leaves
dangling child kobjects.

The driver core strictly requires children to be unregistered before their
parent. Unregistering the parent first triggers sysfs warnings and
use-after-free bugs when the children are subsequently unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791531025.gi=
t.hurryman2212@gmail.com?part=3D5
