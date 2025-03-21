Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7AC1A238C
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Mar 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742569350; cv=none; b=N+jQjGU9WgaXtZVYwe7NpuZlHkHJHP7YZJSzMB3YdpsfKS6iybT/y2XBcfGiA1q96fJ9SMZWnSuYloeluSbZHjC1I4n12oGL9hZO9sWNdws+USiWN2bVfT5tfYqWc+oyvmN6nd8p3FeBg9wHr9gSHsX5JEJ84jBRI3m/MEb27pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742569350; c=relaxed/simple;
	bh=9LP2gvjI+vebfzmhbBfwsJ+mK8X7bn7FIJ16m+XPX+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UC1daGz3WohLjcIhihgoT84g2D32ET5Z/VTctcDD3vhqm5+byT+h5jAousV9+5pn+lMc6JbMaAvhZ2f+Cz/0y+HXQcOaENbp7uudPhkb9gCLvT/gVqu62YhYfV1iZdfb2Wk8W9zhxJQMQkZaJGeGM/9H6OiWV4+te5uIYdjIXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTBHLSxi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTBHLSxi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso44307185ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Mar 2025 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742569348; x=1743174148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jXwsaHtfxzI1gty5b9N/MiBZ5X2Is5Qd6h1lNVSGNr4=;
        b=NTBHLSxi5Aaj2Jdfr686+CFOsyKka3otwvC7ZhL2ig4iowu2ftz9cctLa7W4qbeQyh
         RfJ58nqfsolQHF+FBfJ2vLxw0SqGWgcdrx+mtwCys7BcTbo/YXghvt2CzXV2sF3xASyO
         bErs1cuQyn34XDe12Wa5BDzsUgKkEvx/3FqMqu8KRnEtvbm3srWnMIK7pZNSy7E4Ti+T
         tLH6JrlWHN5Hvx7EyZyEV4XR9th5HoqAEschnncKsRMorG0OWHxm7C0Ry9xZnc0i44Ha
         E8aYrRUh+eEZkiZWLWX7Fm29qNuoEaDodvYYIF+Mgtv7Z3Pqm7qlh7r66qI1Lal31l9J
         d/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569348; x=1743174148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXwsaHtfxzI1gty5b9N/MiBZ5X2Is5Qd6h1lNVSGNr4=;
        b=u837xvA8nb9UdvqWSrO5tETRVlES63G90exZiH79lVbN6fPAniU8xt4+HTNJcjM5/1
         RjbulaCKmKqeUCwQgSeN1On6YZ1RDQzOEQ/51ZhP13V+dPrsODp/l9+H/1UtrbMtbYqw
         tXxFHbb7V3ec2bvZteDpUv+fIZNZWHSJ5ZDqZ3YChSbF8QeGQdSXh9AopngOgKcKHoUY
         BeDay5fly0F0hUeivD7t5AViiS9cEVqq30c3j/ZCQvI9p0UtKqJcYJxQWOS4+eUaWUvf
         h25HiXUImHlMXMpI0fTk9nJ34Hlr9E6Hr27EXdxzWHL+dbQ+/vW+fmYerxwD17wyDZ1c
         RnAQ==
X-Gm-Message-State: AOJu0YzEVz94K8g40gPzhIyBKZZZP611ArdlXDp2Js2QzMzHsgV5/qCj
	nD54qyhmkqqVTNvRZjQmfiAS/AXY+ZEXpu9qZebxluEARmdXX4Yj
X-Gm-Gg: ASbGncvjMtPiitz88qX7gezY9PwuSJaZYDQUKXRaFqedEg/+czBOGG3a8ncUlSiizia
	kPhYuiciyBb6F7o2OPq9EUNPEF+NpHjBpmxkOJ1Mf0VJk44kDRASwQvH8KLA/3XJ8XyQLR6mt1y
	K96qz7CwfT1ZhTGhYOXjKFIWX9lhMDqu6N5nu7KaUOK6QRY03kYWkW9SUniaJjDCtyszkBth7tH
	6zla6iXanS7keAyWcqRCU1A4kfZvWO2GSUzxYvgNde126MIQ/oGaQQ59L6eIGuPe0qjBexmvxrK
	vTH6F6fv6KBMC0O78iZe+Uw2LfunkfNmmN6wbegcj1+471YsKtWs4fKaq9UMx1qbf/kn6hSFYX2
	jUT4iwzJeq7qZHbEnUw==
X-Google-Smtp-Source: AGHT+IGOPDCyMXNavaYy+QBb0pZS200mMPLa9Zt6CYfFaAE8/XQozAoB2xqYBYD1gpER608/AiR5UQ==
X-Received: by 2002:a17:902:c942:b0:220:ca39:d453 with SMTP id d9443c01a7336-22780d8004emr54504405ad.17.1742569348079;
        Fri, 21 Mar 2025 08:02:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4c500sm17876965ad.83.2025.03.21.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 08:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9d3b0484-a40a-4d23-81d4-2f61b33adc4c@roeck-us.net>
Date: Fri, 21 Mar 2025 08:02:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: (acpi_power_meter) Replace the deprecated
 hwmon_device_register
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org
References: <09675757-8507-4c4f-b143-2212a8f287ce@stanley.mountain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <09675757-8507-4c4f-b143-2212a8f287ce@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 07:33, Dan Carpenter wrote:
> Hello Huisong Li,
> 
> Commit c812cc42f92d ("hwmon: (acpi_power_meter) Replace the
> deprecated hwmon_device_register") from Mar 19, 2025 (linux-next),
> leads to the following Smatch static checker warning:
> 
> 	drivers/hwmon/acpi_power_meter.c:405 power_meter_is_visible()
> 	warn: signedness bug returning '(-22)'
> 
> drivers/hwmon/acpi_power_meter.c
>      398 static umode_t power_meter_is_visible(const void *data,
>                 ^^^^^^^
> This is an unsigned short.
> 
>      399                                       enum hwmon_sensor_types type,
>      400                                       u32 attr, int channel)
>      401 {
>      402         const struct acpi_power_meter_resource *res = data;
>      403
>      404         if (type != hwmon_power)
> --> 405                 return -EINVAL;

Bummer, I should have seen that. That should return 0. I fixed it up.

Thanks,
Guenter

