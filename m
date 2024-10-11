Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE17188CB1
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661335; cv=none; b=pMPH9Cw4HqhitP5LyVxQ3vhyMEz0ECSOh7rJmyhT5npUIcdpm/XUg62BZj9uNmAB6nweSPrBqvc+B5/nBDhEQMWsbotmHcdL6JaIZTCX4KBpdukIZB+VigQZOSZT1MOeWKJT6UFu5HG7F8ELt3c64093T5I9ujemw+/LrCPsyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661335; c=relaxed/simple;
	bh=T38bTRM2uAaBl9UbMJKt01f8WfdpKTyc/97xqceBYvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s69xZ6lgm/U+pW6N8J5ljgWT02cJ/k4kKPUksn0IauMO2hctXdvjyeng7lD7unv7/+AgxFibgpx/cC0fMIM1CA1KeftqPnrY7a7l+CDr5kzX6iSDkfRuJtDRRj8rigNoZVv8yjpmbaCeQCFUf6NGMkP3rwfwJD1ZvMWCDNZ5rI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVNRRgHl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVNRRgHl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b5affde14so13022665ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728661333; x=1729266133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FAg4wkVT6Cjwi3LgeS7wloPDIRRHaTX+vwEctvT3PfU=;
        b=GVNRRgHl9dnRBqskPMjvqboaygzIHf0tdJxIDCIag3oJ9/8MBCXUoGCImvWGoLftYw
         vImv+Kck8NrJW7Dii4rTwW75DL1UKHVUd1m/yu5fIcH7hj50ETEspzUqxKj+hwmNtodS
         qGxzL9raq8QIO1gtNlKmZXehAnLOI/nwlsIZibbpmLAikvT24qfqhW/ykv1YuvgU9Vnu
         vtDtvL7VhOdVmFtQRDGJxe2yRlUmHXTrhLZXvlNv2GlF5ACpySfH+xkaIX6MjX1F/R72
         aGdXOLJy+bdPLtyp5GKE1ISpPjWR8bYEjMip8idmI6TujfjNrnhZa80b2spw99Yn1f3b
         pbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661333; x=1729266133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAg4wkVT6Cjwi3LgeS7wloPDIRRHaTX+vwEctvT3PfU=;
        b=GltuRw7shbSZCNc4dblqJCOPUuwa1jz1pblKNqWEXLiXwWbRR/qBfokgf35RZ5SMCa
         TyUjzmvWs5oMLboXuWaxFbMjnUolxckiGLxBtbAeBSmwRHNhZBbs7X7/X+LKbEGtsXqf
         GE8N2rhv2j7cAJKrsri+2KqFvao6GFK+wYA1VABMfTqW/cZKySRt+X2yh26ZDF868/3F
         t5AysX5WVanZZLy9bxKOQWI1tMHf0Hm3m5Uias6y58/ExuKlqJTYPEsC1V5oxSnrw8wN
         i6MeESPEZQv3jCY4aK2rhviPHvoM6ZO8rWZW4J3SkElXdklwBbMI6rmek6WeguBoRU+z
         gXaw==
X-Forwarded-Encrypted: i=1; AJvYcCVNf5dUZ11AUVRoD1FAo0mWp2z4usoumy5ZU/Eg/z66Tg7G0DWIsj3MXczMeRh1Jwpq8X1Bmsw/EcmfPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7RySRM+8OMTLMlol6EFh2KtI8ZsbndFGjGtcoAfEDDBfdN1L
	lMqbtd4H5CbiMnPm+/KnobRLH6pj6KUONgONtJfQwYYopmhMt6qZ+8Qdwg==
X-Google-Smtp-Source: AGHT+IHI6wjTJCPSu5qjRpobJiOHnl0hN7vDOtzdVYjkSVCMiPpC31y5P9bsSTQgHeUkHfkEa6EHyg==
X-Received: by 2002:a17:903:228d:b0:20c:a644:c5bf with SMTP id d9443c01a7336-20ca644c633mr30256655ad.31.1728661332629;
        Fri, 11 Oct 2024 08:42:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad9906sm24758195ad.34.2024.10.11.08.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:42:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c91afc26-61c9-4cb8-8993-ef2a750f2fc0@roeck-us.net>
Date: Fri, 11 Oct 2024 08:42:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ads7830 sensors declared in ACPI show up as ads7830-virtual-0,
 not as i2c device
To: Mikael Lund Jepsen <mlj@danelec.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <AS4P189MB21333CF67856C181281114C5BA7E2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
 <AS4P189MB2133236F43AF4D3A60E49BAFBA792@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <AS4P189MB2133236F43AF4D3A60E49BAFBA792@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 06:24, Mikael Lund Jepsen wrote:
> I'm trying to add ACPI definitions for two i2c-based ads7830 sensors. Problem is that lm-sensor reports both devices as "ads7830-virtual-0", which makes it impossible to define separate configs for multiple sensors of the same type. If I register the sensors via sysfs, lm-sensors reports them as I would expect, with <bus#>-<address> in the chip name (e.g. ads7830-i2c-0-4a).
> 
> The adapter on an ACPI defined sensor is being reported as "Virtual device", not "Synopsys DesignWare I2C adapter" as when registered via sysfs, so it seems that the i2c bus is not identified properly in the ACPI case.
> 
> I've followed the documentation for ACPI Based Device Enumeration, using PRP0001 as _HID to match the driver via the compatible property:
> 
>          Device (ADS0)
>          {
>                  Name (_HID, "PRP0001")
>                  Name (_DSD, Package ()
>                  {
>                          ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                          Package ()
>                          {
>                                  Package () { "compatible", "ti,ads7830" },
>                          }
>                  })
>                  Method (_CRS, 0, Serialized)
>                  {
>                          Name (SBUF, ResourceTemplate ()
>                          {
>                                  I2cSerialBusV2 (0x4a, ControllerInitiated,
>                                  100000, AddressingMode7Bit,
>                                  "\\_SB.PC00.I2C0", 0x00,
>                                  ResourceConsumer, , Exclusive,)
>                          })
>                          Return (SBUF)
>                  }
>          }
> 
> The difference between declaring in ACPI (addr 0x4a) vs. registering via sysfs (addr 0x4b) is clear in /sys/bus/i2c/devices/:
> 0-004b -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/0-004b
> i2c-0 -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0
> ...
> i2c-PRP0001:00 -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-PRP0001:00
> 
> I'm not sure if this is correct behaviour, or if this is a symptom of the Adapter being identified as Virtual rather than an i2c bus adapter.
> 
> Does anyone have an idea what I'm doing wrong in my ACPI definition, or is this an issue in the driver/hwmon?
> 

The driver doesn't know anything about ACPI. The identification as virtual device
is done by libsensors. That code is supposed to find ACPI devices, but maybe something
has changed and that doesn't work anymore. One would have to debug the libsensors code
to find a solution.

Note that the driver does not currently support device properties, meaning that
reading individual properties from ACPI is not currently supported. There is
only a single property, "ti,differential-input", which you don't seem to use,
so that probably does not matter. If you do need that property, the driver would
have to be updated.

Guenter

