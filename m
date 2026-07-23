Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70037AA95
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842966; cv=none; b=rRjsrxh0YgrWadQNmkAWW8ZFZB29/l/J3+jE05dRv6FYQ73zZ+VcHUVIgh0ifCODYEeHiY4BGI1dYGVjDkanvIejNosF/CwLG+x2Exlnm2+RwbbarpaWc/7VlJUd03o03Kf+CZmdpI0l5s9/HMUVofXuafGo8vow/jJKLnngJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842966; c=relaxed/simple;
	bh=cMVH30seVxDqGNU+JXO7CI9A1iWOcqfw3kUyY5cSpXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G59E+1RZwUEOuQVyrEEaHcPbkBi4Os8cGZ7B5ZsHVufGPZVkhytypnfNb8CavyKrpUFV7rcuMKAZYt/CkVZ9BcY8rVUBRMTCScdQC4BF71Q/c8RRDCBSxIXA65jzK9BH9pmgCiD95xWR6cGXG81koPKTZOhLRIahzTIk8xbPpTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX/8PCT4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX/8PCT4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84867f07d63so1337165b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784842964; x=1785447764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IPzjE3FNOTGqvDB3QZeC9AMUwCIrsHLR+NHAqkuuNKg=;
        b=GX/8PCT4gj44Hoz7vIJxUbVp28tJd0yDDNPY4GD83psjqXwEta24C5bviRZYCwFaei
         E91nBXJWb7sv3khiPzJ1cmjZeBcHDPbGc1nhFbw3m/sKbhITGco+dSEJAsE8uQ+JGo1R
         b1ZS9n6o0ANZA8HGrIRK8e57evntrGmHWRiINx1kNlPVGIKte8jzJZQW1RWi3hBaK6Zb
         0XqW8xqEF88ikau0EV3oyl7FvLgGgio2s4/aEzzvga/TDoOFQ+/9WU6JZgWv7bEc1Und
         8t/hBcl7zH2UdzG2MC1axazphFnVQK8yxWhIpmwGf2Rsq9q8RhObZFsuHcyXX1lBtq+H
         MBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842964; x=1785447764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPzjE3FNOTGqvDB3QZeC9AMUwCIrsHLR+NHAqkuuNKg=;
        b=kaBQOQmmXR69L9st9jotllzhCQat1JBWTzrHpywGBbcJO8Np6pLTi8y+s1jeqBNPgH
         oi1iKS7y9FXB8n8NLslaR3wT8hWOJqb6vQYtdFBQY52PyyZs1ViRmCj3356bpNHOe209
         F35wSDWFPHQA76LARq7QqtQRm7LWywqW5gwLnK4T+m+gVPIGL1JMia+fafOCb34ow4Nn
         4lt8rtsPJhiNoB/KBbeg0YVvXVxor0FhoerwG7EBf73A6Yev7MKofxZ2//50o8E137iL
         BqJSvuAGwq3HFD5YwaQx7TSrt6PAcQgMXbPsBm2sSybIE7/56odnEfGm5Yq4sLjSKY61
         Tcow==
X-Forwarded-Encrypted: i=1; AHgh+RrYd1M6xZ+fwwcFL29d6/7/8ZSn5PcLLZkEnzirmKmesSoGv6ZJeSn6yraQy53QHywdN8H+k/WNorJK8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuFXSxYi9iW7jVPqoOO+Y6wqHT8y82F68G2m0mEnTTEQtBXvg
	nvhTqfb7oi9SZEBJTGGEodfTK6dXk9KGIngXZD0DgZOHrvPFKLwZFA0Hq5bawg==
X-Gm-Gg: AR+sD10yH32v/bEApkQgx6+GYTQFLsj8M+frGSj06Q5lPo4Pex095OWHz3ajZcALhPb
	Yph+dXe2Uv1uLebQ8IE50wk/dGjYvCHf6OQXsfkUuFUz/vSqyp/VAAKW7iphZyvcoiI+yS9uYj1
	y2/sfAxkfjUePEMOKVMlWh1VQ0AUmMyxjdSk3h4IcvJ2sEZV3qfXDimtpOkD/us4DMo4TVk+2RB
	q8J1Z3vFG8il9R+1kxMVY+IRCwre489LO5gIcLjfDz8hTLKv6AKv7oElGS6eLhbAxPuymiHRMjs
	8UGkKaGOkvMoFEydWSj8QKOEHWXAZC/UGLakm1fl6mRq0HmBuHYyCXt+bChwRxNhgWoLxJMJ3k5
	JI4CpQ3qY2GWlhp2wUE1UXRgDSRDBPAK7h4UovXdDHF54lcaUDLP8JRG32SiPIrzXhpv7G542rX
	iCe3OxwwxQWqwDfkw=
X-Received: by 2002:a05:6a00:3c94:b0:848:4859:a45 with SMTP id d2e1a72fcca58-84e2b7ca651mr5747181b3a.2.1784842963810;
        Thu, 23 Jul 2026 14:42:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c32sm3663216b3a.6.2026.07.23.14.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:42:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 14:42:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: kr494167@gmail.com
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: add missing MODULE_DEVICE_TABLE for OF
 match table
Message-ID: <7e86e321-aab2-460c-a864-e6aa7c108bab@roeck-us.net>
References: <20260721055022.34629-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721055022.34629-1-kr494167@gmail.com>

On Tue, Jul 21, 2026 at 11:20:22AM +0530, kr494167@gmail.com wrote:
> From: surendra <kr494167@gmail.com>
> 
> The driver registers ltc4283_of_match as the platform driver's
> .of_match_table so the kernel probes the device when a DT node with
> compatible "adi,ltc4283" is present, but the corresponding
> MODULE_DEVICE_TABLE(of, ...) call is absent.
> 
> Without it the module alias table (modules.alias) does not contain an
> "of:N*T*Cadi,ltc4283" entry, so udev / kmod cannot auto-load the
> module when the DT node appears, breaking modules-based deployments
> while built-in configurations happen to work by accident.
> 
> Add the missing MODULE_DEVICE_TABLE() to fix module auto-loading.
> 
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
> Signed-off-by: surendra <kr494167@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc4283.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> index 9b85293ea664..9ec409bc2648 100644
> --- a/drivers/hwmon/ltc4283.c
> +++ b/drivers/hwmon/ltc4283.c
> @@ -1772,6 +1772,7 @@ static const struct of_device_id ltc4283_of_match[] = {
>  	{ .compatible = "adi,ltc4283" },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, ltc4283_of_match);
>  
>  static const struct i2c_device_id ltc4283_i2c_id[] = {
>  	{ "ltc4283" },
