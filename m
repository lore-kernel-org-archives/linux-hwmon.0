Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F23EB80D
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814168; cv=none; b=C239KqBulBBXnplDyGX3rxGJzj0FpFyJEZFKheBqnZBf8ERZAU0ySYnk6hP2HL4TgqECDhkbUjrznEszUE+qoIS8HBc5BaRT6ENI4UeIbRcokf2NK9Z8PdMfvCyxqXxxs8henQgFI7K4lyMwDhDIANxWCFL3SmpNXFfAY8j3c1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814168; c=relaxed/simple;
	bh=RTlYYkZYNjOQMgYETbCkdxYuRb/GQVaSBT807Dubhy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WERMApYoJ+vpMGcoiy3Um+L+5Q8GFZrtmfsYHTg3JUtmMhpH1aoF2G0zjaJYBJKleTE/Q/7tnhtmy7QghMq7uKmnBPeL1Z1dVOR1f0zO0I2skM88AAVCkMws0A/VfSsNr1WnPRzxRrN/Vg0vFCL57019bf5HrMTavKyldAkRDA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5aXQydV; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5aXQydV"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso2533861eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814166; x=1773418966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZaLKsYrYsqmlYJpsUyzhmqrHURB2MPZmeFHvFmeA5g=;
        b=Q5aXQydVgv2pDdNpSjjVvgnUOXn6T+qanCb6egv8s+GQCvjUuKB8Zn1Duq3QlxQkTW
         BVBFhg89+D2W6PnbGBNoIGfvKXqgd79OnCyLFN/pSq6yvQxvMb4jnn1xYDTazJLEH6Yw
         TzoVW5+JrEpHZg899204+WPp5MxKGoFcN66+XjN7mdh87IQbVkFht/iquLrIj+/YVyq7
         jiMmZvRJ5nUrURuDBomtNZM85EmWiGfx25ayyiyU2tkRoRZKY83EM3Cz8UiuTgslT8+p
         9UjajeMmFyPEMywCk3UxjYERmK+yqw0P+UEDsyANV86h30kIS1ZdqB2zRBvuldXJ2Il+
         42Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814166; x=1773418966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZaLKsYrYsqmlYJpsUyzhmqrHURB2MPZmeFHvFmeA5g=;
        b=agjuckQd7Y3cuk1IauqYwPqtisGT2flB27mnzwuhXhYKnmGcxjOObN+RGUJdguoxNJ
         Bi5f6rXbuZ1NDaVKb9hyZhzCgD6942zlNHRRCYxzIsQreGuFz+T1EesXDpj4aef+e7Rl
         YqJqKZ3vHGCv6QvoTBh2ZGrh/UHste0om9wlJyscgbIoPqqVxoIbVlUSDY8GBEypGTmR
         27oWK0ZRRDkj+i9XaUVVJshHgdNx68OeVtB7RL5EjM1TlxSZsofDO02j+agcAcapX2Xy
         SnPcCJdK3CfhhKaomLbs7+2RbzSFqiqAWkp8ElDxVQCuO3VPfli+4MsAFd+Zcxmmx8DQ
         VCJg==
X-Forwarded-Encrypted: i=1; AJvYcCWf0G+UEYQLMjLfxPPpdR9gLeZRbWn8IhP65L1u8MjXVAHSvbab/6Bh2ax4o7Q7HWeOqcllZLki01a2BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUS0VkqQWI0Ug9fWKrVyWoDT/dbCC/BSlM4yRJpPC0dy2tS7p
	AoTfUMrLQe5HAQbFC1G4ztNuPtjU5WA0ACHiV8Q535lzb3DLT1HPW2u3
X-Gm-Gg: ATEYQzyDWOGe3NXPZLJ9rBXojvEgqxXXkHXTmioWg6USapaIe/uKT0jr9JNkt/kTr7m
	LlObbCORfsuux8aSC8y8FzhnaKXnF6xGKPOKxnM4Dd3IVjoAXlpegJNAAKdAGTtHqwZousDNGls
	/8bDZoa5GUjICvCmB24PaH1XijYpN4pTkDC3GDX3ZO4il3OzDOt6C4VR/Bt6SR11kYSeuXx9NwP
	U5cCkN3dnDQf0/uunYEVHaR/JK/9VSLoTB9glKI54Dj46NUa8nZNspfK1Kjt5WAujoaiXeiZlPA
	hz4gUlA2mXrx0p8Ubo81zVDVHnDcxppDxNuJCNMLOFTokXGC17M3dc2+IlFjaQ/5Uv7VsCt2l2D
	iijFmP1DEY2mSGAh+wNnr0/MAulY9jHvJ39Zrd7k7d2hQay413OtaMFO1/OYWOpN3EMMPUppeZ/
	rCStvIMwj3AslD2r6AATfM0JLUolQF5nLr9dqX
X-Received: by 2002:a05:7300:a887:b0:2be:1f58:329c with SMTP id 5a478bee46e88-2be4de8fc9cmr1071354eec.11.1772814165502;
        Fri, 06 Mar 2026 08:22:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8078c6sm1769855eec.5.2026.03.06.08.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:22:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:22:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] hwmon: (pmbus/max16601) Remove use of
 i2c_match_id()
Message-ID: <5066f410-a1da-4d66-acd9-e198f8e7df2e@roeck-us.net>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-12-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305195642.830695-12-afd@ti.com>

On Thu, Mar 05, 2026 at 01:56:42PM -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This is often used to then retrieve the
> matching driver_data. This can be done in one step with the helper
> i2c_get_match_data().

... but the code below doesn;t actually call i2c_get_match_data().

> 
> This helper has a couple other benefits:
>  * It doesn't need the i2c_device_id passed in so we do not need
>    to have that forward declared, allowing us to remove those or
>    move the i2c_device_id table down to its more natural spot
>    with the other module info.

... but it doesn't do that.

>  * It also checks for device match data, which allows for OF and
>    ACPI based probing. That means we do not have to manually check
>    those first and can remove those checks.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/hwmon/pmbus/max16601.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
> index d696e506aafba..36dc13424d929 100644
> --- a/drivers/hwmon/pmbus/max16601.c
> +++ b/drivers/hwmon/pmbus/max16601.c
> @@ -318,7 +318,7 @@ static int max16601_probe(struct i2c_client *client)
>  	if (chip_id < 0)
>  		return chip_id;
>  
> -	id = i2c_match_id(max16601_id, client);
> +	id = i2c_client_get_device_id(client);
>  	if (chip_id != id->driver_data)
>  		dev_warn(&client->dev,
>  			 "Device mismatch: Configured %s (%d), detected %d\n",
> -- 
> 2.39.2
> 
