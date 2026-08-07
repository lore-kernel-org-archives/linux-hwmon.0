Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B24B0493
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061550; cv=none; b=fbgajo5pl0jzOw0sDIO0aKRsqot7je14gdwT7tlPiaZBEwPP/QuSxzsEQeltiYg3co2C/QpWBxETI4anPPV7eWoLyLRKtjTx79QCR4qTYEDWQ6EtA85HKCApgYyFvrN4zjVrrRku8XonnkQ8vPP2LHR5O1sfVf71SM59Xe5J91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061550; c=relaxed/simple;
	bh=KfH1P+BeSZyYGqb61nX4WfI17nflfSoKvNZreQsZ+KQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eXKT3MaTbSP3GAEcuhgTh6FJ9KaDAW5QsI4HfRou917bRCv1KKqzITk+H7DihO9P2JNDiugnX/L3WUzyw5xWRlKhajtGopeh7ZTJBRpJVOgJtf1nsRjt0OSBJGtAEJi9n6UutjP6WVwc925bahsl2FlyF/HHC7rhvr6w0eHOBA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWOmw4M4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWOmw4M4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F0A1F000E9;
	Fri,  7 Aug 2026 00:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061549;
	bh=Lgd9yCCpFprn+fwnm7bmM5nBvisw5XgyfLRZbTE32XU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWOmw4M4rtvvrgXqdC1KjrgvbmGgnoUNoQTLX71+6oCsnwqO7KvDbzvqjq5/vJcC2
	 aO+Z/w9xGEw1s05L4Vjpllo3hV3ThNRU5sEsyjdIGes4U2ybh7esj6xpOG7uDn5m0t
	 9D16oVUiM8UwGXFRrzplf4mBO4+MpoF6Vh0bEueWnp5W4Cyp6BAOnTrhtC/Hyyr7pI
	 KENs5Yn+F5BQF53kIyxg5S7teL1PmDr1D5bjFGvbumdtRsNCUyWsYXCyq8w8IXI9YF
	 IJ+pU2J4jWynEV/r2k8yQYs/nhJBpRliIpGp1jzP/7G8xNuxWRawFaHKdPVQvYtoVL
	 iPzR3RPidw9+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260807000107.1786892-3-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-3-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 00:12:28 +0000
Message-Id: <20260807001229.38F0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on the incoming HID report size allows out-of=
-bounds memory reads.
- [High] Completions and spinlocks are initialized after enabling HID hardw=
are interrupts, creating a race condition that leads to a NULL pointer dere=
ference.
- [Medium] Ineffective locking when reinitializing completions causes a dat=
a race on SMP systems.
- [Medium] Incorrect `time_after` calculation allows uninitialized sensor d=
ata to be returned to userspace if read in the same jiffy as probe.
- [Medium] The driver violates the hwmon subsystem requirement to use hwmon=
_lock() for serializing interrupt updates.
--

--- Patch [2]: [PATCH 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III supp=
ort ---
commit 3d0c1a58d5a805ca4eebf7afcc2b51a8194835be
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
   =20
The ROG Ryujin III uses different report offsets and a different
cooler-duty channel from the Ryujin II. It also lacks the separate
external fan controller supplied with the older model.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index b86b87e33615d..5bc60c6036de3 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c

[ ... ]

> @@ -34,6 +36,14 @@ static const struct rog_ryujin_device_info rog_ryujin_=
ii_360_info =3D {
>  	.has_controller =3D true,
>  };
> =20
> +static const struct rog_ryujin_device_info rog_ryujin_iii_info =3D {
> +	.temp_offset =3D 5,
> +	.pump_speed_offset =3D 7,
> +	.fan_speed_offset =3D 10,

[Severity: High]
This is a pre-existing issue, but does rog_ryujin_raw_event() verify if the
incoming HID report size is sufficiently large before accessing dynamic
payload offsets?

For example, it unconditionally reads:

priv->speed_input[1] =3D
    get_unaligned_le16(data + priv->info->fan_speed_offset);

Since this patch adds new devices with larger offsets, could a truncated HID
report cause an out-of-bounds memory read here?

> +	.duty_channel =3D 1,
> +	.has_controller =3D false,
> +};
> +
>  #define STATUS_VALIDITY		1500	/* ms */

[Severity: Medium]
This isn't a bug introduced by this patch, but does rog_ryujin_get_status()
correctly handle being called in the exact same jiffy as the probe?

If a thermal governor or monitoring tool polls the device immediately upon
registration, and it evaluates the time check:

if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))=
) {
    /* Data is up to date */
    return 0;
}

Since time_after(jiffies, jiffies) is false, the negation makes this
condition true. Would this incorrectly skip hardware polling and return
uninitialized sensor data to userspace?

[ ... ]

> @@ -573,6 +583,10 @@ static void rog_ryujin_remove(struct hid_device *hde=
v)
>  static const struct hid_device_id rog_ryujin_table[] =3D {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_ii_360_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EXTR=
EME),
> +	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
> +	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
>  	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does rog_ryujin_probe() enab=
le
hardware interrupts before initializing the synchronization primitives?

If hid_hw_open() is called before init_completion() and spin_lock_init(),
and the device sends a report immediately:

rog_ryujin_raw_event()
    if (!completion_done(&priv->cooler_status_received))
        complete_all(&priv->cooler_status_received);

Could this attempt to complete an uninitialized structure and cause a NULL
pointer dereference?


[Severity: Medium]
This is a pre-existing issue, but is the locking around completions effecti=
ve
against concurrent raw events?

rog_ryujin_execute_cmd() takes a lock to protect the completion:

spin_lock_bh(&priv->status_report_request_lock);
reinit_completion(status_completion);
spin_unlock_bh(&priv->status_report_request_lock);

However, rog_ryujin_raw_event() signals this completion without acquiring t=
he
corresponding lock:

if (!completion_done(&priv->cooler_status_received))
    complete_all(&priv->cooler_status_received);

Could this result in a data race on SMP systems, leading to corrupted
completion state or premature timeouts?


[Severity: Medium]
This isn't a bug introduced by this patch, but does this driver adhere to t=
he
hardware monitoring subsystem guidelines for locking?

The hwmon guidelines state that drivers must use hwmon_lock() and
hwmon_unlock() for serializing attributes registered outside the info
parameter, and for interrupt handling.

In rog_ryujin_raw_event(), the driver asynchronously modifies shared state =
in
interrupt context without the hwmon lock:

priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
    data[priv->info->temp_offset + 1] * 100;

Could this lead to inconsistent or torn reads when rog_ryujin_read() access=
es
these arrays concurrently from process context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807000107.1786=
892-1-renari@arimil.com?part=3D2
