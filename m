Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539063988FA
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941925; cv=none; b=a0p3ID3DkeG+L9Iqt8eGS5Iqu3z2aHThPFl89zr9ENRqjO5Poz24wQsFmoJDOLSibUXEvw8GiEMsjdDQTdOrnyB50y9AyCv1MUfyLEazC1xshjLQwGt92K9+QOB6WS4+C5H9uk0oKWv2GyTWowmw1yRHu2PRGX0mHLpCUMiquwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941925; c=relaxed/simple;
	bh=3X0KDF09iQxMFFXCdCq4FJa4+miV7wutwAqBq7ddcCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHqbbr5p7SMVztIc/jQecxO6u7PC/WH1386FNYRXvtvsEoQoBiGvrxpvAM1cER7wh2Uslgsm0whB0S0OZ+v81ooNzKqQTxjzoQv5EGL1WMwT4SIT1yk1NVXxCyrsz58EipJ66nEOeNZ5CW3N3KHyVeAU2Cbs40o7enrinTK3p+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeYbRgCP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeYbRgCP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96c92c0980so711194a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941923; x=1786546723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ew6Pd3+czLAbTbQ+zkKABqRt8uLi3Q4e6R9X4R65Ps0=;
        b=QeYbRgCPastJkS+eXJ5sgz6rBhJq4cUt77SyAdI1nK2SbTypeZvsWYT5ap6s0ZBG6l
         sV6rRpS4hmjqg3Xlqz78FR3l/ZK9IyoASEDgEy+1WojpHmDm8sdkTPMD9N9nGcu66Pon
         OJ7SjyWbZXO/Ya1995FDR2hwbnVTPAQJWYSbDqAgpfIJSuanccMTdKt+Xk27hU4yiHA8
         XWExWAok6w+1Dy5YwXR7BrtWjzwGrgt7qYbuiPAz8odp5lRCmSXvOAiueMHKR1v3RJkE
         iZKd1aPMCpdCh6TnpnvIchtXcR3cHuhHcwggTKpPBEaqctJrP9Uz7Ucdr7qGFZJF/0Xg
         UYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941923; x=1786546723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ew6Pd3+czLAbTbQ+zkKABqRt8uLi3Q4e6R9X4R65Ps0=;
        b=gHbZx+MBjAoZQZgE6wkkIDJhB5laajLDTRkz4r9MUHMoSGbZuLTwfIbjg4tfSLAYQ8
         P7nhTlthF28Jg2voasGQ41HY1shdmNTT2ciL35DbWGNo7W8IT8Gr3J7nrq329mpPbHXN
         1whvaAyQqXteeZpTaHCOeGRhbeD1Dl4JOhDBaf/Ph9NKKcwNWBfY+jIIxhleVuvwoE5Q
         jffJ9x78bCxULp+TrwblZt4qEQuibxMikxx9u6feN9BmlDzZ906i/5m4Y7hhLbZDrkT+
         OvbKevtJRjjJW+Rys44/Ds1oYujlWI/DWMMMlMIgRilHAb1gQSHOuuee5NBhOiAgfcRe
         zwsA==
X-Forwarded-Encrypted: i=1; AHgh+RpQxjf0j+FJih1dWECuLJVoZ4xyGAjrpfYHqXN7xN0QXHsJ99mIueQlyxQ0ChgA3i4vQLyE9sNDBLwr3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzI8G6wewczbjEFKohzbzKKl9OEyMlGrvZoYjQrsl+FcBTpWTu
	dxHMBMljHGKcQnuwlWMOIiZG2CjWa9csxfD1+qa9raj1f0bVUYjtX8p6
X-Gm-Gg: AR+sD10s3CqUnSgbWJbWTVrld1dSqYG+1IrHMbENiZLzkKwPRf6xc7d4KxqEQw2FLX8
	iKKk3Obgjtr3e1EjmIiDsbeD3zHqSDC3NAuGKzXaQt2OA2N6AwBT93kQ3rkzIb9cZUCxYlldVJv
	CjmRODWcEp7lEOh0xY1MLFDkb761NjszNFjOri21PCuSETyd7qhTRkpchfEltiQSXbGdRrFwNKY
	nqsyk6GARRWcpq4RN3cOxme9tlbnA/lI66WdP8UvCpReygnPQ2AVsdw3O2kxbETeLVZ93fbaS4/
	BpFpxY5EtGZ/xnzudLBMXmT6xhtoSD3InLB3bfA8jw6Hm1A7BFwzd8ZQhMcVwurQ5y9jil7Hwm7
	Ce5ADs5zkwzWQR6BVXVJQ86nhUOERxGnMF/pWiwikCvjvNxATKzlTrk83SJsfST4YqIUIzfpqxr
	NH2nkniF1ZchJ51Z5ydjDNhXydVR8+ji5weK9chJK0Cl/5qOuYXe8Rb21LYnxmdLs6keAbYiW0G
	Q==
X-Received: by 2002:a05:6a20:2449:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cb86029556mr7984191637.36.1785941923409;
        Wed, 05 Aug 2026 07:58:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a96e4sm16077831eec.26.2026.08.05.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:58:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 07:58:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [hwmon-next PATCH v6 3/4] hwmon: (adt7470) Expose fan control
 via PWM framework
Message-ID: <2ab29038-dfb3-40ab-a4e8-e880b9cce279@roeck-us.net>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>

On Wed, Aug 05, 2026 at 10:15:19AM -0300, Luiz Angelo Daros de Luca wrote:
> The ADT7470 features four PWM outputs designed to control fans.
> Previously, these were only accessible through the legacy hwmon
> sysfs interface.
> 
> Expose the ADT7470 fan control lines through the generic PWM framework.
> This allows generic PWM consumers described in Device Tree, such as
> "pwm-fan", to use the device through the "#pwm-cells" property.  This is
> particularly necessary for boards where the ADT7470 external temperature
> sensors are not populated and the chip is used strictly as a fan
> controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
> delegating control to the generic PWM subsystem allows the kernel's
> thermal framework to manage the fans based on unrelated temperature
> zones, such as internal SoC sensors.
> 
> When a PWM consumer applies a new PWM state, the driver automatically
> switches the corresponding PWM channel to manual mode so that the
> requested duty cycle takes effect. The duty cycle specified by the PWM
> framework is internally converted to the 0-255 scale expected by the
> hardware registers.
> 
> To prevent conflicting access, the hwmon PWM sysfs attributes are hidden
> when the device is registered with PWM framework support (i.e. when
> "#pwm-cells" is present in DT and CONFIG_PWM is reachable).
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
