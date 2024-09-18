Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3213AD1C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Sep 2024 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678659; cv=none; b=S/SdOqwMWbX9Sy4TooSYVzvKh7WT5B8wSezpBFbNyVqDv84tmQjDm2juYbS96KTG7FGQ4BuuK3J7SAYsKiPtErZMgCZ8q27oSl1f+qhOoV+ehb7M5DcCtC74Oj8RMj2xAqgs4GyB+/Rf0oYIvEtq1q/VKzN1pWgc2plhVuLxEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678659; c=relaxed/simple;
	bh=mK8OOUCq4LK0EraxrvUqCaBNGfDVjebVd5vYxzj2alM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMAliUkCQyLnO7QXk2M9pKG3BwVBX87llGCtsh58lpk/bBy1s/sxfY1oQZSDfD0/Gg+8XwOJEwGF6KqneJuQhtS66PbWXHzCklOCEZjFDGFKqk5bi4cajcTEelFZcACLNtW4zxYvJLPikLjqVTcrFHhhumHA1CnluNGEcxpXM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZa+KkQA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZa+KkQA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so4879311a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Sep 2024 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726678657; x=1727283457; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srVRljVT4v1DraZPCjeuf5/C2spuCDkTooyXSXkCupk=;
        b=aZa+KkQAzuHd5oZ7tq1RpC7zjD/JTQmelTBIzm/e/Hs0wIEk2CF1PkeZfCNtEh99QY
         zobGuAx9SNuEd5S7INHunv5QNCIzrHKt32VIP4xVNIG8bdNWHZKfb/+n3Ny7JYHODpO9
         1O5K7we+HAbkmRRnpIE1rH/ilaNvtpSh0pVFRHOXwvyVy1GdbF8nl08Ov89HlgqZuAPZ
         raslr8tsTNME5v/j9tVJrD7G5Gws5DrZuEkp/jUICXQqcIUj5EccqMPRl52d7geC+PeR
         kqTpAyx0xXO0o1UWevldepxzMOfbe8wL7HHkbeiY38G68Tj42TI2Xh51mORxlMG3/dWn
         VfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726678657; x=1727283457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srVRljVT4v1DraZPCjeuf5/C2spuCDkTooyXSXkCupk=;
        b=lnWKn1/lDR5uHhE38vEyA5S3427j9ZB33cYFOO5Ukr2LWKvf8KcxbKSzfv54CmPijr
         heD15Vshav6311sEIKfh7PAg7fLEV2AkW9wc6b+MQl4qNBFbSC1TNEA9Tp3KzFlteFQR
         7RqX6cvet+WCZ42bMMeNQIriGxf5wthSKfj2Notm00FvXrflPDVDxxjsBsjYP2+Rl+vs
         fyJCQYrmFDfvPMAQGVH4Xh+j4aNDiZfYjC5KsLFjU01MckGQH6RSMmTlAL2NjVTzMJIY
         NSLKTKEQnh4Chrj7QyDJb38PtP+0kcARxgb7Djl3CBnzwOG4I9FsuInbV2pEgcVzuwFY
         lpKw==
X-Forwarded-Encrypted: i=1; AJvYcCUiD9OK3TV5RGUHLq7iEf3x4abmtVQRobRUgp3Qw/ACHZbbxtf0jm0N6DkU/Y4UDg1ybeB1iVeLcABAkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXZlmAjxiQOiQVyFjZnPOrU7JCcJd7TzKLZcPxFAQu4ZIVlt1E
	/KSX6GrOmA0ki/cCp7AiAcTCuNdWnqTe9NSf2IaQfZ9vJsAgohg6
X-Google-Smtp-Source: AGHT+IGBldCAaibh5tWB4uQMpW8lmpEGRS7HJX+v4fpMYgb5wpqgv80Pi9mQyIbGwDA7ttdWdh7dIQ==
X-Received: by 2002:a05:6a21:58b:b0:1d2:e81c:ac76 with SMTP id adf61e73a8af0-1d2e81caca9mr7369800637.32.1726678657184;
        Wed, 18 Sep 2024 09:57:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9ac28sm7166160b3a.172.2024.09.18.09.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 09:57:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Sep 2024 09:57:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Noah Wang <noahwang.wang@outlook.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <3738dbad-bde3-44c4-bfdd-7ec4c641bc38@roeck-us.net>
References: <20240918123150.1540161-7-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918123150.1540161-7-u.kleine-koenig@baylibre.com>

On Wed, Sep 18, 2024 at 02:31:49PM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> While touching these structs, also remove commas after the sentinel
> entries and use a consistent indention style.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/amc6821.c      | 2 +-
>  drivers/hwmon/pmbus/mp2891.c | 4 ++--
>  drivers/hwmon/pmbus/mp2993.c | 4 ++--
>  drivers/hwmon/pmbus/mp9941.c | 4 ++--
>  drivers/hwmon/sg2042-mcu.c   | 4 ++--
>  drivers/hwmon/spd5118.c      | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 
> 
> base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
> 
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index ac64b407ed0e..e86027f850c9 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -927,7 +927,7 @@ static int amc6821_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id amc6821_id[] = {
> -	{ "amc6821", 0 },
> +	{ "amc6821" },
>  	{ }
>  };
>  
> diff --git a/drivers/hwmon/pmbus/mp2891.c b/drivers/hwmon/pmbus/mp2891.c
> index bb28b15a9103..94ab4ae5fba0 100644
> --- a/drivers/hwmon/pmbus/mp2891.c
> +++ b/drivers/hwmon/pmbus/mp2891.c
> @@ -572,8 +572,8 @@ static int mp2891_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id mp2891_id[] = {
> -	{"mp2891", 0},
> -	{}
> +	{ "mp2891" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mp2891_id);
>  
> diff --git a/drivers/hwmon/pmbus/mp2993.c b/drivers/hwmon/pmbus/mp2993.c
> index 944593e13231..63691dac2281 100644
> --- a/drivers/hwmon/pmbus/mp2993.c
> +++ b/drivers/hwmon/pmbus/mp2993.c
> @@ -233,8 +233,8 @@ static int mp2993_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id mp2993_id[] = {
> -	{"mp2993", 0},
> -	{}
> +	{ "mp2993" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mp2993_id);
>  
> diff --git a/drivers/hwmon/pmbus/mp9941.c b/drivers/hwmon/pmbus/mp9941.c
> index 543955cfce67..8ab5fc4d4092 100644
> --- a/drivers/hwmon/pmbus/mp9941.c
> +++ b/drivers/hwmon/pmbus/mp9941.c
> @@ -291,8 +291,8 @@ static int mp9941_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id mp9941_id[] = {
> -	{"mp9941", 0},
> -	{}
> +	{ "mp9941" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mp9941_id);
>  
> diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
> index 141045769354..aa3fb773602c 100644
> --- a/drivers/hwmon/sg2042-mcu.c
> +++ b/drivers/hwmon/sg2042-mcu.c
> @@ -346,8 +346,8 @@ static void sg2042_mcu_i2c_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id sg2042_mcu_id[] = {
> -	{ "sg2042-hwmon-mcu", 0 },
> -	{},
> +	{ "sg2042-hwmon-mcu" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, sg2042_mcu_id);
>  
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index fcbce5a01e55..6cee48a3e5c3 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -671,7 +671,7 @@ static int spd5118_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
>  
>  static const struct i2c_device_id spd5118_id[] = {
> -	{ "spd5118", 0 },
> +	{ "spd5118" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, spd5118_id);
