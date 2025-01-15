Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2324A7D0;
	Wed, 15 Jan 2025 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950809; cv=none; b=AdDpscf1fKvDgWRZUWhZEpm7+iag8XtoAeAQ77e+UoVVRULZC+5ODOKV8EDvX47NbO0QBmK/hf5uAB6OYyuJuMH/7/JExBpR8U9kD5X/1pJUHEwY8IVkNH1qfm0XkFxuHRgZ1s1VYug0G6mq+RWcKjenBAymq+TAtgqDStwuxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950809; c=relaxed/simple;
	bh=J9j0q9u2CmrBrASi7lSJAJRxcoA2U5BTIH7mTOeL+3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5rhdp/r/ilNDo1oevE9c32zmWLUq1OGYhoGB2/B6gFSslHe7f1GPkqhXCLov4/RhixF/Ku0EX3cXxfo1l5ll6MMNmQA9ggSKZt+37gSd2bciZPnZMNCF4RYJLA/I3SYdViey/JzyXMTdSiFkUA2DNU1VSBV0RfbHBawmHIc/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exCEnc6P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exCEnc6P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21634338cfdso120540615ad.2;
        Wed, 15 Jan 2025 06:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736950807; x=1737555607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRauP/mJ2p43uSUO3cmOAl0UguEAsHeFhhgJqgdpyqk=;
        b=exCEnc6P3Dt4U20M9eGRULxc+bAr4wFN3Bkc7oHLphPywiylToy73FenqkE9igc63L
         NQvyGG6D9U+DOq1dM1abgUlzM2JAmIg00b/7p/YSm/dw5XSEmYPiSUjdm6Pn3jxIGKLU
         ZBwrjtfFRdS6p0Oxf3BYSmHaim7c1vuIV2RSpnG91doPt9bCJAkQM5XEObWXfWYwgGCG
         Rougf9B0HIdPy8CszxGu1mRA3uF2OdLOJkpbS0vuUI0xuHxSGxY+iqRe2FbOgXaNrBQ4
         PaWHU8dayRUJFi0fhyHVrQcKGXqqUkbVVr0aP7W+zuSsPCS97MR98gYad2E/tGkpf0XW
         Gbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950807; x=1737555607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRauP/mJ2p43uSUO3cmOAl0UguEAsHeFhhgJqgdpyqk=;
        b=BGt2mA7iWqq9nh6eZDZn+DUWNoXKiDtrVmR+eUZdCvQDiHfXI/WXz2JipZNI0LDrGQ
         /fWay64q3DChkR7jLg7xZHUhQNIqAmYt4nO1YU9PEI11HHDuIEYhCzFpnKeIWrw8bBHq
         8fyb9yTSI+ihxQCRcnfpuYdjcHkqsj1eel3agc4uRZFCf50UZBFkPPEFjQUHcB+lVK+w
         PGoPpLDKvSYtvuTYUV850KN626ro7/X4C6QPAZpQaT9EbUEINw+QOS6Wx1nbtRKIDSv8
         SgniDDvUut/dghllfRJDe3wlWrqWSnGh13IgAqdukAKfFb6n3ZBslPactPeJwqgCaQKa
         rzhg==
X-Forwarded-Encrypted: i=1; AJvYcCU4uxWjGtCRTbvv5bKB422kLcEobJ1ULUIZQR4y6SsYACWniMzhOHbtk2V/Gx2WOFbVJXxE5NgJv2vutA==@vger.kernel.org, AJvYcCV5VO86I7FkoXT/xKlmnbW4588dvNKCq3N9x9PY+BE0sXuXQ6r6L29BbsXMw81Ei6uvrGinC3Bn7BnWeVfF@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyCuWUSWIgSVsDl5fuLf4znlEK7L4bn8s2DlHfGQAte+vFOI2
	0KkyjKWeRtCU1DSxR1uayOwZuHtNOe2CuGylAQF56wX1VZm4lnYX
X-Gm-Gg: ASbGncto99P/K/tet0BArUITnUimEr33zNAGUTki5TOHCIyDXx7CKjjoenNMbbxAKqF
	zzODC3gpH4AyPSgchNhgl+G1qIzGbP73WJGP19LtWfr+wE3DsmcC6XsMQF0DxHT2aKFdgKu0S7b
	awyUczV0CDgC9SN7ld5dwJ3l0rBxrsNdMvchXMC8Fj/uqzbvCC+eHHELj5O80/I5hE5EhZ/8T7u
	GUbTK8ki08+gbLIDN50sFdONiB5D2tYfSITyg1z/+N/lJBHPIRcG6szxCjh5KZAo3HKxA==
X-Google-Smtp-Source: AGHT+IGax2K2Fbh+Y4swhJyiTNSIGWit8Vovc4+AZaxbkboL+I1nhCQq7UL6jShpXjnglaGcd/nr2w==
X-Received: by 2002:a17:903:185:b0:215:b190:de6 with SMTP id d9443c01a7336-21a83f3f59amr368611505ad.3.1736950806885;
        Wed, 15 Jan 2025 06:20:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f132138sm83862815ad.86.2025.01.15.06.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:20:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Jan 2025 06:20:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix a check for the return
 value of read_domain_devices().
Message-ID: <ec1cb50c-0cb9-4d7a-af2e-2cb1a7b47129@roeck-us.net>
References: <20250115073532.3211000-1-fj1078ii@aa.jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115073532.3211000-1-fj1078ii@aa.jp.fujitsu.com>

On Wed, Jan 15, 2025 at 07:35:32AM +0000, Kazuhiro Abe wrote:
> After commit fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load
> module on platform without _PMD method"),
> the acpi_power_meter driver fails to load if the platform has _PMD method.
> 
> To address this, add a check for successful read_domain_devices().
> Tested on Nvidia Grace machine.
> 
> Fixes: fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load module on platform without _PMD method")
> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>

Checkpatch says:

CHECK: Unnecessary parentheses around 'res != 0'
#108: FILE: drivers/hwmon/acpi_power_meter.c:685:
+	if ((res != 0) && (res != -ENODEV))

No need to resend, I'll fix that up while applying, but please keep it in mind
for the future.

Guenter

> ---
>  drivers/hwmon/acpi_power_meter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 2f1c9d97ad21..dbf2c606fe15 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -682,7 +682,7 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
>  
>  	/* _PMD method is optional. */
>  	res = read_domain_devices(resource);
> -	if (res != -ENODEV)
> +	if ((res != 0) && (res != -ENODEV))
>  		return res;
>  
>  	if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
