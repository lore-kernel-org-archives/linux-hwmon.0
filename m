Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348E1096F
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771775190; cv=none; b=ACpiVnDeyEQl8lRQn4Jhv6XVKPVG+59Ha4wkkCZUOhxMHODaymuB5aRTNThMJQtTTYa0aGwUAHUSQI5JfNHm4c6t+rirAeTxB3TGMWrupZyVibp/U6+8i9T/d8H3mOpnwYp2dEpQmgySe62Qy/quDFIlABlCUZbHVjHuvul1tac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771775190; c=relaxed/simple;
	bh=S9Gp+ua6oQHSyVSA38TUi6p87mciQfyR2SinVvwnW2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OP4Mhd0GzTCV2Q7h3hyqs0F2hJzm/+3UIAI8nev6aLUAOiO9yfU92KFIzlbPBGIvy8MAQUhyWBtKNaOHH3zCneQUInS+hddNvShnos3v5FNyfbOnjKuDnXBvOgFSEfzJqvRxSC26aVrwEY29yeQy4l/FxHx3B6zTXyd2nfV5xrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caA7I6GU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caA7I6GU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a77c1d5c3bso14431125ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 07:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771775189; x=1772379989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v8O0eJWbs4dETPQNI2FxYNYIJCXejPFz6DhCeZCThTM=;
        b=caA7I6GUwA+rnM2a86pEB9TxPJCH67T0b4w5rY/bjWo/yKj/d13S8PSUsycgxQ9kfb
         iWiW5yejyOFFWqw2kaHkmuxpaATaDK19IvfQbAEuglaLAJTlRmNYqTPq3r+tcCdQdXfi
         3oJEI/+PYz9bPFA6kwGtOd8sr79TnJ78H1ylfGVCdBDIy3y9nNdqDtEELBDrWjigcjmp
         0M5Pn1q8YNY+aYjumJqqA4pKOtvRm+zSvbfwGa8XyGmU9/J79nVH3N8UEIgSVEc/GykN
         JYitWAyx2a4JZ1wSuhXrrKCFDcYELYDCL0jaTEGadRQyQOVEg1j8wAcUAo0PSJCiF0O8
         JoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771775189; x=1772379989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8O0eJWbs4dETPQNI2FxYNYIJCXejPFz6DhCeZCThTM=;
        b=vlreAsSoOeKK7t1cb6+LcE4HN+8Wcc/WXWeq2YubiDBdSgQqyxIyfTo1Q+JprPHqOC
         hm3iWOHOXAm613E3oCrVuFeIWLK3FTcxBp7H1d3Paaloil2qe1AgxLh+l/IN5kbi1Pcd
         Reh/CF9UnTwnyPiuFkf3ECJvK4/Ssi9iJEErboyF8nE5V4VL4JC2hXxQg1JilT4JGHpt
         Ex2PDut4CJhJxJrGR+EAunA0ZGqtxIRrlUkRTY+T5mAUYjJB60IewNobluhuHp78cpPM
         Y2RjGjfx5+BmaAKy8SxHN/2RgeuJoQbm1xbPLJcMcRcEyJRfSdeVH9GJx40YLeICER1J
         KAiw==
X-Forwarded-Encrypted: i=1; AJvYcCXkb83E6+Y6Fb/Gk0jdmMHCz/Gh4Nx1gl13ZLnitB89jmA/Urua55BpSM5pk7C6ZEZEllP60hwk4a/Zgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzH5jsI6nzFszMgVHa8baGEB9UACqq3534pwT1RN3Qilac7jeY
	RbkbRZTTaoT0QFUehiSuvVceCw7xewxTQuhLsXyLCmNpNCDMnhtlTuQk
X-Gm-Gg: AZuq6aJmBt/WPKnm+K6lXo59dj7xqrjSsRN2CbUPAXVOkOYeAYVAuPaoqng5psCPQ0/
	DPCi29slyjFkzsvm0kF64Y8zs9FezraY1ZT/v7qLWiQvvYswh6F9agRjGY6vAlxPN5KS6P02U4U
	AGj4QiciqfTHC/BjJg36zvypNP44dQI+VCh9hVh5Cs9z/k9NxbjynQ/xorgDxSMi4QR3dtocoNS
	tpJWuYf3c3oDcDyaHBZHuD+WEN8TMXK2m+1+vIeXVNCGPw/SGWSNy13Tk8Zs9ZE1GuR6TTAR6uv
	Iw7rPT/wBYchhDqMtVZwQ74tsD9MYG/2dhMcNoYm+ztRnQs2jOiUIPP1IG84k4iQtmhea5jv5+1
	XpCepNdOgqohTFlwH7Soi8CWOk3+uhcLxHwULSYyCDmCV/kejOwcr4zKoSbr7UzncRdutLqYKE2
	+4rwvmDZChFCNhObgfVieT7bDn/6Z2k3egFcNS2Kwg9wQmhyTEnJwtFhPMSIiZcmpjsshrfzeb
X-Received: by 2002:a17:903:b88:b0:2aa:d29f:1444 with SMTP id d9443c01a7336-2ad743ffd28mr52582705ad.10.1771775188758;
        Sun, 22 Feb 2026 07:46:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75027b0asm51145265ad.67.2026.02.22.07.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 07:46:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ed657bd5-eb96-45e0-beda-7b459e7891ee@roeck-us.net>
Date: Sun, 22 Feb 2026 07:46:27 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (aht10) Fix initialization commands and add DT
 support
To: Hao Yu <haoyufine@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: jcdra1@gmail.com, akhilesh@ee.iitb.ac.in, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260222105831.7360-1-haoyufine@gmail.com>
 <20260222105831.7360-3-haoyufine@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260222105831.7360-3-haoyufine@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/26 02:58, Hao Yu wrote:
> Correct AHT20 initialization command sequence and
> change DHT20 command format to 0bxxxxx notation.
> 
> Tested on rk3566_lckfb board with aht20 sensor connected at i2c-2 port.
> 
> Signed-off-by: Hao Yu <haoyufine@gmail.com>
> ---
>   drivers/hwmon/aht10.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> index 007befdba977..c18332cc48ba 100644
> --- a/drivers/hwmon/aht10.c
> +++ b/drivers/hwmon/aht10.c
> @@ -37,7 +37,9 @@
>   #define AHT10_CMD_MEAS	0b10101100
>   #define AHT10_CMD_RST	0b10111010
>   
> -#define DHT20_CMD_INIT	0x71
> +#define AHT20_CMD_INIT 0b10111110
> +
> +#define DHT20_CMD_INIT	0b01110001
>   
>   /*
>    * Flags in the answer byte/command
> @@ -60,6 +62,15 @@ static const struct i2c_device_id aht10_id[] = {
>   };
>   MODULE_DEVICE_TABLE(i2c, aht10_id);
>   
> +static const struct of_device_id aht10_of_match[] = {
> +	{ .compatible = "aosong,aht10", .data = (void *)aht10 },
> +	{ .compatible = "aosong,aht20", .data = (void *)aht20 },
> +	{ .compatible = "aosong,dht20", .data = (void *)dht20 },
> +	{}
> +};

Also, adding DT support needs a separate patch. One is a bug fix which needs
to be marked as such for stable backport. Adding DT support is new code.

Thanks,
Guenter

> +
> +MODULE_DEVICE_TABLE(of, aht10_of_match);
> +
>   /**
>    *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
>    *   @client: the i2c client associated with the AHT10/AHT20
> @@ -341,7 +352,7 @@ static int aht10_probe(struct i2c_client *client)
>   		data->meas_size = AHT20_MEAS_SIZE;
>   		data->crc8 = true;
>   		crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
> -		data->init_cmd = AHT10_CMD_INIT;
> +		data->init_cmd = AHT20_CMD_INIT;
>   		break;
>   	case dht20:
>   		data->meas_size = AHT20_MEAS_SIZE;
> @@ -375,6 +386,7 @@ static int aht10_probe(struct i2c_client *client)
>   static struct i2c_driver aht10_driver = {
>   	.driver = {
>   		.name = "aht10",
> +		.of_match_table = aht10_of_match,
>   	},
>   	.probe      = aht10_probe,
>   	.id_table   = aht10_id,

