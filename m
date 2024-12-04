Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9C1FDE2A
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Dec 2024 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321946; cv=none; b=gmaVDxMdbrMvsVrOMHyh3s3j5AD2rT8qk6+XrhiHR5yksB7HAMj0fhBUbPywCZ164HciOFiJHLVJb95HQbsRdOYUcqOYSqeLx05gzspMuByrylOOVwKoXIKrwhJjErXbtgBI0gCfwOaZRpqMtXLi7Pab9JasjInSTc25WgKZ2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321946; c=relaxed/simple;
	bh=aGGUaFa0+MovG1v1VYNhIOarVO3GvvvMwjn/DzLkPxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHND0KZrORdvVg46L7x+lgd5keVbvzBvip/v3sWNyVnWseF92y6SJaJnQ4vYv0GgnXXgmaFaKaYApoj/bpaUA1UNed+8yFF9+6gc+2CUhcNyiH1+CZtMkwbmVe2lZgPFVcdX4/Mzg7aBmu+JbGvNHDTTcXQgrpa4G53o3ieoy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGt4KoSn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGt4KoSn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215909152c5so35290335ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Dec 2024 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733321944; x=1733926744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJlZBIDc5+k8PZKoJ+spB6bbyB5qfdaBvK2mtpJuDCg=;
        b=WGt4KoSn4MVNqBuIQyi/eJvBrGML2Fl7TxI8ihkZoqVQ8joecYg7ty5nVQLoPVNAJZ
         0viUuC7kcWqZDuBjIoD5/KhXdl6xFr7jr5IPhuKfh9SCLYTbMjxVaXobi6edid5m9rl3
         nE/6G6I6aZDhmZJzKQhoD1RFNxdO9OpRP8XhQ7/zov74mykJVK/lgqiUCEJWgN9rF5Ib
         KavbUy5YKgUxOWfZpXUlcKeSK9hT9oV+S0eOS4tpB1j3u4pkQ/Ilq9Bc9MydKirIFhkE
         ja/3AbgX/UHcAU917iXWbfvfErmn+5brxm6jPiryxra4CJ6zUl5LriDsKTOQ/O4XIwmo
         i4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321944; x=1733926744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJlZBIDc5+k8PZKoJ+spB6bbyB5qfdaBvK2mtpJuDCg=;
        b=rrWR7i/9vcGsW64Q84hsJJuf/GGKfecikC3RrHH3VN1ISUfGX5o2wnFT6t4DuytCcx
         XMPqmEYB/V6XYVbiYpXBSSlkYk2QrtP6De/R7TIhFNzzRzZIJVax5LrC1SOvp2HEx6p4
         rMpmk94SB7bjrswfOifOhID+X52MZsLZ8GuG2SQcnZ22UuVB9uuffINPIEePv/NjZoWZ
         tmgWy4CxSxRjpXL5SW99/dBIuMSnh9vU9KypBKcQ0pIGjhisMSQiyXsxVf0U47Jvkdhl
         kWNGMb2kF74JRD0LoMlZ/Q+MRyaKbn/lbjOx1s7g4VC6V9S31OzGondTFaf0iCgMYu56
         tLPA==
X-Forwarded-Encrypted: i=1; AJvYcCXllH3VTiPf2YcYvatEXU0ngJ8Eqnh4PfQSSUBu2ZjYpRp3qZJPgxt3RQgy1IPg2pDh8GkYBgtrpFht8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQx79yvTpxKCe3ShNTHQg5k4TpeWZowGqBQl7fqZ/UEFZs6Aw
	KznXQ2Sos20BA3543RqTP3VtO99LPtQWJ1c+DqmnUC+f6/AsnRHcuTQe/w==
X-Gm-Gg: ASbGnct+B3LXroHP/MnVt1qVosYs/but4jt3lOZXydMrTBUAQnpmB78qkF8aHZkNbV2
	aenXaK6sCzyTlX1a7aMdgWYDjiirnwpOU/oI0nVtOhYwi+492mZafmhODjTHTK7u2Sm1tEpKgHF
	4Yc2DBwP2xezinoUetzcN/Xxw7B5kUDYMIjbzWdQLN1mo/ORAvR3PSyEULdCdW/EA8kD8AEIO/9
	Pe4FjeFhgbBJ/myqlMP4Os4/SD78/G6DXeN/CiIaxebd5OnUa7MM5QtwF9j7kk=
X-Google-Smtp-Source: AGHT+IGLP+dPL5E6OGeazMuml/iDmZCVPvdNSW1kSbfNU3tmxJCIXrXrkcrcObUZsVU63/TBxCwvhg==
X-Received: by 2002:a17:902:f688:b0:215:a964:e680 with SMTP id d9443c01a7336-215bd200355mr91435105ad.25.1733321944529;
        Wed, 04 Dec 2024 06:19:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215591eff15sm79026585ad.175.2024.12.04.06.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:19:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Dec 2024 06:19:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (isl28022) Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <3fd36159-8d74-42b4-a503-ca36c6b1c90f@roeck-us.net>
References: <20241204140857.1691402-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204140857.1691402-2-u.kleine-koenig@baylibre.com>

On Wed, Dec 04, 2024 at 03:08:57PM +0100, Uwe Kleine-König wrote:
> This driver doesn't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize it.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Applied.

Thanks,
Guenter
