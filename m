Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0627A462
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029091; cv=none; b=memFbX/tXcoIECZubFZ9g3TYuM9d//gWpufvGgwklG8lb2ng/nG5YSJxbigDUZaGNItalUxCRQRKgT40Rkh/JCDzvkQXu8N0Zijv1k7Ea1wcluyGsWtpoc7K0pmFiaiLdAVMPyPVQp9BA55Dp8hVsmXkNCe3gWqdeVhoSZeeud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029091; c=relaxed/simple;
	bh=cRCNepXcU3YpljHIpxq7D8A7BYC7zIaNISaZN+81A28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmK38ki71g+32cS/gAjfSric6DFpQ5/8N2EgQsIhow8sbHfHhj1E+r5pUhGrkrbnx0DI+jSuETxb5tLnUwBBBi3lEa2AO/x5cgii5dwCBy79+/YreiOpWdqfevDy6bAtEugdkwabpBS86BQFtVeN5WwAQU1MZrUNyC1wbiTPZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=SAw+ezxd; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="SAw+ezxd"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so4777161a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1775029086; x=1775633886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6WD7XhZT3TK7RM3SA9+0gwCRbhFkp/oQx/7Cq7ZAPA=;
        b=SAw+ezxdvhvqaCPQ9Nvk7mHJFJgOkAG+j+21pOj1kr2nwfzZdAN6TqM3OprdEmz+1u
         IqlwrNQvTnIsee5T+VUIJcJ1Yh1D8lkv7DZvrFeFK6vsN6W216uX7AFVoioP79Gm+BcV
         Hqt2EtPm6NxI9Cb7zHWzi27XO1J/1gWLo4Z/rqRQijpkUU8A+0P6pEm61kttpLipgnHc
         xd2OuDn5cn3rh3/+21XQUNE/su4f+xKrBYYk1GgNlA2fVK+a8kKjadWSCBdLzypKsckS
         1Zmd5qyTPes25o6Ulmi1aI32ksNPdyHfVqJJYl5CoVT4dqFd3oPuXMsq4kfsAL07lcb0
         VyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029086; x=1775633886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6WD7XhZT3TK7RM3SA9+0gwCRbhFkp/oQx/7Cq7ZAPA=;
        b=iqtlr4B+Pl/yNPFdQbHExH4hPcO5CdWn2trG2zWqYi5+ZNcu2lXI3UuJwqSjaWIjVO
         jbSpZEhTN5gVJVrno33QMnpimpJlB267+Q4XTVJJIuxSW3KjfAKOrddEL6RKSaoFPr4p
         yxFuXeBvyDv0HO3Qku2JYqkgkmP+avZcJZD1IPcphxpnh0UFDfIp2RXFJPqRrFsKB/nc
         tIjt6CTOsq+0HH7xX8jih1ynQ5wmvgiz7GFXtiT+c6+IwryfZuFmKejubrdBsvjB14ti
         I3gFfvMKIYpwKB9spNqiYfF4VJpcQvAqBEg0kg5B9QBO0DDpjvGu5gIUP8xzF1Yw9GZE
         Ovww==
X-Forwarded-Encrypted: i=1; AJvYcCVrWu9cBnzET7DAcXgLzIS1Jd0OLUel9Q2SaP22qKdC/6pLVp7KuWD995Ks4E5XlY0/W60OTGKoYok1CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96r/CrsOCQWazLK55Up6VaFADJo/yciAQNeq77Ary0hCf75qU
	oJJzpcIW2QzpFL6LZBE6X4mzccCycATtY6e9O1ldl9CfBBLA5x2L1TvPqjnzjhMQo7I=
X-Gm-Gg: ATEYQzycIZg/lkyWCUALYtWp02rjv6x1pN2El0cXtKmMvFGmbmohQvVQ8IUMxwGYef3
	1XrmqXAYTBGmWqz/U95Q+UzKw1fzCOUaWSxZJFABP0W7rzs0FMqutf3N98+W/P5Xx9cXWRTY0Mn
	pTUCZa+PPkjookXgmVejbk/eN6ooxCVbKvQjVRQW2I8dMr+5tP0+OSR0w1IggkCvqROnMj7JEem
	QHo7Cj0FHk/M5YwkE4Qa+YMkD0jmOAxYR/6RnJDTn2h/4KseFfXYbcGbW4bvGzZ3LQ6TLDuOzpj
	wcNWKabAq+BrbAcmXAWW4Ydgjad8h7bQA6fC69AyKEPjtnvLD+McvdiDyKWlguMnn3GtYGj0N5b
	og2Ld3UaKv+ZqDy8D3HxJg+iCjeJJu6u0JKWvHXbdz0OT7kJ5wG03ZoIxmiCTuT4+MjG77sIiyv
	3NTVFf6eMpxpAjxlUUpCa+KmQrXcIaz5/OOpGYzLtZbxF9YCjQKnHEvhopZfk05BM8RZcz
X-Received: by 2002:a17:90b:57e7:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35dc6f8a7f5mr2536916a91.29.1775029086417;
        Wed, 01 Apr 2026 00:38:06 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbb840a36sm1937737a91.4.2026.04.01.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:38:05 -0700 (PDT)
Date: Wed, 1 Apr 2026 07:38:02 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cheng.JackHY@inventec.com, chiang.brian@inventec.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Message-ID: <u32f65hugozpemi2eya22pwwes7oev4k5c4sr3zn47m6di7tgk@o7ossgndlczv>
References: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
 <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-2-77bc77eedc76@inventec.com>
 <79e3b8f1-f8ba-41af-96d4-b9a1b84ef810@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <79e3b8f1-f8ba-41af-96d4-b9a1b84ef810@roeck-us.net>

On Thu, Mar 26, 2026 at 09:29:38AM -0700, Guenter Roeck wrote:
>On Thu, Mar 26, 2026 at 01:48:06PM +0000, Brian Chiang wrote:
>> From: Jack Cheng <cheng.jackhy@inventec.com>
>>
>> The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
>> module from Delta Power Modules.
>>
>> The Q50SN12072, quarter brick, single output 12V. This product provides up
>> to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
>> efficiency up to 98.3%@54Vin.
>>
>> The Q54SN120A1, quarter brick, single output 12V. This product provides up
>> to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
>> efficiency up to 98.1%@54Vin.
>>
>> Add support for them to q54sj108a2 driver.
>>
>> Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
>> Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
>> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
>> ---
>>  drivers/hwmon/pmbus/q54sj108a2.c | 97 ++++++++++++++++++++++++++++------------
>>  1 file changed, 68 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
>> index d5d60a9af8c5..cc2b32ad935c 100644
>> --- a/drivers/hwmon/pmbus/q54sj108a2.c
>> +++ b/drivers/hwmon/pmbus/q54sj108a2.c
>> @@ -22,7 +22,9 @@
>>  #define PMBUS_FLASH_KEY_WRITE		0xEC
>>
>>  enum chips {
>> -	q54sj108a2
>> +	q50sn12072,
>> +	q54sj108a2,
>> +	q54sn120a1
>>  };
>>
>>  enum {
>> @@ -55,10 +57,24 @@ struct q54sj108a2_data {
>>  #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
>>
>>  static struct pmbus_driver_info q54sj108a2_info[] = {
>> -	[q54sj108a2] = {
>> +	[q50sn12072] = {
>>  		.pages = 1,
>> +		/* Source : Delta Q50SN12072 */
>> +		.format[PSC_VOLTAGE_OUT] = linear,
>> +		.format[PSC_TEMPERATURE] = linear,
>> +		.format[PSC_VOLTAGE_IN] = linear,
>> +		.format[PSC_CURRENT_OUT] = linear,
>>
>> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
>> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
>> +	},
>> +	[q54sj108a2] = {
>> +		.pages = 1,
>>  		/* Source : Delta Q54SJ108A2 */
>> +		.format[PSC_VOLTAGE_OUT] = linear,
>>  		.format[PSC_TEMPERATURE] = linear,
>>  		.format[PSC_VOLTAGE_IN] = linear,
>>  		.format[PSC_CURRENT_OUT] = linear,
>> @@ -69,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
>>  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>>  		PMBUS_HAVE_STATUS_INPUT,
>>  	},
>> +	[q54sn120a1] = {
>> +		.pages = 1,
>> +		/* Source : Delta Q54SN120A1 */
>> +		.format[PSC_VOLTAGE_OUT] = linear,
>> +		.format[PSC_TEMPERATURE] = linear,
>> +		.format[PSC_VOLTAGE_IN] = linear,
>> +		.format[PSC_CURRENT_OUT] = linear,
>> +
>> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
>> +		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
>> +	},
>>  };
>>
>>  static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
>> @@ -270,7 +300,9 @@ static const struct file_operations q54sj108a2_fops = {
>>  };
>>
>>  static const struct i2c_device_id q54sj108a2_id[] = {
>> +	{ "q50sn12072", q50sn12072 },
>>  	{ "q54sj108a2", q54sj108a2 },
>> +	{ "q54sn120a1", q54sn120a1 },
>>  	{ },
>>  };
>>
>> @@ -280,6 +312,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  {
>>  	struct device *dev = &client->dev;
>>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
>> +	const struct i2c_device_id *mid;
>>  	enum chips chip_id;
>>  	int ret, i;
>>  	struct dentry *debugfs;
>> @@ -292,14 +325,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  				     I2C_FUNC_SMBUS_BLOCK_DATA))
>>  		return -ENODEV;
>>
>> -	if (client->dev.of_node)
>> -		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
>> -	else
>> -		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
>> -
>>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>>  	if (ret < 0) {
>> -		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
>> +		dev_err(dev, "Failed to read Manufacturer ID\n");
>>  		return ret;
>>  	}
>>  	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
>> @@ -308,19 +336,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  		return -ENODEV;
>>  	}
>>
>> -	/*
>> -	 * The chips support reading PMBUS_MFR_MODEL.
>> -	 */
>>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>>  	if (ret < 0) {
>>  		dev_err(dev, "Failed to read Manufacturer Model\n");
>>  		return ret;
>>  	}
>> -	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
>> +	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
>> +		if (ret == strlen(mid->name) && !strncasecmp(mid->name, buf, ret))
>> +			break;
>> +	}
>> +	if (!mid->name[0]) {
>>  		buf[ret] = '\0';
>>  		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
>>  		return -ENODEV;
>>  	}
>
>>From Sashiko feedback:
>
>In the original driver, the PMBUS_MFR_MODEL response length was explicitly
>expected to be 14 bytes (if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10))),
>indicating the hardware returns the 10-character name padded with 4 extra
>bytes. The patch changes the detection logic to loop through supported
>devices and strictly require the returned length to match the device name's
>length exactly (`ret == strlen(mid->name)`). Since `ret` will be 14 for the
>original hardware, and strlen("q54sj108a2") is 10, the condition 14 == 10
>evaluates to false. This causes the loop to exit without matching,
>erroneously printing 'Unsupported Manufacturer Model' and returning -ENODEV.
>This completely breaks driver probing and hardware monitoring for the
>pre-existing Q54SJ108A2 device."

Thank you for the explanation. Maybe we should simply match the manufacturer
model and remove the strict length comparison to prevent it from breaking 
the driver probing. I will add this change in v3.

>
>> +	chip_id = mid->driver_data;
>> +
>> +	if (strcmp(client->name, mid->name) != 0)
>> +		dev_notice(dev, "Device mismatch: Configured %s, detected %s\n",
>> +			   client->name, mid->name);
>>
>>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
>>  	if (ret < 0) {
>> @@ -341,6 +375,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  	if (!psu)
>>  		return 0;
>>
>> +	psu->chip = chip_id;
>>  	psu->client = client;
>>
>>  	debugfs = pmbus_get_debugfs_dir(client);
>> @@ -359,9 +394,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
>>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
>>  			    &q54sj108a2_fops);
>> -	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
>> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
>> -			    &q54sj108a2_fops);
>>  	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
>>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
>>  			    &q54sj108a2_fops);
>> @@ -383,27 +415,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
>>  	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
>>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
>>  			    &q54sj108a2_fops);
>> -	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
>> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
>> -			    &q54sj108a2_fops);
>>  	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
>>  			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
>>  			    &q54sj108a2_fops);
>
>What is the purpose/value of keeping this file outside the if() block ?

Thank you for catching this. It was an oversight in v2, the 
`blackbox_read_offset` should have been kept inside of the block.
I'll add this change in v3.

>
>> -	debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
>> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
>> -			    &q54sj108a2_fops);
>> -	debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
>> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
>> -			    &q54sj108a2_fops);
>> -	debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
>> -			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
>> -			    &q54sj108a2_fops);
>> +	if (psu->chip == q54sj108a2) {
>> +		debugfs_create_file("store_default", 0200, q54sj108a2_dir,
>> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
>> +				    &q54sj108a2_fops);
>> +		debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
>> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
>> +				    &q54sj108a2_fops);
>> +		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
>> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
>> +				    &q54sj108a2_fops);
>> +		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
>> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
>> +				    &q54sj108a2_fops);
>> +		debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
>> +				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
>> +				    &q54sj108a2_fops);
>> +	}
>>
>>  	return 0;
>>  }
>>
>>  static const struct of_device_id q54sj108a2_of_match[] = {
>> -	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
>> +	{ .compatible = "delta,q50sn12072" },
>> +	{ .compatible = "delta,q54sj108a2" },
>> +	{ .compatible = "delta,q54sn120a1" },
>
>Why drop .data here ?

I would like to drop .data since it was previously consumed by 
`of_device_get_match_data()`, which has been removed in v2 changes.

>
>Thanks,
>Guenter
>
>>  	{ },
>>  };
>>
>> @@ -421,6 +460,6 @@ static struct i2c_driver q54sj108a2_driver = {
>>  module_i2c_driver(q54sj108a2_driver);
>>
>>  MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
>> -MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
>> +MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
>>  MODULE_LICENSE("GPL");
>>  MODULE_IMPORT_NS("PMBUS");
>>
>> --
>> 2.43.0
>>
