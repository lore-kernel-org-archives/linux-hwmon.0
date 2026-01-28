Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01D248861
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622113; cv=none; b=lWuBWRysRmQmuPBUk/b5XAGGnVNlZwNVuTty4V4z3Fo7GOK+Oi+kYfKRBhFYd9aH4VyYt4b0T0ALP+OQto1IPPIUGK29jTxNffXgPCcuYPBwz/xBpKTQHIiX4hvLfVInTK9ede7AFXkiswDefiMLereUpLDCKbrHPUvJpxCW/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622113; c=relaxed/simple;
	bh=wOLhbENIErrvdgzEmJvmkho1S9PkXpwRcz22UzHzCJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaOsADBUSnD+b+mRibp6xyodWuGrCTjyymKWssDPnqOmmeBiNPsPLGBrwqP9/uOCFlPqfMD1DxIwGXmR7vHGIpst9duN7m9afJQnQhKavJX4TeYcF0BjRUA3umUyZ3WyZHygL5zDFhn/1D8KaLIXOxuGXDUlhVyRsFDdWOkNBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvDRt55A; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvDRt55A"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b7070acfdcso145378eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 09:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769622111; x=1770226911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtqKFEe5Pzy8luortOc0CwHkX1rIlH8Or++BqJLxyg4=;
        b=EvDRt55AhwHblYnrGRPbUokShEFJZxM/Y3fhyHjX/04iYsRdNBE4jSI14etAFOAg51
         t5oB3Di/EjBnO0rMDJJIFEzdzSJOUP06P1lmcbbdVVYng34SvFcCcuzUOkMp4X55GSX3
         ksWSGeaMX+8Tede1kqhlBOmtdA2FtBMY8Y9hmn3e4EPTCubhlt2bxycCcYJByi2oJj5H
         XzcxDJdj1W1PJabd0WMH5p8u3s/c1Bb0G7BZMsOwsXPzjY+hAa2eGPsFiVFoSp3cNXO/
         mKTo4DhC7dqv6ctMKvEsVk+T3vhdgRgiMEYSRI9p+zz7W0T8l5u2Hp5tQRuJate9If8r
         tp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622111; x=1770226911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TtqKFEe5Pzy8luortOc0CwHkX1rIlH8Or++BqJLxyg4=;
        b=dNuuqNmDYPMPGQZKIXNWt8WDUFObeQtK4S2hMOsqgrdEDxkkFdFPhmwvAjfHDeNO2n
         MtOPSKp265TqhhQ/nGYB9GtTH8L3C5banEtDcbs8yEddSISaMgsBfSRjC0j51zH2Uojz
         Fhsz+K/z72XO3SIMtfsEo3Dt/HtyBX5ZxzVWQHrYrwpyw2GeXf4YBSjndahdKdqMfjJ+
         ojVRGg9zFrx62uCuPN9LekUitWWEu9wX2/XZ/2IXXk5sWaJsVVcROrPw6P7H92HQfDXq
         iYMPov4SNzNRfqqUH86twP70efnh3T66x4Qy6wOC2zKWKDWP/aZtI8cqcPvUae/3KLaD
         4rAw==
X-Forwarded-Encrypted: i=1; AJvYcCWQvCcTQPG5imdiqaIf87kfrGUOziB/fiPWv0Y8ExV3UpRAznSWeRCy6uY1E0g1ZtGjr9TLDClLW3LZDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SWVXAGXQTFPeOFum3M5TS/pAO2055z0BhP6TK86EZK2Lql95
	VOdj0JvzY8+qRpzlEZhvOCMCoDbxuRz26W0mgTK6S+GjIh0cxEg04Wzh
X-Gm-Gg: AZuq6aLbWNgPnZ1b5RVzskw43ABa90zfl/0DCIFwe3/iketKz7wbclsG4oHEhoLZm9i
	cHnx1dnKOIDFhSIE8PUwuLNOPP01HpNx6U9UhuWzsjdDZ+9PSDjN0xC069m/oqujr9zt9IEjtWr
	e9qfbFW/Ai6aJ3e7SOI3opBWkE9O3vbTnvhxcME36Kjwq/IJK4GZHPZAOpmNCJk+dIOa2JfSjwI
	JW1IxQadTAx9u5mBgAC3fqm0LgGPj+09OONBw3fVj08Z26ppNLazvtnfRTg9JrCJYEA4mN9pZKq
	pkNR1qyefIEjc2mhh8/R+HIGUyMbmS06mwj7GrlwuFJundfXQtuHBuwFINGo037ajtjjfXlI5OX
	Lzg2Do6TmB6c+xcZ2UaqzvOV/CFREwbVUsEUUtzcCHmC0cS7C+nxISSbnW8WAGP4ZtBgOU7R/gJ
	OZ0fQV3XeFSFFGL6bxmRgasyGU
X-Received: by 2002:a05:7300:6c84:b0:2b7:3240:542f with SMTP id 5a478bee46e88-2b78da4ef6amr3832732eec.37.1769622110875;
        Wed, 28 Jan 2026 09:41:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a170ca0esm3561748eec.15.2026.01.28.09.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:41:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 09:41:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] hwmon: (ina3221) Various improvement and add
 support for SQ52210
Message-ID: <9e9feb88-46db-4b47-a8ed-e30eb0f658c8@roeck-us.net>
References: <20260119121446.17469-1-wenliang202407@163.com>
 <956b92bd-950b-44fc-af85-6f76ed60656f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <956b92bd-950b-44fc-af85-6f76ed60656f@roeck-us.net>

On Tue, Jan 27, 2026 at 10:07:50AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Jan 19, 2026 at 07:14:38AM -0500, Wenliang Yan wrote:
> > Make modifications according to the guidance provided in the reply.
> > 
> > 1.Modify the description for power[123]_input(PATCH 5).
> > 
> > 2.Re-annotate the significance of the limit value calculation
> > and the use of register masks in the sq52210_alert_limit_write.
> > Modify the calculation process to resolve arithmetic overflow issues.
> > The limit values SOL, BOL, and BUL are all stored using the upper
> > 13 bits of the register, so shifting is required. In contrast,
> > the POL value is configured by setting the lower three bits
> > to 0 directly(PATCH 6).
> > 
> > 3.Resolve arithmetic overflow issues in the ina3221_read_power(PATCH 7).
> > 
> > 4.Resolve arithmetic overflow issues in the ina3221_read_curr,
> > and validate channel indices in ina3221_write_in(PATCH 8).
> > 
> 
> AI review of the series provided the feedback below. Please fix or explain
> false positives.
> 

Another round of AI reviews below. Please address or explain.

Thanks,
Guenter

---
commit ef198f703062bc5ad58a148eb506821900c3522e
Author:     Wenliang Yan <wenliang202407@163.com>
hwmon: (ina3221) Support write/read functions for 'power' attribute

SQ52210 adds power attributes to report power data and implements
corresponding read/write functions for this purpose. This includes
reading power values, reading alert thresholds, reading alert
trigger status, and writing alert thresholds.

> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index cb292fee564b..2338b3288950 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -546,6 +553,12 @@ static int ina3221_read_power(struct device *dev, u32 attr, int channel, long *v
>  		if (ret)
>  			return ret;
>  		/* Return power in mW */
> -		*val = DIV_U64_ROUND_CLOSEST((u64)regval * (u64)ina->power_lsb_uW, 1000);
> +		*val = DIV_U64_ROUND_CLOSEST((u64)regval * (u64)ina->power_lsb_uW, 1000);
>  		return 0;

Does this return the power value in milliWatts? The hwmon ABI specifies
that power attributes should be returned in microWatts.

>  	case hwmon_power_crit_alarm:
>  		/* No actual register read if channel is disabled */
> @@ -736,6 +797,18 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
>  	return ret;
>  }
>  
> +static int ina3221_write_power(struct device *dev, u32 attr, int channel, long val)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_power_crit:
> +		return sq52210_alert_limit_write(ina, SQ52210_ALERT_POL, channel, val);

Does this pass the value in microWatts (as received from the core) to a
function that expects milliWatts? The sq52210_alert_limit_write()
implementation multiplies the input by 1000 to convert to microWatts,
which implies it expects the input in milliWatts.

> +	default:
> +		return 0;
> +	}
> +}
> +

commit 61e453283222e7fc9439a6d5c682ce1104dd24ef
Author:     Wenliang Yan <wenliang202407@163.com>
hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function

SQ52210 adds power, current, and limit registers. The ina3221_read_value
function has been refactored to adapt to the new register data reading
format.

> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 4b2888be0ae2..cb292fee564b 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -345,6 +365,17 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>  	case INA3221_CRIT3:
>  		*val = sign_extend32(regval >> 3, 12);
>  		break;
> +	case SQ52210_ALERT_LIMIT1:
> +	case SQ52210_ALERT_LIMIT2:
> +	case SQ52210_ALERT_LIMIT3:
> +		if (ina->alert_type_select & SQ52210_ALERT_ALL_SUL_MASK)
> +			*val = sign_extend32(regval, 15);

Does this return the unshifted register value? The standard Shunt Voltage
registers (INA3221_SHUNTx) return the value shifted right by 3.
Returning the unshifted value here causes a scaling inconsistency when
ina3221_read_curr() applies current_lsb_uA (which is based on the
shifted LSB), resulting in an 8x error in the reported current limit.

> +		else if (ina->alert_type_select & (SQ52210_ALERT_ALL_BOL_MASK
> +					| SQ52210_ALERT_ALL_BUL_MASK))
> +			*val = regval >> 3;
> +		else if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
> +			*val = regval;
> +		break;
>  	default:
>  		*val = 0;
>  		return -EOPNOTSUPP;
> @@ -443,6 +512,94 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>  	}
>  }
>  
> +static int sq52210_alert_limit_write(struct ina3221_data *ina,
> +			enum sq52210_alert_types type, int channel, long val)
> +{
> +	struct regmap *regmap = ina->regmap;

[ ... ]

> +	return ret;
> +}
> +

Is this function unused in this commit? This might cause a build warning
or error depending on the compiler configuration.

commit a0f07f4a272baa0684c7d1ebd30e585dd23a1d77
Author:     Wenliang Yan <wenliang202407@163.com>
hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute

Modified the relevant read/write functions for 'in' and 'curr' attributes,
adding support for crit, lcrit, crit_alarm, and lcrit_alarm features.

> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 2338b3288950..fdcd92082c02 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -823,6 +819,10 @@ static int ina3221_write_curr(struct device *dev, u32 attr,
>  	case hwmon_curr_crit:
>  	case hwmon_curr_max:
>  		return ina3221_write_curr_shunt(ina, attr, channel, val);
> +	case hwmon_curr_lcrit:
> +		return sq52210_alert_limit_write(ina, SQ52210_ALERT_SUL, channel, val);

Does this pass the current value (in milliAmps) directly to a function
that expects a Shunt Voltage value (in microVolts)? The
sq52210_alert_limit_write() function for SQ52210_ALERT_SUL divides by
5 (implying 5uV LSB), but does not account for the shunt resistor value.
This will set an incorrect limit unless the shunt resistor happens to
be 1 mOhm.

> +	default:
> +		return 0;
> +	}
> +}
> +
