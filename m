Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852E31FA26C;
	Sat, 25 Jan 2025 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737771738; cv=none; b=I17ZIBTzFBpRf39vZ1lLXqs3M3lxaPfsQsPEA+06yYxzHuJDxDsvlQ/TdNF6GikcAB7jPMl1kSupMwZ6K7U+XPwqXEMF84M+GdfmYuRwLMDOxeM7nD5pxiARDL+hO2/VuV3KYe7qmuPl5q4qNJui0+r69cTTaviywlLpXUJmevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737771738; c=relaxed/simple;
	bh=Bh7KFi0vVbMKUEbgccerJ7ApmnA7Yw6IeTtCm/S+5iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWoLHqeCA1cj0UdWahLnKQ97Cm6YrkSkpljhn6ED4xeJv2+UIom8tdQuqUDrcF5Ad6NjDbKMyLZZlsg2/wM171Obqu8UqORcilEVOQiJ9Yh6M5cEM8hNuVH77j6kSgs4y7mA/vUwVchHWkQLLu5ZxIY6tLs40ytdbgVOqPC6ODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j4wKtev7; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j4wKtev7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=UibvdDSXR29ETUi7iAgxR/zcMfCGMElss8ogFDbpquY=;
	b=j4wKtev7EKjYmOsOuVp4B1qL4aEMVRE42eeDNJCv6/EUvbtCfA09boF8o7+AKX
	yL95Qm8D0QV9+Dmymyp0j07a4FwwOchFJxjDkwI4GiQHYGT6qNVzzTvDjd3hjSX3
	6GxWFjFmDlaU1rrrYI1XV6blCVPs6VNcV1rJLJT6anKGI=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDn7+uZSpRnid3HIQ--.41899S4;
	Sat, 25 Jan 2025 10:21:14 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: christophe.jaillet@wanadoo.fr
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v3 2/2] hwmon:(ina238)Add support for SQ52206
Date: Sat, 25 Jan 2025 10:20:48 +0800
Message-ID: <20250125022049.1226664-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5f4095b0-8105-4001-81ac-e4f7053e45ae@wanadoo.fr>
References: <5f4095b0-8105-4001-81ac-e4f7053e45ae@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn7+uZSpRnid3HIQ--.41899S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7Kr45Kw4UJF4furyxAFb_yoW5uF4UpF
	Z7GayUKFW5XF17WrW7Xa9rZFyfKrn7Gry2yr4xG3WI9F1vyr97GFyIkrWqk3Z3ury8WF42
	vw1UtFyfuws7ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUeBTnUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiow7f02eUN8HpIQAAss

At 2025-01-24 16:09:14, "Christophe JAILLET" <christophe.jaillet@wanadoo.fr> wrote:
>Le 17/01/2025 à 09:20, Wenliang Yan a écrit :
>> Add support for SQ52206 to the Ina238 driver. Add registers,
>> add calculation formulas, increase compatibility, add
>> compatibility programs for multiple chips.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>
>Hi,
>
>a few nitpick below, should a v4 be needed.

Hello,

Thank you for your review, I will update and submit V4.

>...
>
>> +static ssize_t energy1_input_show(struct device *dev,
>> +				  struct device_attribute *da, char *buf)
>> +{
>> +	struct ina238_data *data = dev_get_drvdata(dev);
>> +	int ret;
>> +	u64 val;
>> +
>> +	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* result in microJoule */
>> +	val = div_u64(val * 96 * INA238_FIXED_SHUNT * data->gain,
>> +			       data->rshunt * 100);
>> +
>> +	return sprintf(buf, "%llu\n", val);
>
>Maybe sysfs_emit()?

Agree, I will make modifications.

>> +}
>> +
>>   static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
>>   		       u32 attr, int channel, long *val)
>>   {
>
>...
>
>> @@ -530,6 +640,15 @@ static const struct hwmon_chip_info ina238_chip_info = {
>>   	.info = ina238_info,
>>   };
>>   
>> +/* energy attributes are 5bytes wide so we need u64 */
>
>Missing space or done intentionally? (5 bytes)

Agree, I will make modifications. (5 bytes)

>> +static DEVICE_ATTR_RO(energy1_input);
>> +
>> +static struct attribute *ina238_attrs[] = {
>> +	&dev_attr_energy1_input.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(ina238);
>> +
>>   static int ina238_probe(struct i2c_client *client)
>>   {
>>   	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
>> @@ -537,13 +656,19 @@ static int ina238_probe(struct i2c_client *client)
>>   	struct device *hwmon_dev;
>>   	struct ina238_data *data;
>>   	int config;
>> +	enum ina238_ids chip;
>
>Maybe move 1 line up, to keep RCT style?

Agree, I will make modifications.

>>   	int ret;
>>   
>> +	chip = (uintptr_t)i2c_get_match_data(client);
>> +
>>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>
>...
>
>> @@ -616,14 +747,26 @@ static int ina238_probe(struct i2c_client *client)
>>   }
>>   
>>   static const struct i2c_device_id ina238_id[] = {
>> -	{ "ina238" },
>> +	{ "ina237", ina237 },
>> +	{ "ina238", ina238 },
>> +	{ "sq52206", sq52206 },
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(i2c, ina238_id);
>>   
>>   static const struct of_device_id __maybe_unused ina238_of_match[] = {
>> -	{ .compatible = "ti,ina237" },
>> -	{ .compatible = "ti,ina238" },
>> +	{
>> +		.compatible = "silergy,sq52206",
>> +		.data = (void *)sq52206
>> +	},
>> +	{
>> +		.compatible = "ti,ina237",
>> +		.data = (void *)ina237
>> +	},
>> +	{
>> +		.compatible = "ti,ina238",
>> +		.data = (void *)ina238
>> +	},
>>   	{ },
>
>While touching things here, this ending comma could be removed ro be 
>consistent with the other struct just above.

Okay, I will follow the same structure as above. (remove comma)

>>   };
>>   MODULE_DEVICE_TABLE(of, ina238_of_match);
>> @@ -642,3 +785,4 @@ module_i2c_driver(ina238_driver);
>>   MODULE_AUTHOR("Nathan Rossi <nathan.rossi@digi.com>");
>>   MODULE_DESCRIPTION("ina238 driver");
>>   MODULE_LICENSE("GPL");
>> +


Thanks,
Wenliang Yan

