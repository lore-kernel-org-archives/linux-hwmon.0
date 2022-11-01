Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384A6C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Nov 2022 14:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKAOhk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Nov 2022 10:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiKAOhk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2022 10:37:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEBF1B9D8
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Nov 2022 07:37:38 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso8571911otq.11
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Nov 2022 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyZQt0p2EDTdgzyz9Llq1rBCpL76qQPePjIezrAVLiI=;
        b=RHYmq1EUquS7Qz3UpcoYU06JsgSw/zGXKtxgWfOi16Ago104yw652+vcZeS+x9TTTm
         +dq7o538qWb9oL8ZEnM4KBABrNuoqxvnRPiwzoK5tKSzJz8zGak6Yx1QHLWNoURjj4c4
         nSnKMd8Xz4NiOiBM96z41ZqlRHk4KaSGHuhVEOtnxmHL5pJOW7AVJQ9QIRmQvjKgQeO3
         XzTgaJnTgx1aYYFcrmtFkE42Ja/1ScI8RBNBMgArnwr+mm+POW9qB2LilM+4Mnap383k
         AYqn1n+hYNZTOqrCxQ1r33s8ElHcPnXgNNJLFOlyZgeZFmZr1IxPrZs3WMuVa0bcUZRF
         5I+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyZQt0p2EDTdgzyz9Llq1rBCpL76qQPePjIezrAVLiI=;
        b=Q5ZhK6JaQ/BsZRWp0YJO3Ek5VJmseHzciPLZXsmojZlgT28Elz/YI7bTLkG3rOiVCO
         JjeE1Jho52EMZ4Ip9hajrMyWw/u1dAKCKfBx9JxnH8aEHcE603LKz6Wyw+EWEs4Fe+RD
         tvOfZLlBs2c1VhF2RUS8d5t7jKYy4+ELObTUBkODXogaetoyg+m/8wy0bBWoHH9OuDfE
         qMsZWNnXe4DjWbs0cG6GTjeRx/l+fOhbGc0CZSwcCtHq/oI8mWG3vQuOywLyNOIFghrI
         ZBWTsRMxYjgIlTQuDXNiTyEqXU5+6OSWTFNIb82g0mgxMpm5DlE+NhPszEMDDhz5DUDO
         QlDQ==
X-Gm-Message-State: ACrzQf3xwfXtv/QbcE2xI6v9JsTHrCIGJaHGGViDIAHqlvTl2huPzI81
        BAbDwgfZ1oJdZAgmq2+4SDvZzP0lzCI=
X-Google-Smtp-Source: AMsMyM4ISITe97GR3JCk6gbmqHlEt1lPri1N5P964wujbF4HP3OAKfiDJWPC/GNR5tbDdBY4HcqOOQ==
X-Received: by 2002:a05:6830:1012:b0:66c:6237:e6e4 with SMTP id a18-20020a056830101200b0066c6237e6e4mr3516045otp.72.1667313458004;
        Tue, 01 Nov 2022 07:37:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r84-20020acaa857000000b00359d1b125bdsm3425529oie.37.2022.11.01.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 07:37:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 1 Nov 2022 07:37:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (it87) Add DMI table for future extensions
Message-ID: <20221101143736.GA1311791@roeck-us.net>
References: <20221030083841.3433967-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030083841.3433967-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 30, 2022 at 07:38:41PM +1100, Frank Crawford wrote:
> Changes in this patch set:
> 
> * Define the DMI matching table for board specific settings during the
>   chip initialisation and move the only current board specific setting
>   to this new table.
> 
> * Export the table for use by udev.
> 
> v2: updates following comments:
> 
> * Converted to use callback function.
> 
> * Moved call to callback funtion to sio_data into it87_find in line
>   with other settings for sio_data.  This requires dmi_data also passed
>   to access additional data.
> 
> * Added macro for defining entries in DMI table to simplify future 
>   additions.
> 
> * Note dmi_data is defined in sm_it87_init to simplify tests and for
>   future additions.
> 
> v3: further updates following comments:
> 
> * Proper use of callback functions for DMI functions.  This also
>   involves saving dmi_data in a static variable for use as required.
> 
> * Moved to dmi_check_system() for testing DMI table.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 73ed21ab325b..6eac15a5f647 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -567,6 +567,14 @@ struct it87_data {
>  	s8 auto_temp[NUM_AUTO_PWM][5];	/* [nr][0] is point1_temp_hyst */
>  };
>  
> +/* Board specific settings from DMI matching */
> +struct it87_dmi_data {
> +	u8 skip_pwm;		/* pwm channels to skip for this board  */
> +};
> +
> +/* Global for results from DMI matching, if needed */
> +static struct it87_dmi_data *dmi_data = NULL;
> +

static variables do not need to be initialized with NULL/0.

>  static int adc_lsb(const struct it87_data *data, int nr)
>  {
>  	int lsb;
> @@ -2393,7 +2401,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  {
>  	int err;
>  	u16 chip_type;
> -	const char *board_vendor, *board_name;
>  	const struct it87_devices *config;
>  
>  	err = superio_enter(sioaddr);
> @@ -2812,24 +2819,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  	if (sio_data->beep_pin)
>  		pr_info("Beeping is supported\n");
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
> +	/* Set values based on DMI matches */
> +	if (dmi_data && dmi_data->skip_pwm)
> +		sio_data->skip_pwm |= dmi_data->skip_pwm;

The second condition is unnecessary. If dmi_data->skip_pwm is 0 the |=
won't do anything.

>  
>  exit:
>  	superio_exit(sioaddr);
> @@ -3307,6 +3299,46 @@ static int __init it87_device_add(int index, unsigned short address,
>  	return err;
>  }
>  
> +/* callback function for DMI */
> +static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
> +{
> +	dmi_data = dmi_entry->driver_data;
> +
> +	if (dmi_data && dmi_data->skip_pwm)

A dmi entry without dmi_data would be pointless, or am I missing
something ? That means that checking for dmi_data should be unnecessary
because it should always be set (and anyone trying to add an entry into
the match table without it would learn quickly that it does not
work).

> +		pr_info("Disabling pwm2 due to hardware constraints\n");
> +
> +	return 1;
> +}
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
> +#define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
> +	{ \
> +		.callback = cb, \

Do you envison more than one callback function ? Because if not
the above could just point to it87_dmi_cb directly.

> +		.matches = { \
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor), \
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
> +		}, \
> +		.driver_data = data, \
> +	}
> +
> +static const struct dmi_system_id it87_dmi_table[] __initconst = {
> +	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", &it87_dmi_cb, &nvidia_fn68pt),

The callback function does not need a &

> +	{ }
> +
> +};
> +MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
> +
>  static int __init sm_it87_init(void)
>  {
>  	int sioaddr[2] = { REG_2E, REG_4E };
> @@ -3319,6 +3351,8 @@ static int __init sm_it87_init(void)
>  	if (err)
>  		return err;
>  
> +	dmi_check_system(it87_dmi_table);
> +
>  	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
>  		memset(&sio_data, 0, sizeof(struct it87_sio_data));
>  		isa_address[i] = 0;
> -- 
> 2.37.3
> 
