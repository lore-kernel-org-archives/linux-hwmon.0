Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC9D2F25F1
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 02:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606391; cv=none; b=Srmbw4ti2FFT//plsqCc5kO675uPxwhP7iHJ9SsmD2JXoeAUMCDX7UkG3Xn+9Tex2OGEkoHzUsLa/tZqcqfzzATwH0wNOwlxuoVreX6vMgPpaqePmDQzHXtjuTRHF2mCaGuDopZOsHB3iHiWuEe4x7bxYCcOWxfKq3Uq6slEQ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606391; c=relaxed/simple;
	bh=9agRZXef3BNKDpPZJX5c0Kf5kgozAvoiqsCsrV2EG1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PazplyuWfaHVVdoh53PvgjYtGdSyFnomPlQQmpt4xx9NoXEfCtvMtPowhUJW9VgWfCDxS782cDM1fnHIehBrU2ku7zFPtLwTStNR6DZuAtEKojdpfY/QMhiE0fWV+QwLYj2acOiW1PyWgmw4udy1l0QLi2yMTFn9UFEO6Tbx+Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaa1RT7U; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaa1RT7U"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso228461a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 18:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763606389; x=1764211189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hWKUkKLxWaSaEY/Hjt2PKZEcHrL1Aby6f/uFanaU3o4=;
        b=kaa1RT7UMo6Fu/5XJDOWf/MaUR5wsdL0LdzXt9uDNWwMkFbe7xHPi7GCGYrnnN01vI
         6MgbDqZeymyWiwBzDPYTQQ8A8oPdLGce1KYr4cJ8C6iOjHo/juPYV0yxM/2qbFJhBra7
         SAMYM1ET2Cl/UvT8l+XaGEiGYWfVynnIAacnLBzWKT4iFpWCspgtTrkkXIjN4eQbYl5c
         fTQ4vuLzmhoDe3p2+8gXKti1/jkvNi+8kzt0co8PjrT/jF8I7bPAmEDFQ9yK6Ttjxidv
         D8kEDM9o0fSUVvNYGb9nrFPwxK60jhY1K+grfaL+mYsXrsnMwh1rV78xqpDO19KvpIjS
         wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763606389; x=1764211189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWKUkKLxWaSaEY/Hjt2PKZEcHrL1Aby6f/uFanaU3o4=;
        b=PS0Z3KwJsxyUVPJd1NTL7Ot1w1zkVXHxsD1UlELRfNNNL3OP9JBzhYlqFVB9VOg/Yy
         0qBgCvcgWKDZMOdDW1GJvbintJKmsgAuWqXKbxWBrhIFCPBiDjDxeyjgNbtvSwsiieY7
         gyNMkydxAzCc2F0BJBrvaz9gbCm1VN6CsphZWfZFy1mZFaS3+rUDD88qWBWuZirDilQX
         YIAA/qubrx6wLMlJ09jqE7IxuiNCs01ytz08PlQF7K1hxNaXFlV5vu8i3L5kjjVXTZen
         s+JJpM6dceZtSnVpmC+HhwI3IptRHxkXESNIgTfk+LEewPpHc/n3+5tocq2fdzC5I0Fu
         qotA==
X-Gm-Message-State: AOJu0Yz2yt4h81FRdfqWsmpFQqkdr7mNYAtQuxmif0DKkbMGvsYWjpCo
	72GWI/+SNCTmfvIffamYUbO89K33A3yNpdbojbZovaeXSXrROvmHoltpOGi8OQ==
X-Gm-Gg: ASbGncvYRjvkg7gg930HmKP8J9vY3x0IgXG9G/5f5DLD3LrGTm7BkEtwwM6x68Iz7bm
	3xKaaJhPzCasr4GBTNspsRaKxDNidBz/RRImA7dxCDc9q8C8IJ3XhMgwhB7b14hfeflc5cCSQgo
	N1EmFzB4LPdlxL+5YBOtV1ozPVa7P9TlvlEx4osHtl/Zjh8AaKsNhnRArNCdU7mFNGANKhIXSjg
	kbxhlH4mVBoozdmEhOEfV5dxTl/Q70XfOWm9tKSrHdSbMvoEFK/TW5aYiyo/TOZeyHD3LP9Pryl
	c8V2gt/j5XW/lyJIw+WmPNKMWtKcbLzSojaPN/6n6dC8sLHTRV/jQoPynsNuT2ScJvSxshtCHbF
	dMmnCwMTxJ+x996RLqwAjKB4P9C0QlDaSwLbGUq6IkWBiSXuV6gUVtS1MxDdEr6alR77tFgewTC
	6pyAU3IDmUYGlBtk7zAjjvI8LE3G0NtUhM46m4RObqHv7L7X9vUKc3cKtFFH1ChBi+bIe8HA==
X-Google-Smtp-Source: AGHT+IFwWzoN6Mmw1vP4jqScGCEna13sJXoWo3Z+/+bq0ITc6FDg5PNbVfvAFpa+verqmQhCwNrQSg==
X-Received: by 2002:a05:7301:282a:b0:2a4:3592:c5f3 with SMTP id 5a478bee46e88-2a6fcfedf69mr394358eec.4.1763606388755;
        Wed, 19 Nov 2025 18:39:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc4f6671sm5204951eec.3.2025.11.19.18.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 18:39:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8bbdfbec-22c0-4c46-b443-3f2b857cece1@roeck-us.net>
Date: Wed, 19 Nov 2025 18:39:47 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch: applesmc.c - update handling
To: Jared Mauch <jared@puck.nether.net>, rydberg@bitmath.org
Cc: linux-hwmon@vger.kernel.org
References: <aR5W2K2Ic06uPgBy@puck.nether.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aR5W2K2Ic06uPgBy@puck.nether.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 15:46, Jared Mauch wrote:
> Updates code from hwmon_device_register to hwmon_device_register_with_info
> 
> Signed-off-by: Jared Mauch <jared@puck.nether.net>
> 

NACK

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index fc6d6a9053ce..984dfbf40233 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -1362,7 +1362,7 @@ static int __init applesmc_init(void)
>   	if (ret)
>   		goto out_light_sysfs;
>   
> -	hwmon_dev = hwmon_device_register(&pdev->dev);
> +	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL, NULL, NULL);
>   	if (IS_ERR(hwmon_dev)) {
>   		ret = PTR_ERR(hwmon_dev);
>   		goto out_light_ledclass;
> 
> 

