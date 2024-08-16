Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D11E520
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Aug 2024 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818062; cv=none; b=EjNqWJu/t3gI/uJw8eMPs7Z7y76mcT/AwETXMatJ/mefwz46uKpiA/KHr6blbVFy3B+yvZfdJNIFynu6vLeoP8QlIEZFIxhrT1iipvSNaZMAqucos1E/WWSstnMxiJpehlYZ7c3odLvuJkSaOtYhvZTybZeajYlMbr8qxlVw65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818062; c=relaxed/simple;
	bh=dt822B1s7HAdv+Qw8hzss4hoGQONe1credrqN/QGxew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYGd3mKeJNu+oljKgiaux6ZxjUP2328feYyaxo9df3RCyr1QI6+po5mUPhOStZ93+T5GryAI0TE+wQx8ETrw0vaqRyXJmy0gI4RFWzyHiT1MURFWD0Ds1gbgXwrUOPCLl/4wmHt0//jDmSiV4PuBQtlmflTjt1mKazQMcnVirfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw74tiq7; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw74tiq7"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3dd16257b87so997599b6e.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Aug 2024 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723818060; x=1724422860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp2bh9g1s9N0Lq/N2dQ26R6rnjVSzWbRkLo9ix9GZ4o=;
        b=Bw74tiq7toAwEbvxsF+cpaTtZdATndmXkxNtvWXGLF7LbgoIk596l5kXu+U6FIugrY
         8Uet4dBNQS8RXGGJXGSVFBQSf8DmnzN09+cXZFpAQRz3o/f9zZlifkcdkc+hwiLOn2T5
         tswHbE6YUL8x4GCUgf6zk9oaSqrJChIVQBL2BuO7iIk9zx4Sj/3iqS9zIdEGRymBntda
         8leGZtGm45t1UxHswC0NbHFAcVJPaRNQYgt/i/oWH/geb+Y8gEMvlHuCmIHjcf6RskP2
         ztbeyIsTI7dLfJlG4K7PTKsb/7q7T5ekWZc0Sfyf2y4ox9EKUNwv8rKl+g5iyGaPgrr1
         9yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723818060; x=1724422860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp2bh9g1s9N0Lq/N2dQ26R6rnjVSzWbRkLo9ix9GZ4o=;
        b=qS7nFzDm2j6N8MzIXx9Mv/elttvaM8+Zx0pWd8gXjqvIq6qzGgbTVd0bY29Z9/B1ZC
         v6YzF9gre7RPhslQE3Iw1oxC+e4FQPxV7T5CHB9fMcmm6TD8/MEH+grPmiKwT9LBYVqx
         5rQ5rcqC51ccdSTvaKvVChhnGk6e8g3vpzs0eWoQVPHN7vs1p0pLK7MqFzYOSTcpXgVw
         5I0iz35Zb0U/KzqkGmkWixhEabLTydz5Jtlo5JnNkIDKisKNUtIJw0vlffxMB7fiXBjC
         I/abS/BsyuLOEh1kPVV1XaFH/fsgv3Qbrn5B6/mn4ebd3DXDjI0PNkHTJ+UNQRw5o4wK
         YTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZMT5GRsid8yqTtzk7/LCfqmGR4IyZi2aVHAZ5nELH0Ojc4ep6lpXcFr0GKLNAso8uUUIFkpI0i9WKBLQ4lG6J2FiGtCiYNNLGYIk=
X-Gm-Message-State: AOJu0Yy+qmGcEAANf3UmH2p0kzdSCiEnemZJPBU+awyhxW+G8sE+cABp
	jQ4xAt7jx7MOWrWSuHDEpNMridXpLz7lN8mslUFssrNn9HxFPcB2
X-Google-Smtp-Source: AGHT+IHJaZBoDPJljgxeOX+5HW1k4+wiR4L2jL1qZwF9RmzOOOvxnG5Gvm79URUpyFtU8nbwsefV0g==
X-Received: by 2002:a05:6808:2207:b0:3db:251b:c16 with SMTP id 5614622812f47-3dd3ae17428mr3507142b6e.42.1723818060172;
        Fri, 16 Aug 2024 07:21:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e10b8sm3002847a12.47.2024.08.16.07.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:20:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <767fdc63-af2f-4234-a887-d34348e0cd15@roeck-us.net>
Date: Fri, 16 Aug 2024 07:20:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: pwmfan: do not force disable pwm controller
To: mailinglist1@johanneskirchmair.de, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, Johannes Kirchmair <johannes.kirchmair@skidata.com>
References: <20240816063656.275918-1-mailinglist1@johanneskirchmair.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240816063656.275918-1-mailinglist1@johanneskirchmair.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/24 23:36, mailinglist1@johanneskirchmair.de wrote:
> From: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> 
> The pwm1_enable attribute of the pwmfan driver influences the mode of
> operation, especially in case of a requested pwm1 duty cycle of zero.
> Especially setting pwm1_enable to two, should keep the pwm controller
> enabled even if the duty cycle is set to zero [1].
> 
> This is not the case at the moment, as the pwm controller is disabled
> always if pwm1 is set to zero.
> 
> This commit tries to fix this behavior.
> 
> [1] https://docs.kernel.org/hwmon/pwm-fan.html
> 
> Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> ---
>   drivers/hwmon/pwm-fan.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index a1712649b07e..10c4e9bcf10c 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -167,7 +167,7 @@ static int pwm_fan_power_on(struct pwm_fan_ctx *ctx)
>   	return ret;
>   }
>   
> -static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
> +static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, int force_disable)

Please use bool.

Guenter

