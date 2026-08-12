Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704A937DEB7
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531532; cv=none; b=FBLVcymL+leh9SG004So7ojvelrGeVZgdzMY0puO7MZCHEwjfPvZsnbaXaphJViFTeSigyilkypwlW9MeZc+w67QUplLSikgrXAJVkVd7JzZ5Fe49HJE9q8BoGXMhdWXNUFNX1660WfGx5oPYX4uQzV7ulH0QLyVATELdmeCaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531532; c=relaxed/simple;
	bh=EDp1yG5V2RmIXfs81sn+yBSuq/3XXEUq1oLEhv7sKdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TK8GyEn9AfkL+l1Ln3jy8pdm7rDGpr/SdD3v4dtVkzTJmH8lSbtwD+MsC/hAr+GZPUcIIUw7Awy02DTyQvfeKdp/4FEmVh/v5a7ERf0xHcA+OBe8eg9CBV9GONPXT8kAGUAHvqJx6QYxnf2mxK4RiuDs3wMYc3fwdMv3oL5q23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivk7n05v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivk7n05v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2119A1F00A3D;
	Wed, 12 Aug 2026 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531531;
	bh=/c7U363rvrnwUKGwq/osQCLCAEKTYjk8CAxpduBm0D8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivk7n05vjbPvYiLhyehTnWmPKa3rxI65n1fztS/3NiqLlNz/srFFu+sqJLOYbg62Y
	 lLB0dCg3sOWiAOYSktdmw0w88575yDq+k276pQOO5l0X41aFvdcgjZnl9mBpBt+pAK
	 7vAzW/Ts4GRYVyODxSO/x8Uwvmct9rGvVTlTqXPIpkuPOMugnICLzxcdUIKWq2olWC
	 KwpY21m2iLvaF5tBdA25UBSHQOBWY4jXBJXmijx7u2E42wZ3ZVinOkv0cSVFgicTtA
	 jdYz7MayYkEkH0RoDsZLFDD7WSPZp4/k4QcU3lYjUynSlKH2H+232vvg1oG8FfkSFA
	 QFIGnijnDXcBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:45:30 +0000
Message-Id: <20260812104531.2119A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The HID hardware and input streams are started before driver synch=
ronization primitives are initialized, creating a race condition that cause=
s a NULL pointer dereference on device plug.
--

--- Patch [1]: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device confi=
guration ---
commit 5da50001b696b978e4b3741acfab6782c708ed93
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Add per-device configuration

Move model-specific report offsets and capabilities into a device
information structure. This prepares the driver for coolers which use
a different report layout or do not include the external fan controller.

Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-=
us.net

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 10a1f5aca988d..80563ce38519d 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c

[ ... ]

> @@ -471,11 +495,15 @@ static int rog_ryujin_probe(struct hid_device *hdev=
, const struct hid_device_id
>  	struct rog_ryujin_data *priv;
>  	int ret;
> =20
> +	if (!id->driver_data)
> +		return -EINVAL;
> +
>  	priv =3D devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	priv->hdev =3D hdev;
> +	priv->info =3D (const struct rog_ryujin_device_info *)id->driver_data;
>  	hid_set_drvdata(hdev, priv);

[Severity: High]
This is a pre-existing issue, but can the initialization order in this
probe function cause a race condition leading to a NULL pointer dereference?

Further down in rog_ryujin_probe(), the driver starts the hardware and opens
the stream before initializing the completion structures:

        ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
        ...
        ret =3D hid_hw_open(hdev);
        ...
        init_completion(&priv->cooler_status_received);

If the device sends a status report immediately after hid_hw_open() is call=
ed,
rog_ryujin_raw_event() will be invoked to process it. This triggers an atte=
mpt
to use the uninitialized completion structure:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
        ...
        if (!completion_done(&priv->cooler_status_received))
            complete_all(&priv->cooler_status_received);
        ...
}

Because the priv structure was allocated with devm_kzalloc(), the
swait_queue_head inside the completion is initialized to all zeroes.

When complete_all() iterates over the zeroed wait queue, its task_list.next
pointer is NULL, which would cause an immediate kernel panic.

Should the init_completion() calls be moved up before hid_hw_start() to
ensure they are ready before any reports can arrive?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812103532.3950=
49-1-renari@arimil.com?part=3D1
