Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1F3C3C
	for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2024 03:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732849980; cv=none; b=JphwOMRPmp+FdkRtZ+jWLL97f6T6OZGsUrjbvTk9eXqd0gpVoa0v8aAfy4kiuSCJAj6BaTbNHYV1SsdNTNyDybHa357YHHB6NIw5Z07aoR7s19Ixcw2AkYTsJxlWxCVZmURlV1ZyRLnpL/VT5Le4h/1s0fT2ArgibTsf4yibsGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732849980; c=relaxed/simple;
	bh=FUXj7X0MQKmg0LjFbpkkLsGvPLY1K95oUsj1BMgAp50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FaJLqhqfl4n1wSrZzm8ffQLEnoTPRERAgvmuDnsXGIFYfndlMH1cRRrJ62pYmDUZz9FzL/uRSps+GCETSYmzj7u3b5PQWJUZELWUXXN52HHOkVldgboYPtpiuJbehoubt5YJAIur7wzxf2Mk9HR7B/oBGRICPQhlq7gZeQeGuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiFV1exX; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiFV1exX"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fc1f1748a3so790103a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Nov 2024 19:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732849978; x=1733454778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=08YUY8oEKIlalckcq6l3aTgWV8GjO0TipYS9RV7kUDc=;
        b=PiFV1exX7Jsx0R2LsNFSPYnREh1AIcVYRmw4FPCfDjAmACSDvPTO3UNgQdsCC1QTnR
         rBrHlWfVCiLmn3DcolZZpOHL8D6dtZt6MEx8vY/5tBIzhlE0dT6GvGkkA8+FeDfsdAYE
         tmIEthgxx96mBwPKbL/VpmKvoHPpnD7OXgGOiX1IXLOUpMbIBfIulWTD1S/m1RHjiQ8n
         GEfnPp7xESwmJ2mVbU4UP+aNPvswdH5mfhS7x/MDfup4N/0aaig1AF6n8eHK8hxYwjWI
         T0opXqc0ImknQFO8CE7l8Axx1Ir996N4Vd3en6nYa6reKF2nbiF46hE3Nx9QkPAhlx3G
         13kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732849978; x=1733454778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08YUY8oEKIlalckcq6l3aTgWV8GjO0TipYS9RV7kUDc=;
        b=DNSn5wfW6F8G1AISPB0JRP7yj7vT5mLb+OkRhb1mlEzyHl37m/56i7uRKV7UHp2B8T
         n6EgbcFY9dETz9H6d/EwYKLmrSdFm2KGPn6jZfBjW2dMhlfvfJ9kUmUzXHhNvuvT7w16
         +XFTECMkNwQWtsvq/AR98Z9oayGTMnJEVb3uopTK3vPNIIAU0J4pbavUh/tD8ZVrbAzg
         H2xruwO0HCPs6UTKhdKMCs3crPGD1Syp/PIuiA2SrJjImbiw6+4PMS4sNdkLegAwxWFM
         ijk7mLQyRORAaFzVvg9lpP+qg5ekf2MdHZ6gzR/MQk4g2ug3RsGi8PoT8+gcbF9ujZm2
         VX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUwEjokLgt7oGbx2Tr0qx8fbgT9h2GWr60HhsbZHuGf1O7d4aMH2/0F0z6Q7HklRnHTKuPuUnp+fLNRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMMoyNbhgsAkV5ltT48InfRUtaRaj2IHQkFoqjiB63RkHzZg9
	ZYsrsW4o0qIbfcknVY5j3bTARZ1n+vqO0pU+fmgEezcGMsSZFI05
X-Gm-Gg: ASbGncuFpsZZg9yvwCYVMGvHeuUCdnIw8K1WFONAVp22AcvT7qvdC8ymB3XBKpqHtpI
	pPcvGrRH41Z6Qn3ZSumeJwLirJpnOt/g8FZ047kPTQMYNAYF1Ll4WqxCcR6Sw9qZsAq6gIkTil6
	+cKIbeCiDhPUWjFwJ4av/0ZwlJ4xK2p14JBjAZKOzHb8dVb8940x+G/+nRCU43nBXqPkiK6Yd9m
	j+qRDJsUwD0hsa17ggMQSry8QXd0/syaNQGYkxfF3F48Ga46kzXMs4SyawF7qrgWfg1doL9Z2ac
	mIRoRw5c7JtlFW3E0rj9J9U=
X-Google-Smtp-Source: AGHT+IGvFi7XS9zAJgqjuuW9JnSQ1yqgRo8hc/kFCKNhGf789R2ewqklKfFkkVAVJxeSrjdqUO3amg==
X-Received: by 2002:a05:6a21:7187:b0:1e0:ed9b:14f6 with SMTP id adf61e73a8af0-1e0ed9b155cmr6127785637.32.1732849978049;
        Thu, 28 Nov 2024 19:12:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3a0766sm2092257a12.78.2024.11.28.19.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 19:12:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9d25b97d-9570-42c2-b951-4cc708f38be0@roeck-us.net>
Date: Thu, 28 Nov 2024 19:12:56 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about enabling ACPI power meter capping
To: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>,
 'Jean Delvare' <jdelvare@suse.com>,
 "'linux-hwmon@vger.kernel.org'" <linux-hwmon@vger.kernel.org>
References: <OS3PR01MB9382B4EB50C4C797AD47F73AD9292@OS3PR01MB9382.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <OS3PR01MB9382B4EB50C4C797AD47F73AD9292@OS3PR01MB9382.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/24 20:02, Shinji Nomoto (Fujitsu) wrote:
> Hi there, We are planning to support ACPI power meter capping in our machines we are manufacturing, so I have a question regarding the capping code in the acpi_power_meter driver.
> For the capping feature to be enabled in the current code, the following conditions for the setup_attrs function in drivers/hwmon/acpi_power_meter.c must be properly satisfied:
> 
>           if (resource->caps.flags & POWER_METER_CAN_CAP) { // Condition 1
>                   if (!can_cap_in_hardware()) { // Condition 2
>                           dev_warn(&resource->acpi_dev->dev,
>                                    "Ignoring unsafe software power cap!\n");
>                           goto skip_unsafe_cap;
>                   }
> 
> * Condition 1
> The capabilities bit3 (indicates that the power meter supports notifications when the hardware limit is enforced) of the ACPI _PMC object is set to 1.
> 
> * Condition 2
> The then statement is skipped if any of the following conditions are met:
> + The module parameter force_cap_on is 1 The Manufacturer string of the
> + DMI System Information information has "IBM" embedded
> 
> After checking the ACPI specifications, I understand that there is no problem as long as condition 1 is met.
> It seems like it would be better to enable the capping feature as long as condition 1 is met. So, can we remove the condition 2?
> I would appreciate your opinions on whether condition 2 is necessary.
> 

The problem here is that it is impossible to prove that the condition is
_not_ necessary. The existence of a specification does not guarantee
that implementations follow it.

On top of that, driver is completely out of date, and only minimal changes
should be made to it. I would suggest to add your system to pm_dmi_table.

Guenter

