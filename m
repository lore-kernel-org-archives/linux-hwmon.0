Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CA278161
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906367; cv=none; b=h00AkZXVHJtsS6RwLrNgp7yw4696JHTdfA+6GjImrgxNZrmiYqhhfxZGHlLH68b5xDdWbjHKoYQcrUQmAMFA1MYPg9Dvvcl0ZOAYSmvGtWlqXpOxQo5JeZXruQfwlEEos2zvc43AV4wP4bmjRQBECaPYN8xoaq8phJvaWn4CRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906367; c=relaxed/simple;
	bh=v0cEEmec0QuTeHOOYlXJno3mbHQhr5lFvf0SffUcGjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZidRYR0/0hDKqqvmKHDa4lxfG2zEC4hA/vyUAwFEP6TePtAsdGMR02lRi8DSvWMEWYsrj3dlj9pq0ZuZCL+YrgfFaDLE46X4yV+/MAjI3+km8Nxeeg8xNYd2SnFEUshgDecxRuebe3T8OHaLic110M6PlkUqq4JgfkxV/FbOD10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7ZfQ/Xg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ZfQ/Xg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a07738118so2780500b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906365; x=1775511165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TVVbDOzRupVkBlt3/objW3qJpPA+B+JYTIJ5BvK7x7c=;
        b=F7ZfQ/XgIzUR6gAcC0niBAPaXAVu+odutcsXBA4JmrW6v1KX6Nl0wpQJhMnACYVNAY
         IbqgC1Odf3rHYnZBySPC1suiF3i/x6uqoFAcqvmHZ/S1+U86wqe0Xf5KH4NnjIL/kPfK
         MmPMHa4MJpcKMyVv204ecYJyJnvqis1IsrP0FAY8B6XjT15ZBGIUs8kFJEuC0oAyb/AB
         SJ/vqEqHTkhQiP59i69OSJbq11ZKSUfRiDHyRQkEfd7tIMsKaQknhD53pDFED8RsTn1/
         aWeteuCsPD1E7HE03z3N/NsICtZwHiFOhs+T2E5iXUf0pyy66Q/KhiRrHXERjoTLmvmx
         GmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906365; x=1775511165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVVbDOzRupVkBlt3/objW3qJpPA+B+JYTIJ5BvK7x7c=;
        b=JZ6NUZ53LBSbodsMjEVlp9R6zNojiQ14n0CTq1GF5AtKHTp15qKWSsEZxU0ZzDFVcO
         /TkW4GvxqZsr6m2TGHTXUIePGx5wgCaKvtnAh4HMDCjIyi+SmuR8vmdfUZ66UyWyvz0r
         3ulxeet3XDkpK2IsCEEOv20lwgROpRgc4EneAhaUTlTyv7YxZ7ofXLxeicMjY4x2KmOu
         6XBhmAqP9Bi9GZ7/E5BD7xkq7i4S5jB8eD+o4US/nNS1OAYYisxb4q8VCN0pD5HWAQK1
         2QIWbm1Bn7yW2CMi2in+xkV72YSfaIFNqgwB0Ikw4NxzuOWg46UKfWuEGTiy1VYX2hwd
         Hetg==
X-Forwarded-Encrypted: i=1; AJvYcCXU9k6sN5txxsJPN7v4XNFZ5iN9nC8LmFg5OZ4jkxmYe/8Csh+eYchpgD1owZnB21HhjQZ3AeggXNlBGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3gesF3IbabdIZyGUSaivnknDENF15l0jz0xPCrNvtK60pHPs
	2Dr+8v6AeKBb1QxG3LW/3HCDBjrGY6UR0SMvbcG9V2NXQNeUKW0WqgaR3DIiZQ==
X-Gm-Gg: ATEYQzwDi70sOJSF+pNDIm4G9iDaFTotwAmEIcDboefzkLBgbeCcA6ffYfIZSyUOjHy
	AB/moW/dco9Q/oGVgni9CHTH0REhS2LPhFcDNysB+ao+mjWULcRQVaQa5FidtNkHj8i+46BVnFg
	jFEHhnIb7ieB59/z61f2EkZefVCa3jO3rHWzbP7cFUpdvdzrh7VLCxwy4XNvVzVP4KLEjg2hBct
	Kca6Dpxrw44+183xAGVA7R2JdWm0TWEr0w7o1Ps0arPfnPHW8esD/1BbUB6I/VU5oNjvaJNjMOG
	VzkU9K4SIGYEJx6qaGkhSIxXlwgChp1s3meHWThdibuONkCE18eBxVtniEHYh5AAbRgClXjbeST
	bnMgA2T8++b31SwkY2cq4KxW8qqa3tgtx5Hc8v6UycWJR99jlVKsdZ/QPNYNTDp1wgqhHwowPXr
	1PsJ3Jg+wXISBm0bcgyeKfyhSEY2zLDYrmjkrcVWJRU4E0tXdiEkrUFOKXiJg4YIXGMig0cugR
X-Received: by 2002:a05:6a00:10d5:b0:824:1b66:6ae2 with SMTP id d2e1a72fcca58-82c95e5a3d3mr13177071b3a.10.1774906364963;
        Mon, 30 Mar 2026 14:32:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc735sm8094237b3a.40.2026.03.30.14.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 14:32:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <996e3980-f45e-4450-ba44-ff032e036735@roeck-us.net>
Date: Mon, 30 Mar 2026 14:32:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus) simplify allocation slightly
To: Rosen Penev <rosenp@gmail.com>, linux-hwmon@vger.kernel.org
Cc: open list <linux-kernel@vger.kernel.org>
References: <20260330212100.15436-1-rosenp@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330212100.15436-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/30/26 14:21, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Please refrain from making cosmetic / personal preference changes like this
in the hardware monitoring subsystem.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index e8fdd799c71c..c55ca3095975 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -106,7 +106,6 @@ struct pmbus_data {
>   	int max_attributes;
>   	int num_attributes;
>   	struct attribute_group group;
> -	const struct attribute_group **groups;
>   
>   	struct pmbus_sensor *sensors;
>   
> @@ -127,6 +126,8 @@ struct pmbus_data {
>   	int vout_high[PMBUS_PAGES];	/* voltage high margin */
>   
>   	ktime_t next_access_backoff;	/* Wait until at least this time */
> +
> +	const struct attribute_group *groups[];
>   };
>   
>   struct pmbus_debugfs_entry {
> @@ -3726,17 +3727,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
>   				     | I2C_FUNC_SMBUS_WORD_DATA))
>   		return -ENODEV;
>   
> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
>   	if (info->groups)
>   		while (info->groups[groups_num])
>   			groups_num++;
>   
> -	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
> -				    GFP_KERNEL);
> -	if (!data->groups)
> +	data = devm_kzalloc(dev, struct_size(data, groups, groups_num + 2), GFP_KERNEL);
> +	if (!data)
>   		return -ENOMEM;
>   
>   	i2c_set_clientdata(client, data);

