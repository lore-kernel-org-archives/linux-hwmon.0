Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337765;
	b=cts1OX9jIM1SYgcT5EGZCTpbhieVnffFslC1ja3+1ie5Ag0KxRXIqWbDL6hfVvPr6T0b
	 MYEla7qkV1FnzdtIlt7Ch9jxeAoEueDewqikZ8pMhhKKk0+WN72ZDx9fllJFMRcA5IzAB
	 vvEQ68rOmxkTGxMgj4stzSkKxJvEk/Ui5pzj87u8yLeBwT8zRcm8EZiSg1i1jWdqibCJV
	 DBaxfcSW7GgB2Wbb9ZTBK9pJ0q80hW76TXqS9jMPb0Ws955VcniWwJPfHv+czdxDKeQUE
	 V27z+rO9f3xbGzKNkRu18ReozJjQGPTf9FkwDYX0qUoqcJXBCT++w5bFRiSwbQkZiGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337765;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=xAYh3rCpk0gZjy4TxPxU9Jme4XyrB0CbnhHMjAeOERU=;
	b=YUYF4GUowCALFYOlEamLPhpXpz38lSkmjsOiRRcahsZRQscNNGSlzyJsCOX5MEmu2Kqv
	 qnqkReFj475pU0JHKc+UyVrE2R2R6Y3To79syF9LV0p4FmTWf1AIE4rRxvHuf8qzS/T45
	 476iSkZ9sAojjhnYpQJ14LswVabpOjspVUVvO+SSakZrHr6bJEKvyEUgs3/0+4AF9YGRC
	 nCDtDLKLjaashcz1ob/P/Hx5+vKStEPlUfVJF7B2ZKMcuMWX3j0qi/7C6oBRWf2Nt4kSP
	 j7omUarbfvmSVHI//xn9RvkJ216bCMTgtcVbwqacgW6wu7uRSBddhtJBt/H22tZ1jPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="ADx7G11/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="q/r6CqgT";
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9A606A327
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C9A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ADx7G11/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=q/r6CqgT
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 797387A0296
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:09:24 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337763;
	 x=1794424163; bh=xAYh3rCpk0gZjy4TxPxU9Jme4XyrB0CbnhHMjAeOERU=; b=
	ADx7G11/k2taN04b5dy1TvSpw5AhypEj+OfbzJqWZz1h4VahYA9XrBjZnFn4KVBf
	K4FozOYLjVQVFt/O9NMLfCEh0LK86H7vRJ4jWu6eblXgIgSOhnJiIj6A/+FH6j+a
	BvF85Qu78rIF8OEMGI5oQxdsXbt5xgOe8dhvRHzMy5ssBpTVo7JH8/ISU9X22ai3
	Hik5BxzaIqBm3HnDVhh+IONxmP48iz5aAXJuBExnc0BNlBQsCpVBHuZLW6yv9Jby
	iF1EUB8Tcl4GeBvvbRiccPY6wwGfAehNXxrigQYS8mJ1Gi9QGsEAcQYNvkkfLRMH
	x1AJDUbGgquJsVIdQCM7oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794337763; x=1794424163; bh=x
	AYh3rCpk0gZjy4TxPxU9Jme4XyrB0CbnhHMjAeOERU=; b=q/r6CqgTMmsu90ob2
	/FLsSJO0aCoLRSaT59iT2FErgvUiEjtd3aPmep48zAcLonQ5CzsLoXJpuD22XCQm
	yfRK6RVthiLoF7UooqwE+OsWB/gygkqCHWN9s3/UeU6OJtTvvtY8RbuEKABmjoFu
	IjUr6UHAfGce+JGTKh3+JAuq4tmzmbjTfaivsO2ZIGwnmJl/MsmCjsp7feCu1nLU
	V3XGGXgj96s6RyIRGFQP8c/PhXlX9g5qWKHMdzholXiQwNpgKaFCm3QTA0vfHOXE
	RgtvbpFWpJSPgMhX87G9Em9sGMFP6SBO/9TC5GsXLQzOPqMQgLLG3Hv9oTd12Flu
	KhEIQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337763; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:XBJ/5rBhbopDA6Ev6ROdyuDBrVba9g9qYD4KhUVI6MAeJmN
	/ms/vrIxHELeKl1YYR88ln60zSjtSxCL0PfLszIR4vJhNeFa79NqKvnFo+jSltcB
	7d0NWFdJZA+NpogCwqvt35EwyTFg5m4y/rEDBSXlH+J1Fgft6tCkeoSyVOxkVRtV
	XYxxD8T0sJ+Lpv57bokIvbCGuw9D2jX3utmQgmdb0AzzPGk28NgihBUTDP5XDeL9
	jqkm+Jv0RycP8B9gsMHd6dnk++Ut8ebk7qDqPKC2xysm+j9qVorHoDQjh8BzrZia
	T2WwgS9Mk8vc40VuEPDjJtoG1kQSKR7NwOpFsbg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uLQg43C1yh4uW8bel0pQCS2kIbZSnXIsRwyuQDkhCHU=:AJXB+gw637lLEXMEk8dWe3H5Qoy8okQj4wzUTLQzV3o=;
X-ME-Sender: <xms:4Wvzah1qZ0Rmu1A1Lmn6GlkNwNSzpmEYu9Xsxs61kEwaQgytzRLcgw>
    <xme:4Wvzai4Qqd0C76CnahI2qE8q-k9SVm2JGH-iyQQJ5seZ4jf-cR-VTFyG4nRU42k26
    YHm8ZSJIU7xFgqWxPkSNHVLjZ56n0JRMWm7u2D_zRbb7ODQgJc7Xbfj>
X-ME-Proxy-Cause: dmFkZTGac2lEHaIJvy8qBFm+CDb8Hy2Ugz8b3inrO/yJfyvFpWgd5kyDSWyjurvV+Zb5gY
    DIAmpbjqQvnUstOpz39sJDwtZMiJB3jN44FLuXOLY+egH6MzoMNN4slCbjm8QD5SZY0EXN
    G/NtwLsX0wA9JFCnV9q1hAreAeQ4AC/9KXlKhw5Wq+rmZjgWiPHgFO4ehZfTv+qtW3CTzQ
    1A/8nSt4NhgdGdYVq0ljKmtj5ncup5gp9MJpK6NAxKckuGbbEy1xnVwSlxl9Wj1p5vXPcm
    evXodYaS8hNrOhIHBu54gVW6EPLLoffsMicny7i4QUYjV1KLFZpZkiRrCwqTpUuAOV8DF2
    CnDa5lsbmaVyId/MwetgZhEIo5VmeDT4Ub24GjJSM0pOeVMVKr2LTg9Mcd1jWwjGK9rQxb
    4q1E12siAULzpC7K64ysgwKyH/AafHdcbE+AfuDqk4PzcBQ4Ei+DBqzv04T/Fng3eLLNvH
    RhmDypafdfstRzYQIk61KTy4dE0QgL5XYLMZ78fxm5aO5noI0XGBVVpo7qZsd47SkzZpTi
    DeDf/+N9pzoOcOvdYTjbYcDnE6PY/ZwpL8m7IFLS687zZjKMAejje2ciWSeJW69A4mJn7M
    SMgINi8nYmpI6Z6cqsshCymGO9Zcx6s+18gAWOIh+S1qBDFs8vRSXBCDL8ng
X-ME-Proxy: <xmx:4mvzaoiShB2Gg7_E-XON4TZn0vgBA5zk4imvdYBtkhiccERRq_-T-w>
    <xmx:4mvzau_cUtpCsl9P8RnYUHI-V3Pfu9_eSWGZIojJKPmFtmyGMrxGCg>
    <xmx:4mvzanpJ4T_BzcDfgyDtjHHY96tV_dy__BCKl3m21zDXcl32MN4ocw>
    <xmx:4mvzal_Q_8D-OeQfArHUhlZ1Sp02nGErxeyKbc6Ey2spncj4l-Jftg>
    <xmx:42vzahfbKYkh2NWBXiw8UjtkiNzphoBzTt36dPI_6MCncBMJ1nk71pH8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C81AD32A0097; Tue, 10 Nov 2026 14:09:21 -0500 (EST)
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
X-ThreadId: AkIRVJOnK82J
Date: Tue, 10 Nov 2026 20:09:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <fb8ef91c-f485-4ac9-9eee-6c3cb6eb3e45@app.fastmail.com>
In-Reply-To: <20261110183434.181711-4-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-4-linux@roeck-us.net>
Subject: Re: [PATCH 03/10] hwmon: (g762) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of g762_platform_data. All hardware
> parameters configurable through platform data (input clock, fan gear
> mode, PWM polarity, and fan startup voltage) are already configurable
> via devicetree properties.
>
> Drop platform data support and the now-unnecessary CONFIG_OF guards from
> the driver, remove the unused platform_data header file, and update the
> driver documentation.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

My patch is entirely identical except that your changelog text
is a bit nicer.

      Arnd
