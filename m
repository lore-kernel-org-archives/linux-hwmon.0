Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE122541C
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341104; cv=none; b=M3EP+4kufpvNIton//irQwsuAG4M4eEAjGgpKAwh80tVQmS9AmUDPq1YavfzhxupOJ5qY9/Ckt1sswxM4nY4pZscNKdfEXJ4VCLw+nfZGDysrL1TZQ5bdSNtnJ703Xovji52GWrV5VzLNsdRuweG3pY/7PwiZ9fQ+g/z8Hu7+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341104; c=relaxed/simple;
	bh=gLKSdOShGg2uo9akYAxRNmgFpbWG+H/A9yxY41Cj1Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhB6wAktEI6IgVyTiiY27VmE5vPDXmS0rbnH5tvPGnUFC2InZ/iSVCQEQJfUW1AD+HQS1WQVuVxtnGngnot4H9dvMK+LX5T6OaUGWdlqwxt10MWovdi74I9YeTuYR5Q5vvWoOYcqkYejudUbNkVepydg8FN5GwzTpJaN9Vw/Iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzYYw0tm; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzYYw0tm"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f68f3b075fso2721747eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341101; x=1778945901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=NzYYw0tmj8AKhcs2nzO4Q8L54dGP9P4u4luMqhJ6ROPPv2HllgtB05ILwNRiqHaMBO
         yJ2miicFqOHtg99vsrYQiTHcKnKTIJ5KGEtlQBm+IDOjb+/6fpNfoFE7Qe1nYcNTWaw4
         vEyT0r7q7V3fHFeBKT8ZA028cy/zse8N+islCm15CiWniqSuNnHiN9zLNyy0OpCbuG+Q
         7v8nv/XTTnUnrwwA0D7ipwF6R51EvbrnP78JwFGDQ1YgsRplf4c+/jnkGMioUPNPJEWc
         rMgY3Q4CcP1ogpAq6AVpN9yUK59jDz3x4XLpdc4QB5LoMoELX1ZUEvrYcJcti3RBQM2H
         /2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341101; x=1778945901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=bM64rsgzTlzykdBuuY+DVVmcHBxlQ4C6U3tWaLfjfNiDtQ6B/4a+IBYHrRWY5S8+Vh
         s5KRMMIiYKyjM5IuyxekOg+ppSGertB4wLB6yUWroZnZPoLrQwYy4Ung82VrX7dEFWO2
         LAFOg1OezDus1ebzi5zCcmLnArOIGo6iNEtwX9uEWezXlTxhW+BW8nf8IDbw6NJhE7DS
         B4T0wtyV0uNL2HCJzR5sZj4Gzn3L9SBlACxoqYoVaxPnUW51F3hSmQeo2e7adPUgEs66
         mWT7CJEspborhE9UhYvuE13V69XtUBCSxEUdSTUVo5Chls2GhFiZAjPnToQfg3kMEUHl
         R2GA==
X-Forwarded-Encrypted: i=1; AFNElJ/T40SqNtGi5iW0SX7HNm2UQWoYKydvwphLWrDkRIPVpP7DIfsvbqVoXFloA9yHoDDzqLX1tynPLFTOrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylM41PRs+8x9Mq8b0OeCT8U5iCEtmmQhvZQXTW1C5C+iSkD9Mx
	tPI5fm+0ng00c6A4cYfjTXHfN01CsaJfyOcSFT6pct+C2lCAjKZijdQx
X-Gm-Gg: Acq92OEuPKC3yIRNyNl18eZY9SwhjfC4gEWYDnjYwYNkosoXhaLEtkhi0WCSHfnehUt
	Ywkq07NtVfvuJLzTW9AaKiyh2hT2TAZBBz20grUojcPkzRj8Pv6MwOIZGbBkJsf14+/DeAkOsrv
	RFnJkVeN/3SAn2sPUoptLmTvaVd2gwqPouflP+7SHsy0t/wCuJLOIWDsIVCD6n/Zu+9eOm+akxE
	zFInGOP9lr/xHsYQKsJVbvpphkIVTHeINRM/BIJ4ANn1R05DML1mkK6c/AS5CCVQ1656AtHcr2c
	qGSa2Ez7cemF+cl+z+nv/l4bMyeTvf7QglMpDYirYykYl/0388X2MPbOa7RF3IGKsQtKKRq9B1n
	dzjwpONlcLveV+Dv8xzOnoBrxPmC2OT7RmS1RuR9umYLPNCtrVVWF/hKeConjGco2NoBPF1azpR
	xMBLsxG0JmOlxDctvM9i91nldO+YSmG+hIdvG1
X-Received: by 2002:a05:693c:2b15:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-2f85c07f8bfmr3256312eec.12.1778341101337;
        Sat, 09 May 2026 08:38:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm6551514eec.30.2026.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:38:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:38:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta E50SN12051
Message-ID: <cede86e8-8bee-4bb4-b6de-e9bc399d316b@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:28PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, after swapping the inserted lines below.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a..0f10368a1386 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -100,6 +100,8 @@ properties:
>              # Delta Electronics DPS920AB 920W 54V Power Supply
>            - delta,dps920ab
>              # 1/4 Brick DC/DC Regulated Power Module
> +          - delta,e50sn12051
> +            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
>            - delta,q54sj108a2
>              # 1300W 1/4 Brick DC/DC Regulated Power Module
>            - delta,q54sn120a1
