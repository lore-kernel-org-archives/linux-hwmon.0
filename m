Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2C1F76A4;
	Thu, 24 Oct 2024 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792103; cv=none; b=DWgy4AzcjJNTj4SUK/gZ1xhXgKvJxgcptszF7bXYrk/IuaMZMK902tF1cMnGta3yLUe/9gmVu+q34BRFb9RCmGCP6fun01v2a+JQyN1aeuM2yalSWMB/IH7ubKjU0plqLz4H6xB7Owo3SNSlfEsrAASY/Xd863uz69v61f3ZhyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792103; c=relaxed/simple;
	bh=ujWOwFhevPGtAdKmvCpae64ZnMyD1CiFuRqa6/pqfGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFqU3JetB4w9HxchxoLK04eZ/xV8fOeWm9Blu/xw3jJbXve3E25gCwFMfMOXL97znyFMdXVBQKpHt9NCypTa3e+nZQmIgHy2vIY/n6GgNIskycM8UVDgOkSuTO+5U/Tj9IUN2EduhHyzhHFaltqMo6gC/P7LihOdgoJ/9P+hLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpcXc9Ec; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpcXc9Ec"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso833129a12.0;
        Thu, 24 Oct 2024 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729792099; x=1730396899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=W1P2Xthi+y8MhLx+1fMRF5RwjBOFpxd6+imzhla2X0U=;
        b=kpcXc9Ecs0NhRM1N71m7J7UU2wWMBoewaYeJfHsX/uOZOee3xXU2MIie5/Gkn67SLv
         /srr0cqyIXtWSYk98AHJHsgibVQpQO7BCelUf1EkKG2Fh/KMDt/b+EZrqyhWw8XlWryJ
         muSsJCqbt9PEyFHUY1/+QveQOFT+CTRNd478r6ZHuF0T6oDW8YVzPTOnrHriGerobhvN
         MLkSLA0FVM3i271SXGlQ17FyNDL975EM1o3q9JStY7Xgl7Cl0lOrABTHkpK/VnrE9tDm
         x1c7Dqc9ZX4VkeS+zQbXRgwJ2LLWZQ9EnGVmHkuxrV0A665ztltlQQg2u+3l7/AhiTTm
         J4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792099; x=1730396899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1P2Xthi+y8MhLx+1fMRF5RwjBOFpxd6+imzhla2X0U=;
        b=sOIEa5zAyeKXmy1LZxcYuxJInKKdmO0EX4ZIfQ6sDmOSAcGvOJVyNvM7/099YJhIHe
         TAHNAbwcf6rph6J/NTrEy1XXKww4nJziHrLD4X9iuRCkOHpB/XbHXIUOZ6bl2uYFFk8r
         DT2Fhv+gJIkFJy22yo0zKfMmJNWQnCTTfafV1gNXYGvVmRGYv7jDV4Zmb0AoiuLm/4ao
         mXjglFhydiQeTIWhq/+0M8aWHayw/citIhQPKlMNcpzLUjwJ9GFNuYBiC/s0l8BCb5Lg
         bMsxG1mDWbDIn78SSJ7Ae4AQ3pVkFbKZ2xbVNjMPs9sSdN3LHFCY56Zu5soYLeFgibML
         57Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7Y5Y96ffaj6IbZsGF4x5w8eRg7XaR+dh9pZgS5+q6M5/bDWFoTuMtaN5CvaQJeBKcFQNMn1BNDnU@vger.kernel.org, AJvYcCVYrXE85XSwBy0vZGaQLLXAaod9gn/0SiSAz4fdlWYmdk6Y4+66uu4zHHntN7K1qsPJ9amTvfsGu9xi@vger.kernel.org, AJvYcCW58ZoTJoRIRMM6isAoXfCjMLMmPG7h/OcdsGl0A8GdCMDUvi2moVNY1qe0ch664xlCkcBSfS/Fl46n9jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dJbPPKvFwmxzcw5XwN5/zznJWOSZKqRCCz+ye8bNqg999QVU
	zOj57ODB5OtMdQNfqBFUKZy2iJ+ZJMVqTboviPxwkfFRfDHliCPz
X-Google-Smtp-Source: AGHT+IG/1+A9UgoYfgvQYBnhy3lGLHzm6QLx2wGsOQl7KrWzHMPy/zYYM49Ng9av8tAZ0Oiv7vwH/A==
X-Received: by 2002:a05:6a21:2d8c:b0:1d9:1907:aa2b with SMTP id adf61e73a8af0-1d978aeada5mr8525165637.1.1729792099421;
        Thu, 24 Oct 2024 10:48:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13ea114sm8195644b3a.158.2024.10.24.10.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:48:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d705ac9-a109-4b49-9ac6-78bd2e9ca091@roeck-us.net>
Date: Thu, 24 Oct 2024 10:48:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
To: Grant Peltier <grantpeltier93@gmail.com>, robh@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1729646466.git.grantpeltier93@gmail.com>
 <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 18:58, Grant Peltier wrote:
> Some applications require Vout to be higher than the detectable voltage
> range of the Vsense pin for a given rail. In such applications, a voltage
> divider may be placed between Vout and the Vsense pin, but this results
> in erroneous telemetry being read back from the part. This change adds
> support for a voltage divider to be defined in the devicetree for a (or
> multiple) specific rail(s) for a supported digital multiphase device and
> for the applicable Vout telemetry to be scaled based on the voltage
> divider configuration.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>   drivers/hwmon/pmbus/isl68137.c | 199 ++++++++++++++++++++++++++++++++-
>   1 file changed, 194 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 7e53fb1d5ea3..b4f581e1d560 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -13,6 +13,7 @@
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/string.h>
>   #include <linux/sysfs.h>
>   
> @@ -20,6 +21,7 @@
>   
>   #define ISL68137_VOUT_AVS	0x30
>   #define RAA_DMPVR2_READ_VMON	0xc8
> +#define MAX_CHANNELS            4
>   
>   enum chips {
>   	isl68137,
> @@ -72,6 +74,17 @@ enum variants {
>   	raa_dmpvr2_hv,
>   };
>   
> +struct isl68137_channel {
> +	u32 vout_voltage_divider[2];
> +};
> +
> +struct isl68137_data {
> +	struct pmbus_driver_info info;
> +	struct isl68137_channel channel[MAX_CHANNELS];
> +};
> +
> +#define to_isl68137_data(x)	container_of(x, struct isl68137_data, info)
> +
>   static const struct i2c_device_id raa_dmpvr_id[];
>   
>   static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
> @@ -163,6 +176,8 @@ static const struct attribute_group *isl68137_attribute_groups[] = {
>   static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
>   				     int phase, int reg)
>   {
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct isl68137_data *data = to_isl68137_data(info);
>   	int ret;
>   
>   	switch (reg) {
> @@ -170,6 +185,25 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
>   		ret = pmbus_read_word_data(client, page, phase,
>   					   RAA_DMPVR2_READ_VMON);
>   		break;
> +	case PMBUS_READ_POUT:
> +		/*
> +		 * In cases where a voltage divider is attached to the target
> +		 * rail between Vout and the Vsense pin, both Vout and Pout
> +		 * should be scaled by the voltage divider scaling factor.
> +		 * I.e. Vout = Vsense * (R1 + R2) / R2
> +		 */
> +		fallthrough;
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret > 0 && data->channel[page].vout_voltage_divider[0]
> +			&& data->channel[page].vout_voltage_divider[1]) {
> +			u64 temp = DIV_ROUND_CLOSEST_ULL((u64)ret *
> +				(data->channel[page].vout_voltage_divider[0]
> +				+ data->channel[page].vout_voltage_divider[1]),
> +				data->channel[page].vout_voltage_divider[1]);
> +			ret = clamp_val(temp, 0, 0xffff);
> +		}
> +		break;
>   	default:
>   		ret = -ENODATA;
>   		break;
> @@ -178,6 +212,50 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
>   	return ret;
>   }
>   
> +static int raa_dmpvr2_write_word_data(struct i2c_client *client, int page,
> +				      int reg, u16 word)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct isl68137_data *data = to_isl68137_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MAX:
> +		/*
> +		 * In cases where a voltage divider is attached to the target
> +		 * rail between Vout and the Vsense pin, Vout related PMBus
> +		 * commands should be scaled based on the expected voltage
> +		 * at the Vsense pin.
> +		 * I.e. Vsense = Vout * R2 / (R1 + R2)
> +		 */
> +		fallthrough;
> +	case PMBUS_VOUT_MARGIN_HIGH:
> +		fallthrough;
> +	case PMBUS_VOUT_MARGIN_LOW:
> +		fallthrough;
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +		fallthrough;
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		fallthrough;

Just add the comment after the last case and drop all the fallthrough;
Same above.

> +	case PMBUS_VOUT_COMMAND:
> +		if (data->channel[page].vout_voltage_divider[0]
> +			&& data->channel[page].vout_voltage_divider[1]) {

It would be better to set defaults instead of having to check this
for every executed command (for example by setting R1:=0 and R2:=1).

> +			u64 temp = DIV_ROUND_CLOSEST_ULL((u64)word *
> +				data->channel[page].vout_voltage_divider[1],
> +				(data->channel[page].vout_voltage_divider[0] +
> +				 data->channel[page].vout_voltage_divider[1]));
> +			ret = clamp_val(temp, 0, 0xffff);
> +		} else {
> +			ret = -ENODATA;
> +		}
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
>   static struct pmbus_driver_info raa_dmpvr_info = {
>   	.pages = 3,
>   	.format[PSC_VOLTAGE_IN] = direct,
> @@ -220,14 +298,67 @@ static struct pmbus_driver_info raa_dmpvr_info = {
>   	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
>   };
>   
> +static int isl68137_probe_child_from_dt(struct device *dev,
> +					struct device_node *child,
> +					struct isl68137_data *data)
> +{
> +	u32 channel;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &channel);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +	if (channel >= MAX_CHANNELS) {

The actual number of channels (pages) supported by the chip is known here
and should be checked, either by passing the number of channels or a pointer
to the entire info structure to this function.

> +		dev_err(dev, "invalid reg %d of %pOFn\n", channel, child);
> +		return -EINVAL;
> +	}
> +
> +	of_property_read_u32_array(child, "renesas,vout-voltage-divider",

Ultimately this potentially applies to _all_ hardware monitoring chips,
so I would very much prefer a generic voltage divider property definition.

> +				data->channel[channel].vout_voltage_divider,
> +				ARRAY_SIZE(data->channel[channel].vout_voltage_divider));

The returned data should be be validated here.

> +
> +	return 0;
> +}
> +
> +static int isl68137_probe_from_dt(struct device *dev,
> +				  struct isl68137_data *data)
> +{
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int err;
> +
> +	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
> +		err = isl68137_probe_child_from_dt(dev, child, data);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>   static int isl68137_probe(struct i2c_client *client)
>   {
> +	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
> +	struct isl68137_data *data;
> +	int i, err;
>   
> -	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> -	if (!info)
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>   		return -ENOMEM;
> -	memcpy(info, &raa_dmpvr_info, sizeof(*info));
> +
> +	for (i = 0; i < MAX_CHANNELS; i++)
> +		memset(data->channel[i].vout_voltage_divider,
> +			0,
> +			sizeof(data->channel[i].vout_voltage_divider));

Under what circumstance would this not already be 0 after devm_kzalloc() ?

> +
> +	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
> +	info = &data->info;
>   
>   	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
>   	case raa_dmpvr1_2rail:
> @@ -242,6 +373,7 @@ static int isl68137_probe(struct i2c_client *client)
>   	case raa_dmpvr2_1rail:
>   		info->pages = 1;
>   		info->read_word_data = raa_dmpvr2_read_word_data;
> +		info->write_word_data = raa_dmpvr2_write_word_data;
>   		break;
>   	case raa_dmpvr2_2rail_nontc:
>   		info->func[0] &= ~PMBUS_HAVE_TEMP3;
> @@ -250,9 +382,11 @@ static int isl68137_probe(struct i2c_client *client)
>   	case raa_dmpvr2_2rail:
>   		info->pages = 2;
>   		info->read_word_data = raa_dmpvr2_read_word_data;
> +		info->write_word_data = raa_dmpvr2_write_word_data;
>   		break;
>   	case raa_dmpvr2_3rail:
>   		info->read_word_data = raa_dmpvr2_read_word_data;
> +		info->write_word_data = raa_dmpvr2_write_word_data;
>   		break;
>   	case raa_dmpvr2_hv:
>   		info->pages = 1;
> @@ -263,11 +397,18 @@ static int isl68137_probe(struct i2c_client *client)
>   		info->m[PSC_POWER] = 2;
>   		info->R[PSC_POWER] = -1;
>   		info->read_word_data = raa_dmpvr2_read_word_data;
> +		info->write_word_data = raa_dmpvr2_write_word_data;
>   		break;
>   	default:
>   		return -ENODEV;
>   	}
>   
> +	if (dev->of_node) {

This conditional should not be necessary because for_each_child_of_node()
ultimately calls __of_get_next_child() which checks if the node pointer
is NULL.

> +		err = isl68137_probe_from_dt(dev, data);
> +		if (err)
> +			return err;
> +	}
> +
>   	return pmbus_do_probe(client, info);
>   }
>   
> @@ -318,11 +459,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>   
>   MODULE_DEVICE_TABLE(i2c, raa_dmpvr_id);
>   
> +static const struct of_device_id isl68137_of_match[] = {
> +	{ .compatible = "renesas,isl68137", .data = (void *)raa_dmpvr1_2rail },
> +	{ .compatible = "renesas,isl68220", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl68221", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl68222", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl68223", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl68224", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl68225", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl68226", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl68227", .data = (void *)raa_dmpvr2_1rail },
> +	{ .compatible = "renesas,isl68229", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl68233", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl68239", .data = (void *)raa_dmpvr2_3rail },
> +
> +	{ .compatible = "renesas,isl69222", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69223", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl69224", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69225", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69227", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl69228", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl69234", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69236", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69239", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl69242", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69243", .data = (void *)raa_dmpvr2_1rail },
> +	{ .compatible = "renesas,isl69247", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69248", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69254", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69255", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69256", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69259", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69260", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69268", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,isl69269", .data = (void *)raa_dmpvr2_3rail },
> +	{ .compatible = "renesas,isl69298", .data = (void *)raa_dmpvr2_2rail },
> +
> +	{ .compatible = "renesas,raa228000", .data = (void *)raa_dmpvr2_hv },
> +	{ .compatible = "renesas,raa228004", .data = (void *)raa_dmpvr2_hv },
> +	{ .compatible = "renesas,raa228006", .data = (void *)raa_dmpvr2_hv },
> +	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
> +	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, isl68137_of_match);
> +
>   /* This is the driver that will be inserted */
>   static struct i2c_driver isl68137_driver = {
>   	.driver = {
> -		   .name = "isl68137",
> -		   },
> +		.name = "isl68137",
> +		.of_match_table = isl68137_of_match,
> +	},
>   	.probe = isl68137_probe,
>   	.id_table = raa_dmpvr_id,
>   };

