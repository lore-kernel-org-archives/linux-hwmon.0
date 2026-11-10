Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340221;
	b=eSfpLzG1FzSmzhrIAhffj6vwI1unfikiGJ6DenrCbD5uC3GsHEPnIVYRDnVSQ8fDz2xq
	 Ap8QV4HvPN50r/8pP63HM1GKzpTDHFYbZoJ6UkA0tGyQd2AcMEpipGgXLjbTFnJQqAklM
	 3UAiISl/IDnXDNYz21orNwVeQNq6QIGvFrjioNj6Icaow785gwNs4gy1V56wdKf/EvxqJ
	 AuZA7CLQ8aNHBDeM1dzOU3fp345AhK6CycGC7foF5RzfrTHL8ffDu/FOA4/oK3hyuljtT
	 2OAt+tQbu2r63Oijjllusqt6aJ7r8fXyAPdlO1wp1Hs/ZeqG11D1shc2m7ANXonWE7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340221;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=zQIFtLvq7i9VMpAZwv+CK/bNZQ/4tM/o/1Xy7i++TS0=;
	b=EkrAoirhVFMMBzWhJgU68nkQy2Ihwn1Jb85x6YmwJgNhxEqzGSiArEo3iOSitimfcbE3
	 s51RTzmQEAivD+mNXSvNKg0VwpboFDlmAvo/AADTesw9r62F5gRkz11fzX48LKW2jg9hN
	 Ur+wh/I3yg1AwMCnBmIKwzOS60ztAjBmfuxJm9/cNlAOOCq6CdZpoKQ+BK5CMAQqscUaW
	 ugSnh1lTUobryfYM33tgcdCYsRq0/s16SlZwOSrP4CkxFFWlj5L7/Rbn72Y8XNllABZrq
	 WYbLpfi0Pw9KkLTfRZpZE185wXR7ABvz+25RNggw+H5ybwOVQHqtD6jX+dm/5/l6/IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XPDRSECx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BK7bmHf2;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1439606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1439606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XPDRSECx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BK7bmHf2
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id DCE081D0026D
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:50:19 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794340218;
	 x=1794426618; bh=zQIFtLvq7i9VMpAZwv+CK/bNZQ/4tM/o/1Xy7i++TS0=; b=
	XPDRSECxsRThXeKDi5I17aBsRMtfGLrs6runJsqksMpG5dT3VtP8ZE6Gs9mtv0Gp
	+rkhTfnPH/qpWO8Aw1kP1OIAP0SZVwscsswO2tl2Tdi43JXGw1EvMkr7eApmnhLZ
	a308Lx/jcmn0N6TIZaKbr3ehED+rdBv/GMH6MIffN6ubZvvZvaYOee9WJiu/pOyC
	9dAGMdo7CaWiunF2h3R5ziZOOTbekxE/EfaZzhvboKA8MVhqDmKZMWtkwFEtK7jX
	tVm1us+FX7ftLs2UPVZv8cTN+TBuro19yrP8OVCT82/UKxjovSShbaHB4jZlONPr
	pWkk1Da32XLPva7dUyR+2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794340218; x=1794426618; bh=z
	QIFtLvq7i9VMpAZwv+CK/bNZQ/4tM/o/1Xy7i++TS0=; b=BK7bmHf2FPpVV4E3o
	h9OZ2LrA3aneTIFNg8/PhgCqbh+dGmsIIQfsL78KoAGVhO2e4u2rp/sQLhpC2SJX
	rJ0R4Lcdi0HFPbPldK2ozKnW0UZ3Ky1ERxeCajbTEVHDCVaojobrKqhEEu0cJtKu
	RZGL1WPs768DKJ+zLgAP5iQWnfKLbijZ+zEDL5faVCT6MosoG86L1VyGbLoloJB5
	1KoBx8fgDTrblkMYE9EDA9SExSeOniW4oF/tCg2YrrQ2GmTp0CXAtjDyAO7b5NI8
	H2Zf6QGoXrcdigHuL++FoEdjZElT26mgDEWDcdYg1o2VJQvitAUgwqP/z1etLnqt
	QSKgw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794340218; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:WsXhue9KE3wM1RT32XwP0SQwQQYdHgPGyijUeEPOGwV4YNE
	xVLdlRYhZoC7lw2IDmtrR5SgUD5uL5fyRfeleECT7y1LN7XomxdjrYR9KNiK39/m
	SURle0OzHVZfyG/ibQt1gdzkYJTRzQ7jOOYtBGIUbc3exmFhy+TaAgRpnYnpG3T2
	SfAdiFHDOun/ooYu5F/ogJl5jxLMQI2KRTRR+uU59WDceORlPYu3YsJWeyuXbSzC
	ArsScobQyWjZAkhyaN+qJQ71pQSBny+1Yy4XFkjuRqqBe5I7hMzwZ7o2ayzcVW8K
	ApDtF9DG7JTEa0hLMTEU/YkymDksZCVYiSGpz1A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:isfI6Vr4Lrlpz6Sa/F6Qg5tf1AKXdzsSvUd5oLVSoHU=:yxypBXPRWb/5EB+Tpz5h9sdo5j/00dCCrOcRgz8WRTM=;
X-ME-Sender: <xms:eHXzalzaVIMf5Ty3pfPEnTNJeICjjclrVdBtJkc1uTXZQjPUIkJ2qQ>
    <xme:eHXzagF1rhdq3A5YmCb1joJvqG3Q2GLaBZE6J6Rf-BFyLdq1qwaXkkAFZo41dFPcw
    onFdzmss2Hy5-nqrDQMl3iC0GT2h3rbA0f792TujhOpHREWn27zerfz>
X-ME-Proxy-Cause: dmFkZTGj3izcc/MO6FDTzgWsB/Qcm8Rs663i4JwX45X8ni6KZrCTa/IqRowsmTPsRfsOeU
    sU2vq3wMwN9vk2JiYXjxdNgVaUfTzULvUwjiPQ4+lQrOp9LtR2IrFlNG/+N0/LDjFydi3a
    v801WWzQKOeZxg8boR/zyaio995ktIy7T6k0zwKva/lhO4nz7WwDQXoPe+dcDKrO7ZG0l4
    tkXI76d/DHUFrr1qzXvtXXIgSOQSZYUK7dtLygpkmBsSyqhKI7c9LfDuQ3gjlLgV2JQg+P
    6GNcfIAzT7czuL6Xofwc40mvSInjc88tTqvWFTghbLoojQSq312geH43rN/cc1Yv7DC6Ez
    a4XzJHj24VNqijkV2KA/bOdBAXiX2uwhnbZmsv+eiZpbWcLiTleqMm41DJJfk1iSghgbjs
    XEbNxydGwQ2jBdOlUuzrVkOXbI+MyUe08Vc8e1D+LmjCGwNA2nFWpABzKeqvwk3pIjVqpF
    1GuN9lJmEYEVpnuUhp3PJW/j6Xim7yLgMAEizgIcowvbrSv1YuXomppXah6sNNF9/rAsBs
    YnYOfLqRWEkewDaCj8HOX1M9N5huRpRCjQqXcpe18kj2v1kmQRYKRBlfbjMlIB++b0+/Al
    sZ1xGVlY2uPxFZ4ouupL7fCwrO4MIMfmlEdPkLiQVv/YVfCMAtURVXNP5byQ
X-ME-Proxy: <xmx:eXXzaoeQOm-uAypBKJn2wKpBrK5ynef6J_7Lke3H3IWel_TnFn-9ag>
    <xmx:eXXzaoIcF3Aac-8PLjOpMcACBpQz_VS3UlG4BlUM7nc5ldMnrTjIOQ>
    <xmx:eXXzahFtEmuKIPbukAy6oON1VLxmSF7h3wkngr2474dBbuWb2eb1Yg>
    <xmx:eXXzaqqhGQwuAb1uWjYLG_AmubMj5T5sYYUBTZp6JKVYd6yBBR3Qpg>
    <xmx:enXzapqX5g2vsyQ9-2ULY8IhSgAwUJgiedxuo5gZlEyeW1IRNriykSPl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8C85832A0097; Tue, 10 Nov 2026 14:50:16 -0500 (EST)
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
X-ThreadId: A8GDZGyJBCjo
Date: Tue, 10 Nov 2026 20:49:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <5d31b403-f693-4920-9632-5f51e41bc972@app.fastmail.com>
In-Reply-To: <1b3d9355-2cf0-40b3-b8d3-ac1b5984cd7d@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-2-linux@roeck-us.net>
 <966198d5-9789-4505-b1cc-670bf035a358@app.fastmail.com>
 <1b3d9355-2cf0-40b3-b8d3-ac1b5984cd7d@roeck-us.net>
Subject: Re: [PATCH 01/10] hwmon: (ads7828) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 20:40, Guenter Roeck wrote:
> On 11/10/26 10:45, Arnd Bergmann wrote:
>> On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
>>> There are no in-tree users of ads7828_platform_data. The driver already
>>> supports configuring differential input mode and external reference
>>> voltage via devicetree properties ("ti,differential-input" and the
>>> "vref" regulator supply).
>>>
>>> Drop platform data support from the driver, remove the unused
>>> platform_data header file, and update the driver documentation.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> 
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> 
>> My patch is almost the same, with two minor differences:
>> 
>
> Did you copy me (or linux-hwmon) on your series ? I don't recall seeing it.
> Sorry, I didn't mean to duplicate your work. I'll look it up and apply
> your patches instead where possible.

I have been slow with posting these, so none of the hwmon patches
have made it to the list so far.

My plan was to start with just the board removal in 7.4, and that
is now pushed back to 7.5.

     Arnd
