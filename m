Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCD316A395
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673911; cv=none; b=swEnMTzsS8VyJsRq6J62xQG9VOkhX0qYN7UEIfliMxC7tCw/SGMkx6+nalPq/Z5HH/C9DdfDkn2KiGAT1FTU1KNx0lwX4Qv0qTcTWSwMyt30ajS0Atbl9gKmt7tEze0Ocj0fjpHvAATOglFAQaWFDpZLpDVL2SLeCIAPrn/a5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673911; c=relaxed/simple;
	bh=g/2zdmedr0+cA1/ngz0aUDnFf7nfgXl04OLe1cRt4KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sydaA4x+5NXA/cAQZSt/9Anf47Cl9v46qFM/HGZmzofk2ENr2QJhazSoohNfnQVufAkARBvdJWpQEgmDHxCTaflL9ZYndvE+LtdnzN7lnDBwijNm6SNH2mYTZFQU/ktQRj/HTSwrh4TYbksbcgttTKFu1GX7NEt9C2KG2xEeiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGc+lZMr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGc+lZMr"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae56e68216so27701835ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 17:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772673909; x=1773278709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSPLmA16vS4uzO9z7fTVabMUYxwof/qK5VsxUKuP71s=;
        b=LGc+lZMrzfcvdaUxIBNI5gls9Wx4svCU8yccHqu01jjClkh/Bmp5CTgtyCf5IRuGuY
         iD+Z/rIyenYqnEpnrSbcBuFbmygv0Zut8MozZpHP1pb7Z8ZWltX1Qc4+/LrdZiBsqA9S
         TBe5sPPEp91mHmrr3mwe7QOT7Pv87iT97vWzSjnaEAsuaiV6So5JxgltlMs/nZZj9d4a
         mR0Slko3AK8p4l9MsKzpParnAz/muoEOsTxwmhHZbEC3AweRtx1gTaiqQuVPmpdypHRg
         bsOmeDVJfihuR8GAv7EOM/EQfaxRXr0/5zvWGvEsD+0FDuxO5wiWGLwBt7JPJ8CfXAW1
         yb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772673909; x=1773278709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSPLmA16vS4uzO9z7fTVabMUYxwof/qK5VsxUKuP71s=;
        b=N/VVh82teRuaGrdrEXhtlsbSOqJr2zFZgIGdwmbgxe2JRtgLhjcVQDzMTFGjPNoS/H
         TeniCqaUJmO4vpt7LuO3RE4iGRLFZxumSDzKYo0Z3D+gmG1oFiVKawInPfh0U8Rv9SfH
         4gt+5rYb7P0CHNT4I1Lit7y/SZDdrr1KHTnKlA7SdTN8zONK0D1zSdhhqqu8+ru6Ucjt
         cH/OyI1sc3jmVIanfJWn1scLf0zRWC8A4orHdGIcs59rdOS1u1cAI2bmrIUr1A7qHpSw
         oPuh7Fg30NU5TIANgYuMZqAqIEh7R6gx94M6dJ43ATMWkijJ6l+xyyiNMhQl0TaOCVnZ
         95TA==
X-Gm-Message-State: AOJu0YwRKQ86GiEoyb6JfkO/ulzuLOQ7NJcZUKqEEw+SeMTqkq9rcJIZ
	bbGNepv6AFYpQK6eiXlEYQ3qeSfTRUu39kHQTpvXcYsyvZvLL2tnTqip
X-Gm-Gg: ATEYQzxJB2ybOTieJDNaVZUxM/PRQ/VDHgGRfmnIrf3pn3wWfihYbBPsm3fMYCCrui2
	a6c5CaO1bP35o9TW+7JL913O0TzCQ7hb8wrLCGHOQRnsj36+x074hy64TvQANYdw6CCqElkbpJ1
	9/FEULLxeA3KtA8gdCfXLBDNh/3hpLv+T4mwJ9Cwk1xSqJ9FrHGmQBAUSrRCLv+xNWMAhmYAGm8
	kg9MvoiQ6Pt7vNoruT5Fl3GaO1SnrRwDQNo+m9LCbRti093wY5lZuh1FLw9ygGPMi+vawiajJNd
	XBCvcmN8wYG1nSM/5IrX2NQME1aWEhRg/LWcsJJ7xsS7KdxqJCSSGiVz3akfJvoCj9Q5j+G7GNx
	yBnA8HU4+PuudpSTv+B/QhwE0Em2s3/b8Zga1DOk/FC3o2DQMX7/FDnbWx0D63llMYAwbJl1Cyk
	+l5apiRmL68SkhtkymqLxT/iescegT8wdt0D4xAto7n/jCcPJrOYqdgjYTPzOOeSrS5dOoCrLb
X-Received: by 2002:a17:903:41c4:b0:2ae:61db:797b with SMTP id d9443c01a7336-2ae6a88bf82mr36181915ad.0.1772673909243;
        Wed, 04 Mar 2026 17:25:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b36e1sm207233325ad.9.2026.03.04.17.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:25:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89b06d69-0094-4b5e-a240-b668bd8b0719@roeck-us.net>
Date: Wed, 4 Mar 2026 17:25:07 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hwmon: gigabyte_waterforce: name input sub-reports
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
 <7c37034ab5b1c4067d42eb75997a993dbbbdc366.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <7c37034ab5b1c4067d42eb75997a993dbbbdc366.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 14:05, Michał Mirosław wrote:
> Use a switch(command) with named labels instead of an if() sequence. The
> hardware only ever uses 0x99 as the first byte (the report ID), so check
> it at the beginning.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>   drivers/hwmon/gigabyte_waterforce.c | 47 +++++++++++++++++------------
>   1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index ef27c1ff8fd8..7f5c88f66e40 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -18,8 +18,12 @@
>   #define USB_VENDOR_ID_GIGABYTE		0x1044
>   
>   #define STATUS_VALIDITY		(2 * 1000)	/* ms */
> +#define REPORT_ID		0x99
>   #define MAX_REPORT_LENGTH	6144
>   
> +#define CMD_FIRMWARE_VERSION	0xD6
> +#define CMD_STATUS		0xDA
> +
>   #define WATERFORCE_TEMP_SENSOR	0xD
>   #define WATERFORCE_FAN_SPEED	0x02
>   #define WATERFORCE_PUMP_SPEED	0x05
> @@ -27,11 +31,11 @@
>   #define WATERFORCE_PUMP_DUTY	0x09
>   
>   /* Control commands, inner offsets and lengths */
> -static const u8 get_status_cmd[] = { 0x99, 0xDA };
> +static const u8 get_status_cmd[] = { REPORT_ID, CMD_STATUS };
>   
>   #define FIRMWARE_VER_START_OFFSET_1	2
>   #define FIRMWARE_VER_START_OFFSET_2	3
> -static const u8 get_firmware_ver_cmd[] = { 0x99, 0xD6 };
> +static const u8 get_firmware_ver_cmd[] = { REPORT_ID, CMD_FIRMWARE_VERSION };
>   
>   /* Command lengths */
>   #define GET_STATUS_CMD_LENGTH		2
> @@ -257,32 +261,35 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>   {
>   	struct waterforce_data *priv = hid_get_drvdata(hdev);
>   
> -	if (data[0] == get_firmware_ver_cmd[0] && data[1] == get_firmware_ver_cmd[1]) {
> +	if (data[0] != REPORT_ID)
> +		return 0;
> +
> +	switch (data[1]) {
> +	case CMD_FIRMWARE_VERSION:
>   		/* Received a firmware version report */
>   		priv->firmware_version =
>   		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
>   
>   		if (!completion_done(&priv->fw_version_processed))
>   			complete_all(&priv->fw_version_processed);
> -		return 0;
> +		break;
> +
> +	case CMD_STATUS:
> +		priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
> +		priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
> +		priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
> +		priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
> +		priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
> +
> +		spin_lock(&priv->status_report_request_lock);
> +		if (!completion_done(&priv->status_report_received))
> +			complete_all(&priv->status_report_received);
> +		spin_unlock(&priv->status_report_request_lock);
> +
> +		priv->updated = jiffies;
> +		break;

That needs a default: case.

Thanks,
Guenter

>   	}
>   
> -	if (data[0] != get_status_cmd[0] || data[1] != get_status_cmd[1])
> -		return 0;
> -
> -	priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
> -	priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
> -	priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
> -	priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
> -	priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
> -
> -	spin_lock(&priv->status_report_request_lock);
> -	if (!completion_done(&priv->status_report_received))
> -		complete_all(&priv->status_report_received);
> -	spin_unlock(&priv->status_report_request_lock);
> -
> -	priv->updated = jiffies;
> -
>   	return 0;
>   }
>   

