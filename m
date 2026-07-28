Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13C409635
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273434; cv=none; b=SQ75paYKee4fXeACALDz7BzxHj7CZJy4wTmgTGmM+x+IptAYiSgouhVt2tWq7bghG8IWRsqa03ljMO1BpL0BH3a2HeYTqXFegPn/nD9vJ/27Fcc7sXURnmFfZCr1yI/QkMN9Zif3QQ1+DecBrBGvmvno1ioaw/nhSPd5OvZHLxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273434; c=relaxed/simple;
	bh=KsrSd1GDRpCKx2soRF7QGqJUiFXPijS9GA3YqzvMgXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7aaVYUjqLTcvdGT0rfEAikiI+iAt6+xT8iPb7r0/4kEpYZcImG4hyGNoqI+tIf4ejCexe7Cfqz306zvyUCnwvk+XGEY1J2mUbKB1kZT8h/pyhS6HPAxTCzW3zlEogI8M/LWGwS8Rz5d9/tNEyJuG8mGOFrCf0b7pIcrEJ7JEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iii6A/Bt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iii6A/Bt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso361595a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273433; x=1785878233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ftm5XLIxNthIvK126OWJRqMXekUTgdSJ4NeDzXA2YbE=;
        b=iii6A/BtBC5zq92y6z6THc2cqjQMahS5lnnjkRlh825LwEGJHS0A1je3/vp/p46vTG
         NqEKfNxRHYNludpeK44G+e7AmCtP9Ga6J9oEaPzVgN1FqffX+mwYDxKEGrGaYTAsnk5b
         QnVhv5YU4K1jREFT01DcFIndCOnen0L3RT5zg2k3qjaRnTKKGqRViUcrgcTUhHB7rWf9
         a385sQwV5QD0XpVTRqLXM90GaAxmp77RWmZ3hVShUxouWOhvDqARsyuTWKXgqG1IpauH
         ia8ZiAQM2qwmfC8mVTJ3+dAc0tw5Q7mBBY1dZpBnEzjPx5UFJBvNIfW19EzHRXcTrS96
         uPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273433; x=1785878233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftm5XLIxNthIvK126OWJRqMXekUTgdSJ4NeDzXA2YbE=;
        b=maLe69YLLn3eJcaf/Bf6c58acLUQcJqU4HwiPVl7hTsAErpJvEQAQGu7AC8dphpmOp
         9tmYQrNxU4Rn0XAopEfWKbxYtM93RcFA5DSnBHPsaeC8uEuZo1f8RVguKW9rl34pShNZ
         Oe1XQXEZmhhKJKNm8CAibnljNJGZFASNxBnLeohHovMMB28D/pXCC3H8ZAH8JbpZm42v
         yRTWQR5RRiGIKyDdhOutRnpBdD3sdsm20ypB1CCV1UNUo8NM+pPiDhvJgHvEvCxX8are
         jYce//DQiZSjgxsf/aj7C8BdOVkls+ktqxgqh52xxYhxvERqnPA5UknF8NxRmYa5+6Wl
         hPSg==
X-Forwarded-Encrypted: i=1; AHgh+RpPMMww9cvg/NE/NuA0BOrYbbapkTL56VZZkqqt32bJ02OQ7udyxBOLOKR2+Z+rcftsoM4Z4tw5gD77KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSZ7bnEtVUHjXpWqpcOKVr5aC4GuYFYAAYTUgLdS33J0Li7DD
	7DdtC+lRHX+yq/r8rP/mp1mkwNjTfmwWJik868wXa2cw8Q84qPVh2xfI
X-Gm-Gg: AR+sD137Lg6DQvuRD1PN+kco4eEArWp/bVMnc29qBnsZ7199XVeZoimrtQSWmpiy9jw
	LbOrV5quF/GaV2pZ/7eoTW3sj6DX3mvd/PAWXWrxH80WRd/7Soji0KYH3/0AG66BFwM5M6gF9/Q
	Y4GkAvX16Tu+KDCZjEztsDXNGSQQCa4wX9BdCrmLKpwI+n+MOnCdGhnJCB2iBEK+YE/+mqHhHci
	cLtpszCRKAykxei2yv22s92gniZ3jhnlWEotAsLY5vZDOOJyqDXfKNc5dpGhn9VtlFe5WXRmNYB
	mumGBOpbzZT7IRyHwcYmVxpLLo9h3w5FgflhhpYK/Q9HzzNrl8ik3sBxKD3zIsu/X8pJWBciPmI
	uqs69J3TtGoImltQeISn3YROPb3iF9cThE6W3AMU6+fhKlJ+JjVdGiqAOoeWuKnbW9IHxWMPNKM
	xU0uTbWl/y9G5ElEgKDL24QOiKEaYyFPXOJNm0Chu68n4jMHICUOs+DHzv9aal1N6vteFUwQJGe
	Q==
X-Received: by 2002:a17:90b:390b:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38f6a4e3667mr4424289a91.21.1785273432741;
        Tue, 28 Jul 2026 14:17:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f1353fdsm443956a91.8.2026.07.28.14.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 28 Jul 2026 14:17:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sean Lyon <sean@seanlyon.dev>
Cc: Jonas Malaco <jonas@protocubo.io>,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2024
 Elite
Message-ID: <2588baac-e7d7-495c-8a6c-277746e9959b@roeck-us.net>
References: <20260728031127.26553-1-sean@seanlyon.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728031127.26553-1-sean@seanlyon.dev>

On Mon, Jul 27, 2026 at 11:11:24PM -0400, Sean Lyon wrote:
> The Kraken 2024 Elite (USB ID 1e71:3012) is protocol-compatible with the
> existing Kraken 2023 devices and works with the current Z53 code paths.
> Add its USB product ID and map it to the KRAKEN2023 kind.
> 
> Tested on hardware: liquid temperature and pump/fan speeds read
> correctly (cross-checked against liquidctl), and PWM control of both the
> pump and fan channels works as expected.
> 
> Signed-off-by: Sean Lyon <sean@seanlyon.dev>

Applied.

Thanks,
Guenter
