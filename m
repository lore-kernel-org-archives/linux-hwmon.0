Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769384;
	b=e58fg/4X6keDaVIAD/vdFZdG2NmVEXTNSGIfuf11rYtTDFNasDARGi3y2PbEJg1O5rdD
	 OZk/gkDiH0y4n+aMve8l0UhZlsw2unkuOpiECqOTEshohOArGZF1u+F7CTjCVpd6zu7B+
	 hbkMMBnIc4KHdMz8P7jH1Rh+r2NW4PszWalbqmmtphEuzzK2E8FX0Zk2GSpIZWAjlFtGx
	 0ee4xoORnsv/dNO1JoOtsI/uZG0yV2M94NKCssyH+t9bi4fSyI+fbXa6zblCq49Nrz5b3
	 goQVcN04MYwmpHDD2s/bGpduDvvsB+jZe26Dy8anezlfYoV13Ieyvk+YAGQAhH9Mbew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
	b=QAKtudMKD3+niVT2tMLkTfkZtR5LbsfXEGFfH88Bmvg7/sb+yzk5AC0AsAWo75+l1mmy
	 p4h7ClLrATU6GxjW5NeGSvr4lAP4iNku2Y56nlaIDj82RlTZQ+53F1jqs7CBMktTndOUI
	 csgbyy0j4+R3qzE1neXXlJZGyLwCBjiUiqWlHxhCi0SJxe7oHexGT99z1M4eQyiJ6BXkR
	 UWdp7rULEKRAJY9FYQoo0OuPwii64YD5u+HjtQGPyJ1vIC824H7V/yrkX/4t1m5hZS9Sv
	 E2Ri80eOKck1iRBsFVEJUVILTFn9EG3xo4ehHCO4zVpUIPNGtqv2qW7fvRjXpWqi6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D555606A6A2
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D555606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so64205705e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769383; x=1796374183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=lMtduL23oty35ecI++RAvCDDqiwnc4Ak+6dpQwXYAlrNx/WsKXzEzr5BaFbdfWGv0o
         MIdxQNlD99ZB3a8pdZlPzsq/4KUpCXSeNscu1C8qklmN3X0MyZyu4smG76KD/bG+zgKN
         a5t5Os6EnPqekAKT3BU784FH51GJONaBlPWvdb5hG5vVq62a5HRLgpmnLGMi6YcnoS7y
         qvGHwnA/+1VBekixkj+vGN89hIxMcptLrPhwi9kCSzPZ5+eJkd3ljI+vBaZ2ii5tpxFc
         LEwVTIzesRkK1aagdCm3Sz9dhOlgaNyOYbdqFMjJ/Rv5/L3luL0uNMhbxT/KTNBR5HLm
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769383; x=1796374183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=b2fI6p9AeJjbUfzriMrhlU5D2on7habcYxwKnSWQ7xyA9fPl7mhoYjvfLQ2KtBN+sv
         kpHQaBn14w8lCpQJ0weVJShpKMeH2L9VqQBjgTnG0US7khgMQ9ubh8+tluPAbrRaHhy6
         RcOQz7OP1y10SR+K6jRb3/kbydNnuG+/CY3s2dzrQYpZfOb1I1dUIDBwseixSXVLbGRY
         VzUoDVC14nemNk2FKcR4cGu32cDc0iL1KeHb/Vnp/5CUsIu7xYGKww5CVqXxJCgJvcGr
         tbhNyY1e3RxPQvuTVb9LPltxX39by4+mr3sdrSYqy9SZm4KJvkFGifyAgggkkPKc4Fh9
         Uz1g==
X-Forwarded-Encrypted: i=1; AL+hErHRcmyJl/RcbkLX6E1eJV7+DALkrq5VZHVUCCpl01XyeH09DSYALySFT2SFWjYe5+5dyAHHnif/1mkHHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jkuaeya1c4uTJCnyfwqkRm1ZKChtuV6OrcaajQEeKONdJCIUY
	J86R1dUufest3z+E42f1iEfB5SgaCs9YPTG/Ei/dxdL+9c6A56Q5jcub0H6J8s45ah4=
X-Gm-Gg: AZFdTZc13fWEnbrCPPIw46cI5qa08M52B7qgdJvPre/VJ+tjGKQ5gHH821AZB/qRmUX
	DFJujypBjJmz3ewnyRSwUIgHGgZ9o4WlFzdHFOuzvoXm4/ZJBPAZlSmcvFYWPHvS3thVM9LZ1jm
	4JFRNPODgdsREtlHc7DbTZKvADBeSrWZEv9owFzjuKBkWcpOYptC1WDKj5r7MdBEjiM3WMKkWO9
	dszKbGG52syLvmr2I0Qie67TqENjYLWuHIwq+W8Z7JXk/83AckWJA5c1LKhyky7TcZ47tHOT9bG
	XtqAVbRth/AqfbIpOGt4RDLGyNRYOIMXCw2+OmX1WYzdCwBnrmyVtsWlBu0a7vGLzXYggCZiDoj
	qvOh+PLJ+lPdcYVwiNEHvg1D+4O2GrACYTeBRjLBDURr9d3w8Z4d8dijebM9hbJFnt984jHN7Rj
	6dZ/IAwX4xtMdsiAAmPtSgkHLCpK6CRrvDqbGYYgHd9hIRKr07jHT74iNknHsrzVvSr00f/3G/G
	YFYjr1cpdu7hgnl3+gFwsG2Iwce8K2fC2AekEwg+RUPLcFE1zlzeENHirNk1tdnzXgc2vd+MIWz
	0rc44/g/1YqsGKqM/WQstx9mo+5YnzFIk8QJf+TDeq5WFA1tOVHYNgWHKgNEORUf9euuRona10M
	AuA/PZ4LyawLW1fBx
X-Received: by 2002:a05:600d:18:b0:4bb:abe2:bbce with SMTP id 5b1f17b1804b1-4bbabe2bcc5mr70018825e9.29.1795769382993;
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b7515sm923694825e9.13.2026.11.27.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Date: Fri, 27 Nov 2026 09:49:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awlDvq6KT4HxGNDA@monoceros>
References: <20261126071124.2383368-1-shivprakash.gupta@nxp.com>
 <20261126071124.2383368-3-shivprakash.gupta@nxp.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gv5nh37x244s5vos"
Content-Disposition: inline
In-Reply-To: <20261126071124.2383368-3-shivprakash.gupta@nxp.com>


--gv5nh37x244s5vos
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Thu, Nov 26, 2026 at 12:41:22PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide i2c_device_id and of_device_id
and drop the include for <linux/mod_devicetable.h>. The latter pulls in
several headers transitively that are not needed and that thus create
unneeded build dependencies for your driver.

Best regards
Uwe

--gv5nh37x244s5vos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJRCEACgkQj4D7WH0S
/k4y8Af/YPMv6+VfabvAg6sjAP1iYCrA9X9sWU9HEzF33ikGj2zaSOQAbmelYcKU
MkYOqadm4ftAn3wh1m+RGl1mnfy1GNluJIXTI9zNZYGx1pj3U8dJqh1/XL74jj8A
xgaOrHFNOPOBUNkjSWBYaj0jo6IcppLUcPbLI6QT0lkZsww+UNLIAAdTGy3bKvJQ
zQELEUsrss+cgFYfjeZ40PKOh/wFEqPemnatDmeoUoMCItb7iPp3LZX0szasTHR0
Y0MOy7nJemFgnBUeFliuIZMWsjW0gTCXFOfwAA/AU9iZ6LoYjQ13w1baDZLxOSsA
hwUFXsoIF6f/koYvawaOx3iNSkWDag==
=uvjs
-----END PGP SIGNATURE-----

--gv5nh37x244s5vos--
