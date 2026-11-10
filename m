Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337667;
	b=KHoCo+mIUcg8WToAsgI/YcpKgK+gY24s8BDnkw7xjUrc+dLPYnF+QEOYbyjjYh9sPmE4
	 eB4T1AbR8o0QX3Mu/N/kCBqMvIdmJgREMm4qkuRQCj9OrwgpvTTcLPWYONteJikhleb8g
	 yXvRtONmIPiJx2djHdqpWnoNqbxzXirkjE40OxnQafXliYSIq5rPe8P8fgK+KhzB+4JrD
	 pHA1kCSgahzticw9arYe4TmJWs8F8c09u/24WJLObr3kpPGHSQ+DcsjS1gacAqpXh42KF
	 F4ns/eYagFIErkBRGXyaoAKZvd8/ixHK5WUpk5BEdWLqlRof99BW5figU2NWh65UbSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337667;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=VEvRBM4KhJ5MiB65RTf5GEGCfvSSogA0Wje6yynJeRA=;
	b=44KGzl8iMLTJAFZ/qZHorWvwT4zcHnnNsEfdT6/aO2Di1mloLwlD4OpxPVTF4rexIYJK
	 MDurq7sS3PKMhss5/5uH7FPTzxUPFSH6EcGmjK2PEEjOIye98om85CJH2oTNExg7c3b1l
	 3NlaAq1tDgOF3eQaxuTXNw4PKVfN6V1cZmA6IVrSjsqCizUkJxU0piLTaJNQAPTcLXnkL
	 g/Nt1v67EkGIw6oi9RmxhLwjCk9U1Xi55DE5amE39Eu9cqUpPR5dkaiOIdueXOI76svcL
	 xW6X/GNzYgyT51VjBSMZ+dZkjCM3vr3MnUUv7jDx9RcsTZHbQ2o3IHX6aaxeuLaUYoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YjxxZbiw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W+Zqvx3N;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7541C606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7541C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YjxxZbiw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W+Zqvx3N
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 839501D00254
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:07:46 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337663;
	 x=1794424063; bh=VEvRBM4KhJ5MiB65RTf5GEGCfvSSogA0Wje6yynJeRA=; b=
	YjxxZbiwFQ8n390v13TL6GLlgLj9ifijwQQDe/Ub0kZSdc4atwnOasCUEPvu4YFA
	M9jMZJOxkLmoRlbVybL1FmnHhrnNw6SX9Ak0uIThLHVJbakULsbUyay+YeeuRLVq
	iFObaIwdyAHGqnyugtPI5Cxl0b47xrn15+vzyGT9vc5ZpbuCw6YTNEK2LYTrz7fK
	ZaoVoPpuWcsAnuV5Kwu8khGX2L8YAziwFVH/5VtqdGYmPyE4MB4TBWSF3iYeMcwY
	Vx8bu5ZrIWFGWlew4kp9aLy3SzGD2OgkDSGYMLs3cZfG479rhkQebKiZIuR1YV7V
	sZrpOPyaWfgWu0Pz+HVMGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794337663; x=
	1794424063; bh=VEvRBM4KhJ5MiB65RTf5GEGCfvSSogA0Wje6yynJeRA=; b=W
	+Zqvx3Nn4gZZS9UO9eQHhi9hHU/qkalWyb/XCzhtRpe0gF1UT/gL31rXXPPKD1Jn
	Rk1ghqFwZQugJ3ciyh8XQ2v4WK2GQCw2bQiTft0VFQMvv3osIUKq4A9YT7eL3lQQ
	o+EJOI9gFuD/YusqJKqg2SGXKKpE5EyRy4PEFh18qhSKeju9f+n0B1bdQDrNtgUL
	WebAVUoPL2wjn3wGuyM2lt4SzV52/ZoD6jTiG/tqj8NcnYf36rJFY9WCGQyyw1mW
	Y9CylRMEaurD5q+St6EW0x/+TTo9QffIQ1FQV/b7bG63wpKw36Hk6suxVDVlutcp
	LIbzB47eAWskalPvqJyGw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337663; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:BjOiwlP6Pt4kBnLMvzvIIPDCnXRNfaZNDyRs3Ys3NLYG1lY
	W0RAD5M7uabrasxMdzudeqS8SEl2kpce1UQzwIpNUtdiUryBcfkj22ikXmLr9ouR
	fHXK7ki8qsRbxOV9x5CEda5vv4MPsfb4NAOD8ZrVJ1WhJKjslnPAbrAF0lBMKqMc
	ZphxoqZ1Q1hsW8sDzWqHD4DYW/uRHnkMF1KYHTsCFgEQW1Xlz+QbmR0N+O0e540X
	dZ2GcdWoLj041AXsgoImlqHtpYfdkpUsDtucT+1BjoqEw3gNyBxvdqvrwBIzuUGK
	mzCaVbLoZFKwkp5kBpvxk8hNA7YWiqso8BnVxKg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:03NL961CdPnWplWcSAsvvgR8zPZeGPz4HvrIapctnCA=:VEvRBM4KhJ5MiB65RTf5GEGCfvSSogA0Wje6yynJeRA=;
X-ME-Sender: <xms:fWvzahVYzHpgsxzgAVJKzAbg6mxDxjgN7va3NLwi-0fdGzCMMSwE6g>
    <xme:fWvzasYyDyUe1FehCQBU7Qbf0Dno8xyLPN0A_YqeoI7d4_yrX4sZ25JZBrcycjidS
    hCNQqI7zYCxZ8zPrtVnEd1RWgahrCiGSGdlD8Upk0SHUa5KXnAy4xOZxA>
X-ME-Proxy-Cause: dmFkZTFCD2CDtk2B0Ec52xi+cWwvVSFfC+RkGEOJP9IyNGl2le8rGCvZsqMTGyoo/aGaIR
    dbu3ZnF4MOOJcUZf/cK1+AjSHoKK+TVgu6AQR4M20u4gXDDQz97kdu0nnlGaA3P2PwoVna
    mqgIGvBb2QNWBJNVi+eMJcXDy+PjMLw44QF1GNv/y9bn5tvEmgg231PmXvaSCO8GKjwTs1
    aC5jxd8fMsnod476ZlAVFn9qXzfLfyk9IU6XxnylAqIPSNrHswPDQxofNU3BAHnBS+cAg1
    UJ+ZwBQ3SPQvWdIMVd6/+2PzF0Hut7iHCV1I5NtMYGdLiAtXaUdv07gg8hfNfapdwVt2Tx
    yYC4ArLj8OdrppvLGeBA66xJ/5qFpL4jlKj/DsGcOaa40zwiYhqjxz7mdu2jguPzCyb01N
    l2eXg/yz8W4FzHXuxvc2D/1yXKsTo1QlFLEWDUTgkeF/93LxKzTcmjhn0VqB0TT5wIzUpg
    gLV+lxIYf0JAujQ82D1sAlZh1QhDu3GlDgXRIOXQFWM6ATl5qE98YMjjZF0J9Xv1Xh6nc2
    RABjI1wKPjHNt0oTCKVvu3dREYUNBqQ1Z4MJmL96J26pV9vZi6xCImnxNMehOiiI5wi/S8
    xA3+sZ6LXHuVH6adrS6PJJlu40SuXa06snqnEWuCqb2cTiwxjlo03riXiPMQ
X-ME-Proxy: <xmx:fmvzau_M4Akeq0W-v9OF1BcOmUyVsLJaUyoJtsU-Wzulo88GMQJJkQ>
    <xmx:fmvzasgJSjTYXfTWDv6qeYu9DcqDclUdsoWR-dh2V9-Vn3tl4mZ7Ug>
    <xmx:fmvzaucP8emrd6yscn1ZCH1f9bmTwPhr9xM4fntAxiokNqoeoLk3lw>
    <xmx:fmvzajqdd3nOPtXllmXWocX141-v2_uhQSltaM_KuhDZz_3RjTj6Zw>
    <xmx:f2vzalwWZ1govYDSBRp57ClJny__C-2Z7lEidgXotCqC_2tT8w5Qmv_W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5EAFB32A0097; Tue, 10 Nov 2026 14:07:41 -0500 (EST)
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
X-ThreadId: AfEUqT_QZ1kk
Date: Tue, 10 Nov 2026 20:07:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Roland Stigge" <stigge@antcom.de>
Message-Id: <840d907c-5769-4b4a-8181-5149b5a05d7f@app.fastmail.com>
In-Reply-To: <20261110183434.181711-11-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-11-linux@roeck-us.net>
Subject: Re: [PATCH 10/10] hwmon: (ds620) Drop platform data support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of ds620_platform_data. Without platform
> data, the driver clears PO2 to keep the thermostat output pin low,
> which is the default valid configuration.
>
> Drop platform data support from the driver, remove the unused
> platform_data header file, and update the driver documentation.
>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

My patch here was different, as I concluded that this was
likely never used upstream and removed the whole thing.

Your patch looks fine though, so if you want to keep the driver:

Acked-by: Arnd Bergmann <arnd@arndb.de>
