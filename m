Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C603F789E
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773632; cv=none; b=TXZ3ZEp50M1nPK6n83lKiUaG0DQ6XzBjHs8TfKOdWVzij6goXDeaHlOpTQkE8HYIXEebWTRLiQ8zj/IVZ/uSiojC2bMrSfIr6RWPGhx3F7dWzcJpvRZ2YHLZ4TCHLiYw2PAsl70eFs/13VpY6xWwKZXcGUQuH9u/fm6YQE7oQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773632; c=relaxed/simple;
	bh=35gwWJnlaPZRb6KGK/nu9wvtWYDj+e3IbO5il0A049o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgc5MhlrNwwDPASGgl3snVP2+LGSpYcSzm8ESXEjyozYEo2hNjXAjX0+RbTz096aU3sj2+VxZT7yEcf9QZvSDa++KWtDjNT1GiLG2OYtFQpZtk02ZTBqO3aoN06GesSzAHx6oqbWL9Syx8fAP333W41ehikCERrgknP+Src+0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx6UqmDZ; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx6UqmDZ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128d7db88b9so7392733c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773630; x=1774378430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y03ElVXkR6NvBgzfk5bST2HFUGhnQLVM61tRglECsAI=;
        b=Fx6UqmDZi52GApuBm5vilWUdy/yRvVpN2cz2WDawyq1Qwt6cjMOjy0we100K6Bue8/
         cc2elntR9TOwQarMcIckDB9f5pRqgQbqU8UEvAbIxvyxv95FSNpzX1ghgBnRAYnVLT2p
         CyA19mfveJ/z0PfZNzYLK+2nr7bwZjLkt+wXZi8ZI6JlImZG7UWKIctZ48gYccsrWHj0
         X4gCkhgTGcHuGvfplqavZkQO42j0spPE3j1Y+QGlei6iYTxD8N8SAIbjeLlE889HJCT4
         JmudAbXOvwuxnL6V7Pwe+wqjiRCfSnOoJojvmoPQeZeff6oLB+ZY210yDavn5YW9qx0z
         DtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773630; x=1774378430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y03ElVXkR6NvBgzfk5bST2HFUGhnQLVM61tRglECsAI=;
        b=f+t6DuZOs+xbjwawdAtJ9hwsllpZv2zZcKGn5qId1dtox1NFoFpqXEYPMtVTRZoOL7
         0IcWdH1c/v206x58A121JGt5ulVcoNAah2V9P8uX7GHqXgR9BewmO6xfwJu3u1fUAUZU
         79ojlh8E2hELNXU07B2vDLxv3Bpbp/ea/16klHgHZW5xj8y662SG9ZFdxP3safIWB4+H
         bPFpYoM7xelwi7BYK834ESeYEghESrWQhgynFtSIghNcGjg14M0K+GMLTuB+OfnFteD3
         5bm55IEsKTiaPX891s6C8T3fbr5MtyzYvf2Hc1SOw6JcpsZmG2W1Zkxnh5nbTAdxKKZ+
         8e4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK413uaqy2hHagks9OG9hOsU04UFNc8Wi2cmu+0A6Lvt/MGCmgJVy52hSG+YYaW8tj2pV1wTTMC15RLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYAYZIdBC2Rx9DHmq3/J8rGZpZI0X1X5s7dKeL/5sEzNXe30k
	qZigT7sR5Xs/LzfLAXZzToRsyuZR87CnK1iJ3Zjzeqlo4VfWvz7ZhZOiK9bhBQ==
X-Gm-Gg: ATEYQzyG+P9sGMIjHD8Ih5Q+uSbtPu/JR7ahNAA6x9gVMb/uEl/TtjYmjP0pHy8z5gG
	mrODa/LzXH7l8r4sG5/CB2zYT4QJXb8iT4195JfprQkBYUCOhDSOEKqjDW35RIj+grA4nbtknIo
	uvuJ3VQFfr7euTFT03tFUv6h6zK8bh3ZUTinvQ3c7K/bScNgR0Ywns/bARTYkcEauvgpz09aDsl
	UD5oVD/ZGt6JdRFfXkXpgl3VNPeHr0gwXIhS+elp7PvSsWGTuQC5UQhEDXkMOcPShCCpKO0TgjH
	kMzBAyOxwoNRfv926BsIexThW/CxZPbDkPIuhdali0meZOMPYNDE7hjdX0a+IFPH94PtlMK/dZb
	V/jbYJzQYdJenC7AwXEMgFqpNovWxxfVNzFKi+thYZ04tFDJJi7eu/8qyJ1lKs/s5C2jiM1nKzN
	+X8GB7WGmQPE3q3uPDg4J9m19iY3AYOjPAyJMrzbGRhvq3BCLzlaJ1Zk/hy1h2hGtr9042lSWm
X-Received: by 2002:a05:7022:49e:b0:11d:c22e:a131 with SMTP id a92af1059eb24-1299ba5f162mr383669c88.3.1773773629555;
        Tue, 17 Mar 2026 11:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b3e8dc1fsm846221c88.8.2026.03.17.11.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:53:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e86bdc50-c9c6-47d0-8c46-1ef58aa4ac77@roeck-us.net>
Date: Tue, 17 Mar 2026 11:53:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: Sanman Pradhan <psanman@juniper.net>,
 linux-hwmon <linux-hwmon@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20260309004508.78609-1-sanman.p211993@gmail.com>
 <20260309004508.78609-3-sanman.p211993@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260309004508.78609-3-sanman.p211993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/26 17:45, Sanman Pradhan wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The MAX31785 fan controller occasionally NACKs master transactions if
> accesses are too tightly spaced. To avoid this, the driver currently
> enforces a 250us inter-access delay with a private timestamp and wrapper
> functions around both raw SMBus accesses and PMBus helper paths.
> 
> Simplify the driver by using pmbus_driver_info.access_delay for normal
> PMBus-mediated accesses instead, and remove the driver-local PMBus
> read/write wrappers.
> 
> Keep local delay handling for raw SMBus accesses used before
> pmbus_do_probe(). For the raw i2c_transfer() long-read path, which
> bypasses PMBus core timing, leverage the newly exported pmbus_wait() and
> pmbus_update_ts() core functions. This replaces hardcoded usleep_range()
> calls and ensures the PMBus core tracks the raw transaction. Placing
> pmbus_update_ts() before the error check fixes a bug where a failed
> i2c_transfer() would skip the delay and impact subsequent PMBus commands.
> 
> Additionally, update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12
> accesses are only remapped for virtual pages, allowing physical-page
> accesses to fall back to the PMBus core. With that change, we can safely
> drop the custom max31785_update_fan() wrapper in favor of the core
> pmbus_update_fan() helper.
> 
> Also use the delayed raw read helper for MFR_REVISION during probe, drop
> the unused to_max31785_data() macro, and rename the local variable
> "virtual" to "vpage".
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

AI review feedback (from https://sashiko.dev/#/patchset/20260309004508.78609-1-sanman.p211993%40gmail.com)
below.

Guenter

> ---
>   drivers/hwmon/pmbus/max31785.c | 187 +++++++++++----------------------
>   1 file changed, 59 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 50073fe0c5e8..098f43486c45 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -31,8 +31,6 @@ struct max31785_data {
>   	struct pmbus_driver_info info;
>   };
>   
> -#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
> -
>   /*
>    * MAX31785 Driver Workaround
>    *
> @@ -40,9 +38,8 @@ struct max31785_data {
>    * These issues are not indicated by the device itself, except for occasional
>    * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
>    *
> - * To address this, we introduce a delay of 250us between consecutive accesses
> - * to the fan controller. This delay helps mitigate communication problems by
> - * allowing sufficient time between accesses.
> + * Keep minimal local delay handling for raw pre-probe SMBus accesses.
> + * Normal PMBus-mediated accesses use pmbus_driver_info.access_delay instead.
>    */
>   static inline void max31785_wait(const struct max31785_data *data)
>   {
> @@ -54,89 +51,42 @@ static inline void max31785_wait(const struct max31785_data *data)
>   }
>   
>   static int max31785_i2c_write_byte_data(struct i2c_client *client,
> -					struct max31785_data *driver_data,
> -					int command, u8 data)
> +					struct max31785_data *data,
> +					int command, u8 value)
>   {
>   	int rc;
>   
> -	max31785_wait(driver_data);
> -	rc = i2c_smbus_write_byte_data(client, command, data);
> -	driver_data->access = ktime_get();
> +	max31785_wait(data);
> +	rc = i2c_smbus_write_byte_data(client, command, value);
> +	data->access = ktime_get();
>   	return rc;
>   }
>   
>   static int max31785_i2c_read_word_data(struct i2c_client *client,
> -				       struct max31785_data *driver_data,
> +				       struct max31785_data *data,
>   				       int command)
>   {
>   	int rc;
>   
> -	max31785_wait(driver_data);
> +	max31785_wait(data);
>   	rc = i2c_smbus_read_word_data(client, command);
> -	driver_data->access = ktime_get();
> -	return rc;
> -}
> -
> -static int _max31785_read_byte_data(struct i2c_client *client,
> -				    struct max31785_data *driver_data,
> -				    int page, int command)
> -{
> -	int rc;
> -
> -	max31785_wait(driver_data);
> -	rc = pmbus_read_byte_data(client, page, command);
> -	driver_data->access = ktime_get();
> -	return rc;
> -}
> -
> -static int _max31785_write_byte_data(struct i2c_client *client,
> -				     struct max31785_data *driver_data,
> -				     int page, int command, u16 data)
> -{
> -	int rc;
> -
> -	max31785_wait(driver_data);
> -	rc = pmbus_write_byte_data(client, page, command, data);
> -	driver_data->access = ktime_get();
> -	return rc;
> -}
> -
> -static int _max31785_read_word_data(struct i2c_client *client,
> -				    struct max31785_data *driver_data,
> -				    int page, int phase, int command)
> -{
> -	int rc;
> -
> -	max31785_wait(driver_data);
> -	rc = pmbus_read_word_data(client, page, phase, command);
> -	driver_data->access = ktime_get();
> -	return rc;
> -}
> -
> -static int _max31785_write_word_data(struct i2c_client *client,
> -				     struct max31785_data *driver_data,
> -				     int page, int command, u16 data)
> -{
> -	int rc;
> -
> -	max31785_wait(driver_data);
> -	rc = pmbus_write_word_data(client, page, command, data);
> -	driver_data->access = ktime_get();
> +	data->access = ktime_get();
>   	return rc;
>   }
>   
>   static int max31785_read_byte_data(struct i2c_client *client, int page, int reg)
>   {
> -	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -	struct max31785_data *driver_data = to_max31785_data(info);
>   
>   	switch (reg) {
>   	case PMBUS_VOUT_MODE:
>   		return -ENOTSUPP;
>   	case PMBUS_FAN_CONFIG_12:
> -		return _max31785_read_byte_data(client, driver_data,
> -						page - MAX31785_NR_PAGES,
> -						reg);
> +		if (page < MAX31785_NR_PAGES)
> +			return -ENODATA;
> +
> +		return pmbus_read_byte_data(client,
> +					    page - MAX31785_NR_PAGES,
> +					    reg);
>   	}
>   
>   	return -ENODATA;
> @@ -178,7 +128,20 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
>   	if (rc < 0)
>   		return rc;
>   
> +	/* Ensure the raw transfer is properly spaced from the
> +	 * preceding PMBus transaction.
> +	 */
> +	pmbus_wait(client);
> +
>   	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +
> +	/*
> +	 * Update PMBus core timing state for the raw transfer, even on error.
> +	 * Pass 0 as the operation mask since this is a raw read, intentionally
> +	 * neither PMBUS_OP_WRITE nor PMBUS_OP_PAGE_CHANGE.
> +	 */
> +	pmbus_update_ts(client, 0);
> +
>   	if (rc < 0)
>   		return rc;
>   
> @@ -203,19 +166,18 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
>   	return rv;
>   }
>   
> -static int max31785_get_pwm_mode(struct i2c_client *client,
> -				 struct max31785_data *driver_data, int page)
> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>   {
>   	int config;
>   	int command;
>   
> -	config = _max31785_read_byte_data(client, driver_data, page,
> -					  PMBUS_FAN_CONFIG_12);
> +	config = pmbus_read_byte_data(client, page,
> +				      PMBUS_FAN_CONFIG_12);
>   	if (config < 0)
>   		return config;
>   
> -	command = _max31785_read_word_data(client, driver_data, page, 0xff,
> -					   PMBUS_FAN_COMMAND_1);
> +	command = pmbus_read_word_data(client, page, 0xff,
> +				       PMBUS_FAN_COMMAND_1);
>   	if (command < 0)
>   		return command;
>   
> @@ -233,8 +195,6 @@ static int max31785_get_pwm_mode(struct i2c_client *client,
>   static int max31785_read_word_data(struct i2c_client *client, int page,
>   				   int phase, int reg)
>   {
> -	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -	struct max31785_data *driver_data = to_max31785_data(info);
>   	u32 val;
>   	int rv;
>   
> @@ -263,7 +223,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
>   		rv = max31785_get_pwm(client, page);
>   		break;
>   	case PMBUS_VIRT_PWM_ENABLE_1:
> -		rv = max31785_get_pwm_mode(client, driver_data, page);
> +		rv = max31785_get_pwm_mode(client, page);
>   		break;
>   	default:
>   		rv = -ENODATA;
> @@ -294,35 +254,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
>   	return (sensor_val * 100) / 255;
>   }
>   
> -static int max31785_update_fan(struct i2c_client *client,
> -			       struct max31785_data *driver_data, int page,
> -			       u8 config, u8 mask, u16 command)
> -{
> -	int from, rv;
> -	u8 to;
> -
> -	from = _max31785_read_byte_data(client, driver_data, page,
> -					PMBUS_FAN_CONFIG_12);
> -	if (from < 0)
> -		return from;
> -
> -	to = (from & ~mask) | (config & mask);
> -
> -	if (to != from) {
> -		rv = _max31785_write_byte_data(client, driver_data, page,
> -					       PMBUS_FAN_CONFIG_12, to);
> -		if (rv < 0)
> -			return rv;
> -	}
> -
> -	rv = _max31785_write_word_data(client, driver_data, page,
> -				       PMBUS_FAN_COMMAND_1, command);
> -
> -	return rv;
> -}
> -
> -static int max31785_pwm_enable(struct i2c_client *client,
> -			       struct max31785_data *driver_data, int page,
> +static int max31785_pwm_enable(struct i2c_client *client, int page,
>   			       u16 word)
>   {
>   	int config = 0;
> @@ -351,23 +283,21 @@ static int max31785_pwm_enable(struct i2c_client *client,
>   		return -EINVAL;
>   	}
>   
> -	return max31785_update_fan(client, driver_data, page, config,
> +	return pmbus_update_fan(client, page, 0, config,
>   				   PB_FAN_1_RPM, rate);
>   }
>   
>   static int max31785_write_word_data(struct i2c_client *client, int page,
>   				    int reg, u16 word)
>   {
> -	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> -	struct max31785_data *driver_data = to_max31785_data(info);
>   
>   	switch (reg) {
>   	case PMBUS_VIRT_PWM_1:
> -		return max31785_update_fan(client, driver_data, page, 0,
> -					   PB_FAN_1_RPM,
> -					   max31785_scale_pwm(word));
> +		return pmbus_update_fan(client, page, 0, 0,
> +					PB_FAN_1_RPM,
> +					max31785_scale_pwm(word));
>   	case PMBUS_VIRT_PWM_ENABLE_1:
> -		return max31785_pwm_enable(client, driver_data, page, word);
> +		return max31785_pwm_enable(client, page, word);
>   	default:
>   		break;
>   	}
> @@ -391,6 +321,7 @@ static const struct pmbus_driver_info max31785_info = {
>   	.read_byte_data = max31785_read_byte_data,
>   	.read_word_data = max31785_read_word_data,
>   	.write_byte = max31785_write_byte,
> +	.access_delay = MAX31785_WAIT_DELAY_US,
>   
>   	/* RPM */
>   	.format[PSC_FAN] = direct,
> @@ -438,29 +369,29 @@ static const struct pmbus_driver_info max31785_info = {
>   };
>   
>   static int max31785_configure_dual_tach(struct i2c_client *client,
> -					struct pmbus_driver_info *info)
> +					struct max31785_data *data)
>   {
> +	struct pmbus_driver_info *info = &data->info;
>   	int ret;
>   	int i;
> -	struct max31785_data *driver_data = to_max31785_data(info);
>   
>   	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
> -		ret = max31785_i2c_write_byte_data(client, driver_data,
> +		ret = max31785_i2c_write_byte_data(client, data,
>   						   PMBUS_PAGE, i);
>   		if (ret < 0)
>   			return ret;
>   
> -		ret = max31785_i2c_read_word_data(client, driver_data,
> +		ret = max31785_i2c_read_word_data(client, data,
>   						  MFR_FAN_CONFIG);
>   		if (ret < 0)
>   			return ret;
>   
>   		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
> -			int virtual = MAX31785_NR_PAGES + i;
> +			int vpage = MAX31785_NR_PAGES + i;
>   
> -			info->pages = virtual + 1;
> -			info->func[virtual] |= PMBUS_HAVE_FAN12;
> -			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
> +			info->pages = vpage + 1;
> +			info->func[vpage] |= PMBUS_HAVE_FAN12;
> +			info->func[vpage] |= PMBUS_PAGE_VIRTUAL;
>   		}
>   	}
>   
> @@ -471,7 +402,7 @@ static int max31785_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
> -	struct max31785_data *driver_data;
> +	struct max31785_data *data;
>   	bool dual_tach = false;
>   	int ret;
>   
> @@ -480,20 +411,20 @@ static int max31785_probe(struct i2c_client *client)
>   				     I2C_FUNC_SMBUS_WORD_DATA))
>   		return -ENODEV;
>   
> -	driver_data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
> -	if (!driver_data)
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>   		return -ENOMEM;
>   
> -	info = &driver_data->info;
> -	driver_data->access = ktime_get();
> +	data->access = ktime_get();
> +	info = &data->info;
>   	*info = max31785_info;
>   
> -	ret = max31785_i2c_write_byte_data(client, driver_data,
> -					   PMBUS_PAGE, 255);
> +	ret = max31785_i2c_write_byte_data(client, data,
> +					   PMBUS_PAGE, 0xff);
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = i2c_smbus_read_word_data(client, MFR_REVISION);
> +	ret = max31785_i2c_read_word_data(client, data, MFR_REVISION);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -509,7 +440,7 @@ static int max31785_probe(struct i2c_client *client)
>   	}
>   
>   	if (dual_tach) {
> -		ret = max31785_configure_dual_tach(client, info);
> +		ret = max31785_configure_dual_tach(client, data);
>   		if (ret < 0)
>   			return ret;
>   	}

Is there a missing inter-access delay before the first PMBus core transaction?
During probe, the driver performs raw I2C accesses and enforces the delay
using max31785_wait(data). The driver then calls pmbus_do_probe(), which
initializes the PMBus core delay tracking variable.
When the PMBus core executes its very first command, its internal delay
logic calculates a negative delay against the newly initialized variable and
executes the transaction without delay.
Because the PMBus core is unaware of the driver local timestamp, could
this violate the 250us delay requirement from the last pre-probe driver
access and cause the controller to NACK the first command?
Should there be an explicit max31785_wait(data) right before calling
pmbus_do_probe() to prevent this?

