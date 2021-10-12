Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734FFC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5291E610C9
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237251AbhJLO15 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236695AbhJLO14 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:27:56 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9B0C06161C;
        Tue, 12 Oct 2021 07:25:54 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k2-20020a056830168200b0054e523d242aso16560229otr.6;
        Tue, 12 Oct 2021 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8dhO4iKJgpntkSBg2CwwF2girkJ/DIoq3G4792Lm7Pw=;
        b=m+3urIRZDUaPFt4YAqHZzlAf2Co2G1/u3NpnpQNYHGV0cvqbdmaK/wdBGa5lZP/DmE
         4whR0NZozjxw8+d6DvFB7E2N/HQPiXIc08eIZvpHwLRHgTMduRKK+eLWEbRksezcZvXZ
         63v3s32o2czL+ftVsGXKff95y2EJ7cBG3f2Cm1QahTRFz/zFYWf7WDmTwasy/Gx5Cqr4
         WhND6AcbSpBn5VINXCBytKj9jxwPw8f6yg1tRVSnw7LdcOm1HcQU8jlGrqN5wPcImhCb
         sadTd7bURwGdeRujqwXjJUl96T6Crtpv7E9+sc9NMnjsdtupWV9cocd0HsilMUSfSp87
         9ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8dhO4iKJgpntkSBg2CwwF2girkJ/DIoq3G4792Lm7Pw=;
        b=xTmnNQs5oWmdXuF2Je4eKoLv1OWIXGUwQ6znpQJwZss5+EXtUY4uAXSsUEtMwfdZ6u
         PEVYZYsRn81Dfwv/ph5K4ArOSvGMvPac/vBjJhUWX4UVraazvse+1aUxhGHu1mvRJ+Sl
         ar2VZpbe4LzCIKAcdqcsYdj/Ml7m1GWkAJV0YFY/Hwio6ZpuuyhhtP2yl+4dAZEsH9yn
         LQEiU1w0U2uLc43kr+l+NMzAgl3+PaFzMmWfO2FfZqrYKl3Oh9aWR6hvdfHWoB6hWCdv
         mmtdFDPnnW/5nYPmZVddz8oblW4vouw08U2LYv7VBNsWhJUceys7R/qodwtCZG9h4cDV
         vv0w==
X-Gm-Message-State: AOAM5310BqTLQXAHfhdAGk0EG/T3tRzy6YVChfHB/h1gZExQe9iaJiYg
        7ul39Zp93NGJ8SH2p2Gp/cU=
X-Google-Smtp-Source: ABdhPJx4ozkQzNek01O2VmB+tImpR0R5CZaBzO4eIsBUBjj6A1cNXJ2K+ZjsWXl/3XhOXODRWZg20g==
X-Received: by 2002:a05:6830:828:: with SMTP id t8mr13349324ots.87.1634048752566;
        Tue, 12 Oct 2021 07:25:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s10sm2357827oib.58.2021.10.12.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:25:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 12 Oct 2021 07:25:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/10] hwmon: (tmp421) introduce a channel struct
Message-ID: <20211012142550.GA743871@roeck-us.net>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <baf34d95983a6b58a3e39e4c098e5979e541572e.1634029538.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baf34d95983a6b58a3e39e4c098e5979e541572e.1634029538.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 12, 2021 at 11:26:55AM +0200, Krzysztof Adamski wrote:
> This is a preparatory change. Upcoming patches will introduce more
> per-channel parameters so it's worth organizing them into a struct.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp421.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 356c96c3588b..707310d616a4 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -87,6 +87,10 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tmp421_of_match);
>  
> +struct tmp421_channel {
> +	s16 temp;
> +};
> +
>  struct tmp421_data {
>  	struct i2c_client *client;
>  	struct mutex update_lock;
> @@ -98,7 +102,7 @@ struct tmp421_data {
>  	unsigned long last_updated;
>  	unsigned long channels;
>  	u8 config;
> -	s16 temp[MAX_CHANNELS];
> +	struct tmp421_channel channel[MAX_CHANNELS];
>  };
>  
>  static int temp_from_raw(u16 reg, bool extended)
> @@ -133,12 +137,12 @@ static int tmp421_update_device(struct tmp421_data *data)
>  			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_MSB[i]);
>  			if (ret < 0)
>  				goto exit;
> -			data->temp[i] = ret << 8;
> +			data->channel[i].temp = ret << 8;
>  
>  			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_LSB[i]);
>  			if (ret < 0)
>  				goto exit;
> -			data->temp[i] |= ret;
> +			data->channel[i].temp |= ret;
>  		}
>  		data->last_updated = jiffies;
>  		data->valid = true;
> @@ -167,7 +171,7 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  	switch (attr) {
>  	case hwmon_temp_input:
> -		*val = temp_from_raw(tmp421->temp[channel],
> +		*val = temp_from_raw(tmp421->channel[channel].temp,
>  				     tmp421->config & TMP421_CONFIG_RANGE);
>  		return 0;
>  	case hwmon_temp_fault:
> @@ -175,7 +179,7 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  		 * Any of OPEN or /PVLD bits indicate a hardware mulfunction
>  		 * and the conversion result may be incorrect
>  		 */
> -		*val = !!(tmp421->temp[channel] & 0x03);
> +		*val = !!(tmp421->channel[channel].temp & 0x03);
>  		return 0;
>  	default:
>  		return -EOPNOTSUPP;
