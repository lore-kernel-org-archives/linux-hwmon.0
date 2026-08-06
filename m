Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90D3D9041
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044663; cv=none; b=MJCWiyrBwIg1Ovvq5mxFq0Xj+1e/PI3AGEJ8tiFn0F5WF9R9RCEc2IGWM7FP8JdTxaubZtTCs+pDfkTiX26tG1qkwg+QOKqvk7kswz67E3J79ceCj420Obk/JanSRT6OTBFh64jsniVUGI++P0aI5pSJNHC8kyFCB0dqPo1Hwfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044663; c=relaxed/simple;
	bh=4tx9NSGNynTF4PHpWC7vIVZqpu7kF9vx/gpj/G0H91k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyau+BORsuwcu2xxKLMmJEdGqyFJOgDc0QamvEiX8HVvOSDybRd9I4sSF/yWXXgma6LzKPyjIolXVrumLJosEFQ5x1bEevKLHRGQqTwL7+aJK9cybdzvIBy0jAomR4zqy3Bhrqwka8M8gmM2aA7IVSEHPPsrZYAAElyhAZ6BJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOc5nwmY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOc5nwmY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccf2360620so25774205ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044661; x=1786649461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=tOc5nwmYFCvlGy8dUXREVOPcy7N1vVKdRwITx7q4Bddtof25Dtvh7e73KtAivBa40C
         qJPmo7jT5oMLIcylajuff3PWOJLYJe+SpB4ZacDKqKmEqjAhf9m3NJghHxNRp6PKkPf5
         RJxFRVfsq9hTlYyw0UCvCLDySBiSQDLwuRPiizyqWbA+dnllpX/QtwHmREM8FA1VDYpf
         2fE8mQ9A5esdkJ9Fx2zF9WcAIQUqU47RYjXm595d1Qap87mHPrthFHdK6P+V6yds0O4u
         LhrclSZs7mKmuQ62k7GKzv5PnVYBCZgvUpe/AOQoREjtLSsEBqvdfsc1s9hgGDUlS8LF
         Rpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044661; x=1786649461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=FlIjf+TX/cUQi03CEjhyTUF9se+3jaT16cPcGp+K+74dKRfnu2fuTqp//rTUpFpu1R
         xJj80zgy3T5dEEpw1IZzDovjGFZyBvrz7KwWudltVvpNRNll+fqy/3PY6f0GBVedfpfy
         HYPlQY5fkC3Iqi3cb/WDE6FDbK3qTSG8mMwaXkkeWkDI79QMzt8BjyqwhId1/8nsYZXV
         1/0tgcZSGohEAphQ1BpibQEyuiRSXXS0WySPhACIXbcibWQ7MyRUerSwpJ/1m2hhfcvv
         ZM2jcNNJx9/iplof+jxSRUTbLHehMfCJWPgzDhfy+3ye29HObWWJDw1Qp4j1PaJXrBi1
         5SLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7N1UwIRf3w4pCDLI+9wiWfWwJk1OwdwChTe0zU73wL7HX+oDNNPcVE105j+IM566rBeUZyvh3v1YZ9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbnEFdX26jpp0LVLzwH0Ewp1pyuKx9lBGXeIrnUmICBHsoD9j
	f5+P2DPjtSsd1Fv3lCb12WcWFO1PKrAf37pUR62edrkyMpVLmz0wGrCb
X-Gm-Gg: AR+sD10prVbqee9rgNI1fhD759h3IJ1GueO8pobRr9c5/uv5sTEr5Ua0RpR1qSK/hmB
	g1AMo75+8O5rutVfNbAMoYxf9S+IHDteZPLPIkfB2M9So97fkUeOLU/PPNsCPE8WOEv5V35gK75
	wdl9CVE+JlKECvZRslsN77RMmSUjGAcZtlOWGPTr2Wyr9MpP4qWhbYlUGSeSyn4qdWt/+RM5RPY
	cUVGkfbLwvWf4MxL4gOLUl4QMR9mJ3VOSV9LQkoEY+0fC51r9GQP8YV+hF54cIRctIZLuIzSEHJ
	PSg217iDjglaO+TJwW8FZGd85jPdHUGHmGPDPTm0I6PsRn053yrPkPKBMlUTzwcU8DovIoW0Pav
	iS81Fm9xAvROUeTcTqF49ueMawaNGYXLgFzjnZ6t3lohmF2N/MLf9s28ZypgFtkbxtBcAiDFdgt
	k1o8mk90atGKag1wgBwvRrpvCDw2ysb64QsQ84oZiVsI/hL1OB9ePtWLkM7siUQHO0+YWxDwPxm
	t8=
X-Received: by 2002:a17:903:1a83:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d106e81d72mr45720725ad.21.1786044660266;
        Thu, 06 Aug 2026 12:31:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d120c611casm1084905ad.83.2026.08.06.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:30:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:30:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <977654fc-d5e1-4d23-8ab3-286acd2dc372@roeck-us.net>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>

On Wed, Aug 05, 2026 at 02:00:54AM -0700, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/hwmon/lm63.rst |  22 +++
>  drivers/hwmon/Kconfig        |   8 +-
>  drivers/hwmon/lm63.c         | 414 +++++++++++++++++++++++++++++++++++--------
>  3 files changed, 366 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm63.rst b/Documentation/hwmon/lm63.rst
> index 9e27367d7405..c40bd0dfe591 100644
> --- a/Documentation/hwmon/lm63.rst
> +++ b/Documentation/hwmon/lm63.rst
> @@ -33,6 +33,16 @@ Supported chips:
>  
>  	       http://www.national.com/pf/LM/LM96163.html
>  
> +  * Sensylink CTF2301
> +
> +    Prefix: 'ctf2301'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf
> +
> +    Register description: https://github.com/TroyMitchell911/ctf2301-datasheet
> +
>  
>  Author: Jean Delvare <jdelvare@suse.de>
>  
> @@ -62,6 +72,8 @@ value have to be masked out. The value is still 16 bit in width.
>  
>  All temperature values are given in degrees Celsius. Resolution is 1.0
>  degree for the local temperature, 0.125 degree for the remote temperature.
> +The CTF2301 local temperature input and limit have a resolution of 0.0625
> +degree.
>  
>  The fan speed is measured using a tachometer. Contrary to most chips which
>  store the value in an 8-bit register and have a selectable clock divider
> @@ -93,3 +105,13 @@ support these GPIO lines at present.
>  The LM96163 is an enhanced version of LM63 with improved temperature accuracy
>  and better PWM resolution. For LM96163, the external temperature sensor type is
>  configurable as CPU embedded diode(1) or 3904 transistor(2).
> +
> +The CTF2301 is register-compatible with the LM63 family and provides 12 fan
> +control lookup table entries. It supports 8-bit PWM resolution when configured
> +for a 22.5 kHz PWM frequency.
> +
> +Device tree nodes may declare ``#cooling-cells`` to register the fan controller
> +with the thermal framework. The cooling state is mapped to the existing
> +``pwm1`` range from 0 to 255. The driver keeps the current automatic or manual
> +fan control mode during probe and switches to manual control when the thermal
> +framework first requests a cooling state.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..abb1af8664fb 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1501,10 +1501,10 @@ config SENSORS_LM63
>  	depends on I2C

This seems to be missing the THERMAL dependency as suggested by Sashiko.

...
> -enum chips { lm63, lm64, lm96163 };
> +enum chips { lm63, lm64, lm96163, ctf2301 };

Alphabetic order, please.

> +		if (data->kind == ctf2301) {
> +			msb = i2c_smbus_read_byte_data(client,
> +						       LM63_REG_LOCAL_TEMP);
> +			lsb = i2c_smbus_read_byte_data(client,
> +						       CTF2301_REG_LOCAL_TEMP_LSB);
> +			if (msb >= 0 && lsb >= 0) {
> +				data->temp8[0] = msb;

Why keep the assignments to data->temp8[0] and data->temp8[1] ?

Thanks,
Guenter
