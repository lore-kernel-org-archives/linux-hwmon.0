Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338308;
	b=HTpXTSBsa5DSN/o0VCPg++LusoDM76fE3V1/jM3Ww4p3pZHHPnA4ShLnwmPQwxU1FeF7
	 q+ZHMaY4ZdyxpFIvBpXUmZcIf+3omIu1iWyym/5aTFaslFnaH9VWZkp9ZjAqefBn90SM8
	 bsgCzlq2IkLbD4KtfMv882PgY3ReU+4hkl9Y0PywoBquaAbznfibzWfF/nsGHC4spHWyL
	 pChLUcDvfrlyXnFxTcmZPk8kFQmSGU2fPN6XYVSPMuYe9b77nYxeXe7blSHQkqWeRLPnf
	 Rr5zG8U+Wl6QG8z/vFaHTetnk0e4nyPifblMtjcK02pO+hBk3xHiVFidjuWjApsFV1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338308;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=XqUZg9aCQFHfcCZ30POfNsOSQSjaxnxH26NL+EBrn1c=;
	b=FscoFulTYPV+LfmonujeicMT912YoCPBgt0mjwTonuV2xrZeCc0rVDLIKHdAtpRbqhvU
	 IC/i94GGmEl/6jaZOHnIfrd600YPxzL4XuLYHADXpgfNjU6Gy19427yFHCvn4cmxU1WBk
	 /r+6BKYsDAv0IzqMlqm63PuHsBOIokbp4/L5w5Kd5/RuY3K1nKacBdiKNevfooNfR1nQO
	 BMsIz17DyIQOVZ2qLEAz0CxdZeqsU5/6+cn0kQKT0sZWArUUHG5zGCxXIxAg9b46nMBE4
	 u8izs1gE3xPGQ7bx6VQNhr94aWO7KJesY5pexcGJQ+lPFDKdxRvSdVV4VYXT49c+aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QFAwpLVg;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wABUZC5O;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78DB606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QFAwpLVg;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wABUZC5O
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id DA5D01D00252
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:18:26 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794338304;
	 x=1794424704; bh=XqUZg9aCQFHfcCZ30POfNsOSQSjaxnxH26NL+EBrn1c=; b=
	QFAwpLVgy7ApDIhxcz8OmqOp8s5IJpDM0lUQ8nHMnBrpLzmFBxltuqs390SbopiW
	t8SdLEylcUbP9spwORZ+82uEcPoalP5KvrROfVxPj44risdtMO+pLTmad9khnG+z
	/5DEIL758WQpgazry+CobSWpxGVUrOoEeJnZCPihEyT916RwcOqVD9gNrxfKdvtS
	SwgQXhCEBf+3fLdHpPe/g6anu9QvHks4PoGdSCQtdpB8s2Y+VyFyxMpZ5mdMVAUM
	5QqUOeYLYHQu9RxrkMRNRAuZsMqMJDUT7PpLANafrfEYZNhlD2rx0w20oGj8wdGO
	fqMZPlTyDWz9vZM3qbzP0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794338304; x=
	1794424704; bh=XqUZg9aCQFHfcCZ30POfNsOSQSjaxnxH26NL+EBrn1c=; b=w
	ABUZC5Ox9kqyYssnS0xyz5UTDVWGuiIjP7oUtWgdJzRKWZ9Cpya8hqA6en8oks65
	JxCJhG9StQJzvHUDEArm9Uup5hRCuX8fejqefXVqRimKKY2KL6dB2U94GPQS/2dj
	8WdNRW1+z69R1h05xtfHX0Q6Api63KpYo7Yhujx1NWlcxXvLDoy1gSWDA4yfFQBY
	1bjKwnFDpvEAWYrFpR66vjj/jcTYELKZLe98x59VZZsXa0elH5aBcU+B6SgtgIjS
	d5E8GGDJZO+9PV9cMTnUpAZo34x0uoKYsqc/S9MufBhSyV/8kDjwL9A3jChgmEWa
	FPukJ3zA3avz5FhIz6D8w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794338304; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:WMVPaB6HqbLdcXpBIPL7tEl3JwxWsluNSSusNjNcVZ7ehJW
	tgvGl39vDRtcOsuq4zGYxwbVplijeeyam46TEbIrrfgxJqBFxEjqO+OkHtUHx4I7
	HTykuYJGXLLtNQ1xgsaoa8VeIcWX6dge3XYs2GFBUlborWwyaHU6h/YgQtGOrY/V
	VSNaYQ0BLT0yZpfzit5gsk+GeDiAaOd+YCccP7YZr+7Nr/L4d9lep3SgcYpZBy7v
	YAfmFzl8u0bxFGnl9QlvvjdnczP2k7cKVa5y3sS9yJteqGsAisuKU/IeXW6dxHHk
	JwqUO/Z/VfXTrYFFJXgDll/tT+y/snEVCwVaBlg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:HMcLgQGc6vWTn964uwzhLJCFycIb1xxBEo6ZBCDzOX8=:y+VnN4MYiCgUbE+AdRx1y1FHEfevY7NrEVITk4QWrDI=;
X-ME-Sender: <xms:_m3zatEhsbxpAYKXhNDgClbFHVMMpl6EVO7eh34ns9z6GvX4CRAh1w>
    <xme:_m3zatL_B8LRFcs-yWjarGNQ0C3eQmj7f86p9UZ2wcY_wQ0sY5DHGA6D5b97SPp-o
    e7dCNWDSr80WbPuUQmZCXuFwaueK5WJR4r2CjXEYnHy39n7TBHlY7wV>
X-ME-Proxy-Cause: dmFkZTGuTIoU1vQs/DvWCn8faFmcmH4hL4EYxQmXzv5kkzJf8V29hwpHqW4Ge0ytbzu8qz
    49IZYmLAuHvVKbuSQZceenH86aVj0C27m6mtPQDfbK0bMUmJdiPlJ1qMoFiwmey7LOsciQ
    5M1SU0jAZ6sufRahtBuRYN89n2wEKnJfHGo9PsCnSKVokftWxkpCgZazrmR1neu6Kjc5wj
    g0vhXH5ZaymiovqsAEufKcn5O1HCsGS8OcGl13z5E0KsMUJa0nDzPYQTbgaZysCxjb1nMc
    sZX/doA3qgqpo/ry3qJZMvxuhBWb41y4L1UG31XQJlLqTFFVIteS0DG7hmwoe7pgR31tQP
    9/phRxxv3MDoxNDR/Tm/jDuB932cJ05DCTO9cyYJopyfTrQhUDYTmm1p5qZV3ZCpv8CvMa
    a73BGOoCBGsCyonkEu5lJBlBUzEYSHt2V7QAfpzz7PilCIB+bv2MNJr5/SDf/Hi/LWAuV7
    1VhICIbFpXDGh8li596+/jyoXmdspA2PtNFGtTSxI6Y4eJ6JtIksuDmqmlz4lwn/vAudcl
    SRBWUvRp2GtxGKLq6RHshmASyiegmOiO77KD/uIbua81tzTATFKJOj3xqVyTQc0vRPgZ84
    5veLBOnij66B+rFAS279AwyrEqo6jquNVuyf4IECOIukJ7yjMTnmwAY+PDOw
X-ME-Proxy: <xmx:_23zauAMcAiU7Xf9YkCKesbwp3Ic51cg1EVOBDjbN0eL87nkrPns0g>
    <xmx:_23zagQ_kUp5gU9ksnCLCFFxrI01ANcuO-yPFCYMH8UldTWfeGv78w>
    <xmx:_23zakrohjjYq78oBBrFHQ1mb3jl3vT6vaRbpfQNaYczwGgrrqiwwg>
    <xmx:_23zaqzk7KDdMS_WpMab5RK6MKZCTYSKJacyRntpABkHSWKYGI2p-Q>
    <xmx:AG7zaqGHUNjpRax9gn7d-3bTmpEfG04LRCG3nwpuwXdHHN1-rMpZsN8N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0194432A0097; Tue, 10 Nov 2026 14:18:21 -0500 (EST)
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
X-ThreadId: ALIHE_c85yL7
Date: Tue, 10 Nov 2026 20:18:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: "Riku Voipio" <riku.voipio@iki.fi>
Message-Id: <fd6da907-9362-4a6e-adcd-9ef99861231a@app.fastmail.com>
In-Reply-To: <20261110183434.181711-10-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-10-linux@roeck-us.net>
Subject: Re: [PATCH 09/10] hwmon: (f75375s) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of f75375s_platform_data. Initial PWM mode
> and enable settings are read from the chip registers during probe, and
> both pwm and pwm_enable are configurable through standard hwmon sysfs
> attributes.
>
> Drop platform data support from the driver and remove
> include/linux/f75375s.h.
>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Once more, I took a different route here and removed the whole driver.
Here is my explanation:

    hwmon: remove unused f75375s
    
    This was used on the iop32x platform but has no references
    left in the kernel and has no devicetree support, so there
    is no longer a way to use it.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Note also that f75375_init() runs into a NULL pointer dereference
when there is no platdata. Your patch fixes this, but I don't
see how this would help anyone.

     Arnd
