Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB64436B
	for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715552729; cv=none; b=qn6/oID+EiDntqvdt11m2n1uhkp26TOXvoPkMzO2JUA4NQiWYf6Wj3HlDKCWIbaVUamMeiqUjoKmrmbPwwnCykepA0vxXMD3zNfsEwtrqPSDwnFzPESWKmtjnSMdZg69fpgeQSOGYcxckxjHxi5s+YyO7rN8CMNZsjhFQDj3TUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715552729; c=relaxed/simple;
	bh=UkEMB8NT9K1NicA6rzxvUvopH8XM+xAARZ9Z0FSBIq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFbKAmOW/jOfvX3ZZNoBHtlIOmoeqeW5VblUXAWmU+UJDvvskzjuBa8BLgxesUm5zvzn2JQF7uu3nXiTXQRvZu9aPXTGTu0DVw2GIIOiU/+9gulJoM2lCLTTaZKU8bKW5MtJK/2OtUk+hxIA5YW7WxbPzegu+JsPBq7Qkw+InB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io; spf=pass smtp.mailfrom=protocubo.io; dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b=YFC20lEl; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protocubo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b="YFC20lEl"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2829675a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google; t=1715552727; x=1716157527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doUUsXuhC5o/Mb7W8vJ6K0DW32CM7s9amgU72ylPVXM=;
        b=YFC20lElDjxvod1OZHsdI76Vctobu7WCDy4OeIODWQOOjcnBeanIEPljctA0QkTmxb
         EllZmFzZx9T9lV5IX3guq79JpqqcTrquzK0ntYLMiP2BO/HL1PH2ws38krOapNmkGhiT
         OIuhZrtoivEQSck3NyENWtYnJ7dg0jMGkLW0W2XB4Aaz1qL+5V03j9cStEje2NuBGva4
         8Q1eSR1B+sp92s5hI3hwWMN76QP01MH1GKBy0Su83FaYiMW31yAXzgEihAWCYNiH8NFy
         s+VbjkbiGMNBUUQzJWKuOuGLuFNbPq9YBvzEwV0xOxKAt90yg4npRcvVp0iaJLSkIaRY
         UDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715552727; x=1716157527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doUUsXuhC5o/Mb7W8vJ6K0DW32CM7s9amgU72ylPVXM=;
        b=uY+6Fx8s7wq47kzoRlE3UB34+vp67cXBO4mHOamz2kVCZ7lRQ8oT1Cv6sadOPzgP5W
         yidYmB3Z360xkQP8gsh3SLhXdaHdhexqg9NIeOE2HZBzfA9jiq+BByBDt+UdI4jyOQ22
         Ik1GxN7bFfVjpbAAIq1rFF/w+gN1fwoBhZ6vNYQsCvNwrnc1KN8Ml7pkG0HDXI4Tw+B+
         kG9L6vFEqxUIUmdEHLMjOMe7tdo5U3eSaxSni+bv6rnKWnTF+sYdQ7N4fZT1MxqJiE2m
         TVJEGVMijy1YQ2d50PzmP/r8zk5j9XxzFniKuYdXUFpSY3GprLVaZFohFr9RDPQvv7lp
         ZtTA==
X-Gm-Message-State: AOJu0YyKGXPC3WmGprxpLZX/473I8fMMBd1yldM+WLFEZCXDLpfHH/0m
	EZlhbUt+kq1fdXqHYH0MOaulCQZqeMa+4dXsStNESz6feEMC//+tqVJW5AzjX94=
X-Google-Smtp-Source: AGHT+IHxEipmEYUokfxFAOqW9vurMJMmX1uV/1j2z6KIKke4iI8yKqUzdMuch5bRrIThRXKuFs69pw==
X-Received: by 2002:a17:902:b20f:b0:1e3:c5d1:2324 with SMTP id d9443c01a7336-1ef43e294d7mr91662115ad.32.1715552727082;
        Sun, 12 May 2024 15:25:27 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5e:645d::1000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf32fdfsm68105635ad.129.2024.05.12.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 15:25:26 -0700 (PDT)
Date: Sun, 12 May 2024 19:25:22 -0300
From: Jonas Malaco <jonas@protocubo.io>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Bail out for unsupported device
 variants
Message-ID: <jymufco6gqytdbpgw65q6gc3lllazpuo5tygwuc7tedapvq27j@picos2hefkyj>
References: <20240512161921.850683-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240512161921.850683-1-linux@roeck-us.net>

On Sun, May 12, 2024 at 09:19:21AM GMT, Guenter Roeck wrote:
> Dan Carpenter reports:
> 
> Commit cbeb479ff4cd ("hwmon: (nzxt-kraken3) Decouple device names
> from kinds") from Apr 28, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/hwmon/nzxt-kraken3.c:957 kraken3_probe()
> 	error: uninitialized symbol 'device_name'.
> 
> Indeed, 'device_name' will be uninitizalized if an unknown product is
> encountered. In practice this should not matter because the driver
> should not instantiate on unknown products, but lets play safe and
> bail out if that happens.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-hwmon/b1738c50-db42-40f0-a899-9c027c131ffb@moroto.mountain/
> Cc: Jonas Malaco <jonas@protocubo.io>
> Cc: Aleksa Savic <savicaleksa83@gmail.com>
> Fixes: cbeb479ff4cd ("hwmon: (nzxt-kraken3) Decouple device names from kinds")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I updated the SHA in Dan's report; the branch has since been rebased.
> 
>  drivers/hwmon/nzxt-kraken3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
> index 0b3f04c740b0..00f3ac90a290 100644
> --- a/drivers/hwmon/nzxt-kraken3.c
> +++ b/drivers/hwmon/nzxt-kraken3.c
> @@ -928,7 +928,8 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
>  		device_name = "kraken2023elite";
>  		break;
>  	default:
> -		break;
> +		ret = -ENODEV;
> +		goto fail_and_close;
>  	}
>  
>  	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> -- 
> 2.39.2
> 

Acked-by: Jonas Malaco <jonas@protocubo.io>
