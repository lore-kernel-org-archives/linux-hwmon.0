Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA213126DC;
	Sat, 27 Dec 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766853254; cv=none; b=fceO5eAL3hFRPdplDdT9CWbtoeDDDSjXyVKwmmAtNPRxVJKx2hFSgZeoDoShe5MrbOpTdpNiGzWbEgFnZJRpJdDejzZ2oJihFi6uzvBtn6ZqmsYVa2u5HmgjHPNd0/ctwhYU2wgzCCgFHpfOJpjo/MmKosEL7NEWM2yl8o8uNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766853254; c=relaxed/simple;
	bh=m0Yl10O93KKHXvYZjqVkLtiD3pBYMpo/TSxRpwGagzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXQl6DaMjRxNUbduIyo1K8X5FMW7OLBH4tPF2vF7lY2aMOcPrdn5S8UtQrEoiLdp7dxKKetqbBAKVXRLGO79/iWzjUWx9qCZkTs72kJ77kSFmOz3tfvzZOTcUd/OEJyHCCh70RXwcw000gTAv+vmwLFz3yK+YNKXCI8Vc6SxCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id A7F98404;
	Sat, 27 Dec 2025 17:34:04 +0100 (CET)
Received: from [192.168.1.232] ([84.179.232.117]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vZXEq-41C9uT0; Sat, 27 Dec 2025 17:33:56 +0100
Message-ID: <9ab5bb73-6237-4348-a62a-a61af4d4704e@t-online.de>
Date: Sat, 27 Dec 2025 17:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] regulator: Add TPS65185 driver
To: Andreas Kemnade <andreas@kemnade.info>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
 <20251227-tps65185-submit-v2-2-1882024b8f33@kemnade.info>
Content-Language: en-US
From: Josua Mayer <josua.m@t-online.de>
In-Reply-To: <20251227-tps65185-submit-v2-2-1882024b8f33@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1766853236-FBFFFA32-52EBCAA4/0/0 CLEAN NORMAL
X-TOI-MSGID: f6b82a1b-eba3-489f-9cfc-ca12eccde188

Am 27.12.25 um 11:20 schrieb Andreas Kemnade:

> Add a driver for the TPS65185 regulator. Implement handling of the various
> gpio pins. Because the PWRUP (=enable) pin functionality can be achieved
> by just using two bits instead, just ensure that it is set to a stable
> value.
> Implement the pair of symmetric LDOs as a single regulator because they
> share a single voltage set register. As the VCOM regulator sits behind that
> machinery, just define that one as a supply.
> For simplicity, just add the temperature sensor (depending on external NTC)
> directly.
>
> There is a mechanism to measure some kick-back voltage during a defined EPD
> operation, to calibrate the VCOM voltage setting and store that
> non-volatile in the chip to be the power up default setup. That is not
> implemented yet in the driver, but that also means that there is a
> non-factory default value in these registers after power-up.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   drivers/regulator/Kconfig    |  11 ++
>   drivers/regulator/Makefile   |   1 +
>   drivers/regulator/tps65185.c | 454 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 466 insertions(+)

Tested on Kobo Aura (N514).

Tested-by: Josua Mayer <josua.mayer@jm0.eu>

