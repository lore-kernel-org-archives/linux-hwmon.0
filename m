Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C3397323
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390778; cv=none; b=K0CASLfquI+gxKIY/L6bn6k70dWg2mT6BMb35VURkJSxdV8s4k4EqpsM/1eO0+HjZ0fQbqwbvMArL0SLRjXGwDsLwEFKjA7tMesGslbpjp3H66sYTcBwwR6/qh2YL++urt0WndgcT7UHCuT7aR3S8AGUgodCua1C76TA33zIJ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390778; c=relaxed/simple;
	bh=f3kM9FnxCVU9hRlD7KtRREQ5m91CSZyJZg7lYviwzqI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KiJct9IsJI8lSP3vBOqLmXM5QwunD9EFwZe1Gc+SBfgZ7trbw7Q6DPwTjYcXYhY/4xD430xVvryDmXzbncbdqMfXRRUKpjLuZfAwu3YAziDmYUR+OxTQYiEr5e17j4GcJwiv3fhgdb2UClF1MUjUlYe0GzSAsGC8ZRcQnXvbQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2eEsRCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2eEsRCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B121F000E9;
	Sat, 22 Aug 2026 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787390776;
	bh=yXeNRe9mqz+HGHZln29jvnc9evp78VAF/wRVXYkPj5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P2eEsRCxirOpMwJqznIKBznurvY5d0dbdIiAtaxiewF4ryi31whuqXtKf15n3Swei
	 CLvzbSDoVeuPHJGL8cCPgm2KRDZnSiCKYRmQFgzkZzoeQeZYNw4v5A8kbJ3SblEPlA
	 1vhQwiGt20wug2uOZ8qjSAODpMhVcrs3sInY2ys8tI6T69exVcoYoGaDAiaqM6Vmqx
	 1oR566+oxi9Izqwv+koctGdaU31ACS6wFZy2V9YASPbdi72eIZ/+yhuUfVWAzvzYd1
	 yCCzpXQ7tWNum9Iw+fPXsuv+bBYLWX4L5FbUSfHmaeg4HQagmyxvHLdkparSogK8/z
	 yiDmRx5Vtu6jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edward Adam Davis" <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_54372C4A0A752D77EF66BC3CA9377097F009@qq.com>
References: <20260822075716.D9C4B1F000E9@smtp.kernel.org>
 <tencent_54372C4A0A752D77EF66BC3CA9377097F009@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 09:26:16 +0000
Message-Id: <20260822092616.B9B121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The newly added validation function `aqc_raw_data_valid` is incomp=
lete and leaves multiple out-of-bounds reads unhandled.
- [High] NULL pointer dereference when a malicious USB device spoofing an `=
aquastreamxt` device sends a STATUS_REPORT_ID (0x01) input report.
--

--- Patch [1]: [PATCH v3] hwmon: (aquacomputer_d5next) valid the data size =
before reading the sensor data ---
commit f2f8bc6cd48d08e98637bc3e14b8b66f1ed8bcd4
Author: Edward Adam Davis <eadavis@qq.com>
Subject: hwmon: (aquacomputer_d5next) valid the data size before reading th=
e sensor data

This commit adds a data size check function, aqc_raw_data_valid(), to preve=
nt
out-of-bounds reads when a device sends a truncated HID report. It aborts t=
he
sensor data read operation if the received data size is smaller than requir=
ed.

Link: https://syzkaller.appspot.com/bug?extid=3D9ee5f5dc18673d6b2f37

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..2381a74eb4a48 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
[ ... ]
> +	/* Fan speed and related readings data size check */
> +	for (i =3D 0; i < priv->num_fans; i++) {
> +		fan_off =3D priv->fan_sensor_offsets[i] + 1;
> +		off =3D fan_off + priv->fan_structure->power;

[Severity: High]
This is a pre-existing issue, but does this code lead to a NULL pointer
dereference for aquastreamxt devices?

For legacy aquastreamxt devices, priv->num_fans is initialized to 2,
but priv->fan_structure is left unassigned (NULL). Legacy devices
normally communicate using report ID 0x04. If a malicious USB device
spoofs an aquastreamxt device and sends a report with
STATUS_REPORT_ID (0x01), would aqc_raw_data_valid() and
aqc_raw_event() blindly dereference priv->fan_structure->power?

Additionally, while this patch attempts to fix the out-of-bounds
reads, are we missing bounds checking for priv->fan_structure->speed
here?

The speed attribute often has the largest offset
(e.g., AQC_FAN_SPEED_OFFSET is 0x08, while power is 0x06). Could a
truncated report still cause an out-of-bounds read when accessing
the speed offset later in aqc_raw_event()?

> +		if (off >=3D size) {
> +			msg =3D "fan power offset";
> +			goto invalid;
> +		}
> +
> +		off =3D fan_off + priv->fan_structure->voltage;
> +		if (off >=3D size) {
> +			msg =3D "fan voltage offset";
> +			goto invalid;
> +		}
> +
> +		off =3D fan_off + priv->fan_structure->curr;
> +		if (off >=3D size) {
> +			msg =3D "fan curr offset";
> +			goto invalid;
> +		}
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does this function leave several
out-of-bounds reads unprotected?

The new aqc_raw_data_valid() function skips checking
priv->flow_sensors_start_offset, priv->power_cycle_count_offset, and
device-specific sensors (like LEAKSHIELD_RESERVOIR_VOLUME). If a
malicious USB device sends a short HID report with STATUS_REPORT_ID,
could these reads still trigger a slab-out-of-bounds access inside
aqc_raw_event()?

> +	return true;
> +invalid:
> +	pr_debug("data size (%d) is less than the %s, %s\n",
> +		 size, msg, __func__);
> +	return false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_54372C4A0A7=
52D77EF66BC3CA9377097F009@qq.com?part=3D1
