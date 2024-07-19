Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC73C39
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721423422; cv=none; b=rjmRjZycQdXAHOSe0rPsLEIIgIaMZk5sTox4l8dKTI5BO8lihmN7evty9DvwMw3dbCDrTKgUlArSjLQ+rVosz0hmViyKxkD6b8lW8w5snL/N+jiq4swvwBgi0MfJXth1nolUca2/d1L4NmEroVGNBBRFQus+Kdasvm4h8uQqIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721423422; c=relaxed/simple;
	bh=cC94l0MZo2IlBoT6/bquoeJo1hn22aGifb23xUxskxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gd7fQl77LbREMqgZJMpvQLuosjuM0Ci6sES79rAVBQnVsHbxq6UY6N1h1GGYqVxFMYEj79UPE3FPj2LNHz3M6zo1gTzuNstUM8mig8f/WxY9kraXtuGvCJVmjFpf2zEP5fRxKrHYpDCat3/gVFrzyauogVDnRuIIXR3xZcejUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXkMZCW8; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXkMZCW8"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8036ce660e5so99170439f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721423419; x=1722028219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NpJCclFpuysvM9UDlE1ZbTa4gKC43KJk3gLKHY9N4mg=;
        b=OXkMZCW86ukIcOLLZV/C+7dLsHLAOXMs79FIzz6qjXV7lEziBdhApEPDnrIM7FQnQ9
         plXku8FPTQ2r5lOLQjVjOuq+MqmtTLSbT7owShDtYR0XrocLclKw894bxdiAT4RTDUEh
         Y9RlEmEPGXDmyNepet568h1zgboa1f2XTxVI/nOwRSLcYL40OkLl6WLp3aQa3nleru/v
         0pcE7nStuCZGYQL4OcBvbBlh9VjkIwaWxzoWO2JX0X1zkAsRU7UT1cAJb04GO94uC8eT
         fRhQnhWJVPpcOUmhI6P3Nh2i3ZuOrc+4xg6UxQBIU8jOz4bINcKITCqNFrrKcKngjv+/
         YyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721423419; x=1722028219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpJCclFpuysvM9UDlE1ZbTa4gKC43KJk3gLKHY9N4mg=;
        b=rbrzh+63hvjI3ArSCIDtPzChwm/FnjlekBq2aC5yoFTLz9I8fCjkpQadHusVkkUc3l
         MKFXvCNslgv9WXuPUXgFjw4NrYTkiE8C+pdZ1Fwbs5jng7o4V6MoOJZQCgYn3qcqcBf/
         VsXdX9yhtrEaC0dQKButWkvQusPqw9XEj5Zc0sGWduPcNA6HQgqsbRdHJe78IZtOmuo3
         +d0JzllTLEdB1TvDBZN3iuKl2jNw8o4umVNZFtYu0T2xOufjOkWQk2M5Wcq1XVcvrJvP
         jmo6q/o+4QSLcnceZ92ag+VZOa8pA0YOifOGwb7fi4c2XGTaAq9OZyc4o4u5b0q9dX8C
         WH2w==
X-Gm-Message-State: AOJu0YwUR3TsuGtNoRIyiYWGwHUDOd26sRcwDpMX3r6lbu6qwXfro6h6
	R4qwiW7p9wT+mmE9mgYuVdFdm7Qwq1bX19Vn8b2pkhbOo9QKt5Kt
X-Google-Smtp-Source: AGHT+IHuhvm6JWmXmeuIciI4kgED+KGEZ4rIF4tSzkLXFWJXmYReGwC/pnrhZJBx+8DEK7y4vKZ+4A==
X-Received: by 2002:a05:6602:6004:b0:806:1b47:64ec with SMTP id ca18e2360f4ac-817124ec5c9mr1297342839f.16.1721423419310;
        Fri, 19 Jul 2024 14:10:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff59d568sm1598165b3a.165.2024.07.19.14.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 14:10:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cddb4e8e-4b4d-48de-a02d-4931c373b47b@roeck-us.net>
Date: Fri, 19 Jul 2024 14:10:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: (pmbus) Register with thermal for
 PSC_TEMPERATURE
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org
References: <abd89e07-3a61-408e-ac2c-67ec0605f12b@stanley.mountain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <abd89e07-3a61-408e-ac2c-67ec0605f12b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/24 13:55, Dan Carpenter wrote:
> Hello Eduardo Valentin,
> 
> Commit 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for
> PSC_TEMPERATURE") from Apr 28, 2022 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/hwmon/pmbus/pmbus_core.c:1375 pmbus_add_sensor()
> 	error: we previously assumed 'type' could be null (see line 1347)
> 
> drivers/hwmon/pmbus/pmbus_core.c
>      1331 static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>      1332                                              const char *name, const char *type,
>      1333                                              int seq, int page, int phase,
>      1334                                              int reg,
>      1335                                              enum pmbus_sensor_classes class,
>      1336                                              bool update, bool readonly,
>      1337                                              bool convert)
>      1338 {
>      1339         struct pmbus_sensor *sensor;
>      1340         struct device_attribute *a;
>      1341
>      1342         sensor = devm_kzalloc(data->dev, sizeof(*sensor), GFP_KERNEL);
>      1343         if (!sensor)
>      1344                 return NULL;
>      1345         a = &sensor->attribute;
>      1346
>      1347         if (type)
>                       ^^^^
> This code assumes type can be NULL
> 
>      1348                 snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
>      1349                          name, seq, type);
>      1350         else
>      1351                 snprintf(sensor->name, sizeof(sensor->name), "%s%d",
>      1352                          name, seq);
>      1353
>      1354         if (data->flags & PMBUS_WRITE_PROTECTED)
>      1355                 readonly = true;
>      1356
>      1357         sensor->page = page;
>      1358         sensor->phase = phase;
>      1359         sensor->reg = reg;
>      1360         sensor->class = class;
>      1361         sensor->update = update;
>      1362         sensor->convert = convert;
>      1363         sensor->data = -ENODATA;
>      1364         pmbus_dev_attr_init(a, sensor->name,
>      1365                             readonly ? 0444 : 0644,
>      1366                             pmbus_show_sensor, pmbus_set_sensor);
>      1367
>      1368         if (pmbus_add_attribute(data, &a->attr))
>      1369                 return NULL;
>      1370
>      1371         sensor->next = data->sensors;
>      1372         data->sensors = sensor;
>      1373
>      1374         /* temperature sensors with _input values are registered with thermal */
> --> 1375         if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
>                                                          ^^^^
> Unchecked dereference
> 

It is only NULL for PSC_PWM, never for PSC_TEMPERATURE. We could add a check to
make the static checker happy but it won't make a practical difference.

Guenter

