Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337003;
	b=R8kWVZdeYnCBRrkI7NTeBDnf/SNcl4RgBkCk5PPCZ4K6q6Sni/XtkeqgA9Rtr6g6vqa4
	 lbbp4u/qs2BW4fDz+Vr4eNqSQb5k+WFfurZb0QjCfSYa2zJPfgZ7HOMGC+vjsE4GxlUtn
	 TY32lmv6tn8unCaGc3lN8wsNfKGsAW+kJgJS/LblS6OB0q4ug9EjCJKvLqVsc+1EutnPx
	 si4mciDkBGGogjtOQM7fzmH+8xzugHQ0nHr3attTGaEHxdPNBh6YfymkAbkfvsTshBLdK
	 VFIbq3nGDIjit/sV+pzQZjACCvL4MLpcgL/pN9Go3MKLugbo7dM8srk7ZmCscusperg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337003;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=77pB6jjKuYC+9zXzZigkrnZsk8fIFqaoziozid1NOpE=;
	b=RVI6mUsawkffHmZrlIHuNxQyPTPV1t72m5agAxb3cyuzPI4JH6Hhbs1H3EJyVjpbbh9D
	 t90IQh7AMdNZDEppWxXxAdn0mZg9XJv3RaCtgqpaVamPeZL4FkrqvjDI01yKADYFHi4Vo
	 vOmgTKNN5/17EVW/iAltsSZ9tXQ1wmzByDU3Azd2OprQZ5wwPRP6dPUYXBST+FM1CZS+V
	 gYPJK3ZcTiXJAwphWHYS9+K5IkhLd7qE6gTz8PoHYMlhZaPvQ79EsXDUrQZKB6QmaFk56
	 mdNmivwu8KvIighMxE5qY9SwNE/zD2jyYhl2ImiKiUgFmxbxhryc0waq2bCtzZYtTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TAF35FHL;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KYXLTr9X;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5251D606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5251D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TAF35FHL;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KYXLTr9X
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4C6327A0290
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 13:56:42 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 13:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337000;
	 x=1794423400; bh=77pB6jjKuYC+9zXzZigkrnZsk8fIFqaoziozid1NOpE=; b=
	TAF35FHLgdTnA2kmrBi5GjTZZVVFGTf3m2DKt9mFATV2VhtozAl74Kpv4g9zuPor
	nTKXUnnjJq8TSz2MSCVYgFdpm4PORrcemaAiU3c4+rZbthk3neuHWOzv1K5qjwnm
	tYgwtmaGv4SFa2fXEKhtvRyclhDN3+bhC1OWW/z7DZZrvrr7KOCx1sXAJDsUZXit
	o/AvVI0hMi7WVuaEWH4N3B0b2vJ7V0u6DEP8Digd3fV2pi6nUEnWCmWG/dv8xC/4
	5TjHVB1DF/l79ubppHP/fVMyuJmPBF9hhPHyURp4ZLV5aOE0zG+dBtggNxax4lT3
	b9iehvYwIqHGxMj+8nmZBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794337000; x=1794423400; bh=7
	7pB6jjKuYC+9zXzZigkrnZsk8fIFqaoziozid1NOpE=; b=KYXLTr9XSZZ7NfsG6
	zikfGarfFHuWFsEmIQX6T+c7e8IzG5sKuGotFZ1V09SnrQA1vuuS3BoWa3PTOFMq
	1sSOgJ5ZkZEum8UHyyzgxafq90PuKFNJVqUDtyHDFT3Hab7oNTTPcpQrN6zQb0sC
	fLF4LO6+HjGOjjfpvY19/FlV2fl8hrJvW+Kjfn9xY/mKUIaefdbm2HDM8Qj/gfgL
	PDY3qfVWOqbgtGSkE3+fJAc/wn/RjbERtI1oFj8bw6X+RACQLIl25GNfhsWxHR2a
	O1PYW0esAxByl6GdThRNRYXqn8p0CygP8aGfMSKw3mM2WWZjzT0fnYW8b2GD/NFj
	TOn7w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337000; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:LBGrpQz6y4BDX+KypX0o7PzsBTjogoCrqbW5sWuXPsKLPoa
	I15Hekv9jMbSv+mLEKHc+CsOokq/SrupOpQyNlrGW/S9a/UrkoFxu3sDJhtK/yBO
	pwvaoSt5JWP6U61aozo1nAt30xgCwcRn6WiNnUNYUL4CwNLuQqFCFsnhAmmYTOao
	eW+qRxM8iyUlrOPYF0TwsGgyOq2a6qD+Qj4V+5tk60gWudZF8xHVoJJb4ZObmLWP
	2RjyohMvkw8vID7RkQhlvjXQVqcGqQVgU2li771s2cSIHm6tA4Y0h8eeXfHwuanT
	zt1slOs/lfrJbxADirPyt2hbNgW2JC7IHvZ/ZpQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zvjPy9V1jaRX/WbG0RO8tSGoA8PnDAeorOgJ+vlT7p0=:nB1PbrDdjzuLRysr2NrVqydLe2Wb1BPQDVGGH3S0lsw=;
X-ME-Sender: <xms:52jzapCRihQIARHWvShtsXzbBGzQXZOwVQRpmbBxHOZauG5DoUtZZg>
    <xme:52jzaiUuFipwazW5jimAnjs7kxmnz6vQcY68QmvmNduz6xaDUeSqArHqwQu-f1TJK
    831ozITSXI-HAsn2rBtjTXrMWgy6mmLpihYj6OPqhYP5su6VAbGGJ4Ukw>
X-ME-Proxy-Cause: dmFkZTEMzlz1LtK/oY+XPfcUeQCxGCi3A3kycgJPcTTxHw4WYGodkQ4CO5YzWfFPcSZTtI
    2Mk5trxKuUOkns2WdEZ8ZsCmqf8qAwFlaXKnrkKHk2J7N5pMTn5KbPua/u0SABRvZAcG+G
    YZPQ/m8koL1UrKBua9c+XwSBVkllAwBnTYKlaDBFIlon9VBpsoQq0NCkr2Vaw+/pZnBG3U
    vEGl/jGDIAwizkikY6Pcj0o43bU81SryJKHxrqBvfsEKxB1p1xiguuGwS+eYu0V4isyJmD
    8U1xwHGsORYGX2i+BS2Uj3oloQ4dlllgqPYdqM7+y0nKwSOeMOV3+d899ttwcRFyqovsfr
    r9TdjToBb/icAswAk9/sdrTJtJlPsxZlJFM5+ocbd9o540mJvDveUcXrRM6GN/ygxkJi+Y
    MliI5OA3p3MK73KyPYQ2cTg3HHfFETyYapHBQ9GEoawTNfOzEr/2rrOgk/fggE7hx5Pyfh
    13LA9+WzK0ijKhYPZQKrLvfzOOEaFb/81OHo4ZD8H86nCvbKtoZFW80v2v9AU4mYIXqrC1
    rD2qfY0BRLv7uiOUt4p/4tg7B8MG63cWhZO9Rx7SfLOeLzBIPuML3zU60YdPHocAO2ro2J
    XsiAPGrI9krkgxdNkfx/vNVxriMAZCLZAEK5z/FSzbQMlmNk0CpBVDBSHZXQ
X-ME-Proxy: <xmx:6Gjzart83DwEnSt3-9GV3gxeGiQ899LxHs1SwKOpn2Z6haOwezHGeg>
    <xmx:6GjzaqZmL1DfGxA1cKJianAlbWzj-NyHqxtJYGrFBDTQYpYtdei6ew>
    <xmx:6GjzamVWNjlE8G8pv3Q15xFlNrQ-Ksz9_8noG3L-6Y8fwkfOJw8m9Q>
    <xmx:6Gjzam5ydQaUAfBfGwStTYIdzNHgGgTlDP7yquxF-Q2D2stWs2ZUrA>
    <xmx:6Gjzav7AKS9zHLxdXhSGvM6kUKM2xtGX1N5nwi0prGuVSBjemEnB1SgW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9FBF532A0097; Tue, 10 Nov 2026 13:56:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AzctlkTPwaRZ
Date: Tue, 10 Nov 2026 19:56:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <2b16d572-aad5-4a99-978a-611781e38966@app.fastmail.com>
In-Reply-To: <20261110183434.181711-3-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-3-linux@roeck-us.net>
Subject: Re: [PATCH 02/10] hwmon: (emc2305) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of emc2305_platform_data. Active PWM channel
> count is detected from the chip product ID register, and per-channel PWM
> and thermal cooling parameters are configurable via devicetree child
> nodes.
>
> Move EMC2305_PWM_MAX into the driver, drop platform data support, and
> remove the unused platform_data header file.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Again, your patch is very similar to mine, but yours is a little nicer.

    Arnd
