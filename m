Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56E8C77B75
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 13:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjESNoO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 09:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjESNoN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 09:44:13 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4EABB
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:44:11 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ae452c2777so6582765ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684503850; x=1687095850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flZYUFrQa1G+ajNcjv7M8ohgaFNaDyCQm2DQQNtCRqk=;
        b=g0NEHCfXzAA/GyVkYM17ePcTU/VWPG+diYOd2n/WWqE+i2Flda2ZK13yquHRm3fTWg
         Z40mfEdx4A0YjwttLOKPWPYdgLR7OBfXZpWgUu2hNuZ3I+p8UX4lXR4RGG+6mUO88Y8S
         xVh57B02gDv3xwfnKdyma3XIdbNigSYsHuqdlo7ZMydEXgvEnodUBk9I63Lalwujii/c
         PWRFqN/fsOSDOM9VRPA+IeHXffVzk3Oz6AmhNnYmqDwmR6rkehaYTVe1kMLgz2nLF4sY
         MNPBD0NDwmh9lrUylyH3WzaF+jE/kcuU4gaNNDKJEzhrAPMSsZb3bQAXsq8FxSyx0ifN
         tgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684503850; x=1687095850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flZYUFrQa1G+ajNcjv7M8ohgaFNaDyCQm2DQQNtCRqk=;
        b=FzOW3M4h9o3gyGy3MwGEWYXsni372L8DhPoM7j4G3KJkimTF9pMg2w6k/OqM2BiPjp
         jw87H45seI2jrjPfeVwHk8qFzHjigeeHzyLGZCsbilTLHpcHieeeNlM6J4Uw1H3XuiKL
         4FtQeivM3EwKTvCDbq0pn9zgM16QIXp6Ayf6lYhsSTwWOH+CpMF7tO+ajuGBWotgh7zx
         ZNRc4reKohvnKj9XtHqhxfo9eak95kGvRQV+bV/dyQ8bUlZWzhdOWB6wcqellWfQbMd3
         ACj+05eenpwefzGX3ff88k/dGLwZPwFy9fkAhCL2ew6yKvo8Urjq8EttHk2cj8oL9/OB
         NP7g==
X-Gm-Message-State: AC+VfDyLxOba5NpsNutvv2pEAK+D7O4y/M8PEOgr4kLM4m5mN1oSlM63
        i3Z41yil66a86OI9KcSkYTr9zNcDBMU=
X-Google-Smtp-Source: ACHHUZ4BkHEU3QMTrg+IchvJBbaNIHS2zx8xmXbsIk1nOm11oc1+BNZKcMpT2pd2jS+yFdhQxDuYnw==
X-Received: by 2002:a17:902:d4c2:b0:1a9:6604:2b1b with SMTP id o2-20020a170902d4c200b001a966042b1bmr2724105plg.20.1684503850582;
        Fri, 19 May 2023 06:44:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902edc700b001ae0b373382sm3448448plk.198.2023.05.19.06.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:44:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 May 2023 06:44:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kirill Yatsenko <kiriyatsenko@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com, jcdra1@gmail.com
Subject: Re: [PATCH 3/3] hwmon: (aht10) Add support for compatible aht20
Message-ID: <dbc4cf0f-1cd7-4294-976c-e1a718cc896a@roeck-us.net>
References: <20230511202633.299174-1-kiriyatsenko@gmail.com>
 <20230511202633.299174-3-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511202633.299174-3-kiriyatsenko@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 11, 2023 at 10:26:33PM +0200, Kirill Yatsenko wrote:
> Add support for compatible AHT20 temperature/humidity sensor. The only
> software difference between the two is that AHT20 has additional crc8
> byte.
> 
> It seems like AHT15 is also supported by the driver but it wasn't
> verified and tested yet.
> 
> Tested on Beaglebone black rev C.
> 
> Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
> ---
>  Documentation/hwmon/aht10.rst | 20 +++++++++----
>  drivers/hwmon/Kconfig         | 11 +++++--
>  drivers/hwmon/aht10.c         | 54 ++++++++++++++++++++++++++++-------
>  3 files changed, 68 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/hwmon/aht10.rst b/Documentation/hwmon/aht10.rst
> index 4e198c5eb683..213644b4ecba 100644
> --- a/Documentation/hwmon/aht10.rst
> +++ b/Documentation/hwmon/aht10.rst
> @@ -5,32 +5,42 @@ Kernel driver aht10
>  
>  Supported chips:
>  
> -  * Aosong AHT10
> +  * Aosong AHT10/AHT20
>  
>      Prefix: 'aht10'
>  
>      Addresses scanned: None
>  
> -    Datasheet:
> +    Datasheet(AHT10):
>  
>        Chinese: http://www.aosong.com/userfiles/files/media/AHT10%E4%BA%A7%E5%93%81%E6%89%8B%E5%86%8C%20A3%2020201210.pdf
>        English: https://server4.eca.ir/eshop/AHT10/Aosong_AHT10_en_draft_0c.pdf
>  
> +    Datasheet(AHT20):
> +
> +      English: http://www.aosong.com/userfiles/files/media/Data%20Sheet%20AHT20.pdf
> +
>  Author: Johannes Cornelis Draaijer <jcdra1@gmail.com>
>  
>  
>  Description
>  -----------
>  
> -The AHT10 is a Temperature and Humidity sensor
> +The AHT10/AHT20 is a Temperature and Humidity sensor
>  
>  The address of this i2c device may only be 0x38
>  
> +Special Features
> +----------------
> +
> +AHT20 has additional CRC8 support which is sent as the last byte of the sensor
> +values.
> +
>  Usage Notes
>  -----------
>  
> -This driver does not probe for AHT10 devices, as there is no reliable
> -way to determine if an i2c chip is or isn't an AHT10. The device has
> +This driver does not probe for AHT10/ATH20 devices, as there is no reliable
> +way to determine if an i2c chip is or isn't an AHT10/AHT20. The device has
>  to be instantiated explicitly with the address 0x38. See
>  Documentation/i2c/instantiating-devices.rst for details.
>  
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index fc640201a2de..ccb295312102 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -255,15 +255,22 @@ config SENSORS_ADT7475
>  	  will be called adt7475.
>  
>  config SENSORS_AHT10
> -	tristate "Aosong AHT10"
> +	tristate "Aosong AHT10, AHT20"
>  	depends on I2C
>  	help
> -	  If you say yes here, you get support for the Aosong AHT10
> +	  If you say yes here, you get support for the Aosong AHT10 and AHT20
>  	  temperature and humidity sensors
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called aht10.
>  
> +config SENSORS_AHT20_CRC
> +	bool "Aosong AHT20 crc8 check"
> +	depends on SENSORS_AHT10
> +	select CRC8
> +	help
> +	  If you say yes here, you get support for the Aosong AHT20 CRC8 check
> +

This is not an appropriate configuration flag. aht20 needs to be added
to aht10_id, and the code needs to use a flag in driver data (struct
aht10_data) to determine if the crc check needs to be applied or not.
There must be no related ifdefs in the code.

Guenter
