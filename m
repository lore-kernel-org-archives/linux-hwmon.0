Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340CB86350;
	Wed, 15 Jan 2025 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736977981; cv=none; b=kDtOH/L2S3+MbHw25CuEypz1HivVORa9TgKmxctEgSlm1c+zVL3EPpA2yiQAQAFAssJvQHWA7nUjJBk90g1PhRki+mldUSG3H5Myqnr0nbGPe2I5SL33stOLzGKM5V6KiNhEW+8PfQ4pQkIunDunPKJAjje4Zd3LNmtMryNWxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736977981; c=relaxed/simple;
	bh=CULZt6tvhCgLK/16x60t699DxLTF9mC8uAaeGoEGODg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOEjeqLrZe+pAb3bIhL9kWfsWTh7kaK6nmpyXnwdmFHlSsADl+JdwFVEFaMKWwfaCjn+QuBLJ/3tI5HfBg7nYN69v0l7o3VqiGXYA+gRJGcWqTiUzrrGRzTwqUNW1dcWWg6rG0YOWhrlfLS5ALb0SlY7OKqOCH54q4GZXOSJ+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtgrIqqm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtgrIqqm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso2273095a91.1;
        Wed, 15 Jan 2025 13:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736977978; x=1737582778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlbeZdkh3jU6diWV2WTvvTw1fKyn2WplppggjRpvaqQ=;
        b=BtgrIqqmxkVXzrhCBKbXwnMZtNvZMdKFiqipiw58t4b5cK/OlFhDu+jKziRh3Q7ePG
         ytW/L4dXm5ZXQO3OXPCHEifaHuc7+3j857nql1yPR33H8MObktlbPqG9SUgXpc+xztVb
         JGTj6RpMxF6fUGd0Tz/wnAN4TslxzhWUCKI8tBrjywrBN3fmft6hldH6u6qbiUxm63tW
         ZZe981yft6gXZoVCQ5kqknGAzMg9q5Olrcs5oAeff3Sl8P9weVbbTh5M7uQXbCH1kdKr
         1aT/zy/dNzmrf4G3FmLNrR08eZBwVzz8aLJf5bkkV+NO8ByMeBCJ9CoQJaCoT5k1Mrls
         0xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736977978; x=1737582778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlbeZdkh3jU6diWV2WTvvTw1fKyn2WplppggjRpvaqQ=;
        b=YOW/CrBlZ1BrmK55XFX3YO44sL7lUeWUlFK8kvN6dFywjhSYbxSRCBxQy9XDPJoyVZ
         QP+PhlUGWb8Bj2rkbF5ClcuqZQ//26BkdquD0eEPonLvhhpN0jUtYUhcNRomQvEV4hy/
         qlIyJ7isOg+rYUMWlTlP76mLh/U4Wuv+hsC2IEQ2D1sOum3jE4/05dPzMKYx5hWS+u17
         Gb6fSce2nzA0vOLQ1Ek6RF0Yx89HSim0iGCH3/Ms8I/51cEOYjwPiAJMSeuvU0Ki/2kV
         VHYsHdh/raweanHL/A15aUNLg4xEXZ5ZgfSPHEYV8+0IkGwF7RQRkM9wHMMLqL+9qzL6
         LiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56xaWNaHqPIgFJ0J1jtuEIlv+F/eqXtCFCOL6J9dgoYcHpBqQR1RJFLfJAInEV1gGKuc42nE2iswlf8zM@vger.kernel.org, AJvYcCXLovpqCgeXIJsMDvUadEv047RtiQA0W+4rj5YUkrhghQcvtzszb24IKI8mvmYnaa6FyEVNVALtrwG2aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyWMsrOBWNONwaNb5MsCi18rdPhtzVKsKOItfiN48h3u+7A9O
	FrGyNBZx+Yb5z8G250Nq8mYibSFLHwTzVP1Bvcd17H1AqVU4bBCc
X-Gm-Gg: ASbGncv92XhjJnEgZj1FiDEWu5K/xW7blwegJIHHoN6FJUa3p2qmXVKx271Oz50zYrS
	8bSB4XcJ4gvJw/JVLXEnU+mNCOXV75iQVkCQaPY4SQRTWM/wM5qjvsxX7so7XInxETc3F+CTvuj
	dzMZMPAqVvoXYYI2spi1qyWhqpW5d5D6Vnn9K6KMnOerWQRjVg8WpbdHMXV41PF557W6mGL8qjs
	LJfHY2Wr2OW11LQ619J54vcxtNY2ocul1/zyDA5gWzr9EoBq32wCYse78lHHYKyuXOGbA==
X-Google-Smtp-Source: AGHT+IEuvKDJotfQIP6sQ/v+uufwRAsf9aeHoyMFgqnqFmfuzcdsx9+O+DiHkXlrpBrQA+Wybg7nGg==
X-Received: by 2002:a17:90b:2803:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-2f728dd3b74mr7047544a91.1.1736977978300;
        Wed, 15 Jan 2025 13:52:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c17f6cdsm2046382a91.12.2025.01.15.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:52:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Jan 2025 13:52:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Lechner <dlechner@baylibre.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ltc2991) Fix mixed signed/unsigned in
 DIV_ROUND_CLOSEST
Message-ID: <1a1f56d8-1783-487b-b57e-3c873f64150a@roeck-us.net>
References: <20250115-hwmon-ltc2991-fix-div-round-closest-v1-1-b4929667e457@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-hwmon-ltc2991-fix-div-round-closest-v1-1-b4929667e457@baylibre.com>

On Wed, Jan 15, 2025 at 02:48:27PM -0600, David Lechner wrote:
> Fix use of DIV_ROUND_CLOSEST where a possibly negative value is divided
> by an unsigned type by casting the unsigned type to the signed type of
> the same size (st->r_sense_uohm[channel] has type of u32).
> 
> The docs on the DIV_ROUND_CLOSEST macro explain that dividing a negative
> value by an unsigned type is undefined behavior. The actual behavior is
> that it converts both values to unsigned before doing the division, for
> example:
> 
>     int ret = DIV_ROUND_CLOSEST(-100, 3U);
> 
> results in ret == 1431655732 instead of -33.
> 
> Fixes: 2b9ea4262ae9 ("hwmon: Add driver for ltc2991")
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2991.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> ---
> base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
> change-id: 20250115-hwmon-ltc2991-fix-div-round-closest-c65c05afb881
> 
> Best regards,
> 
> diff --git a/drivers/hwmon/ltc2991.c b/drivers/hwmon/ltc2991.c
> index 7ca139e4b6aff0b6c3024183e19970b36f927f6e..6d5d4cb846daf3025e55d43cfe311f38bb353621 100644
> --- a/drivers/hwmon/ltc2991.c
> +++ b/drivers/hwmon/ltc2991.c
> @@ -125,7 +125,7 @@ static int ltc2991_get_curr(struct ltc2991_state *st, u32 reg, int channel,
>  
>  	/* Vx-Vy, 19.075uV/LSB */
>  	*val = DIV_ROUND_CLOSEST(sign_extend32(reg_val, 14) * 19075,
> -				 st->r_sense_uohm[channel]);
> +				 (s32)st->r_sense_uohm[channel]);
>  
>  	return 0;
>  }
