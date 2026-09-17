Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FE42A96
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 00:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603729; cv=none; b=RSF/oOpn2A/jXBtW6g2JEK5uYBXWzbtqPwLAJGIVeQ70PLwKd7Dq5sg74tvfcEzLT1gjmqJhMqMqSxpUz5X7N3oTq599ji1cSxvqUL9lNgoW0bx+dbGWirDUWh20JjPEFe5FwgEN4nN1zi91tqQvWGHNmpGoazFyZ9h/wImwv2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603729; c=relaxed/simple;
	bh=axt0pyxvikct4TP8X4Wmmrq2ZpEZQ2m5UBXWa5Kgtkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVCbp+iNqV/oLk0hwZghZ1TgCQDV65O+YtmpQWZSU8TulTTI5sy8bUgD1zPPSfe7nANeKwtKraGimpvmwSi1lUXUpdMfrjdEdFU/t8tfVHgSBJf51EdXE3vN4iadXqAQB5dJ97irf1rnyee+OV0C+W1ZlvQ0NSNOYOSD/4L8Nqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siP5ne7c; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siP5ne7c"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae7089c1so94176eaf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603726; x=1790208526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ij5FQ1cxo8ePhLeDltni+VDXBFGoj/hemI8tUtKAvVo=;
        b=siP5ne7cdpE6qyoSfDKnBF9UvzXBJVWfSggJ7pxyxgWUtXzDQn+u/xQvaYJtmOqADX
         hryhlua0r67mPATDeDqj6DvSw0Ti3bj627oa1z1oGXhCyBVs4I3m3Iwx1PZpwoe+PQaP
         OPhcO+faiHf0EOXsLEOmIExQeeuQzYcgD4MCoI+mKJgMnuzhkmMdeHOig3LitJPm6VG4
         qiZSvd4ZtjXx7AN5S+jj49oYgnm7+jd6OdDJxcNvYhvZPzmtNaRMHE8XIm1fRjJJa3xf
         y22BJvrULyCc+VLXOFT60ihvGDeIFRB+l7CVSONVnNULjNNyg5+altKXxXfCzIKIG1wJ
         9V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603726; x=1790208526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5FQ1cxo8ePhLeDltni+VDXBFGoj/hemI8tUtKAvVo=;
        b=N9cRnLjK7idUDIWlCzVdJt9wViYqrkWXsy9J//o1EHKe1nR32cO7hiSV2CJAGJ5IU7
         HNkqFHAIv0/job+QTkYiGcDkqhb/qmwzT1sId2O/TeCG0hDVyyef7X3FJpxa7Uapg3rz
         L0o4eIGwlNJTws7phy66uYYH5RNc3D7pfrwCIWeXVPW5kULdgyYZEA0JJrBs6uuhnXDd
         Lwl1fquosA3SmhD0dxfr0u4h2+/3eBEOwDSGDkn1wiwS8YxVZMsEvFUGL9P2iUZlrVI3
         OpkOouM/6IxpYUY2IPJj01cd3/+0pmxa+/p7xeFF12d65SdMiM2U88fP6Tp+W0Z3o9W+
         2NEg==
X-Gm-Message-State: AFuF++mzJwKxXWsObEI+5opnxKSIG2u+6lzXtIyMfgk8SZb01gK49NIf
	IWBjOqsSRx3RWA5hXf9v8XS/GsPmifKVjXN6NwTaj0fbKHhXDnl/A8Bx
X-Gm-Gg: AYBFou2p1KqosGswrc3CiD2YvQmNgP1p9W67bQAAYln5qcpqlkNrNgxRfjIeq7WViyZ
	0VMfjSZCmR+gDobqXGptfSSGrdENjquV7vhB0MdkUAAGxiHzyn9uVFoSLUdFIXtfh5+GTBL9bQE
	Nlrh3BioF1B6mtS8iLIuS5ab/ZmYg+svennmnkNyWnCdlAY4VSUmV/FjVHNsBiVRg5ib0EsSUsv
	zEEkifXvHkfg9k1Vg7VIMEYHclKHdEJCqp/qB2WsOR+UqxQLHIaTxFLHawaJMnAHH85owEIBk/j
	H2Y+q3od6TULcW5+B1MKxxJsr53Va7HBA0Si8qdh6xqG/77GNbgKlModRe667bcxfaSFWUSOa2y
	T8DX4GxNuaFghrudPRv0hukd1le2eOBxHj2uUfGGXFAnTch601dSGkn5dMMidQZTTwC25G6Kq8o
	Jg4T6USlmBI2WlFqSMS/rX9QrNBibwARJjm8DoPt6k02azKSz/BI9OEhs+Dd/puIKS/9vT66Pw9
	vb4zByopD8J
X-Received: by 2002:a05:6820:818e:b0:6b7:8396:f3cc with SMTP id 006d021491bc7-6c7d3ceffe5mr4919325eaf.46.1789603726487;
        Wed, 16 Sep 2026 17:08:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14397197dc8sm8595889c88.3.2026.09.16.17.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:08:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:08:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Seo <james@equiv.tech>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Improve raw WMI string handling
Message-ID: <4fae6e7c-2667-4002-93d2-bb3c53910fe7@roeck-us.net>
References: <20260916221912.434119-5-james@equiv.tech>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916221912.434119-5-james@equiv.tech>

On Wed, Sep 16, 2026 at 03:19:15PM -0700, James Seo wrote:
> Commit c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on
> EliteDesk 800 G6") left out some logic for recognizing raw WMI
> strings in check_numeric_sensor_wobj(). This issue was reported by a
> user along with an incomplete and unsuitable proposed solution [1].
> 
> Add the missing logic and properly remedy the issue. Also slightly
> refactor how raw WMI strings are recognized elsewhere to make the
> intent that they should be treated as regular ACPI strings clearer.
> 
> Reported-by: Muhammad Bilal <meatuni001@gmail.com>
> Link: https://lore.kernel.org/linux-hwmon/20260916002907.161210-1-meatuni001@gmail.com/ [1]
> Fixes: c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6")
> Signed-off-by: James Seo <james@equiv.tech>

Never mind my previous reply. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/hp-wmi-sensors.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index 03c684ba83bd..cb2eb9bd278a 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -526,14 +526,12 @@ static int check_wobj(const union acpi_object *wobj,
>  	for (prop = 0; prop <= last_prop; prop++) {
>  		type = elements[prop].type;
>  		valid_type = property_map[prop];
> -		if (type != valid_type) {
> -			if (type == ACPI_TYPE_BUFFER &&
> -			    valid_type == ACPI_TYPE_STRING &&
> -			    is_raw_wmi_string(elements[prop].buffer.pointer,
> -					      elements[prop].buffer.length))
> -				continue;
> +		if (type == ACPI_TYPE_BUFFER &&
> +		    is_raw_wmi_string(elements[prop].buffer.pointer,
> +				      elements[prop].buffer.length))
> +			type = ACPI_TYPE_STRING;
> +		if (type != valid_type)
>  			return -EINVAL;
> -		}
>  	}
>  
>  	return 0;
> @@ -579,6 +577,7 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>  	int prop = HP_WMI_PROPERTY_NAME;
>  	acpi_object_type valid_type;
>  	union acpi_object *elements;
> +	union acpi_object *element;
>  	u32 elem_count;
>  	int last_prop;
>  	bool is_new;
> @@ -602,13 +601,20 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>  	    elem_count > HP_WMI_MAX_PROPERTIES)
>  		return -EINVAL;
>  
> -	type = elements[HP_WMI_PROPERTY_SIZE].type;
> +	element = &elements[HP_WMI_PROPERTY_SIZE];
> +	type = element->type;
>  	switch (type) {
>  	case ACPI_TYPE_INTEGER:
>  		is_new = true;
>  		last_prop = HP_WMI_PROPERTY_RATE_UNITS;
>  		break;
>  
> +	case ACPI_TYPE_BUFFER:
> +		if (!is_raw_wmi_string(element->buffer.pointer,
> +				       element->buffer.length))
> +			return -EINVAL;
> +		fallthrough;
> +
>  	case ACPI_TYPE_STRING:
>  		is_new = false;
>  		last_prop = HP_WMI_PROPERTY_CURRENT_READING;
> @@ -631,6 +637,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>  	for (i = 0; i < elem_count && prop <= last_prop; i++, prop++) {
>  		type = elements[i].type;
>  		valid_type = hp_wmi_property_map[prop];
> +		if (type == ACPI_TYPE_BUFFER &&
> +		    is_raw_wmi_string(elements[i].buffer.pointer,
> +				      elements[i].buffer.length))
> +			type = ACPI_TYPE_STRING;
>  		if (type != valid_type)
>  			return -EINVAL;
>  
> @@ -651,6 +661,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>  			/* PossibleStates[0] has already been type-checked. */
>  			for (j = 0; i + 1 < elem_count && j + 1 < count; j++) {
>  				type = elements[++i].type;
> +				if (type == ACPI_TYPE_BUFFER &&
> +				    is_raw_wmi_string(elements[i].buffer.pointer,
> +						      elements[i].buffer.length))
> +					type = ACPI_TYPE_STRING;
>  				if (type != valid_type)
>  					return -EINVAL;
>  			}
