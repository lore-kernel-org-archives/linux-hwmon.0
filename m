Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B81991A9;
	Mon, 13 Jan 2025 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790353; cv=none; b=ozUt82Bz2it2y8RfoIN78FcK6qhuGvbPmQ6GmLXK8MpqD/i6FgG78abuWksnzFxoXuco4RYVspekTT+BDvCjVdDDBROQlz/hqte2oR/aLN9tDynO9gPgP9ZOcp6cwoF9PgsaPFg75ZkU9MwCYZhRzED6zW5G7pPOwOFRHXJG1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790353; c=relaxed/simple;
	bh=g/b/92ce+VwSlC12aNrR7nql92J5ICNUWXroqLn/MG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYyf1vuHn8MZWY6DVrcMKVabz5FGQrCWJP9Vkox5Qhri4HCQWzUL18gyxcpZLPRW9jFzO9pPtsJMKadwdYUFfK/t8DwlzXjLF9qTV5KZdSJ0RqKV4/O9FTU9+v1NKjCuy3dnJSbeQqS+3fdDP8xoY9jW4+mEnmiCfHmrCpX1G3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+i2Fr2R; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+i2Fr2R"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21670dce0a7so97772525ad.1;
        Mon, 13 Jan 2025 09:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736790351; x=1737395151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEJtCFib//xiDKyOU/G6okNKZgPT/5m5J/9UYLi1Ys0=;
        b=S+i2Fr2RJAQboLJt8o2YBvoWQNQIcWYPygYs6EBJ/jRLW6KK2UeYo1ZUanQi9zN7R0
         NTIy74VbicyKC45BIPfCKe8Lc3FIcAGRJvQypdzjDaIbPaqTyPVy8C+R8hTBppBo+/fj
         YN1tp95XGN+pJLa2Ql5z/ORs+qT89vcJ3KMS1yvdt+06HSHiWEbWDSqkgcxKcrovB7BF
         JJA8dAa4ENuHtTlNqKkH6zv410LHB++XB0DzEpHVHqGy/mMNxyVuwYhZkVBd+J2S0eiV
         XlmUWExch7Z3aeFAoRsuLR8yqq2+/Y4bXYx2iyoau8/7jzWtL3wvW9yTRsHSyZRotYYO
         j3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790351; x=1737395151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEJtCFib//xiDKyOU/G6okNKZgPT/5m5J/9UYLi1Ys0=;
        b=TtoHwlKyrCUK4oozgex9eiGvNCrUnpBoX1E3htwTo6BFPt5FQNYQB4aerOzHwwIhs1
         mRFeQeR53qPL5v6ZW5z7+ICuA/VNgPz+yVNKAjlHUiavx4Lh/psCdarMCxTzUFWmU3mw
         Zn3xTrn2SKDP9AITLtYaqUz4PzzvOaYMfDka9GF40+jHMesBox6uNkPWC6Nw1XwYPegj
         jG+mjFLklWOPwAh69pmpiaCOEGmPJgwB+i5ZFOg53rq6rhNZy7LsaJPoIgFmthZv9mr4
         eEMUxPMhbefRKA9Ik8Om3y5I1+6llJiTm7N1qg2j+YUjDo3avbonTr+2VRF3AXJKqjDr
         bOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO2aUUCAsusnnEEszmKDqQcRRBuWX2w4rMvcXqid4M6eyOd4SKCBoyLMAOv72AQjBp++O1tAj2JoMWfA==@vger.kernel.org, AJvYcCVxEn1W+GaYgXbLCytyRZEzkUei4VRp031+EkKZxvSuunDemTfAakSWETqlMegv0MZ6U87FG0ZHbDUkQ51X@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTnCBOB+JSMFE4n9Oz8D8tT2bF2fqqTQ5fuae9nNWVhCMnS7V
	NEzXiLkqHxZnAWFFKghwiapYl0/QbapAt7qOOJXYIQ9pN+ppycAH
X-Gm-Gg: ASbGnctIl+YTySafV2Xx9fibAp+FYVhBc4+VzB2uwqmPVNtVR9c5KIdPz8ywwWEeHg4
	5xv5YtM7mutHE6s27ahWcoNhYZEy+47HZ5Mbthc0iqJuBrrWgrsb1hiPP8kKTI46BVjFNB3Xddu
	khT8FxWDF0Lo5CsqxQZd7inTNU1bX9OHZRVPWFvT6Wsxb8eu0ormO3FouQO2YKEh8d+uUv1dGy7
	hr8Q19uLfFxOBL8AHEjb/IBF+szYrjHJOk1/+AJR2r1GKJeobMs2oLJQRrrXFJ5jwSk1g==
X-Google-Smtp-Source: AGHT+IFV6xW8X5HEasuLVnky+if3kg6fQ0nZHsTrUNZzD5tpMi76lf5vRWhfzXovMMu4XQ5967C3Hw==
X-Received: by 2002:a17:903:1248:b0:216:5e6e:68cb with SMTP id d9443c01a7336-21a83f56bd2mr319090465ad.16.1736790350745;
        Mon, 13 Jan 2025 09:45:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22c97asm55374005ad.165.2025.01.13.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:45:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 13 Jan 2025 09:45:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Message-ID: <c7c3503f-526e-41f3-8b82-ba7c7c68e89e@roeck-us.net>
References: <20250113035023.365697-1-wenliang202407@163.com>
 <20250113035023.365697-3-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113035023.365697-3-wenliang202407@163.com>

On Mon, Jan 13, 2025 at 11:50:23AM +0800, Wenliang Yan wrote:
> Add support for SQ52206 to the Ina238 driver. Add registers,
> add calculation formulas, increase compatibility, add
> compatibility programs for multiple chips.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
...
> @@ -452,6 +554,9 @@ static umode_t ina238_is_visible(const void *drvdata,
>  				 enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> +	const struct ina238_data *data = drvdata;
> +	bool has_power_highest = data->config->has_power_highest;
> +
>  	switch (type) {
>  	case hwmon_in:
>  		switch (attr) {
> @@ -479,6 +584,10 @@ static umode_t ina238_is_visible(const void *drvdata,
>  			return 0444;
>  		case hwmon_power_max:
>  			return 0644;
> +		case hwmon_power_input_highest:
> +			if (has_power_highest)
> +				return 0444;
> +			break;

This doesn't work as intended. The break; results in the code
entering the hwmon_temp: case. It has to be "return 0;" or
the entire function needs to be rewritten to use "break;"
to exit the switch statements, and "return 0;" at the end
of the function.

>  static int ina238_probe(struct i2c_client *client)
>  {
...
> -	if (data->gain == 1)
> +	config = data->config->config_default;
> +	if (chip == sq52206)
> +		if (data->gain == 1)
> +			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
> +		else if (data->gain == 2)
> +			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
> +	else if (data->gain == 1)

The "else" here is the else from "if (data->gain == 2)" which is wrong.
The entire if/else block from "if (chip == sq52206)" needs to be in {}
to avoid that.

>  		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
>  	ret = regmap_write(data->regmap, INA238_CONFIG, config);
>  	if (ret < 0) {
> @@ -605,7 +735,8 @@ static int ina238_probe(struct i2c_client *client)
>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
>  							 &ina238_chip_info,
> -							 NULL);
> +							 data->config->has_energy ?
> +								NULL : ina238_groups);

This seems to be wrong check. I would assume that ina238_groups is passed
if data->config->has_energy is true, not if it is false.

Guenter
