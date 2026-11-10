Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337138;
	b=FX6V5+wfDPPGh7tF+6aWimyF7Ymwe/A03HSn2N06QYKXSaglLBETe6pzYbKcf1t7rhtp
	 9dYi69v58cgWxkJakvITE3IbGDX6nkoMvycJvbp3ej5sHTQEO6NQUhcMiomMJIK1ggtH9
	 HAaLTyV3cRfte9iSAdBBq7fW4TG46bMJ37cCk4qgSV3bGOMtiGHBigsdL0pq2QwijO2IJ
	 ox391v0ZbOAiBrHyuCOdAhZKNCJxdQm0XHhuqHE1T8utp3qLrSMbHnX4q9uHbzMGAh6DJ
	 0lFxRv7l51okvvTMAGPVJd4zLmav94y9J814B4CUcmFOYJHfEH/Bl2jdPzFp3kjXz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337138;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=m68sOCtO2JLet7rOCIRDSmTO+xIqqw7mCOSSltFTgkI=;
	b=XTmF9pluzx3wWPUVjT+ZGKUMRwXOR0En3NfnOfKX38lSCfntMe/1Y0OOOANxx0begaKJ
	 sM8ZWarW8Jomov/6VHNrTN5VaOhmveBdA62KRL4o2xxergFI+YFsRydHh5a2+SSLoyuHt
	 5gLd+Y5S8u+IfKbHlJYjrtmmYOLkgTuybN3zHuNErWyyHoK0uZcz8oiBVzYFMDS6ygPOq
	 UaAcNN6SIGWw02dtWYwhCmFA3QhRpxPnH4U+m3k8Qcy/ufSbn2n8mX7HHR2MLn719MQT5
	 pvIBSS+6loIwrH0r8l+0+PO513VW1tliwKGBM7MbyMcQnxfpdm5/FJ1w5VxTR8xKJKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YUVyy9Xh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cDUk1jOj;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F426606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F426606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YUVyy9Xh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cDUk1jOj
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5B84F7A02A0
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 13:58:57 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 13:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337135;
	 x=1794423535; bh=m68sOCtO2JLet7rOCIRDSmTO+xIqqw7mCOSSltFTgkI=; b=
	YUVyy9XhhoT8SdF+aE3tDvozeGWhJI7qUYnzr6Gye/+bIeut0+neuNeXs+jXKu01
	rtS5wrN0DIoLdkG2HXLrLesff7xDkZ7a8YARzUGiUYiRHn9nMT6u5RIFBsvqvYjq
	9sORSmhkDqLqlxX85GHN7F1IXnuummkq5esn1JOqdNp/0dFsKexeVRFrtYLBj2k/
	ZGvHL80hfPp/Nwtp3GUrl7dEnVb+/1a5xSV4QQWnWkaemgPsAujej9PZiTb83Wcq
	ny02XWkq750/C6ZTW7gJKH1yBKxCEfUuAiRAopiCM/l40zFxSk58n1fQMjMwx+RF
	xbbM52D/zx5dzM+B/wG56g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794337135; x=
	1794423535; bh=m68sOCtO2JLet7rOCIRDSmTO+xIqqw7mCOSSltFTgkI=; b=c
	DUk1jOj8lYcSd/Mvna4anaFGzJmGWmH1vajDXMpN9uQOLCr7tSkrDked0I9mY51o
	s3SxwfUoc1CNKfORMZjy4nJh0ttlmxXNVJs0wtCJmiPYA/MINAuokjn764f5HIm7
	X6On8BfhrFbp3KwIUp2xrPwEwo3qBYyEqrFk46wEsSf2HpeTgwOFhKhNPlK9A8vR
	UN+tiLr8+Q1w2Z6Kl3xwEnb1WST3GKskwN7w+xh/l/d0YBeONZmyZbDdtxqoFzXW
	dhqplSmDAfeG7jRMw6HDJZtaHjVzEXbrNb+4ZJsaB8gKiy6PPNoUlNsSWvyCFYOy
	heaLkX63EQTRxaY6VjrFg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337135; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:FM1gnY+3JRjblYOZQefetb7J0wM8DfAvbLBcgEub3GCZQan
	ml6B1phWpSUyGeyrRxH6AT/yB4wK0K2yllHQK6VJf8eJ+bHgAUM+JsokBjkjjM1X
	Wkokz8yi+GF8Zw4J6BNim6UtcoIraU1YMD3Z2VvA778V2uPwk/Gt7BI3kTwps7S4
	y8dzW6LANWOsa2LRyXBIQRBM8P6gdeQIUhNQdRgfCqgryWJg2+DPVvVAZ7gSqmIn
	RZF3U5IgOfGQ/e4Z/P8WFRKBRr43HEaLBjM3KSWPSwYSfRxiQWJ9FoEifaQt28Eb
	tUFMUOj5hsan7eQuYxIRaekSiFsQX/LB6WyZIIQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:omYUoUZxTQdDM32aNy7fDlEUxRLShtfXvmJ6tnQH9rc=:UBELVxQfI4LkRGI7Q36qPyiXN6bNabU4xIUx2CT5XfY=;
X-ME-Sender: <xms:bWnzaoWIDs1QvIPZxWMXltBYirmy_THswODG1hvLzQnFyswIoovWIg>
    <xme:bWnzanZyAmqGNnyFe_reQgDipR_jFWbFTZQzGdQdQg4wNB2HVrGsw_Q_-cCn-Ld-0
    w-CoDHS6VGXKkHGC8HZn9s_K4pAEnPJuctYcUOeRoiOAFzk4zLQ_Ppi>
X-ME-Proxy-Cause: dmFkZTGknjd6uVqt1H5gSyUu73TqDKNeB6/YjcJj7eW4lZp2Ocvc/BAz8SnmbSc/pWm8yi
    fKHpqBMvBB+05X2RYyQCH2h9JlHNKSBjccJD4+6mjKVrYn9xaGumWWMg9anMff07+0drT3
    6867r6S+zh5qwgHbgt5k/yxfJEvj5i8EdjkHxc6iH/TB5uleFJ9FJn5VgEdqvDfgD1FLkd
    umBeGCm6+riRdVid6KW8NMkMOtiizjC3igwG86YhEvqAsVH9O8aHirOUKQqQIbznBmvZp7
    YHRjxcX1GqnS68Y6Fzxa3BF7vzoyKFFamxwXXhsh6bTrE9QAkeXByry2dSqvdojbohe1N9
    RevrO1NQHLdslkvsSzuoHyTapSa2rFBcLwHY2uG2pc3wm7+shgsUbYT+Va0IEzYGcGdRd8
    GclomKOzvb9jMcW/qw80XdPawbrDodCdXXZwnAJr+hBIkF8KdKkwBAkw06xzSA67EXav/M
    8hN/jncNx1P0oSOLV3jvaFIdPDHp++aNtUt7m9Bg82c3B3XuIIJGVe/8h+KD7QE9S3WHFs
    9riezhwiWtyflDedLJoj/MxQRnqXcSf1Uycv4VfOL3H2kTt9ynP27mwInwvrMiYqZjZKak
    kTwfQl670nO4ekTcwiQ94Os4Rk14zEHFcBIfF+iVnE612XdlwW5Xk/CrUTAQ
X-ME-Proxy: <xmx:bmnzavTKYveIahEznCBR28jNVZn4rSDRaAskVPSle6dYYzwiKT74wQ>
    <xmx:bmnzaoglIrHZrRhnpkoFqEz_Yu73Uzt8vVWnFtIZ0BXtoYx8QXNZdw>
    <xmx:bmnzan6mAw322uZBPjM433inHWbfJtx5cNWSXsJXGnEJ3N8_BXtdzQ>
    <xmx:bmnzatCY3JwCURX2F5rnmIrlmKmD1b2WPxpkRDOuQiDi8GO5jyHzdw>
    <xmx:b2nzakle2tI_Xft6flVkDQSY5kehjBEARaqEf5dOoiRARqDr45V_82tI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 72F2A32A0097; Tue, 10 Nov 2026 13:58:53 -0500 (EST)
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
X-ThreadId: ANlewBQPAqKJ
Date: Tue, 10 Nov 2026 19:58:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Message-Id: <fee902dd-a825-48b1-8add-b5691c915b5a@app.fastmail.com>
In-Reply-To: <20261110183434.181711-6-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-6-linux@roeck-us.net>
Subject: Re: [PATCH 05/10] hwmon: (ltc4245) Drop platform data support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of ltc4245_platform_data. Sampling all GPIO
> pins as analog voltages is already configurable via the
> "ltc4245,use-extra-gpios" devicetree property.
>
> Drop platform data support from the driver, remove the unused
> platform_data header file, and update the driver documentation.
>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Mine is the functionally the same, but I missed the documentation
change and did not open-code ltc4245_use_extra_gpios(), so your
version is better.

      Arnd
