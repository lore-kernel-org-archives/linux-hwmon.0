Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336348;
	b=NbqHRIG0xK+mwfVfUIvdekIJO4q0XkMmNayNT0MVkVpMmg9ex2H9Ry7vbmBvFslJ3sgG
	 Yodn+Xpzp+v5MgC6ofFc3D0CKDjh6FS/sFOHiqeMaCjslUGIW/Z6KM+6X8oodrLngtemc
	 hOion2IIvPT4NHjlnh58Ootg1tT3vFjjKDlGSRfC1l3iyHy4z5sQfeqTXYWuRKj2tpr9W
	 0BGtl/L79WsbdDLIfVLzGVxOHXnUtbe6TWxYwpXg3MVn37/zPABbpOCJ5LgoMj2K/ONw+
	 hPJw8Kfz0ogFOVtYhWpw6youWFJTeleFNOqIuky5W+7yIHMtdfDiEeyE7GJ9NywtK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336348;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=qrdYKpzCqRJ+cDZ++BAIo2KDd1fphmcFdltnrUQZA6w=;
	b=IYsH8Bo1wz6ugUb4IyBeGUmqIYup33Jc0UXgUCPD/Q7xXEqU3tsvEBFtL8M+QFqWzAR8
	 R1R6/pR1TfRNcsfoVvEpQdPBsAykV9LDk+R3pZal8kIBQEWZ97LLN2Migk0HeJkQT1Tru
	 8tzFvk3iop55NZ4bg5x5/F9uPUFcGDK7zKqqZETzmZInXIgcbCfvFPNjjO1aB0R3R4hIz
	 gGby8msREDhylL4X3O9LIySJcYhqDVZ/895NQ5Vq+SH2Bw8FNnzwdbNwIibpAoOTNxBp/
	 CFaYV1G8KcEvy+g0uuGqM1KZn57pt0Eu8TmzzaZGFUStoVgh4Qx9/2vr6u+hCIgrifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NAgX6Vso;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uy6PQV2I;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A24606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=NAgX6Vso;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uy6PQV2I
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 21FBC1D00299
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 13:45:46 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 13:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794336344;
	 x=1794422744; bh=qrdYKpzCqRJ+cDZ++BAIo2KDd1fphmcFdltnrUQZA6w=; b=
	NAgX6Vso21kDnzb9CcDWTENzFdDgTMCGR3yYI5kDH14jBrR9sYFMQpbLgkMbFmqE
	xkERquCYX0HCBJS4+3Q3ejt/uVfmdO6RXaMTtR8y1mXOy0Ty8sZD9/Hg2KNAaOjW
	pNPrqyF86RpD/L4ZUOAXADoQ8ESvYm1s7bXjnI/HPpEouQhYtDCWpevd6AZRRN/n
	6HnwRxFfTD/TxmSthEP/UCGNHOMMdPDPI7DcLgQ9NuwWXkdNT86Vx0pRwcVA70tG
	dAiYOpdW2UGDZ7gTRG0qwymtzpC+HoUIu5xPfuDx4pfGLjfqIfnIFCBDSE1lOLXa
	3bsVeUw7pIYsQPU1tpfRzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794336344; x=1794422744; bh=q
	rdYKpzCqRJ+cDZ++BAIo2KDd1fphmcFdltnrUQZA6w=; b=uy6PQV2IULL9W5lp+
	f48JlopAbylBuwueq9hC7oiw5ifz/3BluT8cgLf25IToTxeDyUusG0ZXx37ThXUh
	oFHhJPqV406rrad1h4wxHjX329ZUvJAyClFU7RcHxKZCMvtkQYq5ln8qPmxFcBBO
	1pRacTeBhQU88yQaVXLPlIPEwvG4tmEGkMxLWwbWymWEcVmyRSL4XNABv6poeWj0
	hle5k/EtM46HFPC3NcXoLYYPXVSmv7G13M5T0fOIYL6J872EYnWqiv4us4r7tBkR
	wzaNO0wUopumJe+pxslaOqzFYhLsucxhj+GqjlzEnD/Y9OD9mzi2zqx/EnIGYf34
	LvsgA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794336344; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:jRro03xElFPeC94sX/FwzH/m10KFPpzemDYWcGgngGLx+kd
	ds/Wo1gxjBp09kyb+MNfd8z1Jq0OzmuerZTnssHhoBI7OfQ9b0yRn0jfvR+6Utgi
	fNu6PDuIufK1ZAzji3lTYSkrLpMn8Iis4sO4JhY8EnsnqAfKb1kQ96SlrH4VE+mw
	Fn4SedoalX/SngfBqmthwhe1GXRaNpsxcwvRmLXQHE6lT6dBgUcfi6HWoItZt7rW
	o2vY43OuBqTz62RJaSgm2EX37jYbquKt9N+xErKmCkq/5NC0qup5hUX2semot57V
	VBAYCt4cDMGEMb5d/Pzz7WlPV5VQJRPWbIawMNg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:IURt6+6GSppj8YaJwsUnwf8f/DZxTGTg/rfDlu56ZbU=:qQ1fahs4GBEpkjwTganjuez4nanFW4Cvdwns6UReltw=;
X-ME-Sender: <xms:V2bzagBGrKzP63GaP11xbAEvnJwTOYFs83oRU1UvEe81GO67I48eBg>
    <xme:V2bzatWhzK_ADhaRvpl6iPtp4cOJ5UFNe5HgnTBAewSBohtLG1i_XIJmz2oVJr8nk
    Ld8PqniUhP74vGfln1_IwF9uhhmdNcZ-Yfah_mkjQh2OfhEPNYUoFAT>
X-ME-Proxy-Cause: dmFkZTEjbKD/sIhn3KL383Qbz77zkkDvddEqGyYPo/K6cfRfZ9KaTbckckDX7RVgFGSm3x
    cnQDia7gxYgd5M9ipUEw0hCMTCcgJiLB3gy6mLfaQaRbBBfBZK+XG9iSorPDAiVM4q3VhG
    ss/v4GjWO+UP17oI9pn+L0aXh8zriWPzW1twUtJHGu7umhb3xZDwRwx2h7Jig4PYxwPuHj
    8IqKY0P2achgLXF4bUmkVjnndWwR2HlrBHSSv0KUDIRhKUPlQqPaWPF7aTPsNopBi2cYYH
    rYVY3zpI0mYbMdsgtpLGrVBO1JVxxL52A70cp/cK9JaEHVkzE9U6i1PZirNuvVDxBGAPJY
    1Afa+KNiQ0/xjC5AqTWEYMjOd+gVAo7qQMpmQVWvUl8zPTKKHs0mGZ7AjptmQtM2gtd+BS
    7rU5rTPYWJOQQ3cnzMREAoE01pWE9x9XaITAaIidDBIhZdF4HuJP7VKFh5OjK67DmJwwxV
    nyTIW6c657GpPfzyL5uuKlt9hpsYB0MxBCEdHmpKtKQr2xllP7OKR9fPZ1wBbz83vDp6qZ
    KXTsK983LpCPu/ff7/f7wdFqEXl6Wc6wjWTUBQP3yJRxw+2es9x/YAGUc6gp1mtGCGfxE1
    kfo1LBN+Pne/1KwfmokrdQkg1TFoiW7eUs+1hBBlDlE9oj/Oy6fJ9SrUTPag
X-ME-Proxy: <xmx:V2bzaistlOO-QoRL89im2EtphLsgEBlAGARNoErw037qkxzmgPEelA>
    <xmx:V2bzalYmKhz-clkQrMRraczhgOHbTb7m8wN25f7F9tpCqcUhr-c22Q>
    <xmx:V2bzalUUcrHsdeNtQCo8QwpCyjVodT9d5VaZJOLJiV5D0w3wFexyuA>
    <xmx:V2bzap7xyh0bGluavtZF8bl8J-RCac74UdP40lu-vyREbYot7LF5yw>
    <xmx:WGbzaq7XSjaWI04dZ4KsWQUxv2apZt5BGyqP-1nTZ8_NnVq2b9cBdE3S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EFF7B32A0097; Tue, 10 Nov 2026 13:45:42 -0500 (EST)
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
Date: Tue, 10 Nov 2026 19:45:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <966198d5-9789-4505-b1cc-670bf035a358@app.fastmail.com>
In-Reply-To: <20261110183434.181711-2-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-2-linux@roeck-us.net>
Subject: Re: [PATCH 01/10] hwmon: (ads7828) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> There are no in-tree users of ads7828_platform_data. The driver already
> supports configuring differential input mode and external reference
> voltage via devicetree properties ("ti,differential-input" and the
> "vref" regulator supply).
>
> Drop platform data support from the driver, remove the unused
> platform_data header file, and update the driver documentation.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Arnd Bergmann <arnd@arndb.de>

My patch is almost the same, with two minor differences:

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?h=board-remove-7.4&id=94ec070cdb5fdfbcd22d5533970423ecaf7b3e4a

> -	} else if (dev->of_node) {
> +	if (dev->of_node) {
>  		diff_input = of_property_read_bool(dev->of_node,
>  						   "ti,differential-input");

Since only DT support remains, I removed the check for of_node here,
and also the conditional on the match table:

@@ -199,7 +190,7 @@ MODULE_DEVICE_TABLE(of, ads7828_of_match);
 static struct i2c_driver ads7828_driver = {
        .driver = {
                .name = "ads7828",
-               .of_match_table = of_match_ptr(ads7828_of_match),
+               .of_match_table = ads7828_of_match,
        },
 
        .id_table = ads7828_device_ids,

I hope to eventually remove all of those, but there is no need
to respin your patch just for that.

      Arnd
