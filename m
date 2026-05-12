Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1325C13635E
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549502; cv=none; b=Q1sqohkDCsPY3fi+xW3GnPlu3nHG6f+6+b6au+KuzlSGgHmHlrDrC/9pHq1jFfvUVimPo7pqn7SbvrP2hLg+j845OTjXlEvZ7jqIkb4hSID8rBp6thC8iXTygyPWaCjSQRFHZJmtro2FGHKEzWjUTauTAnl/l+20RkEenCF/AMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549502; c=relaxed/simple;
	bh=CbwlNSQk4SZmgLD4fFbWlT2rGdrjZwjYOclUop6MQFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ad/jMQtNr1V552PaME8QMW5lIcw1jZaW2mI+wPNjRu4oP9HTI9b3SNJipKl0xRi3oWDoeoh6yOb7HXWAgwVJmxaErDqnxGJ1S1/LO2PKw9e9Q6agZI5KuPtPVUur/llmhHpUqyAfQm7Wl/laJscouWouS7wmWU+lebfSqth0jNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0Tx6jCu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0Tx6jCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6890C2BCB0;
	Tue, 12 May 2026 01:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549502;
	bh=CbwlNSQk4SZmgLD4fFbWlT2rGdrjZwjYOclUop6MQFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=K0Tx6jCuCUEnfNe48QDcCiNG9WUNOJ7hYt2xqkZfjXtv0G0bTib6hEkYOo6N6IeVN
	 3GR1TEwsFjNRgy8NQmOADJ0nlyp6ncDg3r6y0rY7a3g6UmSVNWr11Lu60M+skEAgec
	 a4KeHbwFzg3HavWVm4McVF2SEfC39cVGZZVztyd8SRrXtpn5gFqythLpUkF32qj5LD
	 kErPx/AYwa8+UGtjzQDOaOPbzgRTgrc1DaKBuR8q1ng0liNZSPH0a9I+9mccN7tqEh
	 sRw39nbkCEmOt8ivrDL5ZtNDbG6dA3a7TM5IgXC4UEwJlmcQUULij82TESNUkMS2/k
	 aLG16OXyMzOSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] hwmon: (pmbus/adm1266) include adapter number in
 GPIO line label
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260510-adm1266-v2-5-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-5-3a22b903c2f1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:31:41 +0000
Message-Id: <20260512013141.D6890C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Changing the generated GPIO line names breaks backwards compat=
ibility for userspace tools and scripts.
--

commit c155c76ac978e1fe6990333ff1cb0db4a1c40a1e
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) include adapter number in GPIO line label
   =20
This commit updates the GPIO line labels for the ADM1266 driver to include
the I2C adapter number, in addition to the slave address. This is intended
to disambiguate labels when multiple devices use the same 7-bit address on
different buses.

> The label is purely informational (visible via gpioinfo and the
> gpiochip /sys/class/gpio name); no DT or ABI consumer parses it.

Does changing the generated GPIO line names risk breaking backwards
compatibility for userspace tools and scripts?=20

These names are exposed to userspace via the GPIO chardev API and sysfs, and
userspace tools (such as libgpiod) or custom scripts can request GPIO lines
by their names. Modifying these names might break existing userspace
deployments that rely on the old naming convention.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 0dfb02db86837..479e768ff87ca 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -292,8 +292,9 @@ static int adm1266_config_gpio(struct adm1266_data *d=
ata)
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(data->gpio_names); i++) {
> -		gpio_name =3D devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-=
%x-%s",
> -					   data->client->addr, adm1266_names[i]);
> +		gpio_name =3D devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-=
%d-%x-%s",
> +					   data->client->adapter->nr, data->client->addr,
> +					   adm1266_names[i]);

Could this naming format change cause regressions for userspace applications
that are already matching on the previous adm1266-%x-%s format?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adm1266-v2=
-0-3a22b903c2f1@nexthop.ai?part=3D5
