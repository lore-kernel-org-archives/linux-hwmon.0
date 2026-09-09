Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA35569F3B
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963172; cv=none; b=jemi9KdvAYNldzwPUhRGG1Ky9J/aOQCV4DRqJyu74iY6ckWps4I6qw5FBiE29ZbolpkDHgV/SPuG42lYZRRwUYLmucIElnhSyMqmdUmOHO+CY8WXPudjSeBjsa+DpjCa1Eqq9LZcNq4bn360EIENl2YuKPUUNBKxdhlEU0n63Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963172; c=relaxed/simple;
	bh=VAUG9ocA9CuuA3ZZK3/Ji3B3eMK2e7/A4q+kEwaraLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxXHmj6TB+OIBPkJd2rymLEc9yU881mkKwA+a1fdpv3dF5MLXhFWRH7ZoVHmA9CshMgxaGV9aP3RKsqBPmoXHXfR7QXqcKuig2cHYdCFKnTaEcz6bkFnVC+uuXK4k4tNIEaE4SV1qNm5etlGqhRnoxy8P2rchbKEA2WZTCiD6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsLp6Npb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsLp6Npb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db18e5cb56so57926945ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963170; x=1789567970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=WsLp6NpbmgzdJch+5EILXUgOxbzUM2BSNIp7BshFaCb9mMCv2PqBnXgEvMRn22YPgc
         2++YHMyZCkDK5zdciAMlg1z9QmDe5Heep0+oWf4QSMNWvCDej1gz5Ddjc9W5ithpw23M
         jGqKvlqhSOOi6pi2RQM116/P+UvIRgs3OLgc/9/mB6rAADvpjI210lfeGbLcxADrx2oT
         Z8M5Ukh+GopxegIS1uK3usVbNssrTl8Hq8x/UIcrCNsEYObMnvS5HMG6u+pJIYJKcjsc
         aCUaftx7XauiMYygVg1KDbCJSvFf8hAT/nAEccI3UxWxsqfy0/g+PGJZo73bQSeNmd8c
         lnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963170; x=1789567970;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=Z27+LPx3OHf7VXKDv0ZccJT2Vr8h7T0z04Zc5B2oZCNSm90EAoCZ9vUMhr1pCGZ1Mh
         PWJi6shNUNeTQhemEtzkRIhxw3acTxCdlAXxU2VaUfq5LjLg4n4DqpNtsRW2osqxkkat
         UKHt7v151krrvGcvrptrUABC1dMVT4D/RrVDYcFmwggHwzoX6dC/Rdgf9BWKDlZXFuL1
         womW7mDEv5//yY9ucZ0Z3ZoLvOakZ0TgI8PZwkNlXY8qcpW4fl6AkZVViNCkwX6ZsYbI
         NWIlgVnlvI4K08CJSTcbaJUmAC83oFrhlbtoR7QQgiYPoQSIDED5LY54VHizxj6MTNNB
         lolg==
X-Forwarded-Encrypted: i=1; AKwUvBxyBpjOWbnMq40nWMKugCDVHnOIOSl/UX/DyFOzoEWMQqjFPx9ig+Bgp2e5kBFEK86EnfTQohCyekuqiw==@vger.kernel.org
X-Gm-Message-State: AFuF++mzfudw2QjZzuoXpzuFLNWE9esAtFYXd9YQ7t87QMoXmRQXP+Tu
	8jz/+ZvjmuJVethWmqzHF0YXsTa4nZDMoVJFb7TyA7COrHCc5TRopdxk
X-Gm-Gg: AYBFou3uOTMRKZbEuNDnoVYevX4u9OSEsy25OHH4wtys/qV4MKQ4iwIUt3nnSFUKf0G
	eh/hbAQVLzUAQ8PtWLKtXVt1ZZyyZUoQYx9m3BjxnvRzauBvNKhGsxntw45SWPH9hU3bKdrUIQk
	p4zaftUBx8RJOUO1HfxA3AicIaBneTmbWC/w0Kq88Cz17Yg7x12RyJve8aHJ7AnVxQHt4a7zcfQ
	FwhRxAd2c2z3whX/8XGZond7oKRgk+hw5clAbLn4eIMaiTusSfOWpmnD6LJ1yYhT6nne6t0zRCQ
	yshARQI0uqQhjHzemrXxLVuVrUyaa/phQBlk6IcSdMgEPWAuCDSXaj7s4xtuYuAzcvWYp9acIx2
	xV+0xSvs+TmyRMQ1Dce5jBdiUoeEUVBBIxudgdn9Jc6cvop8WFMnt5WUr7IzhfPZmJgIBDY+Uoz
	ZNnOwNhQClFQEUCeu3fUpRJCzsxGbJPC/mARjQ7J+VExkC0fsdLS4Q/2W9SQRHtZ0+kxabggvij
	CsY+Up1PPw/n8OE9plUqOYXbOKoFECwX6uQELv52eoGmN1s
X-Received: by 2002:a17:902:8203:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2db1287779cmr388670795ad.16.1788963170238;
        Wed, 09 Sep 2026 07:12:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm74597655ad.79.2026.09.09.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:12:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <43a1bbe0-0012-44b1-ab0d-0dea1136869a@roeck-us.net>
Date: Wed, 9 Sep 2026 07:12:48 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] mfd: remove unused wm8350 driver
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-12-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260909132153.1596191-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 06:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was used on the i.MX31 ADS reference board from Freescale
> and the smdk6410 reference board from Samsung. Both used platform_data
> based driver probing and are now gone from the kernel.
> 
> Since probing with devicetree has never been supported by wm8350,
> it is clear that nothing can use the driver on an upstream kernel,
> and it is unlikely that anyone is still interested in a devicetree
> conversion, so remove it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

