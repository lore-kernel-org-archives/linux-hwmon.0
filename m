Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8063B1EC0
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339795; cv=none; b=ZnTC116H/nMKUcaAWh8US3vYv1G984c9+ZD33g41nDs7QzKeNiXp/oiq15j2L4R89c4Ai1u+usUKPyyvjatPG6tn5PbYDIK/ov2fChbdb9hRWgplklx7JXjGC93m2SlDoV7OTsD7LMgmSHCy2986EmiuvkoxidEF9r2Zvc9Xrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339795; c=relaxed/simple;
	bh=K7+HPRoT8cC9vA5FhgvhzRNw1g9Mo76Ky1GUeYVLRfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3VZS2wrLzP278iC5ANd7en41aPGqKn5eeEwRX+EIJGjGgQLkkuz6jGqcD+YPk6u2oWZ34TcdN+t2P3cH6lgOeTJvmPUPRCOYqu47h1ZAHiHLSLQ13NjXFGEdFWw3TpUh+NE3T0SIlOcwUkfnB1gDgp5vrUdfDtPJHjHe6kaYkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIxOpE27; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIxOpE27"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso114674eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339791; x=1792944591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ltRwcLJB2IvTeYU1P4tvckFXLR/qTUoJOrgmykztVO4=;
        b=hIxOpE27TBfTd9z+/+LRrmHxFaBFUK02GZk2NjHeQZhrilLl35DZPUGoSGyKspiRYc
         w6B14WFbVzsVyYd3htwhh5wECpHyZhTbqreTE0sMwinZwtHooW3vXwgKg5pfrrsC+Yll
         BxgrdNEEdRwnNkCflDm+PktPFkRb3vmca04vOPDNiIZPIWuaJF1y5GqctM/xCMK+oAog
         kwAsNMfs/qcojris8KuT5Bqgga35j1BrnxpStdJ66+wtXKZ6HCObC6TwY4gYK9JSs72L
         35DE6ZDgdu3Mk+BpEMTqtcOcsQDtCmJfrUcFexvkGxt3m0xC5vle/I31SXI7ZxZoswu/
         7qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339791; x=1792944591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltRwcLJB2IvTeYU1P4tvckFXLR/qTUoJOrgmykztVO4=;
        b=Db+0zRDrfiLg/uc11Mn+N3xqOZ/U2bv6ZbetgEAILIl2gTqaBm3Z2HueiLyUqZrDa8
         lti24coIjEB1VWvM4acmFkgoK+mbp/xdrx23rVPn36GhdFEjwW6LewTtPG9VDFMFCmXP
         T7aUiXXPM9BdLeh6E5k+v11SUH84sjtclL+udegvgq4qJIr+EgVjlmIwTGzTgZ3ujNt6
         xDRVLvFkkTBa9fnecJzEhIL5zxQitL9n1+IeF64ibHaJFJ69+14ek2IUVS/xB8KG7b7n
         B07Aq1yqoS4bfCoaPsdRbexs5EHebovY3L9cC5mJygluMU1DF/pkVSJBIySGlTBrd474
         +WVA==
X-Forwarded-Encrypted: i=1; AKwUvBwoKj9g5t9L/qUzrzZ8u3cyS1l4azLlEZJATMu7/ClK0PR3WOMoaqvpbt2QXeFpyvBEQxaobx61+1Tfpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbHfnzA1JX5NXn7t+9odyd8gHSTPPhxXkvk3hmX9YVg7yysV+U
	7ztNxjE7x2vMgcW1R3mbYy+mAfEwjB6oieTDMgQHQoloNGDqog/VCP7p
X-Gm-Gg: AYBFou06wryuZNWQt0jN29GGiiLlmN+KETI+dliLoTdbLic0p3Zd720YlsgyqaXaSFh
	53NHW9TsvziN3f1ZcSLYyBxWqRbAzJ/Ra/Xa3J4t2S8SDm48Jz0PWmfwN+SXu7jJt11DBrBsKUK
	F3Sio9GBXl0yCtGRmV7MweboLJPYNsWlRJ82+rKuBtg1QyAuRi8OgjvEAqEYcvjX0dSyk0erUxF
	NyHKTwkPq1hx4TrKdo/Q8Y5mhw1iOubNDHDKePm1g19tSvk+9aIqu5Nj5N/jAl9jARC1Dz0aN6L
	jDqicofUUbpjYyvFZ0XGuvjq/IV/SLR2WW19gQ4u416s7d1dNJSMD+lrrE/VKCLqk+j4ReDGt56
	j/tGoZh7CdyyYON/q6To444SeGhZ5N9O/9gdWF2ExmwteqPn8EWwWNYckE/Z218XSaGU0IPPxnG
	yJs7j4Xd8Luj9O7Pp06zfYVxx675IxdhWOZfwQq2rYhxGeFGd2yCsH5uy0DgpyqylPUL43McyjA
	bu3RgplIePG
X-Received: by 2002:a05:701b:21c7:b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-18512c382d1mr7146694c88.15.1792339790889;
        Sun, 18 Oct 2026 09:09:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm28812835c88.16.2026.10.18.09.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:09:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH v2] hwmon: (coretemp) Return -ENODATA for invalid
 temperature readings
Message-ID: <ef041f4b-4592-4693-a9d7-a5c82aab9c77@roeck-us.net>
References: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>

On Tue, Oct 06, 2026 at 06:04:56AM -0700, Ricardo Neri wrote:
> IA32_THERM_STATUS and IA32_PACKAGE_THERM_STATUS have a valid bit, bit 31.
> The Intel SDM documents it only for the former, but the package register
> implements it too: x86_pkg_temp_thermal has required it since commit
> f1a18a105660 ("Thermal: CPU Package temperature thermal").
> 
> This driver checked the bit for both registers as well, until
> commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
> temperatures") made it ignore the bit because some CPUs clear it while
> the temperature is too low to be measured. Since then, temp%d_input
> reports such a reading as a real temperature. Userspace cannot tell it
> apart from a genuinely low one.
> 
> Fail the read with -ENODATA while the CPU reports the reading as invalid.
> On a CPU that clears the bit, reading temp%d_input now fails where it
> used to return a low value. sensors(1) shows N/A in its place.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/46f9f319-de71-412f-a424-6cb801478456@roeck-us.net/
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - Patches 1 and 2 of v1 have been applied. This is a rework of patch 3.
> - Drop temp%d_fault and fail temp%d_input with -ENODATA instead. (Guenter)
> - Link to v1: https://lore.kernel.org/r/20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com
> ---
>  Documentation/hwmon/coretemp.rst |  3 +++
>  drivers/hwmon/coretemp.c         | 21 +++++++++++++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> 
> ---
> base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
> change-id: 20261003-coretemp-enodata-e424540e3b4c
> 
> Best regards,
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 349301683381..09f885a847e3 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -50,6 +50,9 @@ All sysfs entries are named with their core_id (represented here by 'X').
>  
>  ================= ========================================================
>  tempX_input	  Core temperature (in millidegrees Celsius).
> +		  Reading fails with -ENODATA while the CPU reports the
> +		  temperature as invalid. Some CPUs do this when the
> +		  temperature is too low to be measured.
>  tempX_max	  Maximum recommended operating temperature (Tcontrol).
>  		  All cooling devices should be turned on.
>  tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 0ab6bbff5637..a9edbb4924a7 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -60,6 +60,8 @@ enum coretemp_attr_index {
>  
>  /*
>   * Per-Core Temperature Data
> + * @temp_valid: Whether the CPU reported @temp as valid. @temp is not
> + *		reported when this is false.
>   * @tjmax: The static tjmax value when tjmax cannot be retrieved from
>   *		IA32_TEMPERATURE_TARGET MSR.
>   * @last_updated: The time when the current temperature value was updated
> @@ -72,6 +74,7 @@ enum coretemp_attr_index {
>   */
>  struct temp_data {
>  	int temp;
> +	bool temp_valid;
>  	int tjmax;
>  	unsigned long last_updated;
>  	unsigned int cpu;
> @@ -398,7 +401,8 @@ static ssize_t show_temp(struct device *dev,
>  {
>  	struct msr val;
>  	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_TEMP]);
> -	int tjmax;
> +	int tjmax, temp;
> +	bool valid;
>  
>  	mutex_lock(&tdata->update_lock);
>  
> @@ -407,17 +411,22 @@ static ssize_t show_temp(struct device *dev,
>  		tjmax = get_tjmax(tdata, dev);
>  		rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
>  		/*
> -		 * Ignore the valid bit. In all observed cases the register
> -		 * value is either low or zero if the valid bit is 0.
> -		 * Return it instead of reporting an error which doesn't
> -		 * really help at all.
> +		 * Bit 31 indicates whether the reading is valid. Some CPUs
> +		 * clear it while the temperature is too low to be measured.
> +		 * Such a reading is not a temperature. Do not report it.
>  		 */
> +		tdata->temp_valid = (val.l >> 31) & 1;
>  		tdata->temp = tjmax - ((val.l >> 16) & 0xff) * 1000;
>  		tdata->last_updated = jiffies;
>  	}
>  
> +	valid = tdata->temp_valid;
> +	temp = tdata->temp;
>  	mutex_unlock(&tdata->update_lock);
> -	return sprintf(buf, "%d\n", tdata->temp);
> +
> +	if (!valid)
> +		return -ENODATA;
> +	return sprintf(buf, "%d\n", temp);
>  }
>  
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev)
