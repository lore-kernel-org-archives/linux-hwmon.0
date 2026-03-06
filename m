Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D036A023
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814408; cv=none; b=JxhrqTcq9er8WzDHtLV8sFIIElLB9gyqcVx05VFOxxdjsAwiGVUiGjJMGW09IS8TtHwGl6vnr96gSiJObUl4PpOauADIKMp0cktKN4YMvcieJSaNibOMIXCilxIGhHmiQH/qn7l8neTgyMwGmoq1yOrJvX8FhXRMCZ+2HXEJS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814408; c=relaxed/simple;
	bh=arIjddhmeKYjbeYv9OdncJsTPLjH/d1u//2YzVvYGhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwb2+h50h+gOhJCy3MQqV6ZnFBOIBPn2yHv5kzy96lp/7DvSKm5FjIWZzLMLD6VYEOn8FuWJJ4HyJxbK9UpicBwPAWZrVG3wwVm8YGvF01AQqh92UPDUkRlFwB7846aQEDQDoltKNtN9nw/VU5nhOXdk82O1bs/9PcLmqd7c/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtWz2o4W; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtWz2o4W"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128cba36eceso64801c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814407; x=1773419207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBC7Bn2gzpWf9cr0AUTi36+mTJ8I7brySGNlqYgTOc4=;
        b=VtWz2o4WbnutsUDarKmsbdgWyAWSmUglaQZnMoK5ltv1e+krPn0Vy4LrK0Vd0C5Unw
         ZGlnHEiOLS3y6Wg02mFBLtgLg8N+dq2ZZIqI/a0kLdcnFquzpSoWNpqHajjHAPCE94Ih
         atKgNUFfFeHEmvTBzeueuMtywCXrhLuknLXjownTh63dh8MZxa8pVh9amd8Z8dRff6BB
         Gim/rI1ts9d9lu+xLSfMiLuFcXQgfq8hjCveAsIjUCu3Waesy3AjtCG79y4gi8lq150U
         kaloJxJ7UYoOFptQw6hQxtiEoRnJOmHwlDUjz1jIA/JauMjHMIc/vimcoLIbry0Fm9zD
         xi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814407; x=1773419207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBC7Bn2gzpWf9cr0AUTi36+mTJ8I7brySGNlqYgTOc4=;
        b=S3XqG8U4tYPnSmMdp26zNkxl18YJhESGFfxMr3k2chySiNKyDQG+NvT8B5Fk64x+WH
         5plkw78kwHNK7r3jis/3fLjP6UAGI+imqAyK8XAmo+ViBhqONawMva/QfE/l9yAQpnXD
         b3mIduh1+SyCVk/37nXfLruoUZAm0PHP5NCh9R8DC4FWiuWja1bgIl67UEVSYddQzyje
         QhlmqOMr7w1urt88xtBFSpRcHps4a2vhwloJ3QXcA7Q6WtofomGUNxCvGui7uCVgvMXU
         hz+tlbngWGnU1CxMhWHB1b9n270s7WaBS7AicnzJbLS3Kygc5glqXjaWGjpbGFObc2m5
         IuXw==
X-Forwarded-Encrypted: i=1; AJvYcCW2BNGvdfJNhv979qnqCF43ZNorYG85XeO5lApFK6RQsLXUeJnhE3SrGvKSYvA1mQ2ZQtrVYkVG5c61Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCjBHrVtCUQghOxjqX7kbxvO6MBFL3jd8lISeJcMQBSMGIZ6R
	WmqpHoz7b3zRsTfFJOtlo4vn/DgPIoYllvog3IJ3eo2X9J2H2AVPc3le
X-Gm-Gg: ATEYQzwn21phQvsq3qgQGyCPraWWecM0vrIPyQVPs70i+bkCgqRYaRPgjyPHvz8y7YB
	3x14cuMGNC/DfHHzMtbMOjc7cAm8mtca7wi85quZ1KUq2KllCTxkdXiGVmEOos9FZpa/KqisL1m
	I1inRIWoJFnECRnxGnFFAkr8T94BsW/vnzs7irBA6cB+CllGe4dUJWXD2aEzgF6dRJlwvMMVjjV
	tcEfOXz20ZonSH7U09ezCvBL68gETgngeQehqyKPlSG3s1u8TLEQfgmFCQ3LGLH7yi0zi3D0f0W
	9tiGuHLCyRneE8S6taWdXudkS8b1wbfIuVLCXZjjCY2R2n0v5JpRONmLNm/7NhYFDKr2Cja/mWm
	ppjO64Pwxb1fmynn09KbW21jHfGAGMvUz6XKp/Q7mC5IaHTwvygNFkrOvyd0PCing/4pgBaTugX
	kXUs6lMguTj9T/BwrUUeS8BjR4MYcnA4W8XKpe07i/m/ozntQ=
X-Received: by 2002:a05:7022:49c:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-128c2d8e759mr1233951c88.6.1772814406473;
        Fri, 06 Mar 2026 08:26:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f670062sm1501662eec.0.2026.03.06.08.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:26:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:26:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] hwmon: (pmbus/tps53679) Remove use of
 i2c_match_id()
Message-ID: <14f4df53-9f40-4d7e-a229-26f7af590556@roeck-us.net>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-9-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305195642.830695-9-afd@ti.com>

On Thu, Mar 05, 2026 at 01:56:39PM -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This is often used to then retrieve the
> matching driver_data. This can be done in one step with the helper
> i2c_get_match_data().
> 
> This helper has a couple other benefits:
>  * It doesn't need the i2c_device_id passed in so we do not need
>    to have that forward declared, allowing us to remove those or
>    move the i2c_device_id table down to its more natural spot
>    with the other module info.

The patch does not actually remove the forward declaration or move 
the i2c_device_id table. At the very least this is misleading.
The same applies to other patches of the series as well.

>  * It also checks for device match data, which allows for OF and
>    ACPI based probing. That means we do not have to manually check
>    those first and can remove those checks.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/hwmon/pmbus/tps53679.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index ca2bfa25eb04c..df2726659a4ed 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -253,10 +253,7 @@ static int tps53679_probe(struct i2c_client *client)
>  	struct pmbus_driver_info *info;
>  	enum chips chip_id;
>  
> -	if (dev->of_node)
> -		chip_id = (uintptr_t)of_device_get_match_data(dev);
> -	else
> -		chip_id = i2c_match_id(tps53679_id, client)->driver_data;
> +	chip_id = (uintptr_t)i2c_get_match_data(client);
>  
>  	info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
>  	if (!info)
