Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDD33507C
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294383; cv=none; b=hmUMi1GrQBm7GFd6E8maETqMtsGvI2QYDsURHxETgY0QRiufDNEFNKMyzUwEbOLBnGb4rFcVYw3/55c/TlcP6ilMwdSK/earKozk9HGwbBpvQn45GeeQGax0PxH6RgFNFhYvV4xWNg/uYn+Hlg3ZdIT4Y9hTTyZM44wqXh5SUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294383; c=relaxed/simple;
	bh=zGZA5jtjA+GnrO/NFjXbXpYAgDySxtTsDj3KTsM8EQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GYvB5uOQBVxX3dhzfF4tCH0gd05zieVc1jFB0kNXuT0omULu91R74yYgXMzsUvMv2PZiexNwjBopP7s9Blv8epFQNtMOyJmrSQD0T2wojUWO2Re8o3fqHzfB7tLl1lmOkiUUmcyUImPDvecQC/vLPCJihAzm1BCttBBw1T2Pegg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0pWAei7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0pWAei7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3692C2BCB0;
	Sat,  9 May 2026 02:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778294383;
	bh=zGZA5jtjA+GnrO/NFjXbXpYAgDySxtTsDj3KTsM8EQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=P0pWAei7X828YdN6n+pOYY6H/5w22wyTFLp5+UfvNnT3H3XewYE+T+BlykfoJAasf
	 qlbcb1bZxjKCs+yW7xUnIGJ/U3KLNO0vqAp3Fsl+MG3GuUbs9/PFZexuMOLdXHCJsH
	 8b6T5hFbBfE9PILIem9adNKMZeUL4JAWjHnDiHtqPZAEu1qTlIvP8R6YQLjWdsK+ph
	 C4rvLacGYxOWSEaS/fyxCSSgcwwfafaiTBQ57/XzMMRqnApEZwgwF/4nffzeYv/QRF
	 XmGrSQKWcJ/PfzQgfXotunFYXzXSjWzIgIUYhFuTiUobGcXlEDCAzURQjOpgPEPHdz
	 AwrN2IcOa8hrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] hwmon: (pmbus/adm1266) include adapter number in
 GPIO line label
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-7-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-7-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 02:39:42 +0000
Message-Id: <20260509023942.E3692C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The I2C adapter number is incorrectly formatted as hexadecimal inst=
ead of decimal in the GPIO line label.
--

commit 79ede8d83182247b49e64822f8f1d3ea0161b1cd
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) include adapter number in GPIO line label

This commit updates the GPIO line labels in the ADM1266 driver to include
the I2C adapter number. This change disambiguates the labels when multiple
devices reside at the same I2C address on different buses.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 07c20746f0831..ec6a2c9167d82 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -293,8 +293,9 @@ static int adm1266_config_gpio(struct adm1266_data *d=
ata)
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(data->gpio_names); i++) {
> -		gpio_name =3D devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-=
%x-%s",
> -					   data->client->addr, adm1266_names[i]);
> +		gpio_name =3D devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-=
%x-%x-%s",
> +					   data->client->adapter->nr, data->client->addr,

Is the use of %x intended for the I2C adapter number here?

I2C adapter numbers are conventionally represented as decimal integers in
Linux (e.g., i2c-10 or 10-0040). Formatting the adapter number as hexadecim=
al
means that bus numbers of 10 or greater will be displayed with letters (e.g=
.,
bus 10 becomes a, resulting in adm1266-a-40-...).

Would using %d for the adapter number better match standard I2C identifiers?

> +					   adm1266_names[i]);
>  		if (!gpio_name)
>  			return -ENOMEM;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D7
