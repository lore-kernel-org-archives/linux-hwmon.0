Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1881FC4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Oct 2022 13:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJONqL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Oct 2022 09:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiJONqK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Oct 2022 09:46:10 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAD851A3F
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 06:46:09 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id x6-20020a4ac586000000b0047f8cc6dbe4so2080144oop.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LLyA+1qhVbSL4HnJ9pPvCEkCaZDducb44wmgLrF/6rY=;
        b=qKkgpvA1ArjXm7CyGycl7zF+0EcnAqcPpZ55QGPDGWRMOVC/VVZ5sxcnXtyHcduQBk
         712/N81vNjxIs1V+D5qot1NtwlZ8fCvPDlzMRL1A6QUH72DVn0s+kzd9kXYgUZkus5Cf
         sNW18SlNuw/DowT9Zpagqf6I5PGoafMMp71e4mX7urMfBTb/qj6v/pcZzcE2YnAj0ND1
         JPTMZvSqyy2mLKCmIIIyFG5V2m6fVMzJWOHkAe1P07a6xpjHC6hCYHIDlSu/apCYFQy+
         8KiIRCKK3SND2M/hfEXmq+jusCRYLERuZlWvdgZktRhJHbYC1RH7wkIXf7+hlTy7O22T
         to/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLyA+1qhVbSL4HnJ9pPvCEkCaZDducb44wmgLrF/6rY=;
        b=B1NCWp46dEiQnQxvxQrsLbCcJw44qiSyoLr69+KZu5/3mOwpBloW2f9chhKqkmYPnW
         KthWBqkgcLtwcKcegfE5zHyFcPQlfFVmFtNiJoNu2oAPc3HcgsN0pwDWujtCU0Ld6es9
         Vaqs/r9PDd9KNZcwoYCqn0i2W9IZNsafbpmG/2LGpqC1NcCn61vUtb1b3XxEuTmwivk9
         UPfYitU1RZHZ7Q9kBz/Ce82EhffXpFqxjeZPIEekuFaGf8UTI1byaZBARGPsZQofZfYS
         95lH3u7Zq8KSh7dn7v7YMYzWIJRHMcDRBqrRZB/c6Q1cEkwU5woRzmLhA3euf9eYBiJK
         zhlQ==
X-Gm-Message-State: ACrzQf03KqGMWGghefEhmMqHlt/XxDycKbYE4aaTyTjdTNM3nt4AAsxi
        K67FCS4pgJ4azjCmbN2N6HU53F20OFU=
X-Google-Smtp-Source: AMsMyM6Zb1sy4Z08giEOwXsKyB+yH2e8HQXlm7lBtx5JKQcjO3cZ3mcC8ReI1kM8To4n0xQER6synQ==
X-Received: by 2002:a05:6820:168b:b0:476:2e4c:6cf1 with SMTP id bc11-20020a056820168b00b004762e4c6cf1mr1047630oob.69.1665841568610;
        Sat, 15 Oct 2022 06:46:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23-20020aca2117000000b00354efb5be11sm2271795oiz.15.2022.10.15.06.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:46:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <29c0182d-4676-ee3b-930a-fffaf67949ba@roeck-us.net>
Date:   Sat, 15 Oct 2022 06:46:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] hwmon: (it86) Create DMI matching table for various
 board settings
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20221015120110.1472074-1-frank@crawford.emu.id.au>
 <20221015120110.1472074-2-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
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

Just noticed: The subject of this patch is wrong. s/it86/it87/

Guenter

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
>   		err = it87_device_add(i, isa_address[i], &sio_data);
>   		if (err)
>   			goto exit_dev_unregister;

