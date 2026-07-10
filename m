Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F023ED5B
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693254; cv=none; b=A1PWC85wieuXbbKyx7r+8E560qnJErBI+6YzwfTK4hQAXVPJfgHyBeXUvlQ3+HVIyazR8thBmN8tZ8g09FFEChz2DksTmaw+QJdYNnIy6ljUyHdclYtYpNFapXmeYFSns2tPw8OI0kRITCDIDiOPWJTtwzFhmaJoybm9FM7qtCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693254; c=relaxed/simple;
	bh=O/0iK7xmhFFoTChSvGcFfHyPMkCTxkCl1nbuqxMvMA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LhflNXrVoGHG+p0PkI47MyWUqG1ZtkYAMzMARZPildQn2i97vOIo0ZkO3L8RCtAlDDh7ZORkboYFl6wFY25zZPq4cCp3NWAkiWMzvi7qGMX+QQCKGomiBbuJhiR5ubj5cPVRYYYctwi92NlNIGxqTa0ZVwqLJB6y+KNhvKnsBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH0s3CLj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH0s3CLj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so5703865ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693252; x=1784298052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ccewgus7tVkvh0J2tEPy956/0MoI4Eu/LcfaX8IBtms=;
        b=YH0s3CLjVu7Z6pmFfP7LzKVGNEnaWKargI4YKCTjshVeELd8E3peRxETi2ZeO5CzSK
         5ZWemnlV0BqsFnwREpLm0h501JwbnnSKJ2ZR3dy9oruvQjLfpkk4OtOLse5z4Wp54Fss
         mseOKF6iPiuEZ+0bSHsTHJ2JO7VpOAnPT2+/VNlVQzWmSElOzJ7sbRY4yDvi7R+j/hpB
         UOSWYF+P0baY/mcWoMu5kB3r4eIL2wSufP1Ur0ICxlmXEfrC7rn5+QGmz8BM6/zDy5/L
         zd46AUepVdRJQtMASCdvOYlKoT5o+ncIu3sshIj+zSTzxe3cxfiNO9tvsmMKPtUOqiSn
         vbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693252; x=1784298052;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ccewgus7tVkvh0J2tEPy956/0MoI4Eu/LcfaX8IBtms=;
        b=fidZKuANzjLbS4VvVzfUPX2JTZd0SrIEQnuqBiE3OaztVIGUn3D/uEkmhcqkyPj5xd
         +gx/nAnu/bpg0oM1Rh4tFpmoiOKBd6IVN3yTdJSlNDVqq147D6qcCTMXe90N/WOEZazK
         T79Nhtcyk2fbSl7X4GEPsjpAN8KmvrEmNsM0UDnAgdKWUz/CSRI2lVwsqlGhMoGFrT6o
         4SmT/sLBsuSKuA7oYO6lSdZ2hs1qn7lD+zI4r7KWpxLykncM8eovd6Bj0H2lxGeB4jjF
         4PXaX0GvM3DQ8JDMF6qFkiQax0Nl0lGxJYMWj5lmewYqeEXl+qFxK7J/QlpzX2CbROcI
         MD9g==
X-Forwarded-Encrypted: i=1; AHgh+RqcU23ZnXqTOc55IgPj7096AUvf3XUW+wQnYhSRtVufZBvDH1Tvx8h6OiebIfpSFx53+MV4BDi+9MSw9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+0v9D3IfH72NWRPp2zs8bE4MSSfJD/Kk+FPSF4/cRtZ+eS5n
	eYzGNXaaZiFEWZpAmksgm9M6aeVb9eFAwBd2UUpd2oXyCGbCOeijec4Z4E3P+A==
X-Gm-Gg: AfdE7ckhGhF1WKBo5/JoA+xH40CiR4nQigCsvrczPDfugBewotc1M4a/ixG++XXacBq
	oMyQo365ZDgdgdJIr9GDRN9M+ke/9A+2NvyMUjzUBOvtzxEOIaMQotKGE3ZpQSIEz0ap4zWE05l
	F/NRSQL7RbdAGEY1d7Dual6t7DbloXiTSZBRNzlZitQfyacppzya2+2F866+LhF9w3hkKNOG21O
	KqBlIC611+GBrJl7T49X0Re1OIFamI2O9OvkIQabkwFIP9tmLc0lSeR/AVhbb5K9nXFegIV9uN+
	6BgBxHxK8FWj+rTHJviTM2T8aNljHeZ3loVTJrQ+RH81xC9O81Qk394TSXjkQwgTyYXp5QLh5ID
	HMhF30uB7ghhoF5Nf+wmA1uM/91n7PhUb/wCL7Xq5uNZokVfKhLoNOD5TdHC3rmI/zuZdgtOg0B
	1HYeaQyKFnnvhfJrE4ZA5jQCn8ny90HLEUKBZQkWJoMRcbctriEvN//lWYdfVHaQ==
X-Received: by 2002:a17:902:c94e:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2ccea369f67mr127097995ad.16.1783693252261;
        Fri, 10 Jul 2026 07:20:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bbaesm60083965ad.57.2026.07.10.07.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:20:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <db210121-33b6-438b-be25-7282e76f7275@roeck-us.net>
Date: Fri, 10 Jul 2026 07:20:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: emc2305: Add missing device tree compatibles
To: Peter Robinson <pbrobinson@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260710112110.466240-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710112110.466240-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 04:21, Peter Robinson wrote:
> Add the missing device tree compatibles for all the variants
> so they can be specified. There's at least the use of emc2301
> already.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>   drivers/hwmon/emc2305.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index eef3b021671b0..38034d7a30901 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -762,6 +762,9 @@ static void emc2305_shutdown(struct i2c_client *client)
>   }
>   
>   static const struct of_device_id of_emc2305_match_table[] = {
> +	{ .compatible = "microchip,emc2301", },
> +	{ .compatible = "microchip,emc2302", },
> +	{ .compatible = "microchip,emc2303", },
>   	{ .compatible = "microchip,emc2305", },
>   	{},
>   };

The bindings are supposed to always use "microchip,emc2305" together with
a compatible for the real chip. That is how it is defined in the yaml
file. The existing bindings do that.

arch/arm64/boot/dts/freescale/imx943-evk.dts:
	compatible = "microchip,emc2301", "microchip,emc2305";
arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j-rpi-cm4.dts:
	compatible = "microchip,emc2301", "microchip,emc2305";

The driver auto-identifies the actual chip in the probe function,
There is nothing missing, and there is no need for this patch.

Guenter

