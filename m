Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C13BF66E
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737504; cv=none; b=Y0HPwXglAobmhJF2Xdntpp8o8A1LhBPE31Lcav1xv8M2x5+QU6eKzu+ISuTPGob5bwyP9zVrne/MJO1Fo7MaRZBtli704Qr84fFUrp3PltmIvZ8J+olVJkD7yNh3BYpjciEuw3y2V90KxCsFRI/cuAixkp2nNVGvRULlqZaP7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737504; c=relaxed/simple;
	bh=ZgqIerCj/pdiQqCimeB/8ZR7tqmCJ37Htvyk7QlPj0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iz5bhEtwScyaaiEhUmdFI/E3pSVEkrJB0lTmF4Kkn2+0yT3miHEX/TQGpvX2OKymsxSQ0EY0mmWDFZySfh1QGRfO1Xv1KpUVM3LIA6SO2+9v/TzPi2o19x2TmI8xYxEasBG5iwAN1b7P+0JrIIn0e3MhWktWiCmdYjP1uMpsVVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv4NLOXG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv4NLOXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F72C2BCB7;
	Thu, 14 May 2026 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737503;
	bh=ZgqIerCj/pdiQqCimeB/8ZR7tqmCJ37Htvyk7QlPj0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Dv4NLOXG7OvEpmAmN7WLvu+a84Da35jNhmk655OLsJqUnrkC7tZwes++rhHtlEI/+
	 VYQzNGDXGN6pCcR/cJgKBjUdcngSiYB21BvI6UkA6x8orPi9gxoMcDp1dnwZKj5usY
	 TSzjnGVpTsPiSLBDaALd3PnUB3olrbeHAFL5O3EEzXZSl8dk2eGWw4MNIooNWzTNLt
	 /14UsCriF36gMLIDLjf+Y9dqrKXYeYgKhajzcyz05K9atCDSuNYr/Nl1z40X59yh09
	 +IxgjFZRkj9TUyBTUJq32r48DtnxmydeObxxxSEXkDCElDc8ibiSAoSBjSAdJcnfau
	 M8YjLBz+jJGQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wilken Gottwalt" <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <agR9YW7hGTJ_l7ms@monster.localdomain>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:45:03 +0000
Message-Id: <20260514054503.A1F72C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver unsafely shares a single buffer (`priv->cmd_buffer`) fo=
r both transmitting commands and receiving asynchronous HID events, leading=
 to a critical data race.
- [Medium] The patch introduces a custom mutex instead of using the hwmon s=
ubsystem's mandated locking API, violating subsystem guidelines and creatin=
g redundant locking.
- [Low] The newly introduced mutex is initialized but never destroyed, pote=
ntially leaking lockdep tracking state on module removal.
--

commit e6fd3791fd5a9cb958361af0e5c07256d1d52355
Author: Wilken Gottwalt <wilken.gottwalt@posteo.net>

hwmon: corsair-psu: fix and readd locking of command buffer

This commit re-adds a locking mechanism to protect chained commands from
parallel access by hwmon and debugfs subsystems. It introduces a custom
mutex in the corsairpsu_data structure to serialize these operations.

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index dddbd2463f8da..f1e59a8debb8f 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
[ ... ]
> @@ -122,6 +123,7 @@ struct corsairpsu_data {
>  	struct device *hwmon_dev;
>  	struct dentry *debugfs;
>  	struct completion wait_completion;
> +	struct mutex lock; /* serializes chained commands and parallel debugfs/=
hwmon access */
>  	u8 *cmd_buffer;

This isn't a bug introduced by this patch, but could sharing a single
cmd_buffer for both transmitting and receiving cause a data race?

If a delayed reply from a previous command arrives right after
reinit_completion() in corsairpsu_usb_cmd(), the async event handler might
overwrite cmd_buffer. Because hid_hw_output_report() executes right after
reinit_completion(), could this result in transmitting a corrupted buffer
to the hardware?

>  	char vendor[REPLY_SIZE];
>  	char product[REPLY_SIZE];
[ ... ]
> @@ -217,6 +221,7 @@ static int corsairpsu_request(struct corsairpsu_data =
*priv, u8 cmd, u8 rail, voi
>  {
>  	int ret;
> =20
> +	mutex_lock(&priv->lock);
>  	switch (cmd) {
>  	case PSU_CMD_RAIL_VOLTS_HCRIT:
>  	case PSU_CMD_RAIL_VOLTS_LCRIT:

The hwmon subsystem guidelines state that drivers should use hwmon_lock() a=
nd
hwmon_unlock() to implement locking required for interrupt handling or for
attributes registered by other means.

Should this use the subsystem-provided hwmon_lock(priv->hwmon_dev) instead
of introducing a custom mutex to protect against concurrent debugfs access?

[ ... ]
> @@ -789,6 +798,7 @@ static int corsairpsu_probe(struct hid_device *hdev, =
const struct hid_device_id
> =20
>  	priv->hdev =3D hdev;
>  	hid_set_drvdata(hdev, priv);
> +	mutex_init(&priv->lock);
>  	init_completion(&priv->wait_completion);
> =20
>  	hid_device_io_start(hdev);

If the custom mutex is kept, could initializing it with mutex_init() leak
lockdep tracking state when the module is removed?

Since the device data is allocated with devm_kzalloc(), would it be safer
to use devm_mutex_init() to ensure the lock is properly destroyed during
cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/agR9YW7hGTJ_l7ms@mo=
nster.localdomain?part=3D1
