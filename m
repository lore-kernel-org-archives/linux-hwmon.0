Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955AB18A6AC
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185096; cv=none; b=RXo2+/U/D6wTfjmvBzseowoTNRllnlt4AtJlPP73lh4fa78iFZCgKFKkYlUZZphWoLzdkFa0m8OWWgwi2BXkLsNQQIRxRsO25WlrsSRAc/AJayA1AUIotRwi5v3diH6wPBqBJHa01ykQlUeRtUXj59WWbS8ADTBDKnaS3dnP08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185096; c=relaxed/simple;
	bh=qvvbgw6OedOPV8/cAG//Rh2LmcfRPCf6mOrROss0Ces=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuQDbfhoeXoQ1ZtD2PS9kIHBjQ5rgB2Cq2ID9mM2rZyAHQUNT+h1KE77ijKCVQl/pMA1YPhR6jez4cGFVfU/yIMCRpFAE6tEOTbVBU/th84hcz5ZFgfOJi8biRyUYuLJ8dW/Jnqb7cvu/hxhP2Dc2xOIWM40MLeXrdIP9nflYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSiM1t4G; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSiM1t4G"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166651f752so12526325ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736185094; x=1736789894; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1WW5qX2j/44h79BIXM8VrLHYKa5eHZl6QPgd6J9fuU=;
        b=SSiM1t4G+maJTDxXuRk3ghypegPChQH3v86A480KvIAD6fd0Zj8lBn8kcS2ACsAk84
         rCFtS01sTVPMYpsLlKbx+vti8nC7XuoCAqpXl1F7S1lWTLquVax45UJOY11W5lh4omba
         X4KjxU4PWfpm3qSPp5ffDBoTMExc0ByDCitvw22yiFiRaJXwM0qIUq9W8hrbHcTVtBqa
         6aAeasR9Irnv7RcLwqzjrjG2/9NBbflDWntC9Ls9Vyr6FgNTj/DfeO7qX6rfdxju7/Dm
         zQrrWgjKkC5+fha+OOjBwCSqf2Cc9Mqtk87CgYgQM4JDMbt85dVVTkrpZ7SezcHISVto
         a8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736185094; x=1736789894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1WW5qX2j/44h79BIXM8VrLHYKa5eHZl6QPgd6J9fuU=;
        b=JFH9EsOoF3+/ZkZKES1IVHhKslnLXJERw+EyAEPqQuvT8He790Fma27txmJFXuQElL
         Dw56clYlxoXF0ynmwqazAclW2i2QZ/olqv714velFz1VSbL7F4IrbC3A01BrUCS1mLYS
         hroJfRiTOvGBDcCiFQFEQxXh57pAWazySrJOidLe3uTg2Dmj0iyRVt9jH6giK9klVwYk
         iGM3zDdtQR/M3KMzupcIbOXnmHZya5Y1yCj8GJ8AFmCpqruMX9+b37xnczD2siDCAs21
         2twAWWA4bzZJlg6iqy3IAAiHxQvBCqv3o0xtbztdSSk4N8aI2Wm0DmK0Efsgx+NV9s2o
         EoQA==
X-Gm-Message-State: AOJu0YwZycEOWnpE0iYYYqa2zLw1bvFBweAAyPdSM+8THZ/uDTOTRb03
	91oZ+eCK6QJR3IhuQ7UfcB+dCCoSfNSaiSbzSActm6wBKZmKMDM55K6XYg==
X-Gm-Gg: ASbGncuOjmfrrLFoyUAH9FoyHZzlmrDXZ/IPu9dmTOnZ4FOfAd+CjH5EjmccBx4xY1n
	0v8eM6tKKHIlskyQo0m0wIPQ/nGQMLw4cWBXa/LblH1Wy1v4uR4geIbA6hWXUfWTBFXEwWfTYfP
	stADF1c8nhBz1xc52euORsf0oMPQK//5SrzKtQMFgDo3B0WZWC8QIbRzVSHenXYkYEN1mfGSxBS
	fsnn6AW/Mk/rp9CcMr4Zve+lmco5GbT/v2gkm3HBKZqrgO1pj04NaLw6nsdorh1bm0mIA==
X-Google-Smtp-Source: AGHT+IGNeMNt9XBd3zZpbqOKbg1GIxSVd8W46WMYt/MCxlhOoEaQ9qKW88xjON+4ypbRgkfnilZgoQ==
X-Received: by 2002:a17:90a:e18b:b0:2ee:9902:18b4 with SMTP id 98e67ed59e1d1-2f452ee838bmr85262705a91.27.1736185093795;
        Mon, 06 Jan 2025 09:38:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8583sm34054719a91.16.2025.01.06.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 09:38:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jan 2025 09:38:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ChiangBrian =?utf-8?B?5rGf5rOz57e7?= TAO <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1] Support the TI TPS53685 driver
Message-ID: <c9737e71-72c9-4357-a0d1-509362e2b051@roeck-us.net>
References: <CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com>

On Wed, Dec 25, 2024 at 05:54:12PM +0800, ChiangBrian 江泳緻 TAO wrote:
> From: Brian Chiang<chiang.brian@inventec.com>
> 
> As the driver is not supported, TPS53685 reading is added based on the
> datasheet.
> 
Neither subject nor description are appropriate. This patch
doesn't add support for a driver, it adds support for a chip
to an existing driver.

> Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
> ---
>  drivers/hwmon/pmbus/tps53679.c | 58 ++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 
>   * Since those chips have special configuration registers, we want to have
> @@ -132,12 +157,33 @@ static int tps53679_identify_multiphase(struct
> i2c_client *client,
>     return tps53679_identify_phases(client, info);
>  }
> 
> +static int tps53685_identify_multiphase(struct i2c_client *client,
> +                   struct pmbus_driver_info *info,
> +                   int pmbus_rev)
> +{
> +   int ret;
> +   ret = tps53685_identify_chip(client, pmbus_rev);
> +   if (ret < 0)
> +       return ret;
> +
> +   info->format[PSC_VOLTAGE_OUT] = linear;
> +
> +   return 0;
> +}
> +
>  static int tps53679_identify(struct i2c_client *client,
>                  struct pmbus_driver_info *info)
>  {
>     return tps53679_identify_mode(client, info);
>  }
> 
> +static int tps53685_identify(struct i2c_client *client,
> +                struct pmbus_driver_info *info)
> +{
> +   return tps53685_identify_multiphase(client, info,
> +                       TPS53681_PMBUS_REVISION);
> +}
> +

The whole point of the existing identify functions was to use them for
multiple chips. Please ajust the code to only use the existing functions.
That should be possible by changing the 'id' parameter of
tps53679_identify_chip() and tps53679_identify_multiphase() to be a char *
instead of an u16, and by passing the expected return length.

>  static int tps53681_identify(struct i2c_client *client,
>                  struct pmbus_driver_info *info)
>  {
> @@ -215,7 +261,9 @@ static struct pmbus_driver_info tps53679_info = {
>         PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>         PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>         PMBUS_HAVE_POUT,
> -   .func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +   .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +       PMBUS_HAVE_STATUS_INPUT |
> +       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>         PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>         PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>         PMBUS_HAVE_POUT,
> @@ -263,6 +311,10 @@ static int tps53679_probe(struct i2c_client *client)
>         info->identify = tps53681_identify;
>         info->read_word_data = tps53681_read_word_data;
>         break;
> +   case tps53685:
> +       info->pages = 2;
> +       info->identify = tps53685_identify;
> +       break;
>     default:
>         return -ENODEV;
>     }
> @@ -278,6 +330,7 @@ static const struct i2c_device_id tps53679_id[] = {
>     {"tps53679", tps53679},
>     {"tps53681", tps53681},
>     {"tps53688", tps53688},
> +   {"tps53685", tps53685},

Numeric order, please.

>     {}
>  };
> 
> @@ -290,6 +343,7 @@ static const struct of_device_id __maybe_unused
> tps53679_of_match[] = {
>     {.compatible = "ti,tps53679", .data = (void *)tps53679},
>     {.compatible = "ti,tps53681", .data = (void *)tps53681},
>     {.compatible = "ti,tps53688", .data = (void *)tps53688},
> +   {.compatible = "ti,tps53685", .data = (void *)tps53685},

Numeric order, please.

>     {}
>  };
>  MODULE_DEVICE_TABLE(of, tps53679_of_match);
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 81b9d813655a..89753f004edb 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -16,7 +16,7 @@
>  #include "pmbus.h"
> 
>  enum chips {
> -   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
> +   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688, tps53685

Please retain numeric order.

>  };
> 
>  #define TPS53647_PAGE_NUM      1
> @@ -109,6 +109,31 @@ static int tps53679_identify_chip(struct
> i2c_client *client,
>     return 0;
>  }
> 
> +static int tps53685_identify_chip(struct i2c_client *client,
> +                 u8 revision)
> +{
> +   u8 buf[I2C_SMBUS_BLOCK_MAX];
> +   int ret;
> +
> +   ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
> +   if (ret < 0)
> +       return ret;
> +   if (ret != revision) {
> +       dev_err(&client->dev, "Unexpected PMBus revision 0x%x\n", ret);
> +       return -ENODEV;
> +   }
> +
> +   ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
> +   if (ret < 0)
> +       return ret;
> +
> +   if (strncmp("\x54\x49\x53\x68\x50\x00", buf, 6)) {

That is "TIShP" with a trailing '\0'. Please provide as text.
Also, the return length should be checked.

> +       dev_err(&client->dev, "Unexpected device ID: %s\n", buf);

The length of 'buf' is 32 bytes, and 32 bytes may be returned by the chip,
leaving the text unterminated. On top of that, there is no guarantee that
the chip 0-terminates its returned data, or that it is in text form
in the first place. This may result in unexpected output, meaning you can
not use %s here. I would suggest to use "%*ph" or similar.

> +       return -ENODEV;
> +   }
> +   return 0;
> +}
> +
>  /*
>   * Common identification function for chips with multi-phase support.
