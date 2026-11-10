Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338688;
	b=hHeEtWIURr2BRWISO1k5Hkn/Xr4IyLAS8796AFvjQAYh1ToGZW3HQ1tCkeIxc3lwX7yp
	 IgGWFBMpnzP0mlAVaisd7bhilj7UT1Gi19oHXSNRhOveipnKoLWrVb8jj5cNDtFcx7Mg/
	 i4cXrjxn+nCzklNU2N6a0X4a6qnpKm8BhcH5SqLp6uj8YiMkKopmQArNpmVT8np2mYEgg
	 t0wsWpKjWKuS9hUAaI5Fe5AyagreuqKU9NUcYDyHSvbvhS2X1MIkFyYvSsRsL6jCowShH
	 FazbhkngUg8HFofQj/RR+iJLEhRwOJToezBLRYe5pjTLREDVYO+gg2dybnKKU5KVkiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338688;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=eJT9eWPAcwrqhAeimdTK8gM+lRO9m0WZaobkggxMqK4=;
	b=daXjgra4swBkFsu+fHtjTLRpmw1X15qX4qv6fANd0/+smQvQswvDdRGJwQ32C7YFbH9U
	 t2r+PgXF1+NjHYuu950U5ccIpczSq+pKCiP6Vq5gUYFmo8zFgsjn96CUw/hG1573uTqNh
	 bnt0tp/FmCLgLVVxfyqWfnlnGk6W/pnzYJ1ZGDwNGHJbOcxwx6r3pAxHp5205ky7T5iyw
	 2UvAIF1GthR/USfvhMGF4nN1Bw9zKhsRfLRWUeyyQbhEZydAdDFd/RpqgQMEsF0iw/YzR
	 EsvZt3vp3Zi0iumyuDRsKxUa7ySgmx73W4pKdEAy+VKXWaxngEOEAAi6xgeQa2L5I3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="PqS/Nwd3";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T7L98Npw;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C74606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C74606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PqS/Nwd3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T7L98Npw
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E8A37A02B0
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:24:47 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794338684;
	 x=1794425084; bh=eJT9eWPAcwrqhAeimdTK8gM+lRO9m0WZaobkggxMqK4=; b=
	PqS/Nwd3zNq+93IOlq+BKPFQGO/c8dJpg9ySmuBr/uL7rMYDdpbOc18bxK21+li9
	Kv3Ov6r3jVO41gkM/EVj07C78HrGjjcfaLz4bxXAtKk0SfIwB48t20AntsMNDHH8
	UvT5AXGe1EcVVnq6iZzZxtOZB1AikdhDSK9bQvw4air142GnGz+iQZyTzA4VFbdE
	9jUqknNz5m/eeUcz4xtc8LplrSVD+CqO0xjWLfXFmQ+SlLC7pC2ZvI9Bu3Zc/Xd+
	cLGo5mkugKDNmF+QkZDh9jSWZwWUuYCx2KTgquvaWrGeykuSpfEIixVVBFsnimHj
	d+UPmOtRBJiLnicUDGTxtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794338684; x=
	1794425084; bh=eJT9eWPAcwrqhAeimdTK8gM+lRO9m0WZaobkggxMqK4=; b=T
	7L98NpwniqpicdNAzVJaamqUnU8Oo7xJ0zfkIkY0xd7pBE+jtnRf3CiIC5agYibM
	P22Ylrn07kQ/UA5vQWx4Uv48nfbAavtzlFsowS2IvJIQJxBA9TIse5z19srlUaC6
	YwIUl1/bmx0EyUjBA2Igf5IECbqTCxCJUOmV6bCWj1Oc27VvRThKxMQOCbrO9SY0
	Ra20rL1hYLzNuMbq8sQEDdFrCsd4enUGITDPgrJLqi3HLO/1g/2ldyOJQqJL0u0i
	+ppFOQSD59PiMt2qCST+UkdBgoUs8el5C9rS8AsRFfKWH58OVR/3hCCoSlhFqM1G
	hN/mZILnF62vdYaYVHAJg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794338684; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:RZImfiYM1kHDJYX7ZId6gZgoUo3uSb/TUBZnNMpYFSdUbkr
	KFGJJABnZB+WHp5w2dnw+AFPBf7t5m+l/BefQvWPXZxhtqKeSOk2kmCncJfvCQ9q
	0WiCS9FigC0/21cuGVqUEg3920HCiFStLnPHRZuKTNX4/Lcw7aJh5NVgMrC2IfFU
	kistWBdRBPERz8OPNrrAxLyu20vVkfCBTOkCOFiWENLmCPlCUpaFJaNBgWXWhHfT
	8P5LiVycBtRQigYUI4rtfHsTONLHHj1ONJlQI6F6YPYHrRoSBRo4fMglj5pVnOWE
	c5Uc0Z6obp1CCFbQNqJGyA16OzqXTcWDxYbFN+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SpSoPKG3hv9vGDqAk8+i5PHSOE4K5GC9LEelQZ/4nuw=:i3CmYj2CVe2il0npCgdlNveHR9jjqJTAVhyVvUSGGcg=;
X-ME-Sender: <xms:eG_zakBqHcs3UQBLnOCiJs3H7xezUH0wHTKvcuihMpfuC70gFUp8HQ>
    <xme:eG_zahWRijcm9lRGY6e-aw2kntthlXY9WBmHRkRviBqmUm9j9JLa_Er8IiMb9S9h5
    gDUGT_mLuCofs6isjfUMCReuBdip0qNLCuM6Q-LXx6IUyZ4VICpd8w0>
X-ME-Proxy-Cause: dmFkZTE/FXcHDWg6BvrFm6dw6mIcTfQgqbPbFbVLYwZcdssjvew6s0slbHotzwE2si3Z85
    thnHUmRPgIw7UUhtNAqrLAMlppk7+0c3/4dOtDE080utFs4u4JfmG86u6lK1oPDzxmLeE4
    RUd51Wx6DbLM5BG5Xbh21J3CXZXXhFANrdsr+ToVbj9lypK3lP0ALRHKIuyzLfqAjzocpJ
    wIE/uHkq7yuO4uopNMP6fFrHwGKECL5ZG0lqR6gsr4Gf5mWwcmJJaFqxT7WaGjUcYJSy2U
    lKiqbvX5aU5HLE0WTeTW4YXEdm0oalI1quHWGcmQKBMmw7jxHidb0v6fCbryaWBLEvwwrF
    JkvppLpuHLLdC3d51g3Paj4qTvhovT+zjslcoloZ1nwUGxAlkG6KcXUGpiPlcO1XTPEv9h
    NYvKeqy2y9TJojZ/fYCDoxTVnf/Y8i/+MvKvcGKUWBGzDOh+FrtMfrE6kUDoZGzrXK4rTY
    B4XmTbUb889Uax7NIbjhLlOYc4VUkS9E7zS2FS27dtxYEuD029w9awV7xMldOdx/uqnKg3
    gMuw7zEYScXZPNX8moU69wWnq1fu2OHDY/w8vIa/m9oxjua+i7XpK0NX78IKUA3B65GOsD
    TQFPDh+czMdV3VrfGVZCoWsJYk3ajhCJMd7I3lo0eydIDZfy8Be/XuE1dzIQ
X-ME-Proxy: <xmx:em_zapGw9iMFI3fU-TWQ7mesnrD79Bey99zp522Y99SP8J2xUCdZsQ>
    <xmx:em_zav2d-PvtugEUxfMz3M6CeCkWZC-oOX0X0Fc-_WBUugEJ72MGwA>
    <xmx:em_zarNPHudkDlbmCoTNqLwcwHDnhTGSuIdlWF-XLi8LkzePhLLswQ>
    <xmx:em_zau4ag1pdauUiXM92WO-Igq5L5Tb_xU_n6MBN2k7xsRs8AYzgVg>
    <xmx:fG_zauHMHjyoNiRrxSAHLVlJBeJ6KrVAQm8dVr0QsbryCJoqc2d3_LOi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D612632A0099; Tue, 10 Nov 2026 14:24:40 -0500 (EST)
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
Date: Tue, 10 Nov 2026 20:24:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: "Tim Harvey" <tharvey@gateworks.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Riku Voipio" <riku.voipio@iki.fi>
Message-Id: <2d7b1690-c943-4640-89d3-d18901d04ebb@app.fastmail.com>
In-Reply-To: <20261110183434.181711-1-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
Subject: Re: [PATCH 00/10] hwmon: Drop unused platform data support and max197 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> Several drivers in drivers/hwmon still support configuration through
> platform data structures even though no in-tree platform or board code
> ever instantiates or supplies that platform data.
>
> Audit all hwmon drivers using dev_get_platdata(), dev->platform_data, or
> headers under include/linux/platform_data/ and drop dead platform data
> support where it is never provided in-tree:

Hi Guenter,

I already commented on the individual patches, and this looks all
ok to me as I did almost exactly the same thing.

Obviously it's a bit unfortunate that we duplicated the work, but
it does give the chance to compare both and find possible mistakes.

My patches are in
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=board-remove-7.4

337dd938a3b0 hwmon: shtc1: remove platform_data based probing
ab1c9ff391ad hwmon: emc2305: remove platform_data based probing
985a7d241616 hwmon: ltc4245: remove platform data probing
8b300deafa72 hwmon: g762: remove pdata based probing
489bafe5cfb8 hwmon: gsc: remove pdata based probing
94ec070cdb5f hwmon: asd7828: remove pdata based probing
296048203f0b hwmon: mcp3021: remove platform_data probe support
93ce98eff9b5 hwmon: remove unused max1111 driver
9d4791700bb8 hwmon: remove unused max197 driver
190ba99436ff hwmon: remove unused ds620 driver
157784eaf3df hwmon: remove unused f75375s

The main difference was that I ended up being a little more
aggressive about removing drivers entirely.

The max1111 driver is technically still used in mainline, but
I remove the last reference from the pxa board files earlier
in that branch.

      Arnd
