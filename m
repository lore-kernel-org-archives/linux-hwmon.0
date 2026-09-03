Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693554A9D78
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440248; cv=none; b=UBmhnLFfWyL4KinJXm94cl+rImJ6eenwJnVbiUBpaR8x4xHujjYrvbDOWSDCbDaGzH26ao/CboFfpOtrkO1Mf2+gIw5LbagwcBQEFADhho9KKr70ZaPgdjlR6AAPYeLyJQczVnD5DW378K21lfTUPjXuBl0zbkb4ZIkXdrUBjmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440248; c=relaxed/simple;
	bh=FHY4q3Ys1IpJPYpVWNL4je7qcy0wYqW1jLlS7Bg7pj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2iP2nffTusQ/PWF63FIC/6GkKY5jFTmqxkvpnjcipwN66usQOZxHKA3QUUvv6vLZthGqgYPTkPoKeI+DerQlsJCMCWmv+vVXpqKlmwHGhBKBrg8bL4SHxB1QSmuYXDHH4oi+kRNiwnA56XxFiaBpNbgb0J1rzKRhYHoDKqjSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7xzK4Bs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7xzK4Bs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8534d507f59so2953293b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788440246; x=1789045046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ursPPyuEzxu2ga/4COx+sqCZCJvo88hNEtVmuIQ04eM=;
        b=W7xzK4Bs8h6xujXG1JOpZLORXGLP5N6Ye+5xzrkAMz5UjtnbhR6/9Jz+BRuM5L13Ie
         uK9AEKzfUuG8vcYWW6jg711actPAfDrMdlAL8NB1eY0vtzoGqNVthFTRcC6JYiFN5eFf
         HQDoWoV+L5K3SZpnN08m2as8P01Oq5NNFRfz9mhYddmnFxloxapjjSV/1w2OpX/Y+2DB
         5sst2kKnitM7hNK6COxg+c6EuZWBgNaPipa3TWEqA2ieTpB0heiiekKRkhUq9jXubai1
         zVAlcTShdRXLNFfpaTUlKMQ6P9R/oydvw2sU4KAmwCqOCzqR0myqbjy8coF9jjdMf7N8
         i+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440246; x=1789045046;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ursPPyuEzxu2ga/4COx+sqCZCJvo88hNEtVmuIQ04eM=;
        b=eAnIGly3Q1Jhfhw6leYFBAeOma2k1pm6ii2SGg8ySWBsqyzbaqGxQ3s6lYVbJdyxhj
         oFLJ55wmn6n4NV08Y6sB6IItFszxuN5N+bISfgqg9KheNApZDNg+RwwgUlMzpbfXDYBK
         iaSz8rrdDij+kIe0zxxDfBXV9yCISNm0RuwiGOHF30VLvIOkFjGZuZpeYH3J2oHYvkUI
         kkVFCftXCE5ddfqt+uYQveX18H9t0/9sA2L883mpx6jzs5SAQ33aGCzAgJ4NgQql6G1z
         2NoYhifcHRu/V3rtI0SUEmL3NkBEqor/G7JUCO9bzhl4ds1XkvWlhRODOMJ29rrewhgH
         v+bQ==
X-Gm-Message-State: AFuF++mRYUTCXXW+7X4kJ+U+kgGzy0J5fuI6ibV7LyiYwhVMsSe5O3xP
	Mpy1wwfOTgfeM0XKDD5id8eLPGxtR5tA2gxO41hOQbL2tlw+T9RJBXMB//o2Zw==
X-Gm-Gg: AYBFou3bdGAB+GFE0+UMJZRIgWLKjKett/yaURTfEpYkkhYWbIJNLCqD2XH3FCa5tm0
	iE0U2iClHAzD63dVuIEDoP93vf03Lwg4r61Tkxohd8uA9qlm5D3Yb1sEHx7vrkZHZX2d9lHXwHS
	eBX9Fz/IuwV9oIjb9y+MIYexQjgwmXWyAcF0laU8OMyzDnCLwwaV6hCWRMIyOQTSkB4MxEHj2bD
	EiwKRDWxPkc4sCJdJl9oPbYmJsGcCKNMsoYbpwv5wfnhFzo+39RqW1I9mDrX1Msnxj/y5FYQUIs
	Lvn314Tlp7pIgs0mHU1CJd3Nov3obghPmRM4tfredTfOT6IWF78fM3E0u5brzCOU8whnjkjGsS7
	dEe2+xBZ5OVsQy3RlILh4hRMFQcCNMCqaZLmDs+JllBlzXoI5QiWT97dcn/VtMDXzkM5nb/ZOEv
	+BEAmOhKybU1oIi/uPMb3+tg9uALzCcs51TaOxjrHZ6buTVueRch4pncNXZEqiy6+O41koQFgei
	SwNogfp6MJKeINXkYXOi7y48PPq+HFLwrGqvQ==
X-Received: by 2002:a05:6a00:23c1:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-85ed93bfe5dmr15162601b3a.16.1788440245621;
        Thu, 03 Sep 2026 05:57:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2fcfe2csm2843012b3a.27.2026.09.03.05.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:57:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86700f73-530a-48b1-98d6-b3d2a2056645@roeck-us.net>
Date: Thu, 3 Sep 2026 05:57:24 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/ltc4286) Add runtime shunt_resistor control
To: Carl Lee <carl.lee@amd.com>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 02:23, Carl Lee wrote:
> Expose a writable shunt_resistor sysfs attribute for ltc4286/ltc4287.
> 
> The driver still initializes rsense from the existing
> shunt-resistor-micro-ohms firmware property (or 300 uOhm by default).
> When userspace updates shunt_resistor, validate the value and update the
> direct-format scaling coefficients used for current and power readings.
> 
> This enables runtime calibration without requiring a DT change or reboot.
> 

What is the practical use case ? "to be able to do it" is not a use case.

Thanks,
Guenter

> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
>   drivers/hwmon/pmbus/ltc4286.c | 86 +++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 82 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
> index 8715d380784a..e80c9ecea099 100644
> --- a/drivers/hwmon/pmbus/ltc4286.c
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   
>   #include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
>   #include <linux/i2c.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
> @@ -16,6 +17,75 @@
>   
>   #define LTC4286_MFR_ID_SIZE	3
>   
> +struct ltc4286_data {
> +	struct pmbus_driver_info info;
> +	u32 rsense;
> +	bool vrange_low_enable;
> +};
> +
> +#define to_ltc4286_data(x) container_of((x), struct ltc4286_data, info)
> +
> +static ssize_t ltc4286_rsense_show(struct device *dev,
> +				   struct device_attribute *devattr,
> +				   char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct ltc4286_data *data = to_ltc4286_data(info);
> +
> +	return sysfs_emit(buf, "%u\n", data->rsense);
> +}
> +
> +static ssize_t ltc4286_rsense_store(struct device *dev,
> +				    struct device_attribute *devattr,
> +				    const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	const struct pmbus_driver_info *info_ro = pmbus_get_driver_info(client);
> +	struct ltc4286_data *data = to_ltc4286_data(info_ro);
> +	struct pmbus_driver_info *info = &data->info;
> +	u32 rsense;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 10, &rsense);
> +	if (ret)
> +		return ret;
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +
> +	if (rsense > (INT_MAX / 1024))
> +		return -EINVAL;
> +
> +	ret = pmbus_lock_interruptible(client);
> +	if (ret)
> +		return ret;
> +
> +	data->rsense = rsense;
> +	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
> +	info->m[PSC_POWER] = data->vrange_low_enable ? 4 * rsense : rsense;
> +
> +	pmbus_unlock(client);
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ltc4286_rsense, 0);
> +
> +static struct attribute *ltc4286_attrs[] = {
> +	&sensor_dev_attr_shunt_resistor.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ltc4286_group = {
> +	.attrs = ltc4286_attrs,
> +};
> +
> +static const struct attribute_group *ltc4286_attribute_groups[] = {
> +	&ltc4286_group,
> +	NULL,
> +};
> +
>   /*
>    * Initialize the MBR as default settings which is referred to LTC4286 datasheet
>    * (March 22, 2022 version) table 3 page 16
> @@ -55,6 +125,7 @@ static struct pmbus_driver_info ltc4286_info = {
>   	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
>   		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
>   		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
> +	.groups = ltc4286_attribute_groups,
>   };
>   
>   static const struct i2c_device_id ltc4286_id[] = {
> @@ -69,6 +140,7 @@ static int ltc4286_probe(struct i2c_client *client)
>   	int ret;
>   	const struct i2c_device_id *mid;
>   	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct ltc4286_data *data;
>   	struct pmbus_driver_info *info;
>   	u32 rsense;
>   	int vrange_nval, vrange_oval;
> @@ -114,11 +186,14 @@ static int ltc4286_probe(struct i2c_client *client)
>   	if (rsense > (INT_MAX / 1024))
>   		return -EINVAL;
>   
> -	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>   		return -ENOMEM;
>   
> +	data->info = ltc4286_info;
> +	data->rsense = rsense;
> +	info = &data->info;
> +
>   	/* Check MFR1 CONFIG register bit 1 VRANGE_SELECT before driver loading */
>   	vrange_oval = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
>   	if (vrange_oval < 0)
> @@ -126,7 +201,10 @@ static int ltc4286_probe(struct i2c_client *client)
>   				     "Failed to read manufacturer configuration one\n");
>   	vrange_nval = vrange_oval;
>   
> -	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
> +	data->vrange_low_enable =
> +		device_property_read_bool(&client->dev, "adi,vrange-low-enable");
> +
> +	if (data->vrange_low_enable) {
>   		vrange_nval &=
>   			~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6 volts */
>   
> 
> ---
> base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
> change-id: 20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-44b1fcc18d38
> 
> Best regards,

