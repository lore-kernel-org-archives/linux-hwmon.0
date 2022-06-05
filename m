Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A97C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 18:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244820AbiFESKO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 14:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351612AbiFESKJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 14:10:09 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB9F30F68;
        Sun,  5 Jun 2022 11:10:08 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f2cbceefb8so16735302fac.11;
        Sun, 05 Jun 2022 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KCnX5O3mYts+FZkfkHPRAH/57Id9nVn3xpKq+JHRyKk=;
        b=johr42mixgEb2ZAZiHuPmzO1oOrnUDhopI8JpAbf5WLtzzISuumfwlta1f7mCB+sUP
         xRcwO6gMqynsKpX++bxM0UVe+KciwEucnAjvAJ2SNBFQTxUbR3noWz9ElP//zbMK6YxM
         B3wMwQ/d1pPC3VgGpV9PwPeMCBIqfMjcxhB+hrNfuzNTQaQr/NNNFmtPyhhYW9Xig7DP
         XuALUm6cMWiBSLrY3oNE0dfL7gZFzed9b2MneLCnfFNqp13rDvtL+VoXwW7uEXbo3+v4
         +1ncIrbTgaTaX2tRSrr0iKZiUSmwBCAFkDzgsJAAtqwplrhCFBtGiJ9r9ZsRLLWbXOc3
         i8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KCnX5O3mYts+FZkfkHPRAH/57Id9nVn3xpKq+JHRyKk=;
        b=QEGwSe1W58I9J2Ax+On8dgC7DDNMsBxD/ywyCk44JFLoufrRKcpS6NGr3M0gmBCIcg
         lQ51gmmVk+tIwdesVtvLWRQ4GFIe1NdZwTqPH7SRY9qEl7IHG1goFOCLobHOK1+nnnti
         pjEiw+haEKkAkVXFpksjPDL1jjXGHBx5aI3bn+B0+ISkVYnijlqNtBhdBpBSyX0HhQAF
         eHRQtaLYeTBxRBUkMIkAmx7g3o/bdwRAW9S0iULM83vZgtw01ER9q5LHVpAsgrk3D4JJ
         727bspLw9JVyMz8dfG0OcuwzUmHBUaPUx0Cl0Io4Ntk/g4MG5lmbPzjC71/Y0wB/ZeOF
         +8+w==
X-Gm-Message-State: AOAM532LSv4StYFlcjP/1Hnmlj/5WPO1uBTzRC7RBFJ2/0xAWUZCg97b
        y7yUINjpe+jzHVLpezDSTD0=
X-Google-Smtp-Source: ABdhPJwfhV4FeBIUi1vM//sNud4msPsdd/U687UbFAvJ/ugdp5yiC5WoYlvqhjOAMRhSbDntNHzmsg==
X-Received: by 2002:a05:6870:d1c8:b0:f3:2788:9397 with SMTP id b8-20020a056870d1c800b000f327889397mr21189373oac.283.1654452607471;
        Sun, 05 Jun 2022 11:10:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d22-20020a056830045600b00608b8e6fad5sm6638663otc.76.2022.06.05.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 11:10:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 11:10:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 7/7] hwmon: (lm90) Read the channel's temperature offset
 from device-tree
Message-ID: <20220605181005.GA3151885@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-8-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-8-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:57AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Try to read the channel's temperature offset from device-tree. Having
> offset in device-tree node is not mandatory. The offset can only be set
> for remote channels.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  drivers/hwmon/lm90.c | 48 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 3837c4ab5833..12e8e874f1b9 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1440,6 +1440,24 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
>  	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
>  }
>  
> +static int lm90_set_temp_offset(struct lm90_data *data, int channel, long val)
> +{
> +	/* Both offset registers have the same resolution */
> +	int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
> +
> +	val = lm90_temp_to_reg(0, val, res);
> +
> +	if (channel == 1) {
> +		data->temp[REMOTE_OFFSET] = val;
> +		return lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> +				    LM90_REG_REMOTE_OFFSL, val);
> +	}
> +
> +	data->temp[REMOTE2_OFFSET] = val;
> +	return lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> +			    LM90_REG_REMOTE2_OFFSL, val);
> +}
> +
>  static const u8 lm90_temp_index[MAX_CHANNELS] = {
>  	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
>  };
> @@ -1577,19 +1595,7 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
>  				    channel, val);
>  		break;
>  	case hwmon_temp_offset:
> -		/* Both offset registers have the same resolution */
> -		val = lm90_temp_to_reg(0, val,
> -				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> -
> -		if (channel == 1) {
> -			data->temp[REMOTE_OFFSET] = val;
> -			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> -					   LM90_REG_REMOTE_OFFSL, val);
> -		} else {
> -			data->temp[REMOTE2_OFFSET] = val;
> -			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> -					   LM90_REG_REMOTE2_OFFSL, val);
> -		}
> +		err = lm90_set_temp_offset(data, channel, val);

Any chance to come up with more unified handling of both channels ?

Thanks,
Guenter

>  		break;
>  	default:
>  		err = -EOPNOTSUPP;
> @@ -2651,6 +2657,7 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>  				      struct lm90_data *data)
>  {
>  	u32 id;
> +	s32 val;
>  	int err;
>  	struct device *dev = &client->dev;
>  
> @@ -2674,6 +2681,21 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>  	if (data->channel_label[id])
>  		data->channel_config[id] |= HWMON_T_LABEL;
>  
> +	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
> +	if (!err) {
> +		if (id == 0) {
> +			dev_err(dev, "offset can't be set for internal channel\n");
> +			return -EINVAL;
> +		}
> +
> +		err = lm90_set_temp_offset(data, id, val);
> +		if (err) {
> +			dev_err(dev, "can't set offset %d for channel %d (%d)\n",
> +				val, id, err);
> +			return err;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
