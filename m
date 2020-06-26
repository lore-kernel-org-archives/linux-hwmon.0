Return-Path: <SRS0=hNyA=AH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01C9C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 01:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A356620767
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 01:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+IOhtLl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgFZBGu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 21:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgFZBGu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 21:06:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D7AC08C5C1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 18:06:49 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cm23so4217065pjb.5
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 18:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1IUQ9x6MgDKw7SqNFoDbawIZdIes/l4OWL6Hw93dep0=;
        b=V+IOhtLlh5C8IGCRFJGwUMXffmO1PtsiBz3wJtni1jaVR2fsKQyUmevNgG7jGR77uX
         uuBPnG+5SlGtOvBVENRawGXbvR/ALvd3ic5Qidl+SJ683OLj3A73cT1lpJs6AuvmLtM2
         WpCtd/tL9XKSv05jU30bC+jk2fYp54luX6u8bWjhb5tzNF6+ZS3qd0FvdgYCVUUZOoyR
         L7HO1zposI8FD+sShE5u2RN1CSViy8bK1E0NZ6OTatKi9s7oK+vlNqasancRddQJzDn4
         0Ej3Nd7F/OICoUXmiT+Oh6rEWJq9lITs9GSvrxc2wBYq0dD/je3mPbwuvZjKHknojCts
         R7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1IUQ9x6MgDKw7SqNFoDbawIZdIes/l4OWL6Hw93dep0=;
        b=nibkwsL8LrxNm6FCz5XvxHFmTT/RXXKLCUlqdurkk7tJjHBLFZKd4mloHpYSbwk1X0
         O+N21AuqaowwugjmwPrxK8MVRi0ghmPMRQRfgob7mavyoMRfsBdgUMkHE5+6znr8Yhjc
         aewW9Ei6DUMeDJcGWt+rJPP9I5v5yl5Pgvs0zOdIplhk+EZUWonaf+WBor1+NCTVoOtx
         clc6eOtWT4GEj0I96qsI8aBb0bqIR728LRXA4ZRdj1Q6Xo+kHknW2uJC8E20m0L7seLt
         rhSYWxhdjV1v96EUldEbXPAnRUtt+BzhLvPj/USO9P7cDLFDYa0GaXqCfpMseMuzjVBw
         8oeQ==
X-Gm-Message-State: AOAM532yZ4UrgyFTgNp1pjosqMJu/sVgQTTogTeEOuvcmuWRquJxbYxj
        +lILI+hJEjgQXh8OlhsgWV7aYqdD
X-Google-Smtp-Source: ABdhPJxXBTxMDdAZetMLgp7CRcB5DqxY0DFx1nf+uN1wDkTvLjmvO5hTsosrTo1Y0mUCe2V0ztlA5A==
X-Received: by 2002:a17:902:8685:: with SMTP id g5mr477230plo.270.1593133609227;
        Thu, 25 Jun 2020 18:06:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w18sm24338472pfq.121.2020.06.25.18.06.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 18:06:48 -0700 (PDT)
Date:   Thu, 25 Jun 2020 18:06:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Josh Lehan <krellan@google.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (pmbus/core) Use s64 instead of long for
 calculations
Message-ID: <20200626010647.GA191227@roeck-us.net>
References: <20200626001343.162071-1-krellan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626001343.162071-1-krellan@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 25, 2020 at 05:13:43PM -0700, Josh Lehan wrote:
> Using s64 type, instead of long type,
> for internal calculations and the sysfs interface.
> 
> This allows 64-bit values to appear correctly on 32-bit kernels.
> As wattage is reported in microwatts,
> monitoring a power supply over 2KW requires this.
> 
> Although it may seem unlikely to run a 32-bit kernel on such
> a large machine, enterprise servers often include a BMC,
> and the BMC might be running a 32-bit kernel....
> 
> Effort: semitruck
> Google-Bug-Id: 159769574
> Signed-off-by: Josh Lehan <krellan@google.com>
> Change-Id: If89882e20387454189b2ebe20c793d4cf166dfa8

Applied to hwmon-next after removing irrelevant tags.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 66 +++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 51eb6d56d29c..52bf71ef5ac4 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -646,12 +646,12 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
>   * Convert linear sensor values to milli- or micro-units
>   * depending on sensor type.
>   */
> -static long pmbus_reg2data_linear(struct pmbus_data *data,
> -				  struct pmbus_sensor *sensor)
> +static s64 pmbus_reg2data_linear(struct pmbus_data *data,
> +				 struct pmbus_sensor *sensor)
>  {
>  	s16 exponent;
>  	s32 mantissa;
> -	long val;
> +	s64 val;
>  
>  	if (sensor->class == PSC_VOLTAGE_OUT) {	/* LINEAR16 */
>  		exponent = data->exponent[sensor->page];
> @@ -665,11 +665,11 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>  
>  	/* scale result to milli-units for all sensors except fans */
>  	if (sensor->class != PSC_FAN)
> -		val = val * 1000L;
> +		val = val * 1000LL;
>  
>  	/* scale result to micro-units for power sensors */
>  	if (sensor->class == PSC_POWER)
> -		val = val * 1000L;
> +		val = val * 1000LL;
>  
>  	if (exponent >= 0)
>  		val <<= exponent;
> @@ -683,8 +683,8 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>   * Convert direct sensor values to milli- or micro-units
>   * depending on sensor type.
>   */
> -static long pmbus_reg2data_direct(struct pmbus_data *data,
> -				  struct pmbus_sensor *sensor)
> +static s64 pmbus_reg2data_direct(struct pmbus_data *data,
> +				 struct pmbus_sensor *sensor)
>  {
>  	s64 b, val = (s16)sensor->data;
>  	s32 m, R;
> @@ -720,15 +720,15 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>  	}
>  
>  	val = div_s64(val - b, m);
> -	return clamp_val(val, LONG_MIN, LONG_MAX);
> +	return val;
>  }
>  
>  /*
>   * Convert VID sensor values to milli- or micro-units
>   * depending on sensor type.
>   */
> -static long pmbus_reg2data_vid(struct pmbus_data *data,
> -			       struct pmbus_sensor *sensor)
> +static s64 pmbus_reg2data_vid(struct pmbus_data *data,
> +			      struct pmbus_sensor *sensor)
>  {
>  	long val = sensor->data;
>  	long rv = 0;
> @@ -750,9 +750,9 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
>  	return rv;
>  }
>  
> -static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
> +static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
>  {
> -	long val;
> +	s64 val;
>  
>  	if (!sensor->convert)
>  		return sensor->data;
> @@ -776,7 +776,7 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
>  #define MIN_MANTISSA	(511 * 1000)
>  
>  static u16 pmbus_data2reg_linear(struct pmbus_data *data,
> -				 struct pmbus_sensor *sensor, long val)
> +				 struct pmbus_sensor *sensor, s64 val)
>  {
>  	s16 exponent = 0, mantissa;
>  	bool negative = false;
> @@ -798,8 +798,8 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  			val <<= -data->exponent[sensor->page];
>  		else
>  			val >>= data->exponent[sensor->page];
> -		val = DIV_ROUND_CLOSEST(val, 1000);
> -		return val & 0xffff;
> +		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
> +		return clamp_val(val, 0, 0xffff);
>  	}
>  
>  	if (val < 0) {
> @@ -809,14 +809,14 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  
>  	/* Power is in uW. Convert to mW before converting. */
>  	if (sensor->class == PSC_POWER)
> -		val = DIV_ROUND_CLOSEST(val, 1000L);
> +		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
>  
>  	/*
>  	 * For simplicity, convert fan data to milli-units
>  	 * before calculating the exponent.
>  	 */
>  	if (sensor->class == PSC_FAN)
> -		val = val * 1000;
> +		val = val * 1000LL;
>  
>  	/* Reduce large mantissa until it fits into 10 bit */
>  	while (val >= MAX_MANTISSA && exponent < 15) {
> @@ -830,11 +830,7 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  	}
>  
>  	/* Convert mantissa from milli-units to units */
> -	mantissa = DIV_ROUND_CLOSEST(val, 1000);
> -
> -	/* Ensure that resulting number is within range */
> -	if (mantissa > 0x3ff)
> -		mantissa = 0x3ff;
> +	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
>  
>  	/* restore sign */
>  	if (negative)
> @@ -845,9 +841,9 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  }
>  
>  static u16 pmbus_data2reg_direct(struct pmbus_data *data,
> -				 struct pmbus_sensor *sensor, long val)
> +				 struct pmbus_sensor *sensor, s64 val)
>  {
> -	s64 b, val64 = val;
> +	s64 b;
>  	s32 m, R;
>  
>  	m = data->info->m[sensor->class];
> @@ -865,30 +861,30 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>  		R -= 3;		/* Adjust R and b for data in milli-units */
>  		b *= 1000;
>  	}
> -	val64 = val64 * m + b;
> +	val = val * m + b;
>  
>  	while (R > 0) {
> -		val64 *= 10;
> +		val *= 10;
>  		R--;
>  	}
>  	while (R < 0) {
> -		val64 = div_s64(val64 + 5LL, 10L);  /* round closest */
> +		val = div_s64(val + 5LL, 10L);  /* round closest */
>  		R++;
>  	}
>  
> -	return (u16)clamp_val(val64, S16_MIN, S16_MAX);
> +	return (u16)clamp_val(val, S16_MIN, S16_MAX);
>  }
>  
>  static u16 pmbus_data2reg_vid(struct pmbus_data *data,
> -			      struct pmbus_sensor *sensor, long val)
> +			      struct pmbus_sensor *sensor, s64 val)
>  {
>  	val = clamp_val(val, 500, 1600);
>  
> -	return 2 + DIV_ROUND_CLOSEST((1600 - val) * 100, 625);
> +	return 2 + DIV_ROUND_CLOSEST_ULL((1600LL - val) * 100LL, 625);
>  }
>  
>  static u16 pmbus_data2reg(struct pmbus_data *data,
> -			  struct pmbus_sensor *sensor, long val)
> +			  struct pmbus_sensor *sensor, s64 val)
>  {
>  	u16 regval;
>  
> @@ -954,7 +950,7 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
>  		WARN(1, "Bad boolean descriptor %p: s1=%p, s2=%p\n", b, s1, s2);
>  		return 0;
>  	} else {
> -		long v1, v2;
> +		s64 v1, v2;
>  
>  		if (s1->data < 0)
>  			return s1->data;
> @@ -991,7 +987,7 @@ static ssize_t pmbus_show_sensor(struct device *dev,
>  	if (sensor->data < 0)
>  		return sensor->data;
>  
> -	return snprintf(buf, PAGE_SIZE, "%ld\n", pmbus_reg2data(data, sensor));
> +	return snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
>  }
>  
>  static ssize_t pmbus_set_sensor(struct device *dev,
> @@ -1002,11 +998,11 @@ static ssize_t pmbus_set_sensor(struct device *dev,
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
>  	ssize_t rv = count;
> -	long val = 0;
> +	s64 val;
>  	int ret;
>  	u16 regval;
>  
> -	if (kstrtol(buf, 10, &val) < 0)
> +	if (kstrtos64(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
>  	mutex_lock(&data->update_lock);
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 
