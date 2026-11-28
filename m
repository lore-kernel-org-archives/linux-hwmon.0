Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852799;
	b=Ojay4yxXwkvCSzxNE7yB4IJJuxOel8tvaaer5Bc9Vkd9MUvvhsFG7qFDH6AEMD2fKfya
	 Efk4DfK1dkI/5fiFqgHXD/SRmPj9fRFiDoghv0zT+SsnBSyVy8ENzlfSJCbaSQxvrj+mT
	 DO0VlzAEn/66oMnUMVY2j1Tiawqxz866ctPXnFlNa0zsSqHTdho5Y0cq6pYL5kfyzVZ8r
	 MU0mYBwQlr2zrJ3awrd5U8rKXDjPztPtMrtQfOlDsU+T77h/G31Fy2qqHoNkkT+29uju9
	 7IZWN+HzcH4GFe/oKTBdGsx8bQJZDIPAj4aqYi9WjOsSWLW8zsLOxJvLYgFJVTyuyRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
	b=WXEKXxWuieMZJHyn3hDkarWF/4GFjMnkUBQQRzAw6mLEvCS9q1c4vJZ11094KR6+T2RZ
	 F+u5ex+PKXKQBjpqHx/tMsZ15ysEBvgxBJ5xnTnbVZPRHCah1AJdebcv3FHS5cc0SnrXe
	 vERiMjZeRKtEqo8XVZXvwd+3mQTxD0JnJif4yxT7B2qWjU2KBQB+DdKbmeSrrfnFNEDKh
	 ZC5QQ35Z5zt5tFVcTrhv42l39qVhYJvPuGFFOWgnuTdpqMI5qQcg2hQp5GMPRyqudRROb
	 SRrhgdyYKyT9AJgA+TiMvQN+iR4L9eA8IZrO7kKGdxCoE7kHsheqhOYpHaCa3Ys1MHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="i/U/to+v";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E13606A326
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E13606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i/U/to+v
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso6444506f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852797; x=1796457597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=i/U/to+vCmL1lcMOCEc3owu39hWkCjDpqJ213buTkVu7MoriXmrx+7OGqlR5mKjN0K
         HJznAwo3QdHX+mccxMSx8rXVqDLQlnkM3P4KKsZD+//BlVONCBDPn8pZ4yevOzRiXp/I
         gJxK0s6juwE0bQ5bE/7yzG82cu1twxYL71VfcfhRCV7DMYxDCXh5JSCk5HmLwiBDbGcK
         /3LWwAPMgikzdeET6ZLrmfguyXOEAu3q8eXawDWa1Mz3qgEI2CVV/tpVSCKAYuyGlmKD
         c7Nrf1KPWTMmTIelV6zqs20Kg89Kf0hmSLldDN2UR8QXyMgoiMgC0Yrgxd++VBF30AKW
         lUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852797; x=1796457597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rECzFDCKo4XXlZnw/34prSvNBZQ0YYwmq2ei4FG0uow=;
        b=YSiGVGLZU5ePROKZQAkYP79LJNYA/TnZaWisTGP0UynGjVaN29SYDSzI358+ZCGYMV
         W0714Ls737ycvypkBKxwYboEBBuFHd+RcoplbSVGCDt5OyegoUwICavy/jqsHdCqxxjj
         DAfTt+iisNBz60v7GlYAIxJiRBvZDe8xaeNRzn80IgIEodcq4+xraTqxrbs8Sdqh1lfj
         LPOo1Kdy+FiK1EoEi+GyvMStnUBbrKu61I++KuXkOlJU38ek76DNDRyJ+oa99+1Frfmq
         MpknVgmSDYXam6Pd8aRurHpYusH6ExcWAM/36dRIGKNGNHha4S5yvOnlGV6wYl8sKwsz
         Z6FA==
X-Forwarded-Encrypted: i=1; AL+hErEJPg7HF2dDpX9hTdoyudIOMwChvMPMvQs7htzB5n8p8V+Zl0pdxQbqBv0adEenjrArAcZ9T7AmlCVmAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9z7TI2Tb2veWM7/GBxoNQcooiH0SKm0uGjMbtS2Yj4tP1eK14O
	XHa9r4SrNhXQoi7bqiWwcagz3P77KRnPcqkMY8q7R9L7plVzl4A+n1m/CGRsYXVH8UM=
X-Gm-Gg: AZFdTZdQ+lUnElrNkol9dT/4yMlZBPBQAmZL7pavy4r4Ov+PmV95MfoHtTul+LkxiY/
	q1xTXHEgP4DlaMIZrYmwoxURJJEy4cdSKbytEH36ivkfmuEkrcz7BOtRsUZnemM6n7Wa1f2Cak6
	g9erBm7v5z9Zdb91AriqcIMDx3iCs5VKqzTcJSNPWfbYOYh0eGr1QorbeHoB8YJG69MdSXtAeqh
	AN7RRrvf8Min6KgoCFDKjgVEJMOdyOR826sAALvEiQ+cbMZeIHkwyfWNWNalVq+dWuxk+mON7l0
	IU9NMAXk5IJIEPP2s/pAtpj6dSTg90PCRZwZBLYvMe5bDnUx+Elp/F35DN6/RnbkCBFDaybrVvb
	tdKSnvceI91ssScbyScExrj2Ce008G9j3l0f4gOayS+h184fKmhUmPYWFf9PieYD/F8DqybX19b
	CrZA9XY7mek9QUBPKCYwjwdaksNuXoqiI8VTXVY8uAiVnXI5/XxKWnFVpjVVM8Ixmsw+BoQ2SH3
	rZtjp+IrSuEdj9WIjeGEQY9XejVn61PKL9HEbePW1Whs1TPprjWkkDRFrnjj/Svr2toZlr+y6I+
	1KeThgSpfMwdfZZMixdbyEl2souB/5Qa5rLdul6WwtWzAlNr5ZU1arn06OXXh8iRbBIUF3+At+L
	/
X-Received: by 2002:a05:6000:2893:b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4abb272746fmr52992473f8f.23.1795852797142;
        Fri, 27 Nov 2026 23:59:57 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b110ba3sm42679550f8f.35.2026.11.27.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:59:55 -0800 (PST)
Date: Sat, 28 Nov 2026 08:59:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awqJkqQ_8tXGIqo9@monoceros>
References: <20261127083807.2844507-1-shivprakash.gupta@nxp.com>
 <20261127083807.2844507-3-shivprakash.gupta@nxp.com>
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
	protocol="application/pgp-signature"; boundary="5kez4omv4kntvob6"
Content-Disposition: inline
In-Reply-To: <20261127083807.2844507-3-shivprakash.gupta@nxp.com>


--5kez4omv4kntvob6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 27, 2026 at 02:08:05PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Both of_device_id and i2c_device_id are provided by <linux/i2c.h>
without additional build dependencies as are introduced by
<linux/mod_devicetable.h>. So please drop the latter.

Best regards
Uwe

--5kez4omv4kntvob6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKifYACgkQj4D7WH0S
/k7agQf/dUy7wCorcL/I4owilXhYjnsXPrSYVFuZTI3zBHYDbdxpHZa80WwZlBG7
E4SFU0OwJbEJe6jfB4zfEAJno76UQtmfOsPNrRBjhVwTHfHa+eurWy0zb9D/2CE3
T9IHil5xV6MLLjEsteKu/ubZ5uOQpl/GemFXCbkkgQnOoNk3fu9vTRW3m81xJ9bm
uNWYCMXorvZ4Wx7PB2OLQd5RwRNUormhf1E7zoUUE4ilF3XfUbBOvueHDCr0dCy2
b/wJgjIiQzRLVsEcMQ1QhPUbCxlrMuzkchAgFdHqygmuxVmNh8Sz3yBHvjK4aG4Y
MLYKgxWCCTBVfnXialkv/zpFTTAkgg==
=jkpr
-----END PGP SIGNATURE-----

--5kez4omv4kntvob6--
