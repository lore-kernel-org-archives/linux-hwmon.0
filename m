Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D063368A6
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189245; cv=none; b=tySP2JVyl2fb/IkM1rnHsgHFATWq9+8JyIUJSSMmUhDQDwpdr6PFWd9FIvRW+LBCsPzyjmPjHSEnSVvfX7votFRTYBGlL68KkfOrG9P7/wMGL2xl1DT0GsrhS+jg/TDM+oHLPQ7Zk1FXcyNGYt8Z/F2ZW30fSfvbIsDOQqy8Y5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189245; c=relaxed/simple;
	bh=engp1nQNSX9vhPkXGfLguo1jEktsA/8b3yfVE0qSsgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWz2tviWSzM5YeI/ciu4kCNgKLatpWDWCCilLrRbe+uehgGiqwWaiD+fR9AVaD48GUzM4jqMv2OYouRxTCyC8V49Xi+FwVYR6K47afpcrSoUF2nhUYSqzQWSYBdWelFHhKPkfD0hZRwM6dhM9uiOCzDDbNCrcu6brof3nr5ai6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/9t/5nL; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/9t/5nL"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0fa90d47bso1230065eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189243; x=1774794043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c90GIT6mW0YUjHC07UDbUeOA+0vWgoPqFFOks4qskQg=;
        b=F/9t/5nL/5wHQ8NRe1Aw8EufQOxkd2ncID66rn/+RlDG00PEXnJzckfb9UJWa5i+Rr
         r3OQEuK8G46NAXe4FPF25cs2GzHCdsiFcd940v83EtxQB4n1+zKErkrUj9UcAFndq0NY
         XYga2mPMqfSDKYMo+dE7GCLW40XoYTnUECk6SMJC/sjUToTCD8rG9Fgu7AgXHJA4QrVf
         5ViQ9uQTn4LfXp3S1SPox9iMuXNM23af7yVMrsAu36yZ08r2EJIwyQ7WpA14EaHokHe+
         SRI6XQ1J0QIz1O+EnBeGUwRroX+3+ZOIanbzuA6rORqHeDdmsz5bcBilEHwDQNTyK479
         nZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189243; x=1774794043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c90GIT6mW0YUjHC07UDbUeOA+0vWgoPqFFOks4qskQg=;
        b=Mf7e2gsgccrCm/GYYcszimeHTy14+VCFHdfk3Q0U2YysWF7a02+U6Y1qzGog59AOVy
         4qGPb9niAAjH3nlT+NneIrhBvcYhnxxSXqJUu+MsVYmgRm7ZjHH+/NA9XzbsZhySHyZo
         I6MYbFm4+a4cjEACMYws1b8eEwCPE/AuhGDs2EvuaSSnxH0T74ziwl3UQaGY4gooEbes
         pbdIjesckcWYMQJ3sIc0qIfRDd5rW1iKeC+AY1IOfuwZNki+CCobGmzTEWZIeZOhGYkg
         Ja/smnSuqMfHUhJ6uO4dAyZm/QW/J/q+nBjiWD1IrfYXqpyML6kILjaBQRsS5JXJq2k9
         JD1g==
X-Gm-Message-State: AOJu0Yym4sE/Pz4nWTQwW49fOhAwln6RRMoS7DljYKqWrpINe7OxjsyM
	uFj3aUMXI3Rjml/REsMscLATG7TKdhTPISFvjjq209Dr9zkZVC20GarBXA3xCQ==
X-Gm-Gg: ATEYQzxduuIS76eZajQ+GtmvpfFm6XEHO2Hn0qQcjMxORy5aDGJFC82RQMqABwNPn4t
	MAUpM/WUhVQylpIRcss6taKMoqOB+ie2aPXTRc/7LCBPaavoCN1OPvKHiyOJItSVegdHXfwcqaQ
	FA68gMxlbMqPDXxX4nEHmAfSEl3XZhDwalZn72+tHxZ535cc3tKicOOiEBGSUWWZdM9fr/S5b7y
	rImBRweXJza/m3QUAj4LjyZuljRxBt3BBfga2uBPVPrC3PLvjC2kRmtglxpxUA20Y/O8FUhUj1Y
	jRDJHTY780B7mQKww5cu7oC5AIYAEvT5bdU316mr/RLaM4ONYhC61EWIWhsl3mqIHtopKvFu2Vj
	MBpaQWiiItKImxP5YfDWPcNM/BvoaVEG0NHrZJOBaPA7Lus7wIeZLWSokUU+PdYFwdmDyOzZ37z
	dN6TIV3gKIw5Sbs9C476NTD+5EM3Vl+4EDC1cKmj8XM2hPUDg=
X-Received: by 2002:a05:7022:6894:b0:128:cdb7:76e1 with SMTP id a92af1059eb24-12a72326a69mr3242178c88.13.1774189242952;
        Sun, 22 Mar 2026 07:20:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bbb57sm7408905c88.10.2026.03.22.07.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:20:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 07:20:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/ina233) Fix error handling and sign
 extension in shunt voltage read
Message-ID: <f5221388-a939-4a6e-a00d-c2d8302cca80@roeck-us.net>
References: <20260319173055.125271-1-sanman.pradhan@hpe.com>
 <20260319173055.125271-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319173055.125271-2-sanman.pradhan@hpe.com>

On Thu, Mar 19, 2026 at 05:31:19PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ina233_read_word_data() reads MFR_READ_VSHUNT via pmbus_read_word_data()
> but has two issues:
> 
> 1. The return value is not checked for errors before being used in
>    arithmetic. A negative error code from a failed I2C transaction is
>    passed directly to DIV_ROUND_CLOSEST(), producing garbage data.
> 
> 2. MFR_READ_VSHUNT is a 16-bit two's complement value. Negative shunt
>    voltages (values with bit 15 set) are treated as large positive
>    values since pmbus_read_word_data() returns them zero-extended in an
>    int. This leads to incorrect scaling in the VIN coefficient
>    conversion.
> 
> Fix both issues by adding an error check, casting to s16 for proper
> sign extension, and clamping the result to a valid non-negative range.
> The clamp is necessary because read_word_data callbacks must return
> non-negative values on success (negative values indicate errors to the
> pmbus core).
> 
> Fixes: b64b6cb163f16 ("hwmon: Add driver for TI INA233 Current and Power Monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>  drivers/hwmon/pmbus/ina233.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
> index dde1e16783943..1f7170372f243 100644
> --- a/drivers/hwmon/pmbus/ina233.c
> +++ b/drivers/hwmon/pmbus/ina233.c
> @@ -67,10 +67,13 @@ static int ina233_read_word_data(struct i2c_client *client, int page,
>  	switch (reg) {
>  	case PMBUS_VIRT_READ_VMON:
>  		ret = pmbus_read_word_data(client, 0, 0xff, MFR_READ_VSHUNT);
> +		if (ret < 0)
> +			return ret;
>  
>  		/* Adjust returned value to match VIN coefficients */
>  		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
> -		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
> +		ret = clamp_val(DIV_ROUND_CLOSEST((s16)ret * 25, 12500),
> +				0, 0x7FFF);

The clamp should be to 0xffff, not 0x7fff. That is still a positive return
value, but does not drop the sign bit (bit 15).

Thanks,
Guenter

>  		break;
>  	default:
>  		ret = -ENODATA;
