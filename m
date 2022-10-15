Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DCBC4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Oct 2022 12:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiJOM15 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Oct 2022 08:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiJOM14 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Oct 2022 08:27:56 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7B31DA65
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:27:55 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id g10so7671399oif.10
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5GyPR4fvFFV5EqaI9WjNyQYT4TpiVVdKumHKVMAmU0=;
        b=KRluPYzLDd1nTRRCD3y37B0/ZuEFMNBwKM4svwE7SYhit+LYewmbrpJ311iOKkYqHa
         3l+KON3AbZGtWq28+8f+60tFiWQGoi3H9HkAmGq5kHwWpT0P8pktRCPxb62tQilbe1nk
         v6Oi3EIXDhiIqbWvlvxQqek7ikSdgpEr1scyoiQmzETivruEo2S/MlLx5WVW3CAEmpaG
         ncvAOA0yYHnNK2BMq8FPmxUCjuVK3CG8Qb+WcEGdQ86QaETO9yj2Kbr82nPxVQu5sL6O
         tylpLP8vREB/dhHqgrtr4iFIV019h43d6xet0EHVlSp9R0bi3Sk7KRifvqMUvfSzWiuu
         /uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5GyPR4fvFFV5EqaI9WjNyQYT4TpiVVdKumHKVMAmU0=;
        b=3EO5NFXkzvKYGrvjOdOSwxebywhxXhZ4I0qVaw1p473h4iAcaSLeQqg78tqCTrfabx
         CpmGi305YitKmn6ofa1WSIVjwxCtIGGolfrSUksw6TYkc/7kI9DkDrsYlfxf9eydI/j7
         8eo4VKK1xY2k5pkNp/2QYGllpjRNodw5wkaAF6H6Vauj0gjycDLeRKRPkrJyDBL3dpSk
         OdX3Pi7GckLPCfUiKXnwMY/RGTg7oSLYrrW2YlgY61T7aL2mL3VnswHw2HbFEEYhleYn
         xaPqtPpgVB1mzniLeUMb3wIsgnJB4+4c6UcidxKygDUuyH6siGJ50lwIvx9cogWC2SUa
         +Zvg==
X-Gm-Message-State: ACrzQf0Okm+rV3FawkOl7Sq4IRJtbj6HFa9qF2R6yJ+LWzztIc9C1dUK
        DyB7c6rnhZ7VvoHSnEPdfEIM/OuocHw=
X-Google-Smtp-Source: AMsMyM594VWW+6SnVcaAdnYaNrZUragzrDXGHsTXgCAD+TOTlpvbXiDPGsORW/D8CaniXKONL6xplw==
X-Received: by 2002:aca:5956:0:b0:351:22fe:6de8 with SMTP id n83-20020aca5956000000b0035122fe6de8mr1054820oib.97.1665836874855;
        Sat, 15 Oct 2022 05:27:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n32-20020a056870242000b0012796e8033dsm2556679oap.57.2022.10.15.05.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 05:27:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d63f9154-4bb9-8578-43c4-6adb083636ff@roeck-us.net>
Date:   Sat, 15 Oct 2022 05:27:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20221015120110.1472074-1-frank@crawford.emu.id.au>
 <20221015120110.1472074-2-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/1] hwmon: (it86) Create DMI matching table for various
 board settings
In-Reply-To: <20221015120110.1472074-2-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/15/22 05:01, Frank Crawford wrote:
> Define the DMI matching table for board specific settings during the
> chip initialisation and move the only current board specific setting
> to this new table.
> 
> Export the table for use by udev.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>   drivers/hwmon/it87.c | 57 ++++++++++++++++++++++++++++----------------
>   1 file changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 7bd154ba351b..b83ef7c89095 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2389,7 +2389,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   {
>   	int err;
>   	u16 chip_type;
> -	const char *board_vendor, *board_name;
>   	const struct it87_devices *config;
>   
>   	err = superio_enter(sioaddr);
> @@ -2802,25 +2801,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	if (sio_data->beep_pin)
>   		pr_info("Beeping is supported\n");
>   
> -	/* Disable specific features based on DMI strings */
> -	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> -	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> -	if (board_vendor && board_name) {
> -		if (strcmp(board_vendor, "nVIDIA") == 0 &&
> -		    strcmp(board_name, "FN68PT") == 0) {
> -			/*
> -			 * On the Shuttle SN68PT, FAN_CTL2 is apparently not
> -			 * connected to a fan, but to something else. One user
> -			 * has reported instant system power-off when changing
> -			 * the PWM2 duty cycle, so we disable it.
> -			 * I use the board name string as the trigger in case
> -			 * the same board is ever used in other systems.
> -			 */
> -			pr_info("Disabling pwm2 due to hardware constraints\n");

This info message gets lost.

> -			sio_data->skip_pwm = BIT(1);
> -		}
> -	}
> -
>   exit:
>   	superio_exit(sioaddr);
>   	return err;
> @@ -3295,14 +3275,48 @@ static int __init it87_device_add(int index, unsigned short address,
>   	return err;
>   }
>   
> +struct it87_dmi_data {
> +	u8 skip_pwm;		/* pwm channels to skip for this board  */
> +};
> +
> +/*
> + * On the Shuttle SN68PT, FAN_CTL2 is apparently not
> + * connected to a fan, but to something else. One user
> + * has reported instant system power-off when changing
> + * the PWM2 duty cycle, so we disable it.
> + * I use the board name string as the trigger in case
> + * the same board is ever used in other systems.
> + */
> +static struct it87_dmi_data nvidia_fn68pt = {
> +	.skip_pwm = BIT(1),
> +};
> +
> +static const struct dmi_system_id it87_dmi_table[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "nVIDIA"),
> +			DMI_MATCH(DMI_BOARD_NAME, "FN68PT"),
> +		},
> +		.driver_data = &nvidia_fn68pt,

Maybe add a callback function and have it display the info message.
Using a callback function may make it easier to add functionality
needed for other boards. Hard to say, though, since it depends on
what is coming next.

> +	},
> +	{ }
> +
> +};
> +MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
> +
>   static int __init sm_it87_init(void)
>   {
> +	const struct dmi_system_id *dmi = dmi_first_match(it87_dmi_table);
> +	struct it87_dmi_data *dmi_data = NULL;
>   	int sioaddr[2] = { REG_2E, REG_4E };
>   	struct it87_sio_data sio_data;
>   	unsigned short isa_address[2];
>   	bool found = false;
>   	int i, err;
>   
> +	if (dmi)
> +		dmi_data = dmi->driver_data;
> +

dmi_data is really unnecessary. Might just check for dmi below and
dereference there if not NULL.

>   	err = platform_driver_register(&it87_driver);
>   	if (err)
>   		return err;
> @@ -3320,6 +3334,9 @@ static int __init sm_it87_init(void)
>   		if (i && isa_address[i] == isa_address[0])
>   			break;
>   
> +		if (dmi_data)
> +			sio_data.skip_pwm |= dmi_data->skip_pwm;
> +

Personally I would prefer a solution which does not require extra code here,
but I don't know a good one. The only means for the callback function to return
data to here seems to be through static variables. Any idea what else is coming ?
One option might be to keep a global copy of sio_data (eg it87_sio_data),
initialize it from the dmi callback function, and use
		sio_data = it87_sio_data;
instead of memset() to initialize it.

Thanks,
Guenter

>   		err = it87_device_add(i, isa_address[i], &sio_data);
>   		if (err)
>   			goto exit_dev_unregister;

