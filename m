Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222213;
	b=4HO59DWGTEJJPux08oSHLZRjR9STcr8Jzbyzk6QX6W3C8j0UsPiOZgUuBvOITu+IyC5S
	 JgsF5nGSO5J73uk5H2qsJTwNRZdp5sf3oLZDKhNWSUqWfWD6JFdbe8EsZOrQTSFve+8jU
	 g/CtgwFE8RAGO48LojAlHcNDUJFoUU0r3vWA8OnEbsNg2w7UWwnUiFVfcBE65ZN7Pb3Wb
	 LaSy5XmBoL1iC6NPl9O92hIA1OH6dSlR087oHE4+Rbsi5ldx2ZVs4dsrJYti++UVp3+hj
	 yRLN2+IS+sykcCvkd40m4aYp1zNuorOiFo4Bf3wqNPB/boAZs0z8tSunY3B7Ed8EVBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HzmlUck2wvNkgIRfMxsPmeVdHcqWQo2f9DFTfL0a1iw=;
	b=Nq+SY/v/FK5n1JYwk4DCU/7rWHot/92XMMzoZnVvpY5O98GB+N7ytrR+iwQGaOv3NQGJ
	 bsTGQzC/0vL72/D3q5pgv46X6dnVrmcGI5bOoaHJ3o1S0n/Ynz/ra+0ph48J2JEMGh+t1
	 C9RJ7xVu7XmaxKeOOQuin50hUmcSLj+P8pz02UzOXdtY/y9UOFf4KJ9DraEUSV3rlWgk+
	 W6oCclLpTFxU36/6/2CoWUNhUDiocAgwVzbxdOqciA8Q3hQNZNSruNNqfA/pZ/+dFEl1m
	 V1agpZqSU+dyf5gEwsbLCJ2qvMAhlfkwI+QlJYfF8lv5syHDiFgQ2iEleDNKNCimRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tuxt4cwP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9070606A31C;
	Mon,  9 Nov 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tuxt4cwP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F201F0089F;
	Mon,  9 Nov 2026 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794222212;
	bh=HzmlUck2wvNkgIRfMxsPmeVdHcqWQo2f9DFTfL0a1iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tuxt4cwPuMRZ9dwdZfbllEuZ1vlOcEh8VzFkaFZTM+X2rY1cJ5FbTTUap4Vn+Pgtg
	 GK9IrZ9/tssXfhlX8cRN+nN0tNY9qCkLDnZNg8SPCec7QuGKdOJ6QPjhCaTeYKMsQy
	 RCMUGAe8MCC3sY+IL3QDV+So9D+kocRXTycMgVzsHNXm+GSNNhk/H/a6XNjSsOQGck
	 dNUunsPH3ScxIw3tiUx/H1025DPPjwSlMR6A7/1DPmCu5rXRWVzcw2Hspdc5p0ntvD
	 6vo0ULsPNcKVmicE81UFfgU8BMFqlYYL6TQk8Al6o23dFg75FW0GF4q0RiCRDIt3DX
	 HCCX4I32aB6Cg==
Message-ID: <sashiko-outbox-204857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Pon" <theflyingrahul@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109104914.1534-3-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:03:31 +0000
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
- [Medium] platform: arm64: hpec_command() skips reading HPEC_REPLY when
  reply is NULL
- [Low] platform: arm64: hp-omnibook-5-ec: direct hwmon registration in
  hpec_probe()
--

commit 9e10721f812ce769072addab8eb2bcaf582e4091
Author: Rahul Pon <theflyingrahul@gmail.com>

platform: arm64: Add HP OmniBook 5 16 embedded controller driver

This commit adds an I2C driver for the HP OmniBook 5 16 embedded controller,
exposing fan and thermistor monitoring via hwmon, mute LEDs, keyboard
backlight attributes, and hotkeys.

> diff --git a/drivers/platform/arm64/hp-omnibook-5-ec.c b/drivers/platform=
/arm64/hp-omnibook-5-ec.c
> new file mode 100644
> index 0000000000000..bfe20e12aafdf
> --- /dev/null
> +++ b/drivers/platform/arm64/hp-omnibook-5-ec.c
> @@ -0,0 +1,417 @@

[ ... ]

> +static int hpec_command(struct hpec *ec, u8 cmd, u8 sub, u8 reply[HPEC_R=
EPLY_LEN])
> +{
> +	u8 request[] =3D { cmd, sub };
> +	int ret;
> +
> +	guard(mutex)(&ec->lock);
> +
> +	ret =3D hpec_wait(ec, HPEC_STATUS_IDLE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i2c_smbus_write_i2c_block_data(ec->client, HPEC_REQUEST,
> +					     sizeof(request), request);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D hpec_wait(ec, HPEC_STATUS_DONE);
> +	if (ret || !reply)
> +		return ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(ec->client, HPEC_REPLY,
> +					    HPEC_REPLY_LEN, reply);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret =3D=3D HPEC_REPLY_LEN ? 0 : -EIO;
> +}

[Severity: Medium]
Does the EC require reading HPEC_REPLY to return HPEC_STATUS from
HPEC_STATUS_DONE to HPEC_STATUS_IDLE?

The file header describes a four-step mailbox protocol ending with reading
the reply, but hpec_command() returns right after HPEC_STATUS reaches
HPEC_STATUS_DONE when reply is NULL (as in hpec_led_set() and
kbd_backlight_timeout_store()).  If the EC only clears HPEC_STATUS_DONE once
HPEC_REPLY is read, the next hpec_command() call will time out in
hpec_wait(ec, HPEC_STATUS_IDLE).

[ ... ]

> +static int hpec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "hp_omnibook_ec", e=
c,
> +						     &hpec_hwmon_chip, NULL);
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);

[Severity: Low]
New hardware monitoring drivers belong in drivers/hwmon/ rather than
registering hwmon devices directly from outside that directory.  Since this
EC is a multi-function device, should the hwmon functionality be split out
into an auxiliary device driver under drivers/hwmon/?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109104914.1534=
-1-theflyingrahul@gmail.com?part=3D2
