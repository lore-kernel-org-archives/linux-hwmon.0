Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A471E0B9C
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 18:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771785214; cv=none; b=teyoX1uBNSfs/WKrPzvwTL/HOEiT9iSCYd2PRzIAmpBAHWm8rD/2cx6OBuMTEsvNvA0EbbYAc3PNi7AgeUb6gI+LoaeTHGEmL9U/qWhu3jL4SNQy3NT/jz2cOGzg+KXsxnvBHGTsA4r0EnIM6zxUBwK7ecO2TWuL6UXVKo6/dl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771785214; c=relaxed/simple;
	bh=Gxa5A+tvgIFzLTNVZwkWDhuRkbCoNzau+xJzqZTG0Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i15zTgzgDrfE9cFj/3MbKORQU6NyRSsXO+M5EZ6PgJ52l95/ynship0X6gyOchk6c4zsIevfWGSdFoUZSTbc6l9yBOUoWUh0NRjOZ1lidAZn5cQYchoLyLXfiElGH0WqkDrqmcZm9YuSw0qBXJUGIIFtpyldwaDXZ0gpSuRyg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQF1VZ5S; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQF1VZ5S"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2baa098ffc6so3274824eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 10:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771785212; x=1772390012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GthVDsIOd+2sKUfi8Uh06K9+Ix22GSuy7Q9hscrocw=;
        b=HQF1VZ5SRDaaA2ftTv2oj1xY2pxGhqL+ZkbaxG8Cgr3cuihCvQdraxkNMRB9q0U9sJ
         h7lASR2c5P+HQhy7dlQHga0us3DpAJqjTfj12Fnd3RMZEu+S96k4B6o1sAyV8Qizmim0
         7+dwvQQPfLnqWZD9EzvdUzoux9Yzvt5Y90eIaYatia74eKIXESQjiNqOnFlx9pNAAER9
         I2L56tFde6u5CceL8ShKVUaV5nAaDJbVX6vt4G7JgNbywegF1MlKe79E+/GI9U2rTGzG
         Mbx4zI6dqrfzlDAdmanStTU6zjLv5uscEfS/l1DZdwUkZM1FX46CtJ5aSSGqHUiD8jEV
         IHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771785212; x=1772390012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GthVDsIOd+2sKUfi8Uh06K9+Ix22GSuy7Q9hscrocw=;
        b=pYboZi9Q743FMJyeHMCWLmXbTFQNfaoL/AUqIWHz337lQpvVpCfzo52Oj+zP4tg+6l
         MOzHsaxhA10euo+B8ZHInQyXuf0fNWQJ0x6mslJcnMvrExok5PTqs1fDl4k73uJZoUfn
         +kFlyq7SIMXaPpo+pW+I4qVb+C4NZpgrO0B/qUdFRyGr8jSxH4FCtFDaif271CJVTLkp
         0NckpUMlB1gGWW7wDZwxVcSQt9w48vl5/S/IHc6KEFBiJJuW7W9irU9X0jkcb2RNfuAJ
         cQPKPCwjjXHMgPY8+CuO2Wy8pqDmn2XrIgclvRYRhQZpuZYMFY9a2NrQdg5MDzQHsGmN
         W1fw==
X-Forwarded-Encrypted: i=1; AJvYcCXQEBJ60UgC09oGaiTa+9n+rOLp11b06XQziIlTa4vj6TbugkA2RtHDifbu535aQYi4e5GFwMYKxath9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwB/eDtPKXAANoa0fo5w3NGryQTDUyyXxsi3GWURtN+BZ+aduD
	sMxtHK8yu84RpTzD8IktOf4R3+87Fmy2g/4F+Vfbd1IJDGmgit0+Qbmc
X-Gm-Gg: AZuq6aIdjcfIad2Rxm50p+lXwESHpWfV/VnPiEvqEzig6c+cHlGj4n8Tr3/XJEF0Cex
	vVzircqQgp0AZRQP6iUTVdoVysYeXI6gYpEff1y/ieMi99IhZGeLLd6MpeQLIcB32L9usPe3zgv
	h8ckp1lf/1uJbvcDhv+D3cFDi2NgRRYJ+0b2ML9VdNu/ZDjx09lE0c0JUT6xO6GYK1WzVZAijJ6
	ftCOQhV6a36uNhvVmtwcqSPNDMLXJuID4NLGEuEekqWM/xXrTpolKpLwfYRctZWB55WxDGzxb5K
	T9XcKo3eYO7sZ/Ol2qctpoDIbhrQlEooI0Il6pATdYoOcAPltsFbW2WxqSFVgfthXzSSN2NVTDr
	QqD5vy9cGRHTaODljvaOIVVmU22MYt6VwZ2aPIfGCyAr47FibnxQaDdkq8N7kT1//RDPaoQOsfk
	6xJ2bqGOX7AZbqF+UHboT6ZARoN+eh6zazoo7a
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr1966020c88.23.1771785211890;
        Sun, 22 Feb 2026 10:33:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af9f74bsm5158185c88.15.2026.02.22.10.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 10:33:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Feb 2026 10:33:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hao Yu <haoyufine@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jcdra1@gmail.com, akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (aht10) Fix initialization commands for
 AHT20
Message-ID: <dab83860-0dd5-4c88-bcb1-99226cf4fce7@roeck-us.net>
References: <20260222170332.1616-1-haoyufine@gmail.com>
 <20260222170332.1616-3-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222170332.1616-3-haoyufine@gmail.com>

On Mon, Feb 23, 2026 at 01:03:31AM +0800, Hao Yu wrote:
> According to the AHT20 datasheet (updated to V1.0 after the 2023.09
> version), the initialization command for AHT20 is 0b10111110 (0xBE).
> The previous sequence (0xE1) used in earlier versions is no longer
> compatible with newer AHT20 sensors. Update the initialization
> command to ensure the sensor is properly initialized.
> 
> Fixes: d2abcb5cc885 ("hwmon: (aht10) Add support for compatible aht20")
> Signed-off-by: Hao Yu <haoyufine@gmail.com>

Applied, since htis is a fix which doewsn't depend on the devicetree patches.

Thanks,
Guenter

> ---
>  drivers/hwmon/aht10.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> index 007befdba977..4ce019d2cc80 100644
> --- a/drivers/hwmon/aht10.c
> +++ b/drivers/hwmon/aht10.c
> @@ -37,7 +37,9 @@
>  #define AHT10_CMD_MEAS	0b10101100
>  #define AHT10_CMD_RST	0b10111010
>  
> -#define DHT20_CMD_INIT	0x71
> +#define AHT20_CMD_INIT	0b10111110
> +
> +#define DHT20_CMD_INIT	0b01110001
>  
>  /*
>   * Flags in the answer byte/command
> @@ -341,7 +343,7 @@ static int aht10_probe(struct i2c_client *client)
>  		data->meas_size = AHT20_MEAS_SIZE;
>  		data->crc8 = true;
>  		crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
> -		data->init_cmd = AHT10_CMD_INIT;
> +		data->init_cmd = AHT20_CMD_INIT;
>  		break;
>  	case dht20:
>  		data->meas_size = AHT20_MEAS_SIZE;
