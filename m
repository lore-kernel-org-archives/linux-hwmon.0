Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782238;
	b=bWvKVK9WyxiFvJ1apOFE32gzRg3DMzkz4VtxSUr/Cb8cOebEiOPGmgk79obLQ6tuS8f9
	 T0V81Pbxv7HxM2F5m1+Z1ETK0Qlg9DaeJHuh3tkW3PQGE1i6Qxa7XvCYWK5QvUmilJtJu
	 sMW5ccTXKPYCAC1KcXrpH3TSKkz+nHdd9j4da1cXuJ+/7MmXuLep5ql//0Czv9FAk5eb8
	 +2ZJwXCL150t5Sj//pG83uChrHMEe6L/EvYUnLpXLPJbW/2Yq5zNtA+EYL6Rks8j83p37
	 AB3f6n6Rc4AQPILfgRjMwjwOVGVpqI6/grQmy+pNhEV8LVd3nKK6qYcqOk0rZnKmMSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=osPJP7uNwlGOijtHubovoPV3y9dW+CIrxksQVId775L8LGqvMVJG8s3nmw+RPhRyzVU2
	 hZ0u3vR2+tOK7E81vImOKbsKyPRtVwtROAjG1Oh9SqqQo7md3UEgn3dhEAfh61DqkQSNd
	 V1tO/PY78EuDIGm7o70Xvtk5KsSdVz743xmOH8syZktQYt75QQTF/WburYWS3QcIsN7Qy
	 m7ZIewEsP7rdwi4o+0YU61RUlntts0B+Rj3u8L2BEs3EbNQPi6HiQ8m6CHbk9cGpoQ4+/
	 3Oibq/o64esN32OXsoQ1zQTM4JataOBoMLyB6z/7Demk7CFyEN4+vPsGVTatjgy/CCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9A606A326
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a49a022221so3493741fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=fnS5pYaB/WYCuNhjifIdbdrP7dTnzNue0RofWGusWFBfipE6ZuW9hxxas8jmBM5IDM
         1GYXdQ/wqmlZaH1lPhNpLF+2YawTs2DOgsepnjq2jDfwfKqbCau3gXcFq+5nrsRYAjWW
         LW0jivy9JWDTMU87QMTJF6V2UaSnLGkdZMpfomHUblwUGDUwvvGO3D4Uv9PE7VtJm7fK
         iWy7dzXtUDhk4qiVLi78sc6kN26K9gznCjbPsbK7nFkt8YIs/Ba1e82VE8sv/Jgopbk4
         /w2GBBS5i81G1gZpNOtxtBdzFIZRSjXcI0fXbfVXDTt7YtGpXckHcVj8mg6/VrJsQM8c
         YoYA==
X-Forwarded-Encrypted: i=1; AKwUvBxjpmvjiwZ0HpEb4zeaB+LuuXLUv24VsAlgnqLsrWtnYy4tP1wm39D+Am9TEKPUvvAUrIo7sWwgSJGaMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IsRqoo3yF4xC1OAQhFESEp8OCLOaymiR229jmfrBnwH7+zvij
	CVVHwp8zdtmHVLQO0to8108zl2ajRLYo75UyzdZ3xL69cnWgBZkE3wvgkL8rg6kOY1xefXb7+PY
	uR8Cf8kw=
X-Gm-Gg: AYBFou2okLXtgB5djJDIAyjPPkmUMaWur9CnQdBRTKJxIDFvExjl8kIrAAEDDfAVX8m
	eYsT/z8UxCan9IQyB5AMkWNetcEevRs0nYc6zMW+WWnYw22DxXEJ9Hgqbf+I+J+weUUTNwWaa+H
	w4oxtiXEDu5q9pvqOLrt3x+XhPfPhUu8uci7o4tG/vtqcXsywDH6uEhgg+ukilzPegihkh5Wz9K
	uiuX0bzhQE8ggf1yqySisOFgBkeb985NcZH6KwATVBRdd70Tdu1JcCmG9uaBx6w83VD6KleHYEo
	NgxYRwwaaJ39XsqOrjKRMU1H38vwMm6Tp1JQh1XVBj44dlNb8la+qibC7xhtsVT2WRNVxsqyQsm
	07RSDFCuaW2DIHntVRR3KFiu5kSqSwM+SaY8RdoHtXsfjNinj1OosaQYF5BBXIJvYD1BSTNl4bf
	WXKOVw7VkYykIt7VJBNU7xJCfzRlg4saTV1cFxdzWC/wTF12M/su+eA+LqqfS9bPfXJ0OyDth4Q
	K6ACmwProTLiVYSdesC4dLf1ycZni9rOnMKxjAzkNadlZspWqYJeTTrkOzj81AD18cxTCJ68V+8
	OsFI6f4ZKAOu7JnOvXjvU8QAP8v1vAllGGdT4CW2dJ92YjNGq7vBuKo=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
