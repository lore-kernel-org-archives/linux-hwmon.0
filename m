Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46E3630BF
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189483; cv=none; b=LFjd3M8y97oMZNj1G53Kynl01nwZ2KJX2z2tr/O6cpHmv9fN3RlZT4e8WMSYeTjF6fvYt0sOQkCVv/35tZ/rACn14kelvQkthQ/vwovSC/KVW91b9H2Cg8YkA0lCqJXStiX4H9jo8WMe4oG9tJg+pnX3LzfGUGW3NirWCP+umGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189483; c=relaxed/simple;
	bh=VIlUeXSRZeypu85+shu2R+cv4doMcmzCkSnA4JU5Acg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAIsoivrUkpgBhgdP+nR+tcT7xouIEn53HEhBhKbywjanB1JqpgdK+dmPJDMDbHmpjBrieGi5YDEtAAb6FYtLxh+MkD+HlwxLHgo2yVwdMUDqbFZ7Dbf8XTtPeu/guO5Y7A2o5p3LOoXTZRh9J07o0HA+ADjl+YQZhe1vxInWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Og93x7Ac; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Og93x7Ac"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c1092cc08cso178112eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189469; x=1774794269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48LFT5xoLd6RtM1k0dj2BLq7NNeYZZaAFGyC2+2DipQ=;
        b=Og93x7AcCCZ0861JLjSZN2iQroNB23vh9a0Ie3jqr9sG+WTVjZ97kvtOUDDDsIBp2o
         6W3QlWumdieLAa6zh807i4imkWmj5NS9t1mAamfdW7xKGNJG/GqzSrRVZh+LXZ50McrF
         wZ18dJPx6V02MrhqIzoBIp9MtAt5Sg8FZLnZxAP+rwYROjTqEEQyZJ6M1sA7S2lZB0b5
         3QpXNoaC90MJSE+yeKSuDkawTHnoyKm8++3bxwzYR2flNtkyr+L7wQbKgSORD59Dh+a3
         PkAQWwFe/kxNLBzlVKzC/vsolbRMwJYL6I4POZKktMi4rui4c+duplQq0+YFDYImxC53
         NDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189469; x=1774794269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48LFT5xoLd6RtM1k0dj2BLq7NNeYZZaAFGyC2+2DipQ=;
        b=bQAu+ujlxypJXOtUqLMjvXJg+nJgx6KXjA3EwAJbq0raof9z9aTDkaDINvuDgsJxgb
         DzJG7cb53HpZJy6PF8ZUfe+KV8lWMUTUXYFUMVjCop9IuYSvW+nS80CZthqXLoQvwKcn
         Zq5LzfiH8nkzzNolFcK03q+GD/pCGwcaTi8pu1ETlLYZHSZduSfSlHx+FWhH5NmiU8Kx
         /6xP47Cqr+dSCgMMuK59lS1oqCQmZilOWrMa5Jo8mkJpNcBc67MPBpAu06RROz9SwYgo
         wGDLmdoRNUN+PpuEFLPsAbawPCybB5zfLi0YBS9k0uoDJw6Lv61U544LI22xNvQtqgzH
         V8vA==
X-Gm-Message-State: AOJu0YwcnnvyWW1AaQXg3rEa1Z4m3azbdrl4vQD6dA5axj8DyKcYTKDO
	eIxd3vkDC4bH5k+XLn+pij3HHd+BvUanDQi/hLPCpDKpq5J1glsA76BY
X-Gm-Gg: ATEYQzxD4CAxGFwGCU14Fnqj9ymF+FKuv/deD9HumHk2RUnoO0mQ2IrYeKisQccZRpu
	IgbLFS18vT50qZRFy0/U9CAwry3HL2AGDwtno2z9K3kkUJ0J77xpMmi/kA2vHVG0vTjrnRNBDPb
	xANQzL0/M9mfjZLaDrPDo32E+yIr1fBByfxiAPJ8bDU9net6sc3MP9clYYLiyjhi5ALIxqUk3jG
	H/VX4cs4Fy0PtiGKVVCmBWCbcyhfg0HFAPD0qLAWrT0oXYFxUvtitLh8/F9CDA8vNv/laU8FeJ2
	DtAE+O3TZLvDPjkQVBUeTD6ZyF9cKETrKqOR6bdV9Hnf7l5QYk/IowpWXjrpQRt3f6FutRzatAZ
	9SA+gtAaWOC+5JT33JqsF7l4miPUcMj222L454YDHlxx20gxQJr9/cadaW8xKJTfIjPCjiehYyH
	SIda6cP8+bDHQ650eR9kp9ZA3N9WRz4d/DLPv2
X-Received: by 2002:a05:7022:fa9:b0:12a:6c19:d20d with SMTP id a92af1059eb24-12a726da820mr3866661c88.39.1774189468978;
        Sun, 22 Mar 2026 07:24:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a39sm7242713c88.3.2026.03.22.07.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:24:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 07:24:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137) Add mutex protection for
 AVS enable sysfs attributes
Message-ID: <c4117b2c-c86e-48b7-834a-7701d32ea3b6@roeck-us.net>
References: <20260319173055.125271-1-sanman.pradhan@hpe.com>
 <20260319173055.125271-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319173055.125271-3-sanman.pradhan@hpe.com>

On Thu, Mar 19, 2026 at 05:31:29PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The custom avs0_enable and avs1_enable sysfs attributes access PMBus
> registers through the exported API helpers (pmbus_read_byte_data,
> pmbus_read_word_data, pmbus_write_word_data, pmbus_update_byte_data)
> without holding the PMBus update_lock mutex. These exported helpers do
> not acquire the mutex internally, unlike the core's internal callers
> which hold the lock before invoking them.
> 
> The store callback is especially vulnerable: it performs a multi-step
> read-modify-write sequence (read VOUT_COMMAND, write VOUT_COMMAND, then
> update OPERATION) where concurrent access from another thread could
> interleave and corrupt the register state.
> 
> Add pmbus_lock_interruptible()/pmbus_unlock() around both the show and
> store callbacks to serialize PMBus register access with the rest of the
> driver.
> 
> Fixes: 038a9c3d1e424 ("hwmon: (pmbus/isl68137) Add driver for Intersil ISL68137 PWM Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/isl68137.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index f42b13fe9fc18..48059ac4a08be 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -94,7 +94,15 @@ static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
>  					     int page,
>  					     char *buf)
>  {
> -	int val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> +	int val;
> +
> +	val = pmbus_lock_interruptible(client);
> +	if (val)
> +		return val;
> +
> +	val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> +
> +	pmbus_unlock(client);
>  
>  	if (val < 0)
>  		return val;
> @@ -116,6 +124,10 @@ static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
>  
>  	op_val = result ? ISL68137_VOUT_AVS : 0;
>  
> +	rc = pmbus_lock_interruptible(client);
> +	if (rc)
> +		return rc;
> +
>  	/*
>  	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
>  	 * switched to PMBus control. Switching back to AVSBus control
> @@ -127,17 +139,20 @@ static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
>  		rc = pmbus_read_word_data(client, page, 0xff,
>  					  PMBUS_VOUT_COMMAND);
>  		if (rc < 0)
> -			return rc;
> +			goto unlock;
>  
>  		rc = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
>  					   rc);
>  		if (rc < 0)
> -			return rc;
> +			goto unlock;
>  	}
>  
>  	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
>  				    ISL68137_VOUT_AVS, op_val);
>  
> +unlock:
> +	pmbus_unlock(client);
> +
>  	return (rc < 0) ? rc : count;
>  }
>  
