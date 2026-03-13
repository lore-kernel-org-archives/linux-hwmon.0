Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520383D903E
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427559; cv=none; b=qYKEIw4G1RF3myFkrbHeuJqEVzDmOxX1N3oMQucaPcGug4Xutegl5IKq/CRSv4TxRP6+bb4b0eeQio6Img/YbLfBfMKmK9BQA2oS82q0rLOYhzMXmOMJsAxhEXctsiI1aV+ChBiEJh3zn54D6fUzeXPf7hS9OrmfqdHjAE848Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427559; c=relaxed/simple;
	bh=2zQ+a5ycGOUKJKRXheLqg4HnDrao521k/fJ1jyibxE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIXJhfUkWdYCPSLv67avRfxEIOhUONZ2XcifEHiLdNQd2mix/26AIBIN3iEGLVffPZKVmZNvjqsjx9XgOoPktAHitkdVDqvTZP3+S1gW4GHj+y48oflHnLXmGfvqDVAaZMepoVQhYOG2QsC1Iy1svsp9qiabp2DtBAEkjUaj9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct/9abw4; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct/9abw4"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4e9694so344271c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773427557; x=1774032357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smH+Txpt1bCAmMOLghTOk87dk1umeAnh8F4uUYgOBdE=;
        b=ct/9abw41esy+iOfHptwNK1uTJ4avbXt0sZL1cdrm2h+2RTcH5Caqel8kq509p2715
         pC7Qb5obSdwmw/GtywMrZL7hMGs/GDpN3Jhll3XKD3vvv42iaH2HbUcO2RyBzPKrJTCR
         RmSRWBsQgngVHuDaQMINp6EZyXh7RTU7oMP/JZXdltz0mFybT8GYn2VubfpMBTgVvSfo
         JJQpUJtILxr3gl0zrRLWRLrVvqmZfPWb1yHHraxYdu8rdn29L6SBGZM+ZvcDOb/qnGhk
         lmeEan/aZGhgYiTCVlNeKMHNPrGlQAbMqk1u9Du+/WYAzWzwGGmTOEDK3scnClqYqx/9
         jJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773427557; x=1774032357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smH+Txpt1bCAmMOLghTOk87dk1umeAnh8F4uUYgOBdE=;
        b=HTpD+1SRKMh9r4wHTR4OVHfIKmlboopCeCDGfwO4PyZIJpGOWtlJXy0vjGXSws5Xc+
         rTYBC5oApkVlZ0ZnkH1vwJ3xAZAtRQnQuNyrPrsKcXxQO6rE4Ms/5O3Af3otW4BWA4Dy
         2xTpwOYi1JNlWcmVK/SauuUnHgUo4BScAc5aFvsUn0qi0mU0oMGhAQXT3ZRzTXM7IjHC
         un18PWLoIDnjwTmpVzG9DHfKCuN8U1XIYNrm1pHJGBFxk3LyMZnXvuLbhdTJwM9Df2Qg
         IjxPAMxtrjbyLw/bULfyd91yjAsicnoVWB7/j8MvTsUoa/mV0Ft5MsYX1galXR/Y8WQl
         ZvUQ==
X-Gm-Message-State: AOJu0YyztwzBn6yGe8t+9Ex00udWcPwwnAga4ZHRY8DQHoY6nuT6RCGy
	F9EjO4nBikF5B6S2ye7h0TSdIc+nTmdw/3+B7Y/vH1ZxqQwMWmtXqLZx
X-Gm-Gg: ATEYQzy/HvizGTI/UWjKgo128Je7hhBZirGfVw2lFSLzXSxrkcrBXgRmhgGJgf5D7al
	FgOn069IR613U/v47qIo1ttBHSnbN+NjlEg9pnJVlQ4yRZvYO1G+Xz158I2OBXPVkYLpsLPPuz8
	8LwZ6/ijuuF5c036kbI2HVkDZlUe63Y/UIeoLXbXZJDOtj/1DYtH2f2ex4HtxUvYH+tGCSA5LWe
	rojELh17piZom55YaRrSVypjl/9IbULCRaUb5g7rB3JMCDwl3fD4iqOJVgVs70mou0y+JDr/Vmi
	mTnyJOyVrD1BCWYBkWwvRZLddaHfKKdVB4b2cAoH+JUv8xEAJIF6fJbjsYXuRNYeaGNUMAlzh6s
	/5X9ACshiKz9j919PJE4CL4jZjEprhfHxuYBzt3ODJYoFgBgELEskHNFVKVsTVyTHbpOFmG0QJC
	3lfNytC58QzLe66bzwWQLw8RDjN7AKK6/ygTZ9W/Q9bTl+v8Y=
X-Received: by 2002:a05:7022:2393:b0:11b:2de8:6271 with SMTP id a92af1059eb24-128f3e350bcmr2399423c88.39.1773427557171;
        Fri, 13 Mar 2026 11:45:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f618f01csm3236004c88.0.2026.03.13.11.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 11:45:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Mar 2026 11:45:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: ibmpex: check ibmpex_send_message() return value
Message-ID: <3e0baf34-2177-408f-8ec1-923789357887@roeck-us.net>
References: <20260310203555.33896-1-jaime.saguillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310203555.33896-1-jaime.saguillo@gmail.com>

On Tue, Mar 10, 2026 at 08:35:55PM +0000, Jaime Saguillo Revilla wrote:
> Several ibmpex request helpers ignore the return value of
> ibmpex_send_message() and then unconditionally wait for
> read_complete.
> 
> If transmit fails, no response will arrive and the code may wait
> indefinitely. Check ibmpex_send_message() return values and
> propagate errors to callers instead of continuing.
> 
> Also propagate reset command failures through
> ibmpex_high_low_store().
> 
> Signed-off-by: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>

Is that an actual problem ? This driver has a variety of problems,
starting with its use of a long since deprecated ABI.
Checking those return values is a minor issus. Also see inline comments
(from AI review).

> ---
>  drivers/hwmon/ibmpex.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index dec730798d58..92cda205e57c 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
> @@ -133,9 +133,13 @@ static int ibmpex_send_message(struct ibmpex_bmc_data *data)
>  
>  static int ibmpex_ver_check(struct ibmpex_bmc_data *data)
>  {
> +	int err;
> +
>  	data->tx_msg_data[0] = PEX_GET_VERSION;
>  	data->tx_message.data_len = 1;
> -	ibmpex_send_message(data);
> +	err = ibmpex_send_message(data);
> +	if (err)
> +		return err;
>  
>  	wait_for_completion(&data->read_complete);
>  
> @@ -159,9 +163,13 @@ static int ibmpex_ver_check(struct ibmpex_bmc_data *data)
>  
>  static int ibmpex_query_sensor_count(struct ibmpex_bmc_data *data)
>  {
> +	int err;
> +
>  	data->tx_msg_data[0] = PEX_GET_SENSOR_COUNT;
>  	data->tx_message.data_len = 1;
> -	ibmpex_send_message(data);
> +	err = ibmpex_send_message(data);
> +	if (err)
> +		return err;
>  
>  	wait_for_completion(&data->read_complete);
>  
> @@ -173,10 +181,14 @@ static int ibmpex_query_sensor_count(struct ibmpex_bmc_data *data)
>  
>  static int ibmpex_query_sensor_name(struct ibmpex_bmc_data *data, int sensor)
>  {
> +	int err;
> +
>  	data->tx_msg_data[0] = PEX_GET_SENSOR_NAME;
>  	data->tx_msg_data[1] = sensor;
>  	data->tx_message.data_len = 2;
> -	ibmpex_send_message(data);
> +	err = ibmpex_send_message(data);
> +	if (err)
> +		return err;
>  
>  	wait_for_completion(&data->read_complete);
>  
> @@ -188,10 +200,14 @@ static int ibmpex_query_sensor_name(struct ibmpex_bmc_data *data, int sensor)
>  
>  static int ibmpex_query_sensor_data(struct ibmpex_bmc_data *data, int sensor)
>  {
> +	int err;
> +
>  	data->tx_msg_data[0] = PEX_GET_SENSOR_DATA;
>  	data->tx_msg_data[1] = sensor;
>  	data->tx_message.data_len = 2;
> -	ibmpex_send_message(data);
> +	err = ibmpex_send_message(data);
> +	if (err)
> +		return err;
>  
>  	wait_for_completion(&data->read_complete);
>  
> @@ -206,9 +222,13 @@ static int ibmpex_query_sensor_data(struct ibmpex_bmc_data *data, int sensor)
>  
>  static int ibmpex_reset_high_low_data(struct ibmpex_bmc_data *data)
>  {
> +	int err;
> +
>  	data->tx_msg_data[0] = PEX_RESET_HIGH_LOW;
>  	data->tx_message.data_len = 1;
> -	ibmpex_send_message(data);
> +	err = ibmpex_send_message(data);
> +	if (err)
> +		return err;
>  
>  	wait_for_completion(&data->read_complete);

Should we also check data->rx_result here?
The commit message mentions propagating reset command failures through
ibmpex_high_low_store. While the local transmission error is caught by
checking the return value of ibmpex_send_message, if the BMC rejects or
fails the reset command, data->rx_result will contain a non-zero error
code.
Since data->rx_result is ignored here, the function will still return
success to userspace, which seems to result in incomplete error propagation.

>  
> @@ -276,8 +296,11 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
>  				     const char *buf, size_t count)
>  {
>  	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
> +	int err;
>  
> -	ibmpex_reset_high_low_data(data);
> +	err = ibmpex_reset_high_low_data(data);
> +	if (err)
> +		return err;

Does this sysfs store function need to acquire the data->lock mutex?
ibmpex_reset_high_low_data writes directly to the shared message buffers
data->tx_msg_data and data->tx_message.data_len, and ibmpex_send_message
increments data->tx_msgid.
If sysfs operations run concurrently, this could corrupt the transmitted
messages. Furthermore, if data->tx_msgid is incremented concurrently before
the BMC responds, the IPMI response handler might silently drop the
response due to a message ID mismatch. This would skip the completion call
and cause the thread to hang indefinitely.
Other functions like ibmpex_update_device appear to protect these shared
resources by holding mutex_lock(&data->lock).

>  
>  	return count;
>  }
> -- 
> 2.34.1
> 
