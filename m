Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337369;
	b=Aw2UX+5/9JpBsljCGGXVisjvWUHRkWWYbSPhkp2ymzZX7HeqvLGfrVt7P3EOG0pHS71h
	 lduHcCdkCi/4oRew+Rn59pAeXbfvZxSv6r/rFT8Vi1nnoYgaP3pi8eIrf2a5a3DXs+U57
	 T5WXmKctjo2dOViaBCOGZc+gm0FlE+nUOdbKI/QvRUjgV/AnLpfxakOOhePDfiyFT+TR/
	 wk3y3K2/ZlXuGpPp+iymL5T8cbGCD1cXYqde5bhmgMQgR2pzKBZhaN1a9QvP9l8Q46a9r
	 T+n3iLhV7VQmhYVDiMLSiEXN6CIQdx7ejSBS3iuzdYHuorL9q9evVzyTN9ZPC8sx/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337369;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=vqc8zbSEh0FVzgLLJbez+F/kW4hK04tZt/b3ntVMqC4=;
	b=NiBP3ldWmq91MP4E/fTGIG7aAD5hipyj5E/L+UAEEeIyHg+eABKrSm7GSbuOo01j2FFW
	 HEpvsF32f98H/1Ofa5/aEMSS/Zk0r2Vteb9AGsJdxc+VJsKTrqYSzV7L/Lsr+KVHTd2mW
	 AaNveICSz0rnFyeZU6QhApjzMYGE+w/zMRXdtomh10up36NU3n1zjkKYcw/wI/q6ccQa8
	 ZE8jVJE0bHy5Hub2V/5B31PfNIpnaHjUS2HAG8Zoqehc2WXDcFWzTYg/gWCoJkXCApZ/e
	 C2PSY++BYj85FnFcf5bY2KgO0U/G6B3upQH4Rg1q1rIIbLh49EVGH0h0Yg3Xa5xgmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=lx+NfBXI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jCWf0Bgg;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B4606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=lx+NfBXI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jCWf0Bgg
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 95F441D0014F
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:02:47 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337365;
	 x=1794423765; bh=vqc8zbSEh0FVzgLLJbez+F/kW4hK04tZt/b3ntVMqC4=; b=
	lx+NfBXICESmyJAChY84HUWikGYxJ4LBRul5WS45LrJSgXefBqumnbxjjpvp8+Xf
	VCYLLci2eytI9ZEp3NRZPf2rYVjHV+uTh6cXkKRJWjiVFqA+NGMLD4wtgxRig810
	HoXppzB28z4iLDFS/uDG/5K0soZeZZ4VMjVyqTwPuhK8rQFpBwH29MYCOgQvk179
	5BfcrI9JT/09kHP8EeCQmESitdm/8qQ2aFHtDqVldl1VpICkjyt5Y8Y5n6MZ0Yqo
	iDW46bwuF/bI5wpMllpjnQjKiR3midREW6giQjH7D6Ghz8gJUyX0/a7BIOTcq7NC
	F3UAuvVT72kMIdotaRrWHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794337365; x=
	1794423765; bh=vqc8zbSEh0FVzgLLJbez+F/kW4hK04tZt/b3ntVMqC4=; b=j
	CWf0BggTVAngKB6z7H5zzqFXvD3bCppJP0rYnsdzhtly3O/pf9Z8I9/p3alCQ1ka
	R9CT+ZDN8njiLu36HAziBi0g4+uH7EJfN+tbF8agZv7Y0VobfcjILlR/t/EFce0a
	0v90y1czg8JzcxCKYucPgqdcAdKY/nqoDLwJeoNstmu6Ph6t8XytTrkVkWFovdzH
	7yGFhKJxJCrUKjospu/b1WwpQWvsNQ8bdYlMoWLZiu9NRVfwgu1htfBmjt+rKQo8
	vAgNY7CL2vsmAwuWF0c9igEeJdkQTfTqWSnAFfUbtaVhEEk/mc5jeQTBA69bgJcH
	xXzzfW5GFcNoA1SYT0AXg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337365; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:aiJ1GqSMJIYxqao3+u9+KlkR6ddnYDdWp6sA3HPGnp6S1Ai
	Gk7ct1GbHcQNuV0raB9ILKoFrPinumVaVGb1HMqi/WpBgR+NvPR58aHnLQZh2WgV
	h6u7RCTvcHnMXbdr+zqbzE8YGrJ0YEWyPE5f2FCb6XR91hr39OPlRdjaqku5dgHQ
	LNFAcTAFIoY6Wi+8PdQN5dLmWlpIhK6oTFpHmJM6pmFevY37XrlJN3R3DzvVNZDb
	vM+DtRoEy3XfGcFulhow+YlaXgYK50rOjPCigAKchPSBSmREtepf7JAIon5sf9Mu
	HBIKSH51I+pHGhjmfuCact2E5CAL/tzn0XxPpzw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OMP325DUH/iMe94ShVAjB1TUUPWfKfUOLm/L+LxRlOM=:3cWxtsawbyCtHPUwehERZxr0T4oLU6GDzdIWOcuZML0=;
X-ME-Sender: <xms:U2rzahNlfq4oQ_Cc3YnEX78c5O8hU9LHvZS3p4_VY8J3GGYWSEn2wQ>
    <xme:U2rzauzusl0iDWZu2U400r17h3azdTgKt_dFUW2_SU0ym2sJdC4_A3u7xbkcG-y10
    GngXBQq_F2iP9g6denSJEo-apIuH4yHuN3aqC5dMwFdh6Q0XTEkLIfe>
X-ME-Proxy-Cause: dmFkZTErib1/xIDs2hiEgcSAIM5UumBpzhVcKMmnuiY/xnuXGHxjlAdjdIZCKefkOP2eA/
    nAmdVuHJQogqMuNJ0XGzOCZRQC96Q+ROjU2kf+N7igk6ZDq76BmlG46rHkIsVvrVjQQjbO
    SHOxdMXeyAMBM83mprK6jP7kjN4axBW9Qo+Iav/Nd5oAk767iIbC/F62Lp7Es+qY+vi5+v
    ZoZnL37mscQm1wAWRWX+JBeLB6oVc92IGUfNH7oaYSA9Uc0ogHdlCpepg+VYfYKXU04hRl
    xGpx0/tewpJ4fODXJ1HA1bC+2AD7lcN3axmnipMyF1Yx30BuHQRWKYmsGS+AXuQ7B3TuZV
    gUits6a2WdFx+L+YgTWP8pJiBGHvQpSt7T34n5rcTqIGC1QppCn94RZ94tnosQN7aM3D7p
    spMyPGSUP4ZncenfH7RBnCausCHKMd2TX5mBlCfS0Mtyi//8W6xZs7hMNC8EQT+m/Isn2Y
    i7sox2VtwxcfXxyrp6TmmXq85mkeurYpZMWIO4CMBt4g1/3ydzIBZ3vl0CxVz5J58LUp47
    TkW02hqY3XUKxOxLtMpgsH/1C18t9Y9VNLOFmfP9Xo3c9dRBJJBkSN1c3gOiQMklm8t2am
    kuI2bRJ9r2L8DLbw0UeKSXkifAV13OJ5T4APSPAaAT7Ai6dKIvDePgn/bz1Q
X-ME-Proxy: <xmx:VGrzapI2ga0EGxUFlidLtLdsREZhw93SGEdeZk0YR61K1kVXvNgpUw>
    <xmx:VGrzas7rbcoj8ODShm_uynv50UH7BwyqjvpV1pOS3aINKNt0NE0nbA>
    <xmx:VGrzakz28WIrz-xxEgpAbBWGHS_zynjd2l9DLIU9wAZY4A5UU2HeEQ>
    <xmx:VGrzaoan74T9aoxkR7Dv3wwX5ULl8NKjzDEq2YtIttdrxIXJbovJFA>
    <xmx:VWrzalq4ECMa90v4SC8xm5d3oZEIsZZOJRO36Qz9Tv2diWWS-6ZUVeO2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B62B032A0097; Tue, 10 Nov 2026 14:02:43 -0500 (EST)
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
X-ThreadId: AdK4AHFuUP6N
Date: Tue, 10 Nov 2026 20:02:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Message-Id: <c407055a-131a-4e9f-bdd6-5b1aaa60b95f@app.fastmail.com>
In-Reply-To: <20261110183434.181711-9-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-9-linux@roeck-us.net>
Subject: Re: [PATCH 08/10] hwmon: (max197) Remove driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> The max197 driver requires platform data providing a convert() callback
> function pointer and fails to probe without it. No in-tree platform ev=
er
> instantiates max197 or supplies struct max197_platform_data, and there
> is no alternative mechanism to access the chip.
>
> Remove the unused driver, its platform_data header file, Kconfig/Makef=
ile
> entries, and documentation.
>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

My patch is identical, though your changelog text is slightly inaccurate,
as there actually was an in-tree user in arch/x86/platform/ts5500/ts5500=
.c
until linux-7.1.

     Arnd
