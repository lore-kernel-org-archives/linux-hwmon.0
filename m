Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991486;
	b=Pf67vXo/qV9ZrfwkkRPNokSgX3tVl1Q8bcqGo357hPLZ7InFvsJmpdvvklJxa3BLxgxH
	 d2gqZtVKsef0Q+W+jd2jKjy6VnikB3r7rSCfCD0KxZob0juEHzp9JMBWWeJPZZGZFwyyi
	 g1jWj4spM8j4x+/LBDRnfwgcfLikBf/517zOmZ9j6AZq2Y3pxTrYFVa4fVSxggc192LWO
	 1CHgln6I/9G7bkfW7TvHEmRIi/BfgHucahzg6rgrwAjXVc0Ta0qRamM9yig1JYcMIm9qf
	 M3S5nKz3plWvRI5phFZle9OtYhI2/NNkW0BWsDwLDvUPqalqBKm569Y/rNa6fPjKoxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991486;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KDlfuAN1WEHnOjnJcaNQFMplES2DZIUu3vEgMrK4TU8=;
	b=l/BCQpjNKzF9/N/mYsiPJ+eKVQYUBU4u1sdrQh0ERmQirRUzIw69/PX5+z3Uu/nwSIqv
	 hG4OAYDJbadpMO+EuoIVtRDsP13qmIYWjFT/0lcTx8dFB3/DRn/weLhJxFKqmd0TqznqB
	 w2ReHTtupPCNg3/qLamnQbJnzyvhBC3qHozGNK79GNbgMVhIcGEc18GP2yXnvq3Ku53T3
	 gjr7sknZ8tldEYsV5+BvWY43W6xFvqrp897uLIfN5kqJZZWmDfJi89meCS8z2iMxXdN2U
	 stmkcr+Qp+bGBEwdDLtfFesMqlXGsyGLOS1rCaNKGZTpThSyON6Z6IWE4zp6WhNlaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeNHqFQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14346606A32D
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Nov 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NeNHqFQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9075D1F0089F;
	Fri,  6 Nov 2026 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991485;
	bh=KDlfuAN1WEHnOjnJcaNQFMplES2DZIUu3vEgMrK4TU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeNHqFQdqLTKe85yu/ppFsd23DQfiVD3FDS09TzvZ4txtEqQSzNdI2btqE7+3BG0C
	 6Xkkra5w+7oY4uYMplAAlcmwN/Zn+Z/V68qYtoMj1B4VQfry0i97/fXpU9v+snJera
	 dqeM/1oYKmOewanFpL61U76mu3jyohmNRf8t4XTcGm3nh68tIPW+wlBvRxnEY5YNWD
	 yCZekret/aNa4aQBkpDuVhPij3BoZkULrTlwFeTo9UXALnHqYEoqyhaVJpjY8KmnCT
	 +feIu3YGdde4ac9qaA2seN8fhPAzOx4BVtMkSw5WIdAka/AcExPGBrRKO05MKyg/Hb
	 lSiWlUxqDkLaA==
Message-ID: <sashiko-outbox-202122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261106184357.27763-1-tomasz@bojanowski.me>
References: <20261106184357.27763-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:58:05 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] hwmon: msi_mystic_light: probe fails in msi_ml_probe() when
  CONFIG_HIDRAW=3Dn
- [Low] hwmon: msi_mystic_light: 32-bit jiffies wraparound in
  msi_ml_update()
--

commit e43662ecc3664e6bdfc441610eb41666bfc00492
Author: Tomasz Bojanowski <tomasz@bojanowski.me>

hwmon: Add driver for MSI Mystic Light controller voltage sensors

This commit adds a hwmon driver for the voltage sensors exposed via HID
feature report 0xf0 on the MSI Mystic Light USB controller found on MSI
800-series motherboards.

> diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_=
light.c
> new file mode 100644
> index 0000000000000..39dde9d9e82d9
> --- /dev/null
> +++ b/drivers/hwmon/msi_mystic_light.c
[ ... ]
> +struct msi_ml_data {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +	const struct msi_ml_board *board;
> +	u8 *buf;			/* report buffer, must be DMA safe */
> +	u16 in[MSI_ML_MAX_IN];		/* mV, 0 =3D no reading */
> +	unsigned long updated;		/* jiffies */
> +	bool valid;
> +};
[ ... ]
> +static int msi_ml_update(struct msi_ml_data *priv)
> +{
> +	const struct msi_ml_board *board =3D priv->board;
> +	u8 *buf =3D priv->buf;
> +	int i, ret;
> +
> +	if (priv->valid && time_before(jiffies, priv->updated + MSI_ML_CACHE_TI=
ME))
> +		return 0;

[Severity: Low]
Can the 32-bit jiffies comparison in msi_ml_update() wrap around on 32-bit
kernels?  If the sensor is read once and then not polled for 2^31 jiffies
(~24.8 days at HZ=3D1000), time_before() evaluates to true again and
msi_ml_update() returns stale cached readings for the next ~24.8 days.
Using u64 with get_jiffies_64() and time_before64() avoids the wraparound.

[ ... ]

> +static int msi_ml_probe(struct hid_device *hdev, const struct hid_device=
_id *id)
> +{
[ ... ]
> +	ret =3D hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	/* Keep the hidraw interface for user space LED control */
> +	ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does msi_ml_probe() fail with -ENODEV when CONFIG_HIDRAW is disabled?

SENSORS_MSI_MYSTIC_LIGHT only depends on USB_HID in Kconfig.  When
CONFIG_HIDRAW=3Dn, hidraw_connect() fails and leaves hdev->claimed as 0;
because msi_ml_driver does not define a .raw_event callback and
HID_CONNECT_DRIVER was not passed to hid_hw_start(), hid_connect() rejects
the device:

drivers/hid/hid-core.c:hid_connect() {
    ...
	if (!hdev->claimed && !hdev->driver->raw_event) {
		hid_err(hdev, "device has no listeners, quitting\n");
		return -ENODEV;
	}
    ...
}

As a result, the hwmon device is never registered even though reading the
voltage sensors via hid_hw_raw_request() does not require hidraw.  Passing
HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER to hid_hw_start() avoids this
failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106184357.2776=
3-1-tomasz@bojanowski.me?part=3D1
