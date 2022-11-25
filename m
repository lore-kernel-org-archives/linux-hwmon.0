Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9513C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Nov 2022 15:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKYPpU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Nov 2022 10:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiKYPpN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Nov 2022 10:45:13 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E90346672;
        Fri, 25 Nov 2022 07:45:12 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-13bd2aea61bso5632148fac.0;
        Fri, 25 Nov 2022 07:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qoc8a9uTe+h3RoaDiypNi6chRC1rLmrrHQjfRNQj5SA=;
        b=iQ9e884gyeLQs0h7zW5aq7Cb4LdGBCcE9qLh2O+wJGbKZHlcWmh7RsuA2QFJuuKutS
         h5bf529jyvmOW60C674PTunRrA33eLWQzFqFTP5BN6IzVmERBmL5/54SbBnAkCql1b+q
         5omK8T7YWHfXZJeOO2lzv/NBPFW8rM7XTF++4OrKUBDsF1A5zNebiaQkAwFd3xNwK8hU
         8byupVeuDhcvZogVpOuMcpaWNLfplKWH06I5Nta+8mjABytevykLWq4L6cJKM6Q0scfS
         GCb0xDv/EJPb0c/nb+B6A3L1AGBISx5UbXGZ7ya1etwGP+NPbiJEXO1dlYdCKDX3u3zR
         x95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qoc8a9uTe+h3RoaDiypNi6chRC1rLmrrHQjfRNQj5SA=;
        b=C0GXbsvV4TospzHVFNadfsMLgUNQgrrV1xue7yMeWh6l8YVX5vVaC59AfcLe2mrABb
         FETD3faqibLWJItbJD+FzV1++jFxpjPM66rjSoBLgjwc+MhBxwFcvHscx3ex5kPgA17N
         M8eVl/bMCaVFv2avkidSahyxp4E8XWOcnRC7jrT8RKYUtSsa4afDqlseBJabocdmNKD+
         wrxeZtZAgmv9wwLLorgb8/VjmPXp2yJb6TyHElWqnKHTh0WbIvcQ6MeIgYgfop75eFbL
         3QKakEk+AwnQq3rT7RsKv9auz94k6fjUQmibYpEGlWMhO2FVIsic+PB55lIKCEFUxAi0
         b89g==
X-Gm-Message-State: ANoB5plptD3kxd9iiZXgM/IawIJecLb9gQAR7YXsMcneLS2NKHopfod8
        Mn5M9ap14GGVy0hJKrhyLEmtSW20ZLk=
X-Google-Smtp-Source: AA0mqf7h+JhwolkoO0n3BcpoYVimgkjuGHagbJyOXuNcwFewosL60wY5ef/gDmymkYoxgWODBhVffg==
X-Received: by 2002:a05:6870:e8f:b0:143:6465:31db with SMTP id mm15-20020a0568700e8f00b00143646531dbmr3474067oab.79.1669391111078;
        Fri, 25 Nov 2022 07:45:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r14-20020a056870178e00b00130e66a7644sm2225545oae.25.2022.11.25.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:45:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Nov 2022 07:45:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v2] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
Message-ID: <20221125154509.GA1169236@roeck-us.net>
References: <20221125114901.11309-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125114901.11309-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 25, 2022 at 08:49:01AM -0300, Joaquín Ignacio Aramendía wrote:
> Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
> DMI strings are added to this driver since the same EC layout is used and
> has similar specs as the OXP mini AMD.
> 
> The added devices are:
> - OneXPlayer mini PRO (AMD 6800U)
> - AOK ZOE A1 (AMD 6800U)
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Dropped v1 and applied v2.

Guenter

> ---
> Corrected commit message (AOK ZOE description)
> Removed unhelpful dev_info message
> ---
>  Documentation/hwmon/oxp-sensors.rst | 16 +++++++++---
>  drivers/hwmon/oxp-sensors.c         | 40 ++++++++++++++++++++++++-----
>  2 files changed, 47 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
> --
> 2.38.1
> 
> diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
> index f612dddc964a..39c588ec5c50 100644
> --- a/Documentation/hwmon/oxp-sensors.rst
> +++ b/Documentation/hwmon/oxp-sensors.rst
> @@ -12,9 +12,19 @@ Description:
>  One X Player devices from One Netbook provide fan readings and fan control
>  through its Embedded Controller.
> 
> -Currently only supports AMD boards from the One X Player lineup. Intel boards
> -could be supported if we could figure out the EC registers and values to write
> -to since the EC layout and model is different.
> +Currently only supports AMD boards from the One X Player and AOK ZOE lineup.
> +Intel boards could be supported if we could figure out the EC registers and
> +values to write to since the EC layout and model is different.
> +
> +Supported devices
> +-----------------
> +
> +Currently the driver supports the following handhelds:
> +
> + - AOK ZOE A1
> + - OneXPlayer AMD
> + - OneXPlayer mini AMD
> + - OneXPlayer mini AMD PRO
> 
>  Sysfs entries
>  -------------
> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> index da54a38f4454..a2bfcf3f9909 100644
> --- a/drivers/hwmon/oxp-sensors.c
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -3,13 +3,14 @@
>   * Platform driver for OXP Handhelds that expose fan reading and control
>   * via hwmon sysfs.
>   *
> - * All boards have the same DMI strings and they are told appart by the
> + * Old boards have the same DMI strings and they are told appart by the
>   * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
>   * but the code is made to be simple to add other handheld boards in the
>   * future.
> - * Fan control is provided via pwm interface in the range [0-255]. AMD
> - * boards use [0-100] as range in the EC, the written value is scaled to
> - * accommodate for that.
> + * Fan control is provided via pwm interface in the range [0-255].
> + * Old AMD boards use [0-100] as range in the EC, the written value is
> + * scaled to accommodate for that. Newer boards like the mini PRO and
> + * AOK ZOE are not scaled but have the same EC layout.
>   *
>   * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
>   */
> @@ -39,16 +40,39 @@ static bool unlock_global_acpi_lock(void)
>  	return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
>  }
> 
> +enum oxp_board {
> +	aok_zoe_a1 = 1,
> +	oxp_mini_amd,
> +	oxp_mini_amd_pro,
> +};
> +
> +static enum oxp_board board;
> +
>  #define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
>  #define OXP_SENSOR_PWM_ENABLE_REG	0x4A /* PWM enable is 1 register long */
>  #define OXP_SENSOR_PWM_REG		0x4B /* PWM reading is 1 register long */
> 
>  static const struct dmi_system_id dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> +		},
> +		.driver_data = (void *) &(enum oxp_board) {aok_zoe_a1},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
>  		},
> +		.driver_data = (void *) &(enum oxp_board) {oxp_mini_amd},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER Mini Pro"),
> +		},
> +		.driver_data = (void *) &(enum oxp_board) {oxp_mini_amd_pro},
>  	},
>  	{},
>  };
> @@ -137,7 +161,8 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
>  			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
>  			if (ret)
>  				return ret;
> -			*val = (*val * 255) / 100;
> +			if (board == oxp_mini_amd)
> +				*val = (*val * 255) / 100;
>  			return 0;
>  		case hwmon_pwm_enable:
>  			return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
> @@ -166,7 +191,8 @@ static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
>  		case hwmon_pwm_input:
>  			if (val < 0 || val > 255)
>  				return -EINVAL;
> -			val = (val * 100) / 255;
> +			if (board == oxp_mini_amd)
> +				val = (val * 100) / 255;
>  			return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
>  		default:
>  			break;
> @@ -216,6 +242,8 @@ static int oxp_platform_probe(struct platform_device *pdev)
>  	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>  		return -ENODEV;
> 
> +	board = *((enum oxp_board *) dmi_entry->driver_data);
> +
>  	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
>  						     &oxp_ec_chip_info, NULL);
