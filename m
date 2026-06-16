Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C7355F5F
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631091; cv=none; b=gm8LzwV75pSIhE0PLEbmotXZVfNI/N5KDrQan7zyTSX35kDSwih20OoKZ09Gy7F/wsHc/WTROZcOxYlm7S41zVbI6Df66wP+xUiVVcpzXdGyN90J3Ik55vui691EAddl0YzQje+yRWlMX0t7OI+yqQ2fQTvqHUQ0FDQnSj7NnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631091; c=relaxed/simple;
	bh=6GeA0jA1wDQ9V+EMLWTfbhuQiGWnODUgk6jbpH8ADy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jfCk57CJ6LrZXZ6mEl5VLkIGkqMnhS6t8dYFnkwERSbJG0QjIxVzn15KTq0W/2vWTL3zIXA3SjzGhPTpvOhDjY6V5zGFgqG0Rqp1BoaIN0P+EgaX8CDz89Fh5VEL71EkVSlcrZJRUJ7evYgo1CHP/wMuybKnlNdRXEdcBzB6UIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n93VUQnx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n93VUQnx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so118130a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631088; x=1782235888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6awS2rdOePAupcrXYemmwHTdrhsv17QJlD4kqahHwCE=;
        b=n93VUQnx+fcLKOckCg8Zl04HStf5OOwgFfaC+FauROMURqt7MRyhHC21Xh3b1CKxrZ
         eH9ivQDCUmhpFxsNRBldFzzbW69Rn0IpiFbaIq5KJQp8itNh+kgaS7JQ++Pdj3uu6gzl
         KI77PQS7bswRl6IAwwnmnqja/d5/+XixS67uZaVMwcnzEw0J9oPdMavJ/+j83jYkU/7j
         IJOrfEKmMpNPogtPdRHfQkbkxW1hniJX/hOCBL1NS2HBzOmclv0Rg2n+VxPj/xUJ2jNn
         l3RDyDB/U+iaOjj/9osFIJqAgsmt5p4j9fppiXLF/wmKbdr7ke6EVSgoFX/eKVZjZll9
         Mx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631088; x=1782235888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6awS2rdOePAupcrXYemmwHTdrhsv17QJlD4kqahHwCE=;
        b=cO5bfTEmTuzO/9YeaqRqwKhra64kO+mEvBDxVETtQybWrtJNqpmq2pHNDbXGBcfdDe
         p6fuFM4GcQtQOE2cu/b/4+kHQ2yOtMNTn8lwioiIhoygQ5vtD9RUfLdIkrk4i0DQmmMx
         yazChGlhihHsloiK7TLGfupj7ewRQ9BEqVvqRk1STvfct+XN+/fpC2APfFnBLUeydtgq
         M8cfSIhNtRr3cIDGx/TvjqG39sNEShV7AsdV8YoFuWIwld0HSpoSK2lqeDaXZKicUBKh
         I7U0gr0LtnV83xhNrc72vkoL7tyxoXEtKe7KJkTE4sw4dlx2ID9PUbqLoDN3g+2m2KYZ
         ScAw==
X-Forwarded-Encrypted: i=1; AFNElJ+I14a9KjYMs9d5hLkoFfaFWP/Q2/8McNhEG8efjCJYmfxVdZ5v5rBwAds5hfP3lBsOSzprR0lXl0XYLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpylDdtPx6FUa2Yxhe39/rSrCBemx8MgI4MqNhP61eRK6TW1tY
	RtZY8r1h9JZzuaE0kkmJmgFP8YOEOzwBG26dpqOdTrDHsm1ZALj9BZB8
X-Gm-Gg: Acq92OEyleSAgq9qN8LjBKYge7LU632QlcgOquobc1FUlAPBePwxrPBz8fuNhBQDdEu
	YTuxLgvBiky7a1Qs4lEkwSWRVj9P7mX+z7tyJ2y0LZvtpFJ1S+y6w93eVCyNV0NzDITPBeRtp1v
	UqMoP+mr0KWJ3/6SaddcsAdowv2r8P1jg09cGLubX3fhrrMz6BIEiIqIJqdDbWfE7qHYBOglEkN
	A3F3TKwNbJo/wjrWDdXZX/WpRtQdpUb+M8GkspohWxW2hjrVvTytMnJvF+FYBeZ4KZ1LS2/TDxd
	sDV1TQh3R3LrXv3Ej4BDn4kw/XyDpO0VCQPjf/k6OEna1tUoqmg4oVVeydq/+hv10Xru+CZBJjb
	IR1fWS+fdjP+RM8ccae9kF09NOnA+uEJNQNPqe2tU74kD3Gqq7Rb6vntG0nu0mnJ6CYtkcLktL0
	d4pVStnsOrohMHuGaxY8LKnIrJcfqf6aOEOqWWGmLmsbjSzwIBCwm+Js7m07Khd9Jw68gDj4Jb
X-Received: by 2002:a17:90b:2dcd:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-37c523fa12emr4076600a91.10.1781631088440;
        Tue, 16 Jun 2026 10:31:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c953c5313sm77012a91.0.2026.06.16.10.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 10:31:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <29fad48e-c152-4f72-8478-6efb4eb9f4f1@roeck-us.net>
Date: Tue, 16 Jun 2026 10:31:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ibmaem) clean up sensors if version sysfs file
 fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260615064636.39215-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260615064636.39215-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/26 23:46, Pengpeng Hou wrote:
> aem_register_sensors() creates the dynamic sensor files and the name
> sysfs file before creating the version file.
> 
> Errors from the dynamic sensor files and from the name file already jump
> to aem_remove_sensors(), but an error from creating the version file is
> returned directly.  That leaves the earlier sysfs files published even
> though the AEM instance probe fails and the backing state is torn down.
> 
> Route the version-file failure through the same cleanup path as the
> earlier sysfs creation failures.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/hwmon/ibmaem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
> index 0a9c3a29e6f2..305c41dd15bb 100644
> --- a/drivers/hwmon/ibmaem.c
> +++ b/drivers/hwmon/ibmaem.c
> @@ -945,6 +945,9 @@ static int aem_register_sensors(struct aem_data *data,
>   	if (err)
>   		goto error;
>   	err = device_create_file(dev, &sensor_dev_attr_version.dev_attr);
> +	if (err)
> +		goto error;
> +
>   	return err;
>   
>   error:


The main problem with this patch is that the hardware supported by the
driver ("x3350, x3550, x3650, x3655, x3755, x3850 M2, x3950 M2, and
certain HC10/HS2x/LS2x/QS2x blades") is no longer supported by Linux
distributions. On top of that, the driver uses a long since obsolete
API to register with the hwmon subsystem, triggering a kernel warning
whenever the driver is loaded.

That is a general problem with this and similar patches: They fix a
minor and unlikely to be seen problem while missing all the real issues
(as can be seen from Sashiko's feedback).

So, no, I am not going to apply this patch without evidence that the
driver is actually used.

Guenter

