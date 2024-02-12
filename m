Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E33B29A
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707750786; cv=none; b=jVX22evAwoRmQUTcSsdyAWA5JfZZF/BxfnEoCkZXb3li2ZTL01aiJqCRGXAY+IctnOzxMnjmIlMWQG+HdvcIPpVhqrw3uzzOVaPQEQ09UaTNUtBgVvKVdGzAqNeFplTa/tPZ9+1KG6hkvw4/G1MORRqezYoTCQke4DdRIK7vIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707750786; c=relaxed/simple;
	bh=BoN4HOxkxRv7qKur1MWUgCSQF5Zf8BCXnv8Mv8Ed5v4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xqm0MeKKqwwKmvPEHdceCTgvqHDve9M+EtXYxCN7amBaY1znNlTSGGpBdzKOVgh0EGmKeid4/4/S5Sffk6OHeBZ1wXr+yU8yQ4Rj/fGg7WWa/76oeuyWpC/Bn5Q1fMvETuypfxfHTJXyaCvQWQX3e7cDDOPd6QiqOm1TRTOYigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9/lJ9Ut; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9/lJ9Ut"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d746856d85so24312945ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707750784; x=1708355584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KMUlD1AuTnV542iP4iMcP5snW6n/UJBaheo+UG7sdao=;
        b=F9/lJ9UtkK3YrntH/kiwwwZO/YHfcRhPOOUxViIO0imrz5dOcs6Lb9gjcah5Jnrvvm
         R8AdT5glK1efxHHvm3k1HEpfl1GyL0QQLHcXg+/78tGrN76n9AhVICH5LQSxGF8iAOp8
         PKQq5wbzNFBh0LrLin00ea3van9TwycCCMNvJ1gj28iZzmEo5PMaH6IN1Nz+IrT/zTbh
         G2kwV4LD/w7o/aQvSKFf8Av0IWTvqlKOAINXqtt6PjLZEMvtuT6bAI/MCxHPy9480IiC
         K/aeVLceujFn/9Y2EW+I7xap6GnrGQz8olexODO3NPyFCp9ya41hnNzRMKg28NEJF9LI
         htOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750784; x=1708355584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMUlD1AuTnV542iP4iMcP5snW6n/UJBaheo+UG7sdao=;
        b=b7BQGGfjKVNjsZaMySkFAKg/CzU15hIHnJVbT6si8D2SGemEpyKwphbRHMjZCLtjdv
         B40j2oTtkOTrbNFPLVbcIy0gwK+4mq/lg3P2hQ/l0KnYSKiqXizAxIvVSqvtZjlGWeQ9
         /NDIHjD6a4D2b/NP/5YeIm/9WnuPNMeSdXJhvHv+V2xTXPaD4u/O/YG/CCtk/ssE4Efu
         MwCC16o3amQRPLvvX6/S/zJrRE2SnV+bXhpPJspsol4stYHQhuwOHsO0agIfyANJB9bn
         jMGXlJPB2/MHpX3wfQDc5L9CH7vv7CeZ4EcsBSZLJNn8ki6c6lxQTFsSMFQb2+3kn/yv
         MWsg==
X-Gm-Message-State: AOJu0Yy8moMmH/lxE11m6Uujbo0GLhgVfb5q3e3iZOW1bIuZsmuEUT6w
	sB4qUAJAsV1jVyViUKX7yNgJT1IGDuZ4/iUsXJj5Fq8JmIML8oOU4Mng0qQW
X-Google-Smtp-Source: AGHT+IHwgRZwzsZGVcspr3C5lCJh/9+eKFH+vlwk9zcKWDCZhUgRH9qbKbBEMKx1QhZLIAbPYCss2A==
X-Received: by 2002:a17:902:f7d1:b0:1d4:caea:5fad with SMTP id h17-20020a170902f7d100b001d4caea5fadmr6041627plw.33.1707750784004;
        Mon, 12 Feb 2024 07:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/4iwFgMrKJbwrvq1sF0A6pL4JsK368x4RlY70H5rNvDCh6yBx+hkQDius2gdtJPii9wVkDYKvnvK1FugudLqUw8srv58OfHd1rsnsr/GZEWIfgHtWsl1+c9JBJAFtfdOhcuWJ
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v2-20020a170902d08200b001d94a245f3fsm486018plv.16.2024.02.12.07.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:13:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b553e1f1-0e2f-4b1d-b501-7554bf86d0c7@roeck-us.net>
Date: Mon, 12 Feb 2024 07:13:01 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Remove buffer_lock
Content-Language: en-US
To: Aleksandr Mezin <mezin.alexander@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jonas Malaco <jonas@protocubo.io>, Aleksa Savic <savicaleksa83@gmail.com>
References: <20240212141311.110808-1-mezin.alexander@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240212141311.110808-1-mezin.alexander@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/24 06:12, Aleksandr Mezin wrote:
> Instead of pre-allocating a buffer and synchronizing the access to it,
> simply allocate memory when needed.
> 
> Fewer synchronization primitives, fewer lines of code.
> 

Trading that for runtime overhead and an additional failure point ?
I don't think that is super-valuable, and it doesn't really save
anything in the execution path except making it more expensive.

You could save as many lines of code by allocating the buffer
as part of struct kraken3_data, i.e., with
	u8 buffer[MAX_REPORT_LENGTH];
instead of
	u8 *buffer;

I really dislike temporary memory allocations like that, due to the
added runtime overhead, added failure risk, and the potential for
memory fragmentation, so unless you provide a much better reason
for this change I am not going to accept it.

Guenter

> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> ---
>   drivers/hwmon/nzxt-kraken3.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
> index 5806a3f32bcb..1b2aacf9f44c 100644
> --- a/drivers/hwmon/nzxt-kraken3.c
> +++ b/drivers/hwmon/nzxt-kraken3.c
> @@ -97,7 +97,6 @@ struct kraken3_data {
>   	struct hid_device *hdev;
>   	struct device *hwmon_dev;
>   	struct dentry *debugfs;
> -	struct mutex buffer_lock;	/* For locking access to buffer */
>   	struct mutex z53_status_request_lock;
>   	struct completion fw_version_processed;
>   	/*
> @@ -109,7 +108,6 @@ struct kraken3_data {
>   	/* For locking the above completion */
>   	spinlock_t status_completion_lock;
>   
> -	u8 *buffer;
>   	struct kraken3_channel_info channel_info[2];	/* Pump and fan */
>   	bool is_device_faulty;
>   
> @@ -186,13 +184,15 @@ static umode_t kraken3_is_visible(const void *data, enum hwmon_sensor_types type
>   static int kraken3_write_expanded(struct kraken3_data *priv, const u8 *cmd, int cmd_length)
>   {
>   	int ret;
> +	u8 *buffer = kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
>   
> -	mutex_lock(&priv->buffer_lock);
> +	if (buffer == NULL)
> +		return -ENOMEM;
>   
> -	memcpy_and_pad(priv->buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
> -	ret = hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT_LENGTH);
> +	memcpy_and_pad(buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
> +	ret = hid_hw_output_report(priv->hdev, buffer, MAX_REPORT_LENGTH);
>   
> -	mutex_unlock(&priv->buffer_lock);
> +	kfree(buffer);
>   	return ret;
>   }
>   
> @@ -913,13 +913,6 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
>   		break;
>   	}
>   
> -	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> -	if (!priv->buffer) {
> -		ret = -ENOMEM;
> -		goto fail_and_close;
> -	}
> -
> -	mutex_init(&priv->buffer_lock);
>   	mutex_init(&priv->z53_status_request_lock);
>   	init_completion(&priv->fw_version_processed);
>   	init_completion(&priv->status_report_processed);

