Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27E7C77B7A
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 13:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjESNe6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 09:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjESNet (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 09:34:49 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD94BA1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:34:48 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d3578c25bso601902b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684503288; x=1687095288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ue6IlpFzRJeo0akOn8qPsmw6b6KPmwZSaJBnVp/l85w=;
        b=YPI0tKHwFH8zfJKeNBg7HCF46wENu8TetPB5Tf4ZOYp7lgXVcICWNY4G1GgqId6QLj
         goLBRSeYr/6azckeG7vaXAdRNEEzwywMplj8HMZSBX0HQAGZ+YYJgpnwixJjf0w+R+AS
         laDkxUEuXFRI+1d4E64CQrUtZmbmFKaBdh7I/KMC3jyDdZxziRfsrKytxMBaczqeVZan
         s/a9Rw02bHTM4fASbaORgF6hJskJid6eH/oUZUwbkGbjrg4+/GAg3XrzrZXpmg5TKHHm
         +4fW6WoLo+IAiJvDD8pZwOhwhJI6fa9tTPTZN15g/NBlZfXY8SOBsmxmMKrXmNRXh7Y2
         byNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684503288; x=1687095288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue6IlpFzRJeo0akOn8qPsmw6b6KPmwZSaJBnVp/l85w=;
        b=cS6ckxnPvpTCja3RiqC8wrqnUIm76h5cHB4BQu1UWoO9qxKGur1MC3OvNrftfvLEg/
         Cx+TBQEg8eq/bi0Ml+UWl+V67tSacgmfcKlPGtebyZuxqvK400t6gvY1alk1dpugNC3R
         7a8n2K8ryypq1NJs80NrkupG9nHAIvzvoSHRm9FFWxFjZN9BnPaU9jLq3XZU+tNcbwKq
         ceQdRaboz8hFMNl3a8YZs7mx3Epx311JlFraSWEkjntYunS8XMEEfsk/VBeJmMnzXYYm
         06+MK0d15XgypzM+mb+gfdqu6Ov3zffdE6GxqQFa1tli3Q3NEoqSzK1bt+9q/2DrBvLj
         JlGA==
X-Gm-Message-State: AC+VfDw8oLNb2KshTF4XQKydFbr4Suqs+n9G2tNkzIDpIE/fEyVNTL7Q
        xOAlSDIWwTo17hMiYS8q22A=
X-Google-Smtp-Source: ACHHUZ4FDBGwzVrR4RZyBkZeGkW/YAFmx7usGqIv53qdQo+8yq+jsNitrb6ZkWnRmNx8573AI4rA5A==
X-Received: by 2002:a05:6a20:e68e:b0:101:2160:ff89 with SMTP id mz14-20020a056a20e68e00b001012160ff89mr2050222pzb.38.1684503288273;
        Fri, 19 May 2023 06:34:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23-20020a63e017000000b0051303d3e3c5sm3086422pgh.42.2023.05.19.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:34:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 May 2023 06:34:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kirill Yatsenko <kiriyatsenko@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com, jcdra1@gmail.com
Subject: Re: [PATCH 2/3] hwmon: (aht10) Refactor aht10_read_values function
Message-ID: <55a1e9c6-c7ab-4a49-8130-561293760dea@roeck-us.net>
References: <20230511202633.299174-1-kiriyatsenko@gmail.com>
 <20230511202633.299174-2-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511202633.299174-2-kiriyatsenko@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 11, 2023 at 10:26:32PM +0200, Kirill Yatsenko wrote:
> Exit from the function immediately if the poll time hasn't yet expired.
> Therefore the code after the check can be moved one tab to the left which
> improves readability.
> 
> Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
> ---
>  drivers/hwmon/aht10.c | 67 ++++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> index 87a433e570e1..17ceec9aab66 100644
> --- a/drivers/hwmon/aht10.c
> +++ b/drivers/hwmon/aht10.c
> @@ -135,40 +135,43 @@ static int aht10_read_values(struct aht10_data *data)
>  	struct i2c_client *client = data->client;
>  
>  	mutex_lock(&data->lock);
> -	if (aht10_polltime_expired(data)) {
> -		res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
> -		if (res < 0) {
> -			mutex_unlock(&data->lock);
> +	if (!aht10_polltime_expired(data)) {
> +		mutex_unlock(&data->lock);
> +		return 0;
> +	}
> +
> +	res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
> +	if (res < 0) {
> +		mutex_unlock(&data->lock);
> +		return res;
> +	}
> +
> +	usleep_range(AHT10_MEAS_DELAY, AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
> +
> +	res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
> +	if (res != AHT10_MEAS_SIZE) {
> +		mutex_unlock(&data->lock);
> +		if (res >= 0)
> +			return -ENODATA;
> +		else
>  			return res;

else after return is pointless (and static analyzers complain about it).

No need to resend (I see it is inherited from old code). I'll fix it up
when applying the patch.

Guenter

> -		}
> -
> -		usleep_range(AHT10_MEAS_DELAY,
> -			     AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
> -
> -		res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
> -		if (res != AHT10_MEAS_SIZE) {
> -			mutex_unlock(&data->lock);
> -			if (res >= 0)
> -				return -ENODATA;
> -			else
> -				return res;
> -		}
> -
> -		hum =   ((u32)raw_data[1] << 12u) |
> -			((u32)raw_data[2] << 4u) |
> -			((raw_data[3] & 0xF0u) >> 4u);
> -
> -		temp =  ((u32)(raw_data[3] & 0x0Fu) << 16u) |
> -			((u32)raw_data[4] << 8u) |
> -			raw_data[5];
> -
> -		temp = ((temp * 625) >> 15u) * 10;
> -		hum = ((hum * 625) >> 16u) * 10;
> -
> -		data->temperature = (int)temp - 50000;
> -		data->humidity = hum;
> -		data->previous_poll_time = ktime_get_boottime();
>  	}
> +
> +	hum =   ((u32)raw_data[1] << 12u) |
> +		((u32)raw_data[2] << 4u) |
> +		((raw_data[3] & 0xF0u) >> 4u);
> +
> +	temp =  ((u32)(raw_data[3] & 0x0Fu) << 16u) |
> +		((u32)raw_data[4] << 8u) |
> +		raw_data[5];
> +
> +	temp = ((temp * 625) >> 15u) * 10;
> +	hum = ((hum * 625) >> 16u) * 10;
> +
> +	data->temperature = (int)temp - 50000;
> +	data->humidity = hum;
> +	data->previous_poll_time = ktime_get_boottime();
> +
>  	mutex_unlock(&data->lock);
>  	return 0;
>  }
