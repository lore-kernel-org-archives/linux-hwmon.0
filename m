Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342744;
	b=nFLnmWAXGygtvt8+AkBLZZvpz0JvBucZjobcI0iUpmfSrZ33iYCh6qKEhRnvEkS2NKOv
	 HdaunmJX+2Z3qOI+HoDecyvOxsEmzon5HAstAEob3Wo1+zptp/WGVnHSzoiTyn5nBfEjf
	 qFAM3Walugowq+3C03gtWUAl36+Qdsqte1F2fmuquQ9gDP+pZVTOzltUQUyTCnh96TRFi
	 fCdPK4miXcLCbrD0h+G/nVXKFBOccRBx5ossyqK+WLgN42YCcZzD5Dm0KrvpKM+0YjgKo
	 IDYpnFmGDXFWQnVGZp4/m+vUfp+8rX+PzBHB+gk0UQyEkpOyX25oq/BPSjdPg47ylyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342744;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=/lOxLvzyPXrXw5KtFdSPNuyWUewKZMm9lKS6tHy200U=;
	b=Jmmrik6AP9vz/zQG3J0HsPexNxcBKGFfhHBLhYKOMoEyfB7xLD5LjldT2l8Ii6qtWXvo
	 AjlyFcwWM6xN7+m0tw6NwobG2CsqlfKgIGf6SNrEwO/x9SZRwlUNnUS7Zi2Tb9pYgcv4p
	 PNPqkWxcN3jKljuZBgcD2yt82iW8vUTx48KmhSTMKrUMBHivukzcbItCkP/FdqgXbzCLr
	 1DjP7RtqYYrrnykud8RrX78J2lmVKgsKQPncJQ1RZ6EARjoaNnbEi9msxnXpDfYYs9clg
	 OyPBhOVSwmwZT8X6JYxGZJ+odvRGlEoDhgs2qG2uzKW3OuUoOA8jG9aiPnhLYcKib7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=IZbHzN6J;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=azEClLVU;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1F606A333
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 20:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E1F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=IZbHzN6J;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=azEClLVU
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 815151D001ED
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 15:32:22 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 15:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794342738;
	 x=1794429138; bh=/lOxLvzyPXrXw5KtFdSPNuyWUewKZMm9lKS6tHy200U=; b=
	IZbHzN6JRKQjABP8g2bXGzD1n5L0/p1Vp2CqQKPCV56EmPmuZpzluYQC6RqHwkgz
	IRlg3pgm9A83Xlj/SDawfe0d7NUXz687o70lA/PfE1oqYq54Seo13GgglaUGb4iS
	pYdwuoTvMeX+jGvVO3FjMd2SBTzwoWzf1GtzW6jGkKn8PKsfJKeiHmsGrxthB+ub
	8+qB5QrY628V5+PQgAx+AZ5tf51GeCN0rk94kasbmo8GtqQ75b2N253ToLNeGQ8h
	yNzP5JNq3WG9KeI3+HBmGVudTafPGmK/fwna1/ObDe2NgIjxLPZUibjzjKT/8gcy
	WyHeQIfA3N4TeXPteWNkHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794342738; x=
	1794429138; bh=/lOxLvzyPXrXw5KtFdSPNuyWUewKZMm9lKS6tHy200U=; b=a
	zEClLVUehbKiofFhrPd12OVbZmuvEllRiKgNoMFN287ddk7e+NHQN5vWAaDLRCUh
	WN/yquO3s6ciyJ9R00pA4zSXpZR0K3MA7XJQCrr0/ixgmwPuOtjF/9RuwzCuJ67O
	TDP9xyEohlRxmYARyvcPHU/kXHVMXsaiU1xGClSY/PooOk/isSge5GuL+xYXPv15
	Tt6e7ZVeOwsmSVgRWGwIJNLpds8aG3A+HgA8b7Jrd021lFA9arje6AsyOSzRiIcV
	6JwZAwfLJLtnKuwY/6ybXH++7hxYVxpgtKn8YpfhgauePVouCmIpyNR4mPbcJshY
	uSt1Vs+cYc5IoD+9Di1BA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794342738; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:bfEmOsPTm+X1O5h3gt3nb6qr5evTvtSHanZtXrfyToTuK32
	IXJ0z5JWesrt9IScyq5XIk/XA37TXxSbDwLxzvV+ygp2NGaalOrR0JtGC1KdRERz
	c45/oyEwAzJV5ccI+A7TFMZ61sKxfBFczArwc6vAaunQyylHEo8w41C8AjXDM0bE
	aQtzZeJW5PrwuVHiSmBliD2ZSfRyLdT6llN4u859+XeM/F3hM5J8JQdqgXyQxdrF
	afuJXOtqEOF617Czno6sR9BnOeKIZJcWCVnh6fl5anwARFUv9qLMUK8gLuD4AEY6
	xVCkTZs3ZN2KmoVoUkNpZcwY0rRWlH3pbI3FOMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ELTYrjs5Plm/NG6d++8s4lyUZ51Od8wLeuIu8xG7nPw=:2wF9a4ZeOnddGRqCPngq/QqgpWwYPY9K9CD8ltgQ+xc=;
X-ME-Sender: <xms:T3_zatbK_F3jX5vqbQg6-cLKarvOwsukVjIf91FXZHx1YmMkzSuWdQ>
    <xme:T3_zavN0tY86YFCDgq5iESQsPl2jJ6gP6rKIOsVG4vNaHXXoqUEeTpDpUZtx_Q_o6
    wrwe9pkAOxe1-3qksehSwfHnuuBrdfVjSvV_jLpKBPnADjtsApd5YxW3A>
X-ME-Proxy-Cause: dmFkZTFY52piNiDjPfTey+1EPfZ+Q2KK6e5z9C++6b54vK4N8T46eADn/qEO8bxa+kjJsH
    3/y968LlMNJw8OO/cFJthTNGffrmZfvb9FqsL7iSItlIOHzOloMDhNIgJTyrp7yG5SgePE
    ijVpnUaTtmTS1ozsem5TYyq+eP6zlVXAdRAVgXaxQgQ78gnAHAeWNdeB3UOfug09jDgbuX
    SKSIH+sy//6lEjrs48LGonVy6y+MKPL/GLrujMbdz8oF7dmU9I00lrKMvlDfraew27mmhf
    c79OpOyVhGvQ8/EhIdtJjAtCMb87Zyyj7yKmVvy/bONfFu4wt7VEy/WBdNh5pIPz3ebUQg
    g+jvvJIKO7gfITtHA/V1wBLHgVJXg8t1czjVagRaPAGa5edjWH4RyDZYWplDkDheMc4dQa
    0rzr4WB+cVZ/+X7DKbmka2M0cS5E8H8rozqw+i68x/Diq/M7MyynDZ0BVyQzfXMsdtTDLP
    sK454P5PeJdx/P23IjQHPLD3Zq2RQWKvfenBjAw3nA5/WKz+ak8K9vFUbXrBKw2rWj7ijk
    /ptbIePF6BAAzYJofrptndgHw5EtgZpeiri1DVSIFmJq4vKsdgCF+hv/O1m65uJZlqGjUL
    jIYJKGyBv86ZsCib8Vb+GZWAW9MBl3cBPiJduZe2m7J51x4GWaXr/FRyA0iA
X-ME-Proxy: <xmx:UH_zahdlZLRXnT2uCgQwniumk4Y9fmhoN36PnxUONQj5-aO0k3ei6g>
    <xmx:UH_zagvfZqoU-wdyYJLNH7rrgWCHeX-GSOpVvtiyo8vd7P-W-4sw2g>
    <xmx:UH_zaqmWalcj85uw6WwubZ-6uXYvpv2AZtJ4yXLK9P0ZeF6Hd9ijYQ>
    <xmx:UH_zaqxVhnEECEIEHBs4tC4Ai2uTe9yO7t7iiXdTSG_qACIQDp9tEw>
    <xmx:Un_zasfZpfAj879KENSoYXWsqtVj8xpgp4MuvgeaXwqZKjUUa-21f7YF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3F11632A0099; Tue, 10 Nov 2026 15:32:15 -0500 (EST)
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
X-ThreadId: ADAJLyfTf3lN
Date: Tue, 10 Nov 2026 21:31:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: "Tim Harvey" <tharvey@gateworks.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Riku Voipio" <riku.voipio@iki.fi>
Message-Id: <2dadad7c-8645-4bc5-8b64-0c56432f5ce6@app.fastmail.com>
In-Reply-To: <d43d0f8c-bec0-4dcf-ba81-b3e141faf4e8@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <2d7b1690-c943-4640-89d3-d18901d04ebb@app.fastmail.com>
 <d43d0f8c-bec0-4dcf-ba81-b3e141faf4e8@roeck-us.net>
Subject: Re: [PATCH 00/10] hwmon: Drop unused platform data support and max197 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 20:50, Guenter Roeck wrote:
> On 11/10/26 11:24, Arnd Bergmann wrote:
>> On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
>> 
>> Obviously it's a bit unfortunate that we duplicated the work, but
>> it does give the chance to compare both and find possible mistakes.
>> 
>
> At least on my side it took maybe 30 minutes, so not much time lost.
> All I did was to ask Gemini to do the work for me (see the Summary
> patch).

I probably took me a little longer for these, but I also did 300
patches in total, and a lot of these were more complex.

>> My patches are in
>> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=board-remove-7.4
>> 
>> 337dd938a3b0 hwmon: shtc1: remove platform_data based probing
>> ab1c9ff391ad hwmon: emc2305: remove platform_data based probing
>> 985a7d241616 hwmon: ltc4245: remove platform data probing
>> 8b300deafa72 hwmon: g762: remove pdata based probing
>> 489bafe5cfb8 hwmon: gsc: remove pdata based probing
>> 94ec070cdb5f hwmon: asd7828: remove pdata based probing
>> 296048203f0b hwmon: mcp3021: remove platform_data probe support
>> 93ce98eff9b5 hwmon: remove unused max1111 driver
>> 9d4791700bb8 hwmon: remove unused max197 driver
>> 190ba99436ff hwmon: remove unused ds620 driver
>> 157784eaf3df hwmon: remove unused f75375s
>> 
>> The main difference was that I ended up being a little more
>> aggressive about removing drivers entirely.
>> 
>> The max1111 driver is technically still used in mainline, but
>> I remove the last reference from the pxa board files earlier
>> in that branch.
>> 
>
> I'll look into your patches later and pick the ones I like better
> (including the removals).
>
> Again, sorry, I did not intend to duplicate your work.

No worries, I'm mainly glad to see the patches get merged, no matter
which version. It is very nice to see that we arrived at essentially
the same list of drivers.

     Arnd
