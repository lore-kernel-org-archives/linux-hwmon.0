Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12646348C4C
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933847; cv=none; b=Cr3TXM/k+GIK3oii4KU0kx9hqCQ0dow3yzRyFPtyg5rbHeYZ6CixrkRkxHgx+thIHC0w44GdldV0vAfstqDg2L9yHaecqDaytPznh6Z63mzHIM2aAQpojXuUDZp2PmKUKTgoHHmN0Tm1/HbvLoFh3mtAKGHIOY3+50EOcN+YKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933847; c=relaxed/simple;
	bh=qmn6C5At/XvU+fYiCZ+/ZwUU2PH+msJobqIWY++3OmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/9Xsg3sYHzyoPaAG0gTkYcL1WkExmsP9If4JZRAHyI/FEgcH2H9COVL8lfUuztsexpB43ElKS1hbseh06k4uYEZsZNZrozSDLdLaMtv1yzI1LbMzpLad/w6wHu+okGhH+YRwaRYzCf7t4STUrhsx3aP50nR1mIQPeKxb/CRSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDS/DYSP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDS/DYSP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d58efc7356so11889515ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933845; x=1788538645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCz7PmgI80ZKCd5ensb+gqUeVoQsl5zpnesQh9e6pXw=;
        b=qDS/DYSPzQp3Dd3QcinHAD8qPODHB3P3lm0i+UzyDiwf++bv28YqkRdoi1v5v3Wouj
         ZeSTOYIOzTgImZ5l8ps3mqCEBnegEBDaXX7sXvTVXLtHkrrqcuM5RjwZ8akMc6EmD5q1
         VA40eNwWB6Y0pwnmLQEQa7TPPGuuN55sNLAuBJUXmHfCQryXcKL7TXruzu2m1FxYhUHx
         QmStJiq9Rp1mqpy3U8P4AbfKAqHtaIxl8qgkbHSlQWKT+wQodZtYImp96AurqmbdDGlZ
         FEOEvQS7Oq74arzLV4LcBmwfX5fk2WfvBky/ihBoCkaju+f6JLCp6wHs0khvDmfE7aby
         7arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933845; x=1788538645;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCz7PmgI80ZKCd5ensb+gqUeVoQsl5zpnesQh9e6pXw=;
        b=nEoyOcf5oI6k59Z8Xh42bvzHro9fuEUt6W+jgBx2Q7F2ehiD9fkzqV4UdCWMGAHGgx
         Ygke6hIy5I8+BcZbM2nHoenORoE6fnDMhXWFB3q9w46RucKa6p9389jL3WDF28qXcsHu
         5qS2udGpt+wvpQgEKXjlEqqknnVYS5nYwIrqkuS/CWDixKDi1Jh1bLOgqWE0QHdrwuoz
         6Msq//gQ/SoOY9wDpWgJBHys+DT2YK7r/pNJhMJKp1eOhzHShG0yzN1RUmhccvpvR36F
         DuGjyrctlGmGua9KqNJkFu6hfPf/mDw8CYOZMlWYcgIDyWyQcArN2ocWjah6I+iLurFE
         rttQ==
X-Gm-Message-State: AFuF++k/NDyKC6oK+74SEo4UxuATeiwq7eC1j9c7NKMG5Hioz60aq+nx
	aYfw6QtetxnB2Rts+97n6VDKr0nGPqb6VqETCgSKfqaLPkuVDmvgAUgJ
X-Gm-Gg: AR+sD10vFtqre2pmOSiPCtbu5bnr6xEe7Y+7cm7dQ3hN043tYmmCbUrVUQHBAAF3wCE
	KVWIkSbuTQt1hBQB8An1/RSP2aFjZy9kaFTEQj/t9KfuySd3FaAgHPcNFWMGpTs5ANWHdX7TDoV
	TnoIZsptY7I885vpLC21rAbbAejqkiKDrrFY2a85qJKMjFPcM/U3UWaWsJ/wjyRULqEmxLUY809
	b7np4shhFgzJczgkX0zvcsKTvg7IRgEIHL8MJrpT/w5kJfoG2uqBt7frxN+q5+9MV/ZexPDykMt
	bWyvBiJudv2uqCKV6zUQ7W9y87OIjTFkvAYtrrXJP7KsLObt0BwjD2NWPaZc3WPW5hXuznouiZH
	gDPTFI8sLNKiXIcKrotFG0ETgjSv4qPztVYfBSkQJUHJ/BUdcpj5//bmZabopkZilemv1iM/8t0
	qAs0ObGvE6V37V1GrMw5ZlH77qv2AFZHenE1OnntFiG2DJ3IZfsHVrUHiq80UlhNJ4jH+bxxS55
	jiqw7w//XY2w19+lunh5u2kc0TB3c7cHeUddA==
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr158990145ad.4.1787933845333;
        Fri, 28 Aug 2026 09:17:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f956658sm7303038eec.19.2026.08.28.09.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:17:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57665923-dba8-4619-878f-8ed76a0e5c6c@roeck-us.net>
Date: Fri, 28 Aug 2026 09:17:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (nct6683) Add pwm[1-8]_enable
To: sashiko-reviews@lists.linux.dev, Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-4-jdahlin@gmail.com>
 <20260825094401.0E4391F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260825094401.0E4391F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/26 02:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The sysfs callbacks `show_pwm_enable()` and `store_pwm_enable()` incorrectly cast their attribute argument to `struct sensor_device_attribute_2 *`, leading to type confusion with `struct sensor_device_attribute` and causing failures on Big-Endian architectures.

Yes. Please fix.

Thanks,
Guenter

> --
> 
> --- Patch [3]: [PATCH 3/5] hwmon: (nct6683) Add pwm[1-8]_enable ---
> commit ae1360636538f417a87b23c1e1c204ef9329c018
> Author: Johan Dahlin <jdahlin@gmail.com>
> 
> hwmon: (nct6683) Add pwm[1-8]_enable
> 
> This commit exposes the manual-control bitmap as pwm[1-8]_enable for fan
> control on supported boards, falling back to read-only hardware control
> on unsupported variants.
> 
> Link: https://github.com/Fred78290/nct6687d
> Link: https://github.com/LibreHardwareMonitor/LibreHardwareMonitor
> 
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index b43e915f9d0fb..0324ace707a53 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
> [ ... ]
>> @@ -962,25 +963,93 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
> [ ... ]
>> +static ssize_t
>> +show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> 
> [Severity: Medium]
> Does this cast cause type confusion with struct sensor_device_attribute?
> 
> The template initializes the attribute as a struct sensor_device_attribute,
> which uses an int for the index field, but it is cast here to a struct
> sensor_device_attribute_2, which uses a u8 for the index.
> 
> On Big-Endian architectures, reading a u8 from an int field aliases the MSB.
> Would this result in an index of 0, effectively mapping all manual fan
> control operations to channel 0 and breaking functionality for fans 1-7?
> 
>> +	struct nct6683_data *data = dev_get_drvdata(dev);
>> +	u8 mode;
>> +
>> +	mutex_lock(&data->update_lock);
>> +	mode = nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE);
>> +	mutex_unlock(&data->update_lock);
>> +
>> +	return sysfs_emit(buf, "%d\n", (mode & BIT(sattr->index)) ? 1 : 2);
>> +}
>> +
>> +static ssize_t
>> +store_pwm_enable(struct device *dev, struct device_attribute *attr,
>> +		 const char *buf, size_t count)
>> +{
>> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> 
> [Severity: Medium]
> Is there a similar type confusion issue on the store path?
> 
> Casting to struct sensor_device_attribute_2 and reading the u8 index might
> similarly fail on Big-Endian systems during store operations, causing writes
> to unintended channels.
> 
>> +	struct nct6683_data *data = dev_get_drvdata(dev);
>> +	u8 bit = BIT(sattr->index);
> [ ... ]
> 

