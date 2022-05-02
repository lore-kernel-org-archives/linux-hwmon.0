Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD0C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 04:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382393AbiEBE1m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 00:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382372AbiEBE1l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 00:27:41 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156F617058
        for <linux-hwmon@vger.kernel.org>; Sun,  1 May 2022 21:24:14 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id l16so6984938oil.6
        for <linux-hwmon@vger.kernel.org>; Sun, 01 May 2022 21:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fqHAvKkb8T997Vhh62JNTBMPrcPqr/XowYXGIKY+VTc=;
        b=NqDvzPx0CEAuhQYUVzvkmwWQkThOGhm4nWRBN2VXbBfCcpO9nBhXvCPxGqR9m6hSdM
         bfTdQw/2rNc+ykTgG+tBMnDsifJ584ydzeuKemPlHiHWiQKdYEduYT3pm3J3nbewih06
         YlIgs0hrujbs0U8sT0t1cJD8UK/d6v9rDZ2bO0dPrLewf8fy1IIaUB1G4TrFM/DgOch8
         aqqLoeGAaQmRDTsEOU3+Zvzl7Z7g0FbLt7bPhdbfWjSnzry2PKHr71jQJO/D4YZYdSA6
         gJSyIooiXrqo3alIbxDoGa3X8Gw0XwjrWbvLcHSnWKdXZpDXz2xlvwlx3hbFtBS0vz7D
         EGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=fqHAvKkb8T997Vhh62JNTBMPrcPqr/XowYXGIKY+VTc=;
        b=0ex7ggI6sXXBkVsnza58tap564nxg7ms8H6DhmL11OlbQlg4JB4a1xFfGnaxAhSgBn
         tc6etBaMGLSx+dnoM5aOW/3aKAw/10XVYAktzyV+3arxZ63qeJrBD9aUdR92aK11ZcxJ
         NcHZgI+bA7gsWo33ulHN/H3rGTxX2Oit9kt7HtxoXko3jKGPPYjOruOdn3uULFqNi28N
         i/wzO+PjQlpoBLQdTAzU+8um6E32M7KocxEtiN2MIWlbXnzINNIS7adoKjkwyYClGDDP
         B0NM9bP4QajwP63XJrR90kCjx7vvtycNrvlCjhIFFtD6TxRXdEOyW54FWm3xLdfgTZuW
         OOIw==
X-Gm-Message-State: AOAM5324bISViUWd7hTh1kW9axWgGDpDOxvggruP7VifBF7nBCYlU2bM
        ySDYk+Xot/Z2jVxaIm8P4HA=
X-Google-Smtp-Source: ABdhPJwAOoYTTUYTsPERqy8ke9g0tBAD8w0gkPbV3uwjzI7AgY5++47xCFZM/IPR/6f7oF3TmO12tQ==
X-Received: by 2002:a05:6808:ecc:b0:322:319c:cd3 with SMTP id q12-20020a0568080ecc00b00322319c0cd3mr6570227oiv.148.1651465453432;
        Sun, 01 May 2022 21:24:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f15-20020a4ada4f000000b0035eb4e5a6b5sm3502740oou.11.2022.05.01.21.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 21:24:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 1 May 2022 21:24:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus) Use _pmbus_read_byte_data with
 callback
Message-ID: <20220502042411.GA1717731@roeck-us.net>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-3-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428144039.2464667-3-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 28, 2022 at 04:40:37PM +0200, Mårten Lindahl wrote:
> Some of the pmbus core functions uses pmbus_read_byte_data, which does
> not support driver callbacks for chip specific write operations. This
> could potentially influence some specific regulator chips that for
> example need a time delay before each data access.
> 
> Lets use _pmbus_read_byte_data with callback check.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 46 ++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 98da2db3f831..bd143ca0c320 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -294,6 +294,24 @@ static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg,
>  	return pmbus_write_byte_data(client, page, reg, value);
>  }
>  
> +/*
> + * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
> + * a device specific mapping function exists and calls it if necessary.
> + */
> +static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	const struct pmbus_driver_info *info = data->info;
> +	int status;
> +
> +	if (info->read_byte_data) {
> +		status = info->read_byte_data(client, page, reg);
> +		if (status != -ENODATA)
> +			return status;
> +	}
> +	return pmbus_read_byte_data(client, page, reg);
> +}
> +
>  int pmbus_update_fan(struct i2c_client *client, int page, int id,
>  		     u8 config, u8 mask, u16 command)
>  {
> @@ -301,7 +319,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
>  	int rv;
>  	u8 to;
>  
> -	from = pmbus_read_byte_data(client, page,
> +	from = _pmbus_read_byte_data(client, page,
>  				    pmbus_fan_config_registers[id]);
>  	if (from < 0)
>  		return from;
> @@ -408,7 +426,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  	unsigned int tmp;
>  	int rv;
>  
> -	rv = pmbus_read_byte_data(client, page, reg);
> +	rv = _pmbus_read_byte_data(client, page, reg);
>  	if (rv < 0)
>  		return rv;
>  
> @@ -421,24 +439,6 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  }
>  EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
>  
> -/*
> - * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
> - * a device specific mapping function exists and calls it if necessary.
> - */
> -static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
> -{
> -	struct pmbus_data *data = i2c_get_clientdata(client);
> -	const struct pmbus_driver_info *info = data->info;
> -	int status;
> -
> -	if (info->read_byte_data) {
> -		status = info->read_byte_data(client, page, reg);
> -		if (status != -ENODATA)
> -			return status;
> -	}
> -	return pmbus_read_byte_data(client, page, reg);
> -}
> -
>  static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
>  					      int reg)
>  {
> @@ -473,7 +473,7 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
>  		return s->data;
>  	}
>  
> -	config = pmbus_read_byte_data(client, page,
> +	config = _pmbus_read_byte_data(client, page,
>  				      pmbus_fan_config_registers[id]);
>  	if (config < 0)
>  		return config;
> @@ -2414,7 +2414,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
>  	int ret;
>  
>  	mutex_lock(&data->update_lock);
> -	ret = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> +	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>  	mutex_unlock(&data->update_lock);
>  
>  	if (ret < 0)
> @@ -2513,7 +2513,7 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>  		if (!(func & cat->func))
>  			continue;
>  
> -		status = pmbus_read_byte_data(client, page, cat->reg);
> +		status = _pmbus_read_byte_data(client, page, cat->reg);
>  		if (status < 0) {
>  			mutex_unlock(&data->update_lock);
>  			return status;
