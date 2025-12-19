Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC635FF76
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162839; cv=none; b=dR5pq4PhiicJbPtLN3rdtVzfYDA74NV/EjlZ95C5xLKXeZAEus9Sz+guVq7CasfPxV2xSbo1oFQEa2FmdI3KEUrty20IYkKqC1ddaUmb3z0NwEu3BAFCCv7C7e/MAaW95v6okIAqqJnZ6UCX9i/9cFndbOwIFM6FQVj5WYdvH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162839; c=relaxed/simple;
	bh=jhRk3Ipk7e68GLhh5OnW32OvRpsBRz+3p+xrVBoz+Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od/Ja1CS70sje9KIjuFIq6I3ZH/LtISCL8r6oki3DODfdJ5+uzNP/FbLD1CuOXeEsMlixxM6Pb/3ctYe/5zeiZan5sBUUf55EdA+WVUHUCYRj7tL7YZ5zf6ygMo8rPo9rJPqVV3zWGhRzNe8j7rCtj6hs4oUtAPCBRSv4Wkyi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9ADlUcu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9ADlUcu"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2020944a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766162836; x=1766767636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOervZ2wireH/C15tXnZc6MfLwrTuJtgTvxZVl4SpmM=;
        b=Z9ADlUcu4NlJ7tzfe8L99H7dh/nsXQ6MGu5NgJ3zKTqSySfm4bHnoGYcss/X6sd/cU
         dR/MU2fvuG6vwwsdTT4ZhZk+ZK7V3OcmD5vEb6P+70HS13PfPD3gIK+3KXNv/2gb11xM
         iyNIyf6blDk60Dz37LU7LJxjRnjPXI8vtvY7ELwj0NL9LSMTXIPw0xzXI0PQzGijeTqN
         9D56FObrIiUVnfpKL098JtIL4smXhG2vKlWpTl62WQR2IJbTeZd8CcIXfKt7TfBCMBxa
         xQS0OWkHQL7Uw8SxCpcd+ggDQBRRDLJkjEnat81/OAvlChP41ExTGJB0DM2mAc+7rvOR
         zSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162836; x=1766767636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IOervZ2wireH/C15tXnZc6MfLwrTuJtgTvxZVl4SpmM=;
        b=boyZ/HialgSIJLBoT8GbhIjBoRoFmPt/C5wQA4bLQ2dokd0ffD5UbwTAQ8NwCdcW6U
         eh7A/ckzvXv8udn7KoJ1PWrU2vVdsjqYeAsO6u0mdOjcl9EmmcVXJf404bI6yxzB8tHg
         2DUzz8ejcwQmEFgDAp5dFuDpcvZsA3qw43p8AtabZUpHU7fIPWwNOE9tZ7gIs/2Ngs4a
         izMQF+NgwNLG6AXGr5DmyH5QHX1cYupw+5J5HMF0e8aB6SsmgtRvKg/vmIxI11OTa+Jf
         l52OhPgVAOraMHR+hzdl82pyM/u8V6BlEEKNPrEqvGP3+AZa2tgptLUxtImOtlxGOR+s
         X1lQ==
X-Gm-Message-State: AOJu0YwdOb2Q9WlaVGCUR+LbttiWTxZYPBpeyJbXwQewnBYwHviq+c/K
	Rq4gdUuSsJbBhNjjTdGdPgJp5R6/IJAaYHQWkNSLcMkUPiGal9ch7l9u
X-Gm-Gg: AY/fxX4C3ia0hlm4wMPIgoSIuA3SrR2I02YZpsfUyCriyC3mpBE/fak5c07Ssj6sPfo
	wlv/T6rIVpq3DfcwCOjNw/p7awsTBysVK76cfa42jT6vM42JNAbgMIbQOGEc3gBxKPD8zLiLUFg
	liLa8rvF9fHnidB2sVNTNvztMeJV02taXDtMJtGTBYUSJPJV6PSXM9k//Y/Mz14GdxkXZ4Y3ccH
	z5BgZ0KckQp3LAZsBdVuxAUqAQCg2qKLLZqgwOSqVC5zhFPKpgaEdH0H/UuOVxuGe2xqYJqmLqj
	uuZBQ5inn1jQd80KYasfwFJUdlj3wb+S0Q4nz6G+t1Tkah3UdwyTnECPRXEaVywoW/HcpeTHKBl
	qdklukKleLAmRpvD5Jk7W7HeQ8qo9tAqFy9KhZK3BTCn8TlXpwwvCACOSVKGG4Ulocdz52AxmLe
	v/oVCO8CvSNXVJBmMvwN78RtIq
X-Google-Smtp-Source: AGHT+IFNCTi0/O17x/JCP+ojFIqzO60a/e+LUTFZOFQTe8hd6b0gSlm1Ew46MEctgTXA5AbFxuiOUA==
X-Received: by 2002:a05:693c:6016:b0:2ae:5a73:23d6 with SMTP id 5a478bee46e88-2b05ec17300mr3031836eec.19.1766162835465;
        Fri, 19 Dec 2025 08:47:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm6769004eec.0.2025.12.19.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:47:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:47:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: Use sysfs_emit in show function callsbacks
Message-ID: <160f3844-e142-47ab-a0b5-5e9512aac568@roeck-us.net>
References: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
 <20251219-hwmon-fixes-v1-2-21b29097ea3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-hwmon-fixes-v1-2-21b29097ea3b@gmail.com>

On Fri, Dec 19, 2025 at 05:48:15PM +0200, Kari Argillander wrote:
> Use sysfs_emit() over sprintf() to prevent potential overflows. In
> hwmon_attr_show() that is totally impossible but looking other places
> many still use sysfs_emit().
> 
> Also according Documentation/filesystems/sysfs.rst code should use
> sysfs_emit().
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 7a784d685d77..714caa6a36a3 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -73,7 +73,7 @@ struct hwmon_thermal_data {
>  static ssize_t
>  name_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%s\n", to_hwmon_device(dev)->name);
> +	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->name);
>  }
>  static DEVICE_ATTR_RO(name);
>  
> @@ -446,7 +446,7 @@ static ssize_t hwmon_attr_show(struct device *dev,
>  	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
>  			      hattr->name, val64);
>  
> -	return sprintf(buf, "%lld\n", val64);
> +	return sysfs_emit(buf, "%lld\n", val64);
>  }
>  
>  static ssize_t hwmon_attr_show_string(struct device *dev,
> @@ -469,7 +469,7 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
>  	trace_hwmon_attr_show_string(hattr->index + hwmon_attr_base(type),
>  				     hattr->name, s);
>  
> -	return sprintf(buf, "%s\n", s);
> +	return sysfs_emit(buf, "%s\n", s);
>  }
>  
>  static ssize_t hwmon_attr_store(struct device *dev,
