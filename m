Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D921423A;
	Tue, 14 Jan 2025 23:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736898083; cv=none; b=I21cuCSlU7T2s3yuVuojnLl50dmG50Gafe3spvwajQxKcjG8pqDyMV08Sm3qeIBEyfBQrwsUUCV7M8cutuB6MLpMGRmLvjqtMStIanulYbqk/8NqzA/+jtvk+q3tFLCNPhFMvqHPH/meIjdiulxu8j0O4NaC63RDc0xccQIiqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736898083; c=relaxed/simple;
	bh=ZYh7cM6CXCMOo4sqNJ43zT+AF7HXsA+GV0tNS+AbPCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRHKvmcb6jCHUjD1C90N9wuKaR7VT7KQXo5irCUL+nHa5Wo+KMWMoLMyY/EOoZAln2ij/1lwEzwxamxJdcwYfVatwbxLJp2sQXQcI5gIe6j5nfGxJh0/eayJkf/GvHjqVrNiu0y2ZvRxnpHT8VFSg/uRP8sE9xQTpyXMQ1BheYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7HX0uDO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7HX0uDO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-218c8aca5f1so131760445ad.0;
        Tue, 14 Jan 2025 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736898081; x=1737502881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvH1gFx1L7k8YAwOJFggGVDITC1/AVZ8rAH3YGNpblI=;
        b=d7HX0uDOJGvFQbH0VtjS14f77eGIqo4ialqDtGmOJNkyZLweJnRQTGBurLgqwBCK1q
         Qo+GKbLMnGCGHVOxy6tG1Ti5fqAMTGmwRICAYKgOKE5rI6WX8Rp6eM/EXUyZNOH5udSa
         Rn0vgW0VGJR9kSjNhsX8Bt3tLyezloHSy0B+wzPdbW8r3xEw/ZQIHrwtIwbmM36HEq2N
         TtnM3Fn3hmS5w0JePUIN1gJZxF9odFKShSky7CEX5q0MXG063a89KK6+O5xYkdVwoEGD
         XXN3kLNlD3sBQ/wU0wQ8JegxWUEk/WxiKj2lf/ISBpqWDlk7EAfJstBsyfOOfKKdqk5v
         kuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736898081; x=1737502881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvH1gFx1L7k8YAwOJFggGVDITC1/AVZ8rAH3YGNpblI=;
        b=WTP7FUBl3gauGusO1mhekO5hHEbnduqGizvRCh9Sd5BgHowB2GxjEnJVa2sbMMN7V/
         v992ZU60tjsAipWk+AExAYXajulq1NK5Hmgsq5fm+nC0qdmGXrZ4uiNdRB9Ugmd181Y9
         XE8c8hwxDLgVLyy9Phuzjq4lhhK6xQrNRwPyql5aBPWbIOuuqDDdOT2CwL6Py47+fTT+
         /gZ7mLsRb4AodJteHjSnFfXJmri/k2NPpZ4QgwstT7iBh8MJHYh3zjnDJ6m6THzSCThe
         J3tLy2GLpoAhHqsDjl7agTjXh6EEgKifL/orH5BZJqFM0fhRy12poSBfJ2R+/DVPmnxW
         sZSg==
X-Forwarded-Encrypted: i=1; AJvYcCUEeralcXl6MavR38Hkl2mOWYxKvhmMArSzk13Ysa3TuvGzIA0+oLJBnqmoECmi2vmadPGkOtdcboxeNg==@vger.kernel.org, AJvYcCXM6HjEeC9hlHek9D5prCMjeYzCyk0I1y8WHlSRBwsq+FRSprSXjwPBud6BDTzW0ttFxLjjt+PBss8xsB2P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywelx4zh2qbmXcOsLyqbKIcC+Mx31gSEZg5KP7wdWSCMn6zGAX5
	Mt7S1tzfICmIRgCAK/81fO4dNNQRUnFPFXhg81b/QBmnpOVS9yK6
X-Gm-Gg: ASbGncutpCbUqgOcZl5TDAT3KuN8i69faEp4AIaclNzPA8w56sKsZugAF3PzSN//RSu
	GOucZj/4mF2Uu/s/Z7Vk5yYitOydSaShYXP0IaHXKejoDPYfA3IJ2x9yWzDHmoELHGFa80CCGru
	+x/NbZu/WOH8+kzWqSTyw3OODBxscgJWQ1zFzaE6gQDzCtkvoO9tnBhkfpny9i+iaMUwJuXWAW9
	kl0PadIwJmQ+QpcIs23cxmqtT84OeBxu2h6Bq6CYi9icK0bgvguLG37UxXX70QOja/EvA==
X-Google-Smtp-Source: AGHT+IF8uQEOoF9rnxC3pbsjIBaGmrlQ1cXNzFrW+fdybYU5rf9BJrWhSChRn2zDyuSBOcZ9ySqQNA==
X-Received: by 2002:a17:903:2452:b0:216:6f1e:5799 with SMTP id d9443c01a7336-21a83fe4f75mr417246415ad.35.1736898081184;
        Tue, 14 Jan 2025 15:41:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10de62sm71720695ad.13.2025.01.14.15.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 15:41:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Jan 2025 15:41:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Lechner <dlechner@baylibre.com>
Cc: Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp513) Fix division of negative numbers
Message-ID: <52f375d5-f196-48a1-be6e-ecb7553d2d97@roeck-us.net>
References: <20250114-fix-si-prefix-macro-sign-bugs-v1-1-696fd8d10f00@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-fix-si-prefix-macro-sign-bugs-v1-1-696fd8d10f00@baylibre.com>

On Tue, Jan 14, 2025 at 03:45:52PM -0600, David Lechner wrote:
> Fix several issues with division of negative numbers in the tmp513
> driver.
> 
> The docs on the DIV_ROUND_CLOSEST macro explain that dividing a negative
> value by an unsigned type is undefined behavior. The driver was doing
> this in several places, i.e. data->shunt_uohms has type of u32. The
> actual "undefined" behavior is that it converts both values to unsigned
> before doing the division, for example:
> 
>     int ret = DIV_ROUND_CLOSEST(-100, 3U);
> 
> results in ret == 1431655732 instead of -33.
> 
> Furthermore the MILLI macro has a type of unsigned long. Multiplying a
> signed long by an unsigned long results in an unsigned long.
> 
> So, we need to cast both MILLI and data data->shunt_uohms to long when
> using the DIV_ROUND_CLOSEST macro.
> 
> Fixes: f07f9d2467f4 ("hwmon: (tmp513) Use SI constants from units.h")
> Fixes: 59dfa75e5d82 ("hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.")
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp513.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> 
> ---
> base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
> change-id: 20250114-fix-si-prefix-macro-sign-bugs-307673e6ea45
> 
> Best regards,
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 1c2cb12071b80866b751b71bf39292580cd47929..1c7601de47d0720352d729e35a5b7eeaf109355f 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -207,7 +207,9 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
>  		*val = sign_extend32(regval,
>  				     reg == TMP51X_SHUNT_CURRENT_RESULT ?
>  				     16 - tmp51x_get_pga_shift(data) : 15);
> -		*val = DIV_ROUND_CLOSEST(*val * 10 * MILLI, data->shunt_uohms);
> +		*val = DIV_ROUND_CLOSEST(*val * 10 * (long)MILLI,
> +					 (long)data->shunt_uohms);
> +
>  		break;
>  	case TMP51X_BUS_VOLTAGE_RESULT:
>  	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> @@ -223,7 +225,7 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
>  	case TMP51X_BUS_CURRENT_RESULT:
>  		// Current = (ShuntVoltage * CalibrationRegister) / 4096
>  		*val = sign_extend32(regval, 15) * (long)data->curr_lsb_ua;
> -		*val = DIV_ROUND_CLOSEST(*val, MILLI);
> +		*val = DIV_ROUND_CLOSEST(*val, (long)MILLI);
>  		break;
>  	case TMP51X_LOCAL_TEMP_RESULT:
>  	case TMP51X_REMOTE_TEMP_RESULT_1:
> @@ -263,7 +265,8 @@ static int tmp51x_set_value(struct tmp51x_data *data, u8 reg, long val)
>  		 * The user enter current value and we convert it to
>  		 * voltage. 1lsb = 10uV
>  		 */
> -		val = DIV_ROUND_CLOSEST(val * data->shunt_uohms, 10 * MILLI);
> +		val = DIV_ROUND_CLOSEST(val * (long)data->shunt_uohms,
> +					10 * (long)MILLI);
>  		max_val = U16_MAX >> tmp51x_get_pga_shift(data);
>  		regval = clamp_val(val, -max_val, max_val);
>  		break;
