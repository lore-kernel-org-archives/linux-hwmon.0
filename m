Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9329BC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 14:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKEOAO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 10:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiKEOAO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 10:00:14 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF2920BE9
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 07:00:13 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so4150966otu.7
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Nov 2022 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjGT/pxNYdAxHeKh4v7SZ0c38kp9YfMCrNIjdNFi1AU=;
        b=F3CyyGpzNfFSH/g9wfNsqpSAqBYJl3zRTcM7rjjX5ZfyXXQML1EcbFDKuwam9MVZfC
         3CJ/lfzVbfphon+3AT3PsE47ShD05fGsGBgKyYkIu5Aq/w0tgft1NiFzthUyTgEpLVj1
         UAAESzfil0ShtaDfNioXucvB/OpsyGld9YbUbgpIOVCZMI4q14DV2yD7rGR++iv7G4YE
         kABYWyJU27mFfnjTNPFCYNab0mpKTacs7QSn+W9PUFAdXv0RjrWFsR61xN9dyLCb6xD4
         xbLLqv7Dyg6/9ornVrB/LdC8NuqwnTZKe/LE1hsDs9BjMeezLTndMfJHoBzR0pltn3IW
         LbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjGT/pxNYdAxHeKh4v7SZ0c38kp9YfMCrNIjdNFi1AU=;
        b=bsxEYS3Y6s/yfk4cXgXX+AHTNo+3xWVJunEzYBgXX7qL2I2KuhORmz3WUwFQlPhsap
         5P3k9mKrrIFFOp7wtnGPAR4HVYHIfb6ZsVWsPw6nSJK17STO314slE0B1R58WloxaGVy
         rJtQwaCDIWgqXhrnL7gDvSb1qv11qqFGfAaB88lLbg0FzY66Tg4vhAkhM419HEUMndmP
         BNbvFQaU3PSVNyg9i+wrF0VqWHoGoS1WGybkL0ui1ucJfE2aTFCiINCrNlBItektFS5J
         Zm2HEeYC91VDYgt0yDHh4gpeGlvXaFv3m8hHsTrOpVXITEPj6A/T4HnMDuVe+ZlQu88q
         37Sg==
X-Gm-Message-State: ACrzQf1T9X1oEK1u3ccC/Bw1QUuycjztrwDqYxcfYbgslliNYrtk7USV
        vxLRtY385hiZ3aj0xdpnQBU=
X-Google-Smtp-Source: AMsMyM5LQdmz6m24u7VFYq0lu5CjiVM1eN8qd79/gct7WVLKaGYgkAKHL3bJow36baOrWlpdPh0l5w==
X-Received: by 2002:a9d:4917:0:b0:661:bdc6:46a with SMTP id e23-20020a9d4917000000b00661bdc6046amr19989383otf.122.1667656812484;
        Sat, 05 Nov 2022 07:00:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x66-20020a9d20c8000000b00661a05691fasm845794ota.79.2022.11.05.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:00:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 5 Nov 2022 07:00:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/1] hwmon: (it87) Add DMI table for future extensions
Message-ID: <20221105140008.GA1606271@roeck-us.net>
References: <20221105045754.1439809-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105045754.1439809-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 05, 2022 at 03:57:54PM +1100, Frank Crawford wrote:

Description got lost, and the change log should be after '---'.
Otherwise looks good.

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
> v4: further cleanups following comments
> 
> * Note the macro IT87_DMI_MATCH_VND includes callback argument for use
>   by a future update.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 73ed21ab325b..9997f76b1f4a 100644
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
> +static struct it87_dmi_data *dmi_data;
> +
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
> +	if (dmi_data)
> +		sio_data->skip_pwm |= dmi_data->skip_pwm;
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
> +		.matches = { \
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor), \
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
> +		}, \
> +		.driver_data = data, \
> +	}
> +
> +static const struct dmi_system_id it87_dmi_table[] __initconst = {
> +	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
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
> 2.38.1
> 
