Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA5C77B7E
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 May 2023 15:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbjEYP3W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 May 2023 11:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjEYP3V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 May 2023 11:29:21 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807BB99
        for <linux-hwmon@vger.kernel.org>; Thu, 25 May 2023 08:29:19 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ae3fe67980so14508805ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 May 2023 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685028559; x=1687620559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0IpM0KTMUWs+XuGaIV6G6Pmegxcx0rG9VrATQ4P/Yo=;
        b=CYwqCVq+QOdRIv6NMwUsNslNbPolh7+6FbzvKQYNvTuuEvluxm899g8wVUxmsQ0NOk
         3vFZfK3UHgCaMy5iH0VN6L6Y38DSqUI9U4kWgOPyCt/+Z2oeJZkv3KM3nPmT9NUck1Gr
         z8sQV5uPvne5eI0ngGgOmCs1a1EEAvg76qeIfsBxYHoSaYFtYOggXkNm9fS8Fw5rMWnq
         HBayjUgWbWIu+hpZso+w8TjRxkMhSbj4CVhc7ODniSp2KpdOlOE/F/v2a4yiEL9DWLRK
         pP/KyR+TCvvLQfuDVEvKi4YYg3dzeEH4FCUZl7T6kOop66eqV/dCnKP14PSuyuS0Jugd
         u44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028559; x=1687620559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0IpM0KTMUWs+XuGaIV6G6Pmegxcx0rG9VrATQ4P/Yo=;
        b=jZNloiu5pEplB/bqZ4TSF3torTKzb27J1U3JbIkCj/ziAWLcZnsEZJRzD33ARbiE53
         euM7DSPyO9EZjSOpDVXQa7xM38gIwBJTeSEoXuc/FjGgXbfmfoBqXeQUeIHqHVIGBE2w
         m0ox5NLwEyuFyvtezt7PBLFvG+cso/XgXLmJ3ulAU9YtGwFZ5iAL7QfCefcGdAa5o/zL
         APHwvxji4eaETt8lIYYgo/2xvGTKjr6OpNyO+3Y02lR0hFGZQV/q8ga91byih2Lo/Z71
         xlDrVzDmxs3uS6ffPI7h9HwATM8ihiU8nq8xixz0K9jEAeZ/If0cITiThVYe7TrWzoKp
         vmFA==
X-Gm-Message-State: AC+VfDyqemHSSPqWITprb/FGigEE60r6X1uicy42DmF0amOKKSeX91Wu
        aTuTcmI7Zs/cNY8EFceUHfRXmmIXZ4Y=
X-Google-Smtp-Source: ACHHUZ5j4CFKp2VFtR1vu1PJCblOST24rT6VFWko4n6CNKzDaNkPBjLeCcytiiNV/oF6jgWBEli51w==
X-Received: by 2002:a17:902:ecc8:b0:1ae:5fb0:4256 with SMTP id a8-20020a170902ecc800b001ae5fb04256mr2538097plh.57.1685028558914;
        Thu, 25 May 2023 08:29:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b001a285269b70sm1550947plh.280.2023.05.25.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 08:29:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 25 May 2023 08:29:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: (it87) Generalise support for FAN_CTL
 ON/OFF
Message-ID: <da9eeb29-c56a-4abb-abe9-369e745201ea@roeck-us.net>
References: <20230507104106.1808726-1-frank@crawford.emu.id.au>
 <20230507104106.1808726-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507104106.1808726-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, May 07, 2023 at 08:41:05PM +1000, Frank Crawford wrote:
> Add feature flag FEAT_FANCTL_ONOFF for chips that support configuration
> bits for management of fan control off.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

This patch would leave the driver broken until the next patch is applied,
which is a no-go.

You have a number of options:

- Negate the flag and apply it to 8603 only to minimize the changes,
  and make all changes in a single patch.
- Split the two patches into three, first to introduce the flag,
  then apply it to affected chips, then make the actual code
  changes.
- Combine the two patches into one.

Guenter

> ---
>  drivers/hwmon/it87.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 4c3641d28a6a..6fa9e928177e 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -320,6 +320,7 @@ struct it87_devices {
>  #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
>  #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
>  #define FEAT_FOUR_TEMP		BIT(22)
> +#define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
>  
>  static const struct it87_devices it87_devices[] = {
>  	[it87] = {
> @@ -534,6 +535,7 @@ static const struct it87_devices it87_devices[] = {
>  #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
>  #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
>  						     FEAT_10_9MV_ADC))
> +#define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
>  
>  struct it87_sio_data {
>  	int sioaddr;
> @@ -1240,11 +1242,12 @@ static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
>  
>  static int pwm_mode(const struct it87_data *data, int nr)
>  {
> -	if (data->type != it8603 && nr < 3 && !(data->fan_main_ctrl & BIT(nr)))
> -		return 0;				/* Full speed */
> +	if (has_fanctl_onoff(data) && nr < 3 &&
> +	    !(data->fan_main_ctrl & BIT(nr)))
> +		return 0;			/* Full speed */
>  	if (data->pwm_ctrl[nr] & 0x80)
> -		return 2;				/* Automatic mode */
> -	if ((data->type == it8603 || nr >= 3) &&
> +		return 2;			/* Automatic mode */
> +	if ((!has_fanctl_onoff(data) || nr >= 3) &&
>  	    data->pwm_duty[nr] == pwm_to_reg(data, 0xff))
>  		return 0;			/* Full speed */
>  
> @@ -1481,7 +1484,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
>  		return err;
>  
>  	if (val == 0) {
> -		if (nr < 3 && data->type != it8603) {
> +		if (nr < 3 && has_fanctl_onoff(data)) {
>  			int tmp;
>  			/* make sure the fan is on when in on/off mode */
>  			tmp = it87_read_value(data, IT87_REG_FAN_CTL);
> @@ -1521,7 +1524,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
>  		data->pwm_ctrl[nr] = ctrl;
>  		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
>  
> -		if (data->type != it8603 && nr < 3) {
> +		if (has_fanctl_onoff(data) && nr < 3) {
>  			/* set SmartGuardian mode */
>  			data->fan_main_ctrl |= BIT(nr);
>  			it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
