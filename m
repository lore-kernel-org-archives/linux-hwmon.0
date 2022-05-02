Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F126BC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 04:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382462AbiEBE1b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 00:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382377AbiEBE1Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 00:27:25 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DA21EEDB
        for <linux-hwmon@vger.kernel.org>; Sun,  1 May 2022 21:23:58 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id h10-20020a056830400a00b00605e92cc450so7086427ots.11
        for <linux-hwmon@vger.kernel.org>; Sun, 01 May 2022 21:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lSPUs1BzGExCMyShN35Sl/5BOOFha5ViTmrW2EjptxI=;
        b=PwXO1xqJ5X+Fqli6Bx1NtfeDJZhN6jkLCs1lHL7hbpGGSVsIBKtTNDpGzFWLhDZFXD
         k7ya08m+sWdNKoGxY3bdtElwoA5ri6/npzuf+RZLC1yZNvdazogogv1ihtmKRT94f5oB
         d5U0G6+5mCFDXcGVR1E1fPwRQoJ34Vxzv4fCJTdpgXhoI2LIuAEBgh2PVUCXVLGXrEqZ
         +Q8Mg5B8h5d3oRyHyCEXZ77QwBl862UbD7EiO+Z07gU4pWF5mTCY+cuzQjgKA/QH2dy/
         73ZD70BhTSAvpRP/JQmInDuSdGSPoK9j4Eceh3vqyM6rtbK3BxIz+zfdXmyUV+GJf5Hc
         oAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=lSPUs1BzGExCMyShN35Sl/5BOOFha5ViTmrW2EjptxI=;
        b=Yqa3O/Ktzuz9MwvbBWTbLYbwGRHyUETetsfu3nyZhuusx24AaQ5cgUjNpMS+NcxJKf
         GryW9qLdPQRidX0dHBI/iA7716PXZj987CCHZ76ahf6Ywjare50Yh/WQkSianS/ulsoA
         0Q85v7yMkWAKJhyUbzg0YGg9Q8r0IxmhAGHIxBSC8i5GhzdzVu4RaUuqzv4OyCInYyrm
         lVHBZ3qM/DRg+1T9Musgq8uR/gP6apkgtGlNd0nsf3KS4ztrHNY9G6hmz4LQ4WQDwG4S
         5kFraaSIjaJHKTlW1q74qnL9x2wBFSE3aeutFr5HrzSIxOPiOPtvcHljrLiQ8I4yHNck
         WIDw==
X-Gm-Message-State: AOAM530fPl6AmbKAGbUK5Oat7urDlVLnsPuUo3DYcWXz0JWTODsc8hlD
        Px4KfqlUuECwpKPekVESxsg=
X-Google-Smtp-Source: ABdhPJwMNgwBuffWP8bWMeUzpsjBdjWavkbK88nzMXjUPprKJM9ghNdSxl139+HLB2d8WLS8iP5o+A==
X-Received: by 2002:a9d:3ad:0:b0:604:c1fd:cd4c with SMTP id f42-20020a9d03ad000000b00604c1fdcd4cmr3731844otf.288.1651465437316;
        Sun, 01 May 2022 21:23:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a19-20020a9d4713000000b0060603221243sm2466056otf.19.2022.05.01.21.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 21:23:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 1 May 2022 21:23:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v4 1/4] hwmon: (pmbus) Introduce and use write_byte_data
 callback
Message-ID: <20220502042355.GA1717700@roeck-us.net>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-2-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428144039.2464667-2-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 28, 2022 at 04:40:36PM +0200, Mårten Lindahl wrote:
> Some of the pmbus core functions uses pmbus_write_byte_data, which does
> not support driver callbacks for chip specific write operations. This
> could potentially influence some specific regulator chips that for
> example need a time delay before each data access.
> 
> Lets add support for driver callback with _pmbus_write_byte_data.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      |  2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 24 +++++++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index e74b6ef070f3..c031a9700ace 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -438,6 +438,8 @@ struct pmbus_driver_info {
>  	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>  	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>  			      int reg);
> +	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
> +			      u8 byte);
>  	int (*write_word_data)(struct i2c_client *client, int page, int reg,
>  			       u16 word);
>  	int (*write_byte)(struct i2c_client *client, int page, u8 value);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index b2618b1d529e..98da2db3f831 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -276,6 +276,24 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
>  	return pmbus_write_word_data(client, page, reg, word);
>  }
>  
> +/*
> + * _pmbus_write_byte_data() is similar to pmbus_write_byte_data(), but checks if
> + * a device specific mapping function exists and calls it if necessary.
> + */
> +static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	const struct pmbus_driver_info *info = data->info;
> +	int status;
> +
> +	if (info->write_byte_data) {
> +		status = info->write_byte_data(client, page, reg, value);
> +		if (status != -ENODATA)
> +			return status;
> +	}
> +	return pmbus_write_byte_data(client, page, reg, value);
> +}
> +
>  int pmbus_update_fan(struct i2c_client *client, int page, int id,
>  		     u8 config, u8 mask, u16 command)
>  {
> @@ -290,7 +308,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
>  
>  	to = (from & ~mask) | (config & mask);
>  	if (to != from) {
> -		rv = pmbus_write_byte_data(client, page,
> +		rv = _pmbus_write_byte_data(client, page,
>  					   pmbus_fan_config_registers[id], to);
>  		if (rv < 0)
>  			return rv;
> @@ -397,7 +415,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  	tmp = (rv & ~mask) | (value & mask);
>  
>  	if (tmp != rv)
> -		rv = pmbus_write_byte_data(client, page, reg, tmp);
> +		rv = _pmbus_write_byte_data(client, page, reg, tmp);
>  
>  	return rv;
>  }
> @@ -912,7 +930,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
>  
>  	regval = status & mask;
>  	if (regval) {
> -		ret = pmbus_write_byte_data(client, page, reg, regval);
> +		ret = _pmbus_write_byte_data(client, page, reg, regval);
>  		if (ret)
>  			goto unlock;
>  	}
