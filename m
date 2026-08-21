Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CB37267E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288685; cv=none; b=Qdn6edYTuiXwMeuykBQLHRxzmHVsPFgq06qM4y+MeEPvRDEr4kcVnapSe0G9sBLLFdlXOluZG+/0v0ObMnVE7tn7eQHz8sjnueOAXuBZUFtveCYSVVupIoK4wTyB4hjJ7cn/ckYABL5rhrxGzabgUi5RQuOxIMNz+21zVphFUsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288685; c=relaxed/simple;
	bh=8vqD/3ZYuiQoCSeCciUAHlrh3Qq6QOe3/3qZn9IMhUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=euDbNNukdL8YxB+fc7yOwIrH7RAAYruz82ZnFr10smqiYoP1znDzMJMcqXKmEUozM9IOqQSDHMREHq7PVDLQxmW0QRq0Sb3uCcCKhHWXtLvIPvjwIP4zQ3ujsQNnUG2dcJehvslj79PYdzoBcg10RjC43dkt4lupRp9rJrpZseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHDZFQ1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHDZFQ1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A48B1F000E9;
	Fri, 21 Aug 2026 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787288683;
	bh=h/88jOArVUrTPkTWAwNTEiw+G1MIVs5HGl3pv4P+KYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHDZFQ1ViyNSWhSSfUmJcNtwIDxMHmG+5bDq7jWIVuVP5wBYDLLV1JwJOapFnsPfp
	 MchQ6mWZf3VklWntDDoxogyqU8X+dOdty6x/dynKcQ/pARIMS+uxl1bEtVXvQEL94q
	 8CbKyXeRCNMUU8TiF6WVRkjAbHtvTTPEdy96HKJqpibwlRC/KPAFtGsPW2wlDgoq5N
	 o5MYJ/m5/g2oT6QA0wcbb3FiwM1CfY0L0iJ4jfRovXOhsGC7xlnAr7vkhwfGoUfA/+
	 pVn9Y8rqeS0yuQJuSujzdVSZpKzjUtsntAChNU2IqVt1o/ESqgZruVcrHbIEUgcx7W
	 NvUU34YfyJvBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation/hwmon: Document hwmon_notify_event()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821045136.664480-1-linux@roeck-us.net>
References: <20260821045136.664480-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 05:04:43 +0000
Message-Id: <20260821050443.9A48B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The pec_store() function violates subsystem cleanup guidelines by =
mixing guard() lock acquisition with goto-based error handling, resulting i=
n a Use-After-Free vulnerability.
--

--- Patch [1]: [PATCH] Documentation/hwmon: Document hwmon_notify_event() -=
--
commit 2b10b27f5fc8a96731a2e5192ecb3af70d5ee8cc
Author: Guenter Roeck <linux@roeck-us.net>

Documentation/hwmon: Document hwmon_notify_event()

Add the function prototype and description of hwmon_notify_event() to
the hwmon kernel API guide. This allows drivers to report events such as
alarms or faults to userspace.

> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwm=
on/hwmon-kernel-api.rst
> index 9fcde32a140df..c3eb433a78f61 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.rst
> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> @@ -42,6 +42,9 @@ register/unregister functions::
> =20
>    char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
> =20
> +  int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types typ=
e,
> +			 u32 attr, int channel);
> +
>    void hwmon_lock(struct device *dev);
>    void hwmon_unlock(struct device *dev);
> =20

[ ... ]

This is a pre-existing issue, but while reviewing the hwmon subsystem I not=
iced
a potential bug in drivers/hwmon/hwmon.c:

[Severity: High]
Can this sequence trigger a use-after-free?

Looking at pec_store() in drivers/hwmon/hwmon.c, we acquire a device refere=
nce
and lock, but mix it with a goto statement for error handling:

drivers/hwmon/hwmon.c:pec_store() {
        ...
        hdev =3D device_find_child(dev, NULL, hwmon_match_device);
        ...
        hwdev =3D to_hwmon_device(hdev);
        guard(mutex)(&hwdev->lock);
        if (hwdev->chip->ops->write) {
                err =3D hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chi=
p_pec, 0, val);
                if (err && err !=3D -EOPNOTSUPP)
                        goto put;
        }
        ...
put:
        put_device(hdev);

        return err;
}

If the put_device(hdev) call drops the last reference to the device (for
example, due to a concurrent device removal), it triggers hwmon_dev_release=
()
which frees the hwdev memory.

When the function returns, the guard scope exits and attempts to call
mutex_unlock() on the saved hwdev->lock pointer, dereferencing the freshly
freed memory.

Could this be converted to use scoped_guard() or avoid the goto statement to
ensure the lock is released before dropping the device reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821045136.6644=
80-1-linux@roeck-us.net?part=3D1
