Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C81B257D
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245372; cv=none; b=pdtFtM88U08PqiiaQnekneh/ChpmlIyWPQpW5/AgWgD5Q9lX6d07iPtmaerpy34BH670kdIXh95rYzfUNJXdd9iftyeme7zjJvxi9rdAHUITIVBmxCUPfxuxeSsvlT2lcs9iP8ljym0K2nQroqnMCn7unN38yrpTtkr0+6YlOj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245372; c=relaxed/simple;
	bh=l4N9M5yuiWMT69Lv8bRTr8kSfIyOHP0gPvLzG8ZJMjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XPho6lqznkXdD78yZpnXlWy1GU9zZ2nFJnMlB7jEi1z6EpSFhAlX7NZjxJTwkZexul0iQHUeIRzzgywDu2KUhuPVThqpa7ArrkDodvhzjUcxjsB6cMeqChptVwGo5vB81oCdK7MGdmscyOMzxvrAfQa94Gpp51DGeB5p9JdXDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf6/BIjT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf6/BIjT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f573ff39bso71959615ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 19:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739245369; x=1739850169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e7THVtOgCBsdItpMZwrqFRpNQtsLizOfFcR3yNnH9tE=;
        b=Tf6/BIjTrTM5sqlx+Og6PVofxiZ5smsizRFTuIwe8QsL/PDcA+PnPUSKFfjKCfJ2Rr
         yCIUSKeS84aUS6aHtR6cn1ExlKW5BNEforETDPTmwOqOnBU6JVXDI0sFEFWAVGAqGhzl
         yKkGtbqTCc0UBj9i2vKozlnfcl3Frid9WsiqQLMhO+leJ+UUVyJdF4hQZ62AvGkdQ6hO
         WbQYmv/DqZwWSyb4ZwXn83+/CVg71kSLbAHFnUnSvxFAapTWIza7bFlgiJ4cK4byZnLp
         VcQa+Xin3j7Md0tAG9tMl/HRNEB3dGprrHgsgmD6pR+TTIGhK1AiSrzWVYxUjlM9rwqy
         6CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245369; x=1739850169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7THVtOgCBsdItpMZwrqFRpNQtsLizOfFcR3yNnH9tE=;
        b=T+0lnGATwZ+Whn4U28SIacVap1EZnqHSqvol2YJMDySbHfGP7oYlNcGjALl2JNrH1I
         KBCw4CtcCyUITvH/jk0ERkL/QYNgM/1/bQCF0JCUF55S9lrfyoPdUJXeuod+VkUSH/sG
         I57CdPfFUpdIfuORGqrTnqyVi976GxsubqL8sM3dOoME47cvgrb79+u7uRIRcSlgkjWd
         ILDSA5GCo4nXKMxwSNFmb31vSq5uQSYbsIU8+eAuuAW2bAl54SUh8nMB23TExagxfgZ7
         xJwtWZwqazIdz+lKeY1P+Bngp/L428zY3k6y9vRWbYQ7ASTYFmfh1k8zBABmjp67SWlU
         gfng==
X-Forwarded-Encrypted: i=1; AJvYcCUTDzPG0SAd0EY/JGfkIxMbTRuVEd6/Mxvwn9CMv8eGeCuY3sFctTH1at/RHbSLcm8YeUD3R/Qq0bJfZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGGzujkg2PK2GzX6Fp/NDn9CVn7XoXedLFN5HtTyGIDZ0X2Hy
	Dmbz8qRlokTxRTxVDZrTOmzkpRTNI+J/m5E92oVGFuS6D7pLBGHyaSwWaQ==
X-Gm-Gg: ASbGncsSvCsmPHlb0mv148KR/fYEurbcxtb6YUpHuJ6uhGeI3UWfA2pIPf1C2aW1eDU
	sU3CRoJT7sSs+wvtMebEGCwpQ39HVY11rqDWEpuECreov7Jyru9uKbnXuKO2rV3d3wCn9qStYpF
	2utgLbEMS+wD0X9rTC4i1PjajodElR/l206To0XalmKiIpaZAvCo9r44AA/D5JX00AP52Q8f12S
	4J7hb15Wlc4yrX/k5FW0ma8rQOkT8MU6vi3VITv8JNKMQM14W+icosZ0YO9/9Q+/1eJmQC3m/iL
	dFwqq0u8muy9aUIuChz3tmQ9eyWTMXR+7YJ0r4h1AIA29mcm+n1qU2DuElWicxjk
X-Google-Smtp-Source: AGHT+IF6bQjRtFwI6Icf2I7dujCtij6DhxoltS3RGBw5pun8THqIcMcgxcoKf7Na9sjfWULBZKAbSQ==
X-Received: by 2002:a17:902:dac7:b0:21f:b404:5110 with SMTP id d9443c01a7336-21fb40451d5mr45390755ad.34.1739245369471;
        Mon, 10 Feb 2025 19:42:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36551885sm85860045ad.88.2025.02.10.19.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 19:42:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec61410c-65c6-4777-9206-5ca55595d0cd@roeck-us.net>
Date: Mon, 10 Feb 2025 19:42:47 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (pmbus/tps53679) Add support for TPS53685
To: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?=
 <chiang.brian@inventec.com>, linux-hwmon@vger.kernel.org
References: <CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/25 19:20, ChiangBrian 江泳緻 TAO wrote:
> From: Brian Chiang<chiang.brian@inventec.com>
> 
> The TPS53685 is a fully AMD SVI3 compliant step down
> controller with trans-inductor voltage regulator
> (TLVR) topology support, dual channels, built-in
> non-volatile memory (NVM), PMBus™ interface, and
> full compatible with TI NexFET™ smart power
> stages.
> Add support for it to the tps53679 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> ---

Change log goes here. I don't recall the content of v2, so this patch
goes to the end of my review queue. Immediate comments below, though.

>   drivers/hwmon/pmbus/tps53679.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 63524dff5e75..5b5125c67e55 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -16,7 +16,7 @@
>   #include "pmbus.h"
> 
>   enum chips {
> -   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
> +   tps53647, tps53667, tps53676, tps53679, tps53681, tps53685, tps53688
>   };
> 
>   #define TPS53647_PAGE_NUM      1
> @@ -31,7 +31,8 @@ enum chips {
>   #define TPS53679_PROT_VR13_5MV     0x07 /* VR13.0 mode, 5-mV DAC */
>   #define TPS53679_PAGE_NUM      2
> 
> -#define TPS53681_DEVICE_ID     0x81
> +#define TPS53681_DEVICE_ID     "\x81"
> +#define TPS53685_DEVICE_ID     "TIShP"
> 
>   #define TPS53681_PMBUS_REVISION        0x33
> 
> @@ -86,7 +87,7 @@ static int tps53679_identify_phases(struct i2c_client *client,
>   }
> 
>   static int tps53679_identify_chip(struct i2c_client *client,
> -                 u8 revision, u16 id)
> +                 u8 revision, char *id)
>   {
>      u8 buf[I2C_SMBUS_BLOCK_MAX];
>      int ret;
> @@ -102,11 +103,11 @@ static int tps53679_identify_chip(struct
> i2c_client *client,
>      ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>      if (ret < 0)
>          return ret;
> -   if (ret != 1 || buf[0] != id) {
> -       dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
> +   if (strncmp(id, buf, ret)) {

This will successfully match any substring of "TIShP".

> +       dev_err(&client->dev, "Unexpected device ID: %*ph\n", buf);
>          return -ENODEV;
>      }
> -   return 0;
> +   return ret;

This is an unacceptable and unnecessary API change.

>   }
> 
>   /*
> @@ -138,6 +139,14 @@ static int tps53679_identify(struct i2c_client *client,
>      return tps53679_identify_mode(client, info);
>   }
> 
> +static int tps53685_identify(struct i2c_client *client,
> +                struct pmbus_driver_info *info)
> +{
> +   info->format[PSC_VOLTAGE_OUT] = linear;
> +   return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
> +                       TPS53685_DEVICE_ID);
> +}
> +
>   static int tps53681_identify(struct i2c_client *client,
>                   struct pmbus_driver_info *info)
>   {
> @@ -215,7 +224,9 @@ static struct pmbus_driver_info tps53679_info = {
>          PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>          PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>          PMBUS_HAVE_POUT,
> -   .func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +   .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +       PMBUS_HAVE_STATUS_INPUT |
> +       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>          PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>          PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>          PMBUS_HAVE_POUT,
> @@ -263,6 +274,10 @@ static int tps53679_probe(struct i2c_client *client)
>          info->identify = tps53681_identify;
>          info->read_word_data = tps53681_read_word_data;
>          break;
> +   case tps53685:
> +       info->pages = TPS53679_PAGE_NUM;
> +       info->identify = tps53685_identify;
> +       break;
>      default:
>          return -ENODEV;
>      }
> @@ -277,6 +292,7 @@ static const struct i2c_device_id tps53679_id[] = {
>      {"tps53676", tps53676},
>      {"tps53679", tps53679},
>      {"tps53681", tps53681},
> +   {"tps53685", tps53685},
>      {"tps53688", tps53688},
>      {}
>   };
> @@ -289,6 +305,7 @@ static const struct of_device_id __maybe_unused
> tps53679_of_match[] = {
>      {.compatible = "ti,tps53676", .data = (void *)tps53676},
>      {.compatible = "ti,tps53679", .data = (void *)tps53679},
>      {.compatible = "ti,tps53681", .data = (void *)tps53681},
> +   {.compatible = "ti,tps53685", .data = (void *)tps53685},
>      {.compatible = "ti,tps53688", .data = (void *)tps53688},
>      {}
>   };

