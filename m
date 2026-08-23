Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE803128DF
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787459213; cv=none; b=Hh/mf3irhCbzjtgqMzVeXsoY4Njgv2Jz4SShoIJbAQjskfUUipgpCt3qiJGtdqX4HzOPBP7ZxwPvK0xbsWG9+HfjCLFRxZCDSKHwbg5orCgiHIYV5A189V7kALT59tyYt/uOUSiv8w0bE1yPpCVFmnTBtqUpSgE6qYmaVVmh//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787459213; c=relaxed/simple;
	bh=h1E6CEqKHoDsBx3lNc+efN5br6wQWifNLjXXBpPwweI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8P3aybS+V5ZKFMAsB4I/XuMWyDHffeyXefoFsQWdkITtKoInFlbslD/m+mq7Zev8as93uBK/ezqhgBI0+0YkKaXw50qZYpTYYZtpzxWBoJNv++zGs5N8+CqmzDF4Ynclstuh5Fy6H+C6CSlbVrnztYMfs8qF5poblvjoDZrcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCzHVv4a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCzHVv4a"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d53197d8b5so23673835ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 21:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787459211; x=1788064011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGQY/BKdvVO3mikQxDJmzgu9H2nS1ohzOfMoYUukN40=;
        b=bCzHVv4aMnFNCEjrzv28/CflM/UAkCMcJRylNaAO+OwjuRh1vcmcbZLvQZnWXAZGUU
         OOD7xTmAgpjMD7kcAe+MYSpt39L8n3mbHWZtE6XQv4sXcLuyFxr9AJcOupt3w2DM0zBq
         3XZDbxSdC9XPH9rUm/yxdyxonSn1vnV81UR683XU4IyNIjjdIqKxkpfFc27Kh0uJUcMx
         EDyP4mVPGgRPMPKaJxUJ2mpPQATdaDtqXaQIREmbXJjfHB4q+h/vG64xzgqIUh7jJAFd
         LlLIVgcQdCNq3a3oHzngXMkuKAEW6VKg3JBDaW5aKFXJPoDMwv0kgq0+c6agqjd/nID+
         4OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787459211; x=1788064011;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SGQY/BKdvVO3mikQxDJmzgu9H2nS1ohzOfMoYUukN40=;
        b=ZFVd0hrJnt1gQmlJSKJgurrlLgUDyiv3eahmTogR5XCT4tpR2TWdzZIALV5VjW5yBQ
         9tUEDH27NgcQm2YJGfAMIvLNEaSf0chDh6LrsEu0wE+8EypSomrDK1wqMyY1Y2mnGdH+
         mP+maefsmfJ6LXYj7w39bvhRcsH/3vwXiFSc1lKvsck092cK8Sa9ATzDKs78UaLNd8MJ
         NXHyHz9VSLfuRZkReSmP1NQEIjLewyVLkJ4X1Rq3idIfY8hk24ZUs8kAhfDQ4KTVGXJa
         tCurRU7vywso/SjfAgVekRNuPI7dqwVmxLQ3dxA9EB+jJhGsmUmo/C4C5PkSBfVqYF1I
         099A==
X-Gm-Message-State: AFuF++kk19eYS5lCKr8pj/Cn7UUs6y1d8Jt6U6/9G/Slqgjwi+l13bpV
	t9In8JBAZ0mxYNL3NiuGaKJSEnR1FNCAmh/AF/slhd3oT2HNSKU/nbs/
X-Gm-Gg: AR+sD11DWebQ4151ltnW+9NFXEDDsTBLUcGLYcCa3lcP74iBIY8LaqCPBTS4aHSaaAP
	vylNDN4z78bEw28X+torFACljERyO4UVnZsh366a+KkdaNJfkCnT3KLe2ZFWVmNijuU+q93CQA4
	PNKMHNrFy6CNiZS0L6LpOhy002LMsG6/3JVMtnsp0U7GCuBUoD0D1c3PG+bHj3OeG3AMYu7fAdb
	gvJj4LAWkIJJZnVPccAF1Dw8mIJcHdVArDyeTX6z1wHQK8fpXdbfWNZkmnSrNuWp9L4cwwJV3bC
	382gpKAodm3V+lcF1aQ+w0ZjuI9C4ovzt29BS3SUnA9i+m6DpTZ66Ks9zB3mkLPWkpMYw3Ebt1W
	vhlcbK+VcNB4FgSn6pH/ukX60RP71InxD+JdgJgg/WLzcgd61v6wwWaTWcjAicBU6oAEJQNarFI
	shBsIqAfAowoliVRV2IsrvliXhYqaWkQqGoI4mj95coUzbk+xmj+qmNgq734FsrVcnWKavOgZs5
	+u3eq3waULpk1y/Ot5kJufjCI5CDNdqaaSfMQ==
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr336483915ad.5.1787459211153;
        Sat, 22 Aug 2026 21:26:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67678c417sm7524385ad.20.2026.08.22.21.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 21:26:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <21b29db0-06c0-4881-9750-d38b3bc931c3@roeck-us.net>
Date: Sat, 22 Aug 2026 21:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (yogafan) fix non-kernel-doc comment
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
 <20260823013841.2884472-1-hanzhijian1991@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260823013841.2884472-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/26 18:38, hanzhijian wrote:
> The file description comment starts with "/**", which is reserved for
> kernel-doc comments.  scripts/kernel-doc then warns when building the
> documentation:
> 
>    Warning: drivers/hwmon/yogafan.c:2 This comment starts with '/**',
>    but isn't a kernel-doc comment. Refer to
>    Documentation/doc-guide/kernel-doc.rst
> 
> Change it to a plain "/*" comment since it does not document any
> function or struct.
> 
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

No change log, no change other than the commit message, that change
does not add any value, and I already applied this patch and sent
out a note that I did.

Are you playing with me ? I am inclined to drop this patch.

Guenter

> ---
>   drivers/hwmon/yogafan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 48fa5148d..278cb089b 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -1,5 +1,5 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>    * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
>    *
>    * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad

