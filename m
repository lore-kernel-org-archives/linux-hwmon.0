Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F543B71C8
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506968; cv=none; b=eq1+M/4I4V0y77I1OUgjCmqMhBC4GwV72RqNurr5qzsBtVA4uKqXKLMSJ+/7rFfmZwKgR86Q3R9i0J+Ibb9okYJwF+/hN3bYP8eumP91filmNkMfK58ThSD/+TxtPSpfhDQm+yWTN0zVCezU7odvqjPlbJnFJIqAcnsh2+XrlS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506968; c=relaxed/simple;
	bh=JJoh/jmUIbgCGv3zXC472llgwxLDY2JJlzUjgLCVlog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rhO9fbAF9/5yZrKrFUNSF55aKDEd1KSchCneYdsx+zPeMYcYPobxqra2BwwgFdscXP3Bpn3ZdBYCTP6r8WGaXK5BbPU6mfmR2AuvTa0WVLXehG2hq/3ClVpizdYrWhNMMSr/CY48/m8iB2XNCOZjM4yv5XDZEcR8E7/o0yj2PHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzUFzjZj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzUFzjZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F201F000E9;
	Mon, 15 Jun 2026 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506962;
	bh=x+dvp0yhljTdHF9b83D6NSPK2V5d4ynIhhwsdtvnxaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzUFzjZj9d72jo5pM5op4kuQyd6Ru7clVZX0tlZeWyXFfQMFGXGSkHU4HAeofi1Q9
	 qeeyVGo1PmpmzImMcZkQXIDkbf9WwfbpSi8zLOrdmhAmx4oAcGJSxu7CoqpxRWrTco
	 L1XWC4S9UkeGsetI8dZFD0MI9+ONpJxrLf6r9Lq0R0qAg0itA+960AjIDvsnHT/Jl3
	 9vb8tBv3OH9foMyo4tm2CfDiGfltDdy/CreQAQkbg6GVDORnrXg3h7t0n+Mj8mDypS
	 6rHR4UEcVJXdt4teoU3VT44J34F4toxPPL+dlp4+ersoJE2E/tG09HiGLmmmg4rQFK
	 7ZUk0b+Nle3cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) remove vrm sysfs file on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260615064806.51139-1-pengpeng@iscas.ac.cn>
References: <20260615064806.51139-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 07:02:41 +0000
Message-Id: <20260615070241.E3F201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference in watchdog_close() when closin=
g the watchdog after the I2C client is unbound.
- [High] Missing serialization in watchdog operations causing I2C bank swit=
ching corruption.
- [Medium] Arithmetic overflows and underflows in sysfs store functions res=
ult in severely incorrect hardware limit configurations.
- [Medium] Global reboot notifier breaks when removing multiple device inst=
ances.
--

commit 2a161651efd66233c91e9cba273ace1907f39461
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

hwmon: (w83793) remove vrm sysfs file on probe failure

This commit updates the probe error path in the w83793 driver to correctly
remove the vrm sysfs file. This matches the normal remove path and prevents
leaving the vrm file behind if probe fails after creating the VID files.

> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1917,6 +1917,7 @@ static int w83793_probe(struct i2c_client *client)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(w83793_vid); i++)
>  		device_remove_file(dev, &w83793_vid[i].dev_attr);
> +	device_remove_file(dev, &dev_attr_vrm);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(w83793_left_fan); i++)
>  		device_remove_file(dev, &w83793_left_fan[i].dev_attr);

[Severity: Medium]
This is a pre-existing issue, but does the use of a global reboot notifier
break when removing multiple device instances?

The driver registers a shared static watchdog_notifier block during probe:

drivers/hwmon/w83793.c:w83793_probe()
    ...
    err =3D register_reboot_notifier(&watchdog_notifier);
    ...

When removing a device, w83793_remove() unconditionally deregisters it:

drivers/hwmon/w83793.c:w83793_remove()
    ...
    unregister_reboot_notifier(&watchdog_notifier);
    ...

If the driver is bound to multiple I2C devices, won't removing the first
device globally unregister the notifier, tearing down reboot events for all
remaining active device instances?

[Severity: High]
This isn't a bug introduced by this patch, but is there a potential NULL
pointer dereference in watchdog_close() when closing the watchdog after the
I2C client is unbound?

In w83793_remove(), data->client is set to NULL to detach the hardware:

drivers/hwmon/w83793.c:w83793_remove()
    ...
    data->client =3D NULL;
    ...

If a user application holds the open file descriptor, w83793_data remains
alive. When the user later closes the file without sending the 'V' magic
character, watchdog_close() enters an else block to log a warning:

drivers/hwmon/w83793.c:watchdog_close()
    ...
    } else {
        dev_crit(&data->client->dev, "unexpected close...\n");
    ...

Since data->client is NULL, could accessing data->client->dev crash the
kernel?

[Severity: Medium]
This is a pre-existing issue, but do the sysfs store functions fail to
prevent arithmetic overflows and underflows, leading to incorrect hardware
limit configurations?

In store_in(), if a user provides an input of 0 for a channel with a
voltage offset (like 5VDD and 5VSB), subtracting the offset underflows
the unsigned long value:

drivers/hwmon/w83793.c:store_in()
    ...
    val -=3D scale_in_add[index] / scale_in[index];
    ...

This wraps around to ULONG_MAX, which incorrectly clamps the voltage limit
to the maximum limit (255) instead of 0.

Similarly, in TEMP_TO_REG(), the macro adds 500 to the parsed long input:

drivers/hwmon/w83793.c:TEMP_TO_REG()
    ...
    return clamp_val((val + (val < 0 ? -500 : 500)) / 1000, min, max);

Could extreme positive user values cause a signed overflow here, producing a
negative limit?

Finally, in FAN_TO_REG():

drivers/hwmon/w83793.c:FAN_TO_REG()
    ...
    if (rpm <=3D 0)
        return 0x0fff;

Since sysfs inputs are parsed as unsigned long but the rpm argument is a
signed long, inputs exceeding LONG_MAX become negative. Does this cause the
driver to disable the fan warning entirely instead of clamping to the upper
bound?

[Severity: High]
This isn't a bug introduced by this patch, but is there missing serializati=
on
in the watchdog operations that could cause I2C bank switching corruption?

The w83793_write_value() function is documented as requiring
data->update_lock because it modifies data->bank:

drivers/hwmon/w83793.c:w83793_write_value()
/* Must be called with data->update_lock held, except during initialization=
 */
static int w83793_write_value(struct i2c_client *client, u16 reg, u8 value)

However, watchdog_trigger() calls this function while only holding
data->watchdog_lock:

drivers/hwmon/w83793.c:watchdog_trigger()
    ...
    w83793_write_value(data->client, W83793_REG_WDT_TIMEOUT,
                       data->watchdog_timeout);
    ...

If watchdog operations and sysfs accesses run concurrently, could they
interleave their I2C commands, corrupt data->bank, and cause reads or
writes to hit the wrong hardware bank registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615064806.5113=
9-1-pengpeng@iscas.ac.cn?part=3D1
