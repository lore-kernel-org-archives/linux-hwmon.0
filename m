Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337237;
	b=y6DyWCb/9tAG4qs+RE2bpZlHXN1khHpucBt/Fi4NxXpZLTjSdtjho2UJo5igdk1ddpnH
	 sIBt8jRwn5YWfF7jyzVKqnFHgodSbMHcJTicrjY+Rq06TSlYJFBPmGEMmmXG0eEzAs94/
	 0qYhHU853cG8Se3J2KFcF7C0ai6Zdu4IBYYGoU7J8jsLv4yxV9Bty3OCIHHCIrINVLe6o
	 XxEuL9GNUk4ruC6lpw0BsIAZ0kZ9x+zih52eYsmrIOhO2rUnYdZ9BjRBP/md6uL4pgky5
	 4G2PozBkxVcHQPbOuGD2WijQtDagHQFDO9vmS510KaUj5xlNdREFlIyCSNS+VdmvStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337237;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=1RW9w06FVhb3AWD54CWLbybVIrCibs2VT2XH1IG1XBc=;
	b=UkkYyGCK931FfdL1KDT0BJUKC6ET1cG5Thy7gm2IgFPKswrOYAHWkjyF6POW/RAnRvTY
	 AAHNFiuwchdMZK418/vNycYMT8OsL8VO3U91DGtoA27bfRuKBpwlTv+UKkCZN92J3AZVs
	 MXwCj6aObksmW9D+R7CkpDKQ30JdkHzud2SaIo2P0ozm0Epsd7tkjoI6PkLD/goVWTgRe
	 34j4KPfhq+P9A89VdJW1LfE+ZYIl25HUJdYUiaLuOXbsLwV8TGaV5he7326dstwbHG1jw
	 wOCWkVoutdcSwRysGts92ZjQqdR5NDy2ebQv8rvPkDUydovugxo1rLJf4yl9of8JiTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BAxyJD8D;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QtxMwC31;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D69606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D69606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BAxyJD8D;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QtxMwC31
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8F8CF7A029A
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:00:23 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794337222;
	 x=1794423622; bh=1RW9w06FVhb3AWD54CWLbybVIrCibs2VT2XH1IG1XBc=; b=
	BAxyJD8DCg8FP9FMC/0PoW+4+X604c+eexdO3J2yU/ubl27dbP8pTluN7dz4MhYw
	VINH7JCwTGVqs9uwnb54WzPxS2rfmeD5cveYZLeOqXjAqot8j//EUY86evmPB7X9
	WnMQBGAsDZ6HG0nkAcVYQTTc8NqmlxU6PnGpjgHHZ8bXYWjZUO+Gne7qluwM4F9H
	IXd+8Iv0TpDPrvhuZ/nGrjBCtUC9aPtxeWj3J0MUMtyMLvjFcPWxVJ77Rmbv7x5M
	x47kfnlebHzr9Lq+YP+gHRKEZzFUFedhw+KAhrrOpDFUikjwVhT3WFnSq727KLty
	8dZgnXfmL4MXWPkd7T8G1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794337222; x=1794423622; bh=1
	RW9w06FVhb3AWD54CWLbybVIrCibs2VT2XH1IG1XBc=; b=QtxMwC31HKE3Kowdk
	9VF3VqDOS6aAb+tMZPTg4nW9hD3JUTcZWKTTcWUey06DG1OxNYbZO2q6jjCpo54h
	Lm3++f5WqF2u0JN3nxW9VIOiCqPs+fvWc/Zv1ABgsJxwQ+l0Y02Tbc10AjrVj7sJ
	oA6kNstLK1hGBClK5Hu4uyHBDSs2yvfbLV1wx5Pg2VFODSnTHEQiBsHwNV+Z5DX2
	T+7Sa8lgoH+1xWxRzmLPJtrmFIdTLBVYlF/CKDdUooJn3ITaEP3zc6Z3ul4Rmy/u
	QlH5WYiWYwmAy75mmvrzUeanxB73hRRfZQf0St/TEuIoRpLdkN0o244zT1gRx0yl
	aypdw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794337222; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:RGG2gTvrfMy121F8KfKvtmDkDS20kOPGhvBeMHEsE47Ay2x
	rPL0UgrtoBMZUl+Y738NDk77EQCTX0XSmHu/hHRDR6cTgXMgD7Zi7rksdseDknKn
	STUUW2CI+FPEZlQNqkLRY8YQC9E/0HDAFJiVv6Sr/vMCQG1ZgEOmz35awVeGaRAc
	nXszhUWLq1AIihYa8OmfEoNlvEnpCNiumJ1cKTf5UT9FCnUj/U5105mj9Q3Qeg2O
	9Ib5CUz35NmwoZBhkcyL3MXy6ktSESp/if45gf2s3eX0dOWDE47sJBXWZpnt8Mjr
	8EiHVzvP1bu7RCXdjC3j0+op6GNEuS6FlwKYkSw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bVpgCbIZ/N4xO5HKMSD+UmhMNgDBqqep6o6gNRkqIOM=:pcxTX36UA4hvBL78GUMwBrIuGGQJJ3xdAYcjMNmPJn4=;
X-ME-Sender: <xms:xWnzalTOE8U-o2xUNZj_OLXKJlhporPwx_R53OB4AufFuom7J8368w>
    <xme:xWnzapklzZ3gfiWt8o1zEs9JgK1BjyxY1Jq8VVXEfh2Kwon9u03gbJPwD1_w_ppKR
    -6zGddImm38t6fINAJISxjQ9Di_HutR8Ghh4EHIo5E3SGjr5w39j0Ud>
X-ME-Proxy-Cause: dmFkZTGYvE/sPta9oaDadBXAaUi8f2b4DhdreoKpwktEnnWPpocTaYm59ifeTgCAd+HWKp
    FPIV7Dt/61MDXXbGfscB1VdP7gj6FQ4hoveogypB90dVZ1pozNt8b86Mt6exOd3DG4F9a7
    YJUo42J2MY0aTsIAgVjNgKnlli4hbGedTz5g/J07G38820OzuqR2rqDVlKIXoTRL5O6iJT
    6NQqkLvWUAraogoSntm4gDIDadWKExKhlMRr7Mo618tUMf24BuCmoBlQoqnbRVr7qYkoWD
    kaJC6MdojB3vKUZWXr2T9AlaCmUHRPSZc5s7JTzu4g2HtNOJBIER2+EK7TUiLCRJm3LGdV
    MTIDloTi5BhPKovXO5Lxtw4GJZxERpCUNlpaXi21iBj45ctQybtZD+HrEH1byzmQVQUbCV
    MSKpQF5Yrs4oUkWZSoG1sSk03GvVJCHyRGnBvnNOJyHTZmiN38SDXZLker9TG2OY3Ssm7V
    lq6/M8T8WJAvcurckXLCTDo8VaUFzesDU0CKa6LweBMp5jL8gFa09I0x+T0Iq6GFW/QEeA
    IXcnKFauR7ODijTX6WaQrC7maQ1lCi1FFzwi/FG5RrmPn6jCrWsvv5nb4zoyJIChFb/50C
    cHYpRWbv4JiUeQwbhb5yXa+c77VK43HrbjDMX9gZ7kU43dtgoi94Uew8XLVA
X-ME-Proxy: <xmx:xWnzan9y_ir9O93U9Cm_xKUR_lxaYKTR5jeo49wjHPUigcRv7FayQw>
    <xmx:xWnzahojI8BxML-3xpXG_Kn0FG-IQ50_FV9rpjNzNQkagmEJfDsiAw>
    <xmx:xWnzasnLPTIiopbHibNjvjj8EBnEedulfL_rP0xUcZLFWtCk4hNewg>
    <xmx:xWnzagJGSrKvL1u07R5iv_8KHk5C-bhxdEqP9iVl8kj-5u14u9Py2Q>
    <xmx:xmnzarKli59y90OoVwNWib5G_oLSb668dufszYyR01xsjWIzAFWH1SX6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E361532A009B; Tue, 10 Nov 2026 14:00:20 -0500 (EST)
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
X-ThreadId: AxoE-gXcXevo
Date: Tue, 10 Nov 2026 20:00:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <fbc64b65-6ff9-483e-a922-d3a49bd728f3@app.fastmail.com>
In-Reply-To: <20261110183434.181711-8-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-8-linux@roeck-us.net>
Subject: Re: [PATCH 07/10] hwmon: (shtc1) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of shtc1_platform_data. Blocking I/O and
> measurement precision modes are already configurable via the
> "sensirion,blocking-io" and "sensirion,low-precision" devicetree
> properties.
>
> Move blocking_io and high_precision directly into struct shtc1_data,
> drop platform data support, remove the unused platform_data header file,
> and update the driver documentation.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

>  	if (np) {
> -		data->setup.blocking_io = of_property_read_bool(np, 
> "sensirion,blocking-io");
> -		data->setup.high_precision = !of_property_read_bool(np, 
> "sensirion,low-precision");

The only difference in my patch is that I removed the redundant
'if (np) {}' check.

        Arnd
