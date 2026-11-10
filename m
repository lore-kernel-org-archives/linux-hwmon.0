Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337924;
	b=qyIm2/WYfVIt6UbXE4ukikPHtL/yCGjshXJkr32ScfSlyiK4XuIMTUgLLKC00S/+b7dd
	 tJbcZruiLsL7m9ljhiJE+J0Ez7e338Sqfp34ZS5VafT8DBQ3Vmc+iNgvjV/WvX+ULEGSS
	 elU218MUzuN8tREnNZsu53dHcc4PfGsCAVSEIsrZNyzNO4DukXJnlVkx5vphfkLn3Lymw
	 6CQ2NBla2srh2vfJjZUVgAa2LhmqzFTbs6l0rDrnDWIywuM9SBBPDLBt2t3o6e6mViBDL
	 9ckIPFGVgz2jOxkOqVrBP1SLu4toVTLiYa3WReBhq7tQ4oiof78rgjV7AKHMibSNKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337924;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ujb1wsB8x0RE2UbBmYlOilYxTrLNNM4yCyFNzGLTYM4=;
	b=w3xEMYgAnuuV9zSdjcvr9SpU4QMV5vYq572E8hssFaSTIRMrEtSihEduEpgL6H/w2pIV
	 lmKfVygT3zHB/GdcBf0Fguyn3BHIFG9U0EYp+ag9ZFncES8PdK7MA63OA67vFEHYCkmDW
	 vlw+Ra++USO85BdcMSpP6q6bwLRU4eUhl73sWBn4rI/2bGX+oiJoDqBqbDknYDUrtW30A
	 n3DevczRvamaRJptPv/UFt3oOUQ1+al+MCF6RhSeZd6gakNZ3L4zfI8/0KcS9dw9w5/wD
	 FML4jX1VDXSu6B/QsMHhsn4JTFWn2cg+QTIbITwfaZ+oYBDWqEQOkU25ResEZ7sTJHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="bDOX/j+H";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YDfKhdmi;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF33606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bDOX/j+H;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YDfKhdmi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id CCAF01D0019E
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:12:02 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337921;
	 x=1794424321; bh=ujb1wsB8x0RE2UbBmYlOilYxTrLNNM4yCyFNzGLTYM4=; b=
	bDOX/j+HbCRhEChropOK2lyr6Y7D/unAP+CHj3B9p/+DPLwhkBQ+9UJznQmAsmbu
	km5V3FsOaRYTIm7k3sDChADuwd6v4tuHZx8JBtjqeCEc4yQIpTbg8SHm8emVucs4
	XDkdD9u/Esubsk98+bCx/sNSP2FHDXRtWGFHajJulEUcPhcr7zPjwTpnjBftWDTk
	LxV8Ddtd1JCMt9HWlG24n9PIYDwmslfI6wotNmwoyZDKfYh13SnFNZSdeVRWx1J8
	GNXK0urHmzQc8Jdn0aq6Eubm+7+03ke2ubuj9hKzuOlB1Nyyr9KC3w9GWmz4mPfn
	iotG4aO7fmxX3jJgzZioAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794337921; x=
	1794424321; bh=ujb1wsB8x0RE2UbBmYlOilYxTrLNNM4yCyFNzGLTYM4=; b=Y
	DfKhdmi1NMPBhNZIGby8fATCZQvQrl+g43tFJAkbJ+RgygJ/N+NoxWbJoFb5mlXg
	scCZRlxUkMRe2wZRE/X7nKQzlQ21nj3rB8pdiMKJreO9KKkRiQV5gxdarud1V9QJ
	o8rtaFUUnfPBNW61vycovQOWB40TWhLzbqe6BOfLi5rRBtrz8+ixESuZ76h7c9Ji
	VkIGzJZjqNXrxRtlNnWam0W7uQx1PRm0Ve1YXT8qoftKVCboCHFz8YArUlXSHK6L
	0SMuaCDNVtih3xP9Q0winYhs/69cQD5SFcfSMWbBpeCvgCnNlOkhFO/cf+G6zk4T
	JflSL/FLC/ZJCDqzK+cXQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337921; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:hs9eMFvAQgVSAvyIJeS1jzI8ymmbEhkgrrINkajn/Dlg/4M
	uDKfb/HD4XVrZgex6hs5LuXK0lnpPOxXOOFDbFuxsx2+Vx5MhbHgXMtczLkJI0ja
	VE7o/GumT+v4CbgU0ufN4MK4LJcZhn9KO29pGQAug3vCLpbLTyINlUNmcw7wxX8Y
	iktJ0+JWE+P9PWm4XYQ7UXTK9Ubwwk9JdH4UvV/DQWHm0x797Iudxvh0tpMxIeiO
	CerZ2LBu0Xyo2EwxB4P8md80yHGspjZMYHt1CvoThoFV2Utufa2Ol0INXnlGB3xc
	slwHnn3q6ax3umj087iHPVWA9XbTaYOhT9oZp+g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ZF7VonLsBQSkjH/VoFdkBomGqnuQY46vPK/aEmuUTb8=:GXSzW0XUSOJBF8J7dSk058oP5k+tMB3MDZnP/NcpMRo=;
X-ME-Sender: <xms:f2zzajzV8r9eoYi6vBcAlyRVuZhxFwlNX7ryB7WNwfu5_xJ4w4XvkQ>
    <xme:f2zzamGG11xg7Sj7Sqrs-AjIb08Z8uU1QrovVlY7PuXYTvPxwaFidfoCipJPFcg4m
    EmERgR91lxFXqPNIryEIMpzSO8bitNQzy3-IlUaij-svcYsap4Hvw-5>
X-ME-Proxy-Cause: dmFkZTEmsVMp4e918wO1ZtkqA6/BgXR2KrYO1LmLsnDkLivhVMMurt/egJjXHRl6RdiMzH
    YjLK+Ug4WQPSz13UxS9a8NQhiLsXbJ3P1K8fzeI0aZBvOfpQsb7fd3H+rdafDUaXh0Z9pR
    AOKBXUuwnozFrbf5Civ24eN6Z14cO7WvdEZUWbr4Lv9+Io3T9lPvjVmfUF2V7+kn8iIv/f
    usXBhduH3yx98grH1rtz20eZznYvI9RDxPh6BUeQRItVRNq5TopQ+UwEtPP2fzYdORvUPH
    g8fXGapINgM9O75Ke5X7kkXJ2+Chc/rLeNQ3Ta6+JdPrcIe08w1x4h1IUwUe4AC4ibPMj9
    TbUuDzLROo73G27iu9METmRbrYE+sdUbtz7dDl9Z02kxA6uS1BoPj3+nO3Z1/J4umzTBq8
    0BkWB0EF3lWLMdlGy1UYbR6NbqBqdOyM2JBFXaJV2SwXuCHMCqvtoEg1Srt0b8IzUlEBGI
    XDiwkEi+YK8mCTDI1hJAJfGwvYqbVElFLS7iqQwu852p5JOg9u65oL/++QfodlngvsR8TT
    7Y4juOMu7NMDpGwUCdhffZfEB5tXh6q0mmxEWBpUEADYQWg53MXRNUqp9I64ofhYulRK7O
    BFbl6t4y85fxoL0P/kBD9M8OtGi6jm3qzlw8Fj1X3ucURQm+CFeJxGVKRYmQ
X-ME-Proxy: <xmx:gGzzarOHdebJJBArcrgfAbolYxFjHL2kP2VexoyohrewozZpoKufDw>
    <xmx:gGzzatscxPNYgD2uUT398rr5vhED7GU7ohfWQV9jxhqKDMjEENAYTw>
    <xmx:gGzzatWGsup41PKvCb7TD0TSP7jJ_8ptzzdEX2_50YW45HNtaZpinQ>
    <xmx:gGzzattHFGBL0WMdXfAOSedUdX5_5RLyYdyrh3zgT9wlPIqmqfLvuA>
    <xmx:gWzzaiwoby3vMiPIZ_AqG_gFGMIl3K9C0bJHctgYoirkduuRdF8impCY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3B81832A0099; Tue, 10 Nov 2026 14:11:59 -0500 (EST)
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
X-ThreadId: AbzNP5GAYLwZ
Date: Tue, 10 Nov 2026 20:11:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: "Tim Harvey" <tharvey@gateworks.com>
Message-Id: <cbee7dd5-09da-4442-afc4-214e8ef2e816@app.fastmail.com>
In-Reply-To: <20261110183434.181711-5-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-5-linux@roeck-us.net>
Subject: Re: [PATCH 04/10] hwmon: (gsc-hwmon) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users providing gsc_hwmon_platform_data. Channel
> descriptions and the fan controller base address are already obtained
> from devicetree / fwnode properties.
>
> Move enum gsc_hwmon_mode and struct gsc_hwmon_channel into the driver,
> fold the channel array and fan_base into struct gsc_hwmon_data, drop
> platform data support, and remove the unused platform_data header file.
>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

My patch is a little simpler here as I kept the platform_data
definition and just moved it into the .c file, so yours is
a nice cleanup on top.

    Arnd
