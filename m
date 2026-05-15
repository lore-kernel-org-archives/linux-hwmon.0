Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601B31F999
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854269; cv=none; b=eTe5NYRdHdYsRXk40fLVWdLpzgP+s0GzCS9Qw+Un1PWEc8l+qCRLJ+8/Shg4oBezLArQYdPrMBzpkP1vg/2RA/2baYz5wyvOeqEtpUpWzNo9M6CxOUrEJQlSese07Lyb96owv9spxD48O8/uo7fdeBkiy8KywcEpdA8ZeWbX/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854269; c=relaxed/simple;
	bh=oYYzVpTKzGuJc8QWczA/enECx9ZhL4LtYa3m9P3daMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVQyLltNmtjbk5KoqAGhVi2zcFalYWeLm70SmbDYIqNhJn7zgsDfLOeB99K1S3YwMFyDdLON7a/MiBLhebvEqRATsSdU2YUpJ/WLx54ggCuprF3dyOdjT6OgT2k84P4onoLYc2GuUUv8fAtZZljDeshON6S/gkJICWqzV5dmeN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPLrtGwt; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPLrtGwt"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so4434674a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854267; x=1779459067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=81XPbDwfScOnAZMMx/pWg3B2AY2BVs/a2ta6xIUDaJg=;
        b=gPLrtGwtpaz8gAd18MisukF2Q5SBuG+J1YIGJndSU0wHaEpI+DbP7u8gD3KQOy0vCi
         z7K97Z0ew+xl5fux288Kdb5kDpmby48OVQFS0/dgqwbvho+dST0PmBlMTSuKx3Wt9z47
         iJWyPHuHeo645ew9FaA3okOmvCqrlRRIH/UHRkBs3NS7rxKuSdbZaPUaXiXycemLPkme
         3yeY4rO4oIfh7Uhk9NOstr6btYlzFJXkzTDPql6t1jGIZNoQgTMBWXOoDnJWLBg9p3Ug
         fy7IJI3cN+ss7OqR0rzLeydSJX/HZIR3pCZZ3e2j5V4P3n5aUvhT/qaS9jLKPhywWrp5
         JU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854267; x=1779459067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81XPbDwfScOnAZMMx/pWg3B2AY2BVs/a2ta6xIUDaJg=;
        b=NOWvjAQ/MHGwpopzpYzV3vkBAMYso5TTDzHucfkjoZAutnDY+/9Yw6h7/fQU3VhUXD
         z/ls6gEeYn/+ouXMFGAv+yJMl3lm5a2h3OnU82/u5ohvnD0yQLDMHUcl+YyzL/noaDXq
         AKB2JhTd0RB9GMUd6l5l9qn2hIK2AqnpNmddNAdkedL/KWe8I3wdfkz75Cyb0+Rf5PDF
         S85e3EaPWUzeSVj/A04s9MAlCnZm4ejJCqFWX14jHYnM57WiPLh8bgqXeSKwu4xxfQa9
         eF4bEwZIkk0BH+hv5lPKf1vZMVGQpM4uF19moVH6Rb0eIdCaPoQx/tKKnBvC4vi5xrni
         rvnw==
X-Forwarded-Encrypted: i=1; AFNElJ/gj0mC8C6RmWdG07l3m5nfv96tq5ICsW28Qnqcjdg1qX+HSPg4Vz03+kFJ7W3SwETpbL/jU8mAkoRWxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XJeHnFXkTq39B5IZDYpPh9NN28NhpeYv0AP+x4kjFxZMkPtO
	+MUs4ZUu8mtvSkRGs/0rcj/GycYbazGR6/BWPptW445ZDS7/BoRODkjB
X-Gm-Gg: Acq92OH8ilPd2GrVAvOKDL07crbG3ieX0j6Z3XZVISDX5RAj6Jr8FB1GjpjF2C5gp31
	BsgopHXejasIKzSYQiWqJLhaRzfzxen655IVsgz164QQ4ekYWvEa17NQD84AUxOYVOdnwRGl77v
	+XQ80c722lIX2wJthQw5g6oBz9nqrMrmLDQr2eA62G/+Ljxhr11pTBiyXsB96Kt/75tp2eaOLVU
	uFisymv6EX4Y/RbSqBbej2rSyBd9chsKl3i7Zk26V+aXZqsoWqpA5mMWK9rP0BfgF92BwIsYPpr
	3WymvRE6ixaPajirIOQnCv9iZJFcGzC2HT/4rQwSaNUq1j9YaOdbajqreOvPNXFlxlnwMAWmFUV
	HzOVN2qlWH0xdT43OGHTM0WGqGoS9sLTPJ7SBpqeKm90xhVt78dWl6QGtiIKp4It938o4uhYp6G
	ihHBYeZ1Z7x1/9tQwNi9s2Ilz+Xy9KD6dKNrbnPx2VdrmBr7loSCqWGp64Cxox1bQbCMS6I0AK7
	LGXZPZ9YnM=
X-Received: by 2002:a17:903:f8d:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bd7e8a0b31mr49913305ad.11.1778854266855;
        Fri, 15 May 2026 07:11:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm63119575ad.47.2026.05.15.07.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:11:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54160fbb-01d9-400b-80f7-bf340997a8d0@roeck-us.net>
Date: Fri, 15 May 2026 07:11:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, naveenkrishna.chatradhi@amd.com,
 Prathima.Lk@amd.com, Anand.Umarji@amd.com, Kevin.Tung@quantatw.com
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
 <20260515134506.397649-6-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515134506.397649-6-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 06:45, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Implement IOCTL interface for SB-TSI driver to enable userspace access
> to TSI register read/write operations through the AMD Advanced Platform
> Management Link (APML) protocol.
> Add an ioctl command (SBTSI_IOCTL_REG_XFER_CMD) that accepts a register
> address, data byte, and direction flag. Serialize access with a mutex
> shared between the hwmon and ioctl paths to prevent concurrent bus
> transactions from corrupting register state.
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>
> ---
> Changes since v1:
> - Use of devm_mutex_init in place of mutex_init
> - Use of guard_mutex in place of mutex_lock()/mutex_unlock()
> - Use of devm_add_action_or_reset() for clean removal
>   
>   drivers/hwmon/sbtsi_temp.c      |  6 +++
>   drivers/misc/amd-sbi/tsi-core.c | 84 ++++++++++++++++++++++++++++++++-
>   drivers/misc/amd-sbi/tsi-core.h | 15 ++++++
>   drivers/misc/amd-sbi/tsi.c      | 20 ++++++--
>   include/linux/misc/tsi.h        |  8 ++++
>   include/uapi/misc/amd-apml.h    | 23 +++++++++
>   6 files changed, 151 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/misc/amd-sbi/tsi-core.h
> 
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> index d7ae986d824c..00e982f4c716 100644
> --- a/drivers/hwmon/sbtsi_temp.c
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -64,12 +64,15 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
>   /*
>    * Read integer and decimal parts of an SB-TSI temperature register pair
>    * The read order is determined by the ReadOrder bit to ensure atomic latching.
> + * The mutex protects against concurrent access to the shared I2C/I3C bus by
> + * the hwmon sysfs and a userspace ioctl
>    */
>   static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
>   			   u8 *val1, u8 *val2)
>   {
>   	int ret;
>   
> +	guard(mutex)(&data->lock);

I would suggest to hide this behind access functions such as sbtsi_lock(),
sbtsi_unlock(), and the matching guard functions. That can be done in a
separate patch; it should not be necessary to include hwmon in the patch
introducing the ioctl.

Thanks,
Guenter

