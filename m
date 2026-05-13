Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BB288C2C
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679807; cv=none; b=eqN4puNYMLzQF7FqHmilrAxITEDHlygVzKhcyFkLCA6/0R/o7QyHm+CHfDHci7rp7jL3eoAp60TcRW9olROV/kLTFje3S6k5EtHKBQQxnwSZs8TUhig+9PalmHBSPqDoPbRzlsA/XZP0jleYdAinybYIRMoqzyy/JhlwNYwapU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679807; c=relaxed/simple;
	bh=LgaBpRbH0jTvyUE3zxMISlAWWSXauQqy/d2F2WCfT10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IELoE3/qQJWMIUEt2asesXit3KhwXPLikt8eWMilv+qxcf1zBM2P56lGmHWKm1A8izeJ6mAtBvK2lUGb91NArQmEnvnIy9GiVPPamFp2or/wkqpY9cg5sYb2E0OJ6tJIE6WNqvTr7TC2fG56Bo1viXk2N7fwMm7h98YrLFg9akk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFgZlaBV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFgZlaBV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-837b39eb078so4609419b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778679805; x=1779284605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=StTBdXZeps9ND5CVXmnzCum6vD1IwdcWlV8P15if0vM=;
        b=KFgZlaBV8j4asKVEZR06ESAhAOekZnc1noRugz+kr4s/P9ik9v6GMELKzIcUPyO1/y
         XH7EInnQAtUvAzx4+iSagPSR/3gExLknn0eu4614nQOwcLBMYzjKTh72/LQkpZJ2cqFl
         4JXDXEgyw6bjREGaTPEjy+3SmbqQRgYxVEQVsPIjl66pNq95jMbOcX16Ht8l8t5pOQku
         Z23dCBsomz2uqgTzXSTmvplmB0kI8BEUShc48NmXhvskb5K17bIwMfphVhTFF0gHUKJI
         gavIlIlDyYBm/fjkeKt//lhAkDGj33L0hSiY+y9VCfwZ0Oy9e6htlWmCcKXbfun7BS3m
         /Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679805; x=1779284605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StTBdXZeps9ND5CVXmnzCum6vD1IwdcWlV8P15if0vM=;
        b=KYIuDXgsDhkpNRqzCdphIMYrRQmIWeUMziWNLP+nunmApF1STHdFuhSaomIe5T/uac
         tec8NLNLVBxYsT+cA2xLXV9RgCEZtE6Q+pwWKHY9cjQ5zItUFFAjiSB2BAJaVP/l178B
         BVeoSv87y7z3uI//K9Na4kyH6BAKP1NYyCe6YED3jlZ6ssN4Csa9sNbJOMoP5ilfej2L
         Vb5qaUu+HnNGn4X9UKccCckKFfq62gWHVi8u8PBjIl2I26diVKdd5CC/xkdubn+m9Qzc
         MGcqxcX+/OCfa+gf03ZZpTEhn8yEHggZMJJbFNNa0HIRPmAyAhGkqUx6a/JK/O465r7j
         utug==
X-Gm-Message-State: AOJu0YzqmJMxfhoW3dh1xYXlVriYULvBlN9N21KDWU9D4F9NWWD6KkXp
	oLCT8AoAIqVqtTb7RMFlXZh90EVwFz8PWIyiGm/JGqJdFGf5ThdF8ni9U4RMaw==
X-Gm-Gg: Acq92OFnsiurUG3Ijk3P5tlQuXVcM77SXE+7AXUB+sR9UbfxI/l/MZYeNXtei/E148H
	pC7TmWjv3TbH4A5qub0MxtCpaYhYDf98H6H2RYZi+RzzgjZ6KBZL+Y5Sumg1vn88L0vfFLE3RWI
	oO1m1zJjxEQCTA4X5IZJJWm/ajirYzAIb0Sb/2dz3XUoShZFCqtYp4kVa604j8a1HUk8cCz5MvC
	xxGNCBRrGHSNQnChAiz1mwHWt3u4fbwSTiPjJiF9Rby1eZ8F9yJ/OhXk2FgWu406lhhGBtiR4hM
	8CxdcZleLWwqWyGbmqXfHzzD1kajeoQyQXwngmVUeQLqKMqaggVfWAm3a3djDIc4z7wM9/jcdqK
	YLUFl6Mdbrcar0VedkIIs87PBpp4N9BciNi8uB8OE96IZi7/FGlIsRq9pMzkdpTgNIqpGHwHMyh
	8wMP8XLF9jpvdyjR0myLNSxsxHnh/4fDJJHpimjzxV1DjQJXM/VgrgXLS2IjDilNphbusQ0aU6
X-Received: by 2002:a05:6a00:4f88:b0:82f:4f63:31e1 with SMTP id d2e1a72fcca58-83f03e753femr3614936b3a.8.1778679805344;
        Wed, 13 May 2026 06:43:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm33057862b3a.20.2026.05.13.06.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:43:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
Date: Wed, 13 May 2026 06:43:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <agR9YW7hGTJ_l7ms@monster.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 06:32, Wilken Gottwalt wrote:
> Fix removed locking mechanism. The locking mechanism does protect
> chained commands (set rail + get value), which are two separate calls
> to the low level access function. The hwmon (temps for example) and
> debugfs (uptimes for example) subsystem can trigger that chain of
> commands in parallel. The serialization in the hw monioring core alone
> is not enough.
> 
> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

You'll need to explain why using the subsystem lock for debugfs
accesses does not work.

Guenter

> ---
>   drivers/hwmon/corsair-psu.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 76f3e1da68d0..6db899b37ede 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -12,6 +12,7 @@
>   #include <linux/jiffies.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> @@ -122,6 +123,7 @@ struct corsairpsu_data {
>   	struct device *hwmon_dev;
>   	struct dentry *debugfs;
>   	struct completion wait_completion;
> +	struct mutex lock; /* serializes chained commands and parallel debugfs/hwmon access */
>   	u8 *cmd_buffer;
>   	char vendor[REPLY_SIZE];
>   	char product[REPLY_SIZE];
> @@ -194,12 +196,14 @@ static int corsairpsu_init(struct corsairpsu_data *priv)
>   	/*
>   	 * PSU_CMD_INIT uses swapped length/command and expects 2 parameter bytes, this command
>   	 * actually generates a reply, but we don't need it
> +	 * only runs during probe/resume and does not switch rails, no locking required
>   	 */
>   	return corsairpsu_usb_cmd(priv, PSU_CMD_INIT, 3, 0, NULL);
>   }
>   
>   static int corsairpsu_fwinfo(struct corsairpsu_data *priv)
>   {
> +	/* only runs in probe and does not switch rails, no locking required */
>   	int ret;
>   
>   	ret = corsairpsu_usb_cmd(priv, 3, PSU_CMD_VEND_STR, 0, priv->vendor);
> @@ -217,6 +221,7 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
>   {
>   	int ret;
>   
> +	mutex_lock(&priv->lock);
>   	switch (cmd) {
>   	case PSU_CMD_RAIL_VOLTS_HCRIT:
>   	case PSU_CMD_RAIL_VOLTS_LCRIT:
> @@ -226,13 +231,17 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
>   	case PSU_CMD_RAIL_WATTS:
>   		ret = corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
>   		if (ret < 0)
> -			return ret;
> +			goto cmd_fail;
>   		break;
>   	default:
>   		break;
>   	}
>   
> -	return corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> +	ret = corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> +
> +cmd_fail:
> +	mutex_unlock(&priv->lock);
> +	return ret;
>   }
>   
>   static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, long *val)
> @@ -789,6 +798,7 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
>   
>   	priv->hdev = hdev;
>   	hid_set_drvdata(hdev, priv);
> +	mutex_init(&priv->lock);
>   	init_completion(&priv->wait_completion);
>   
>   	hid_device_io_start(hdev);

