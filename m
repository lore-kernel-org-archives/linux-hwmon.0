Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883C2E973F;
	Tue, 23 Dec 2025 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766453469; cv=none; b=jwudHzw9kWdhcT9od3v7SUJw6MXimzPtJtRqLIc/WeVGAdmKM4a9IJtGFq/PMLC2Mx0KIRH+DpQjK+Q0ujDz/D2vu0QQQj3cjv48imwZ+RydNZk3Y91cbPpCr+JaRHbaxhwhCpEZRegO3/8jVrrPWGj78VCtDUdADKNg8ar6g98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766453469; c=relaxed/simple;
	bh=dQPw4Z2eLl0aJq7p4Mhgm+w6fLxL0RRd38iKhQkZA5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=APY5uRTXCB3AWV7vQJ+tq3nDqGk5DOxGvo7KI1phiIMqKyx3fJikZihiLfYPRxhhHLgUD2iDQcO2mII4hxajwyuWKZMxDch2/9bw3ELdtNru2J6LfKQDq5TAItpYSTJ440b4e/ZNDn26seN6lszXzU7vaVKmjoBJajqqiQmcvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=YOzDRmBj; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="YOzDRmBj"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uQfkpkp+K4l5uPdyMyZjjQQWhI745KMq7UO5taHoCI0=;
	b=YOzDRmBj6IMHrdaDPjS2TA1NijHZms9JZSCQzl9woj0yMLf56ZxSYdJzatGKRmIgify1jHL8I
	+JZ4kXFOw+FNaySj6uujaTg5eKvHHUdKLUDkMCoI1GJiOZ6Px47YLQ7rRP0WzVeCpFT0cVJ2HmA
	+GO8M/dbjP/NEbcT55AXHms=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dZy7863Scz12LF3;
	Tue, 23 Dec 2025 09:27:48 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 084DF4056B;
	Tue, 23 Dec 2025 09:31:02 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Dec 2025 09:31:01 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 23 Dec
 2025 09:31:01 +0800
Message-ID: <09d98178-2621-47c1-ace8-b7b01e610367@huawei.com>
Date: Tue, 23 Dec 2025 09:31:00 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Replace deprecated strcpy()
 with strscpy()
To: Szymon Wilczek <szymonwilczek@gmx.com>, <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251220173041.377376-1-szymonwilczek@gmx.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20251220173041.377376-1-szymonwilczek@gmx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/12/21 1:30, Szymon Wilczek 写道:
> strcpy() performs no bounds checking on the destination buffer, which
> could result in linear overflows beyond the end of the buffer. Although
> the source strings here are compile-time constants that fit within the
> destination buffers, using strscpy() is the preferred approach as it
> provides bounds checking and aligns with the kernel's deprecated API
> guidelines.
>
> This change converts the remaining strcpy() calls to strscpy(), matching
> the pattern already used throughout other ACPI drivers in
> drivers/acpi/*.c.
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
> ---
>   drivers/hwmon/acpi_power_meter.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 29ccdc2fb7ff..cfb30c68bfc5 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -890,8 +890,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
>   	resource->sensors_valid = 0;
>   	resource->acpi_dev = device;
>   	mutex_init(&resource->lock);
> -	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
> -	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
> +	strscpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
> +	strscpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
>   	device->driver_data = resource;
>   
>   #if IS_REACHABLE(CONFIG_ACPI_IPMI)
LGTM,
Reviewed-by: lihuisong@huawei.com
