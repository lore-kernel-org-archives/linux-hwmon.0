Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115F21CFEDB
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728678304; cv=none; b=lwBohQiHpaU2EIBYUS5h1GspOunebyWPtRvp8BSY3LkV6EsO6Ivt/YRhj6R67chpLd5ZBsTN3LyXP/8aryEPcLML32T1IqG9m6uYn5Ar5CtsVRpm0cjJEeC0c6/OUs5pIpt5qY6su9gp8mTlnVxlV3epMQz8YwrRh/ZAJPnw7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728678304; c=relaxed/simple;
	bh=EZNMIPvFwo97X2/5BlZiD6WpWScCAkyHhXlc25fJ32Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ileLe6DJrgMqYExAwFxMj1e4TzfS8BegQjXSXAlySWfjumsGUtJtojHc+AATErJfDarDNJpO1yPZKUwWPDhns9NAGpt3jZMx9kkTO+uBBtbfHehVYy2IVG1ZVwAYjcHgKQlO8QIL35Z7yVO8mBcEPNCdYEd0Jyen8/4o4iAJDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeYwHPo4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeYwHPo4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so1833605a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 13:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728678302; x=1729283102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H8bB2eY0IpX7d0nfE/hq8zUFblkJdTiWvMdPoBqrW4c=;
        b=WeYwHPo4wnfa+ivartNvDAuiwVTIbDTwwBnxbTUwlWQZWm0R1Bw7SPiEczNBzcJQNx
         /B1LExtOuMSzjcPhuVXlhNPLl7Oo193uGR8SdzoX3yfXqU8064eNz1FgyP94FAimqg+l
         K7BAYICVAb4hHackYgHO9Llc1jYCAMMY4/5AQwlNXoQOKaQXB167j1Ws/kJIeAhnJxuf
         zzbKeZDwRWDPFAOVqBgQQy8fFe/HoebdGdkE5TXudg8K3/iAPN3DNYFuFdZWDbKfxyVj
         KSnXiEKIL0Eqp/OyRbvQ7vNIvuhrAYo/rVhIYLKeHRCdRlxfnqzazN0s/1ublOXhV/mM
         Sxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728678302; x=1729283102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8bB2eY0IpX7d0nfE/hq8zUFblkJdTiWvMdPoBqrW4c=;
        b=ZbtD18syw3UjE/woR3OTAAqtVW29nPBXFQSqLnnuCWljzbqFcO9sI1fgA3k4LWKQo1
         2BT94z47Ky5v9Gk05ptEoz5tF665bzbgtrstSHUskTPsi8wzoFMHDOuJzJ0vNg5uBIW/
         Unp7aaBPwlfzLxiFBx8kHNW7ODeGOhdbnFnbzujt1aml7qUeLHc7tvJyeI+M/atU1NOR
         yVZ/vH7ydYwoKnrRfaLWl3oBRtt9dP79WtbiQZCeZXuUoMQBKg69thvJNesXkoe9l1DF
         Gpihfucy86PuRYnHJ/AEqELAMyDtnIzPNd8Gh/5uziQa4J4ktzBp36uC6c9uiccuUtuV
         PRFw==
X-Forwarded-Encrypted: i=1; AJvYcCX4b59tjR2pmDxedufi8dgBkUgyT57HD6QSJQWp4Ol4M/kyQKpK8ehdcDHZ4Ai0TUSqkPTjxVG1R5O5gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbgrymFIEG4kfIIOtJFDDJhmovDtyFXlTub0XNHekIXnBUxJoF
	okGunjb2YlvMYYrNnKcpsgGywvBwu5rdwXiCd/2R9o0fCJWPNKmj6PKZXA==
X-Google-Smtp-Source: AGHT+IFKoUksXryspUDI2YlOubZ8qriodxdXD3vSH11ZDbSXYizNgoDKDfT+YoDjZzN7EzZhDe5z3g==
X-Received: by 2002:a05:6a21:a343:b0:1d7:d6b:125 with SMTP id adf61e73a8af0-1d8bcfc22edmr4612144637.46.1728678302262;
        Fri, 11 Oct 2024 13:25:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea44908236sm2403469a12.43.2024.10.11.13.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 13:25:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <903cf397-7489-4135-b4cb-db1a6f0983d8@roeck-us.net>
Date: Fri, 11 Oct 2024 13:24:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hwmon: Use new member visible in struct hwmon_ops to
 simplify drivers
To: Heiner Kallweit <hkallweit1@gmail.com>, Tim Harvey
 <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonas Malaco <jonas@protocubo.io>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 12:53, Heiner Kallweit wrote:
> This is a follow-up to 11fb69bb15c1 ("hwmon: Add static visibility member
> to struct hwmon_ops") and makes use of the new struct hwmon_ops member
> to simplify a number of drivers.
> 
> Heiner Kallweit (8):
>    hwmon: i5500_temp: Simplify specifying static visibility attribute
>    hwmon: surface_fan: Simplify specifying static visibility attribute
>    hwmon: sl28cpld: Simplify specifying static visibility attribute
>    hwmon: gsc: Simplify specifying static visibility attribute
>    hwmon: powerz: Simplify specifying static visibility attribute
>    hwmon: raspberrypi: Simplify specifying static visibility attribute
>    hwmon: intel-m10-bmc: Simplify specifying static visibility attribute
>    hwmon: nzxt-kraken2: Simplify specifying static visibility attribute
> 
>   drivers/hwmon/gsc-hwmon.c           |  9 +--------
>   drivers/hwmon/i5500_temp.c          |  8 +-------
>   drivers/hwmon/intel-m10-bmc-hwmon.c |  9 +--------
>   drivers/hwmon/nzxt-kraken2.c        |  9 +--------
>   drivers/hwmon/powerz.c              |  8 +-------
>   drivers/hwmon/raspberrypi-hwmon.c   |  8 +-------
>   drivers/hwmon/sl28cpld-hwmon.c      |  9 +--------
>   drivers/hwmon/surface_fan.c         | 10 +---------
>   8 files changed, 8 insertions(+), 62 deletions(-)
> 


Series applied.

Thanks,
Guenter

