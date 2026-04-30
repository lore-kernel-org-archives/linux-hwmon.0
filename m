Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640CB336882
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590798; cv=none; b=i2t+BnyUXMuP+zCudVdoDw6k2nbdojLjHLvbrbx+7PyfqSihG9mnRJy/fUHK3ojWv82hR72Of5YEvuWEPXuhUj9aIHqIw/nNq4F6FSpW8pf+JaqsRG5Juzu+MsTbxVg0DQbz/EmCCOcih0D16ENcrKTI5mjDsXtVAjGCuMDQV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590798; c=relaxed/simple;
	bh=dY1HY9JIF8+lDEBooYfgHkN/XI0e+4h8UH4v6feKDu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXPxnDOHlADs6LqcYP3d7iNSH1NcQey/knnLR+Qxtr9GmTArp+VEWHVromfk/334PFavnHfY8gJfxJ9OQRYC3y7RZur6lwisx0aV41DBLd0oZnxChCw0gwBUkH0P7xNpDuK+3ULoHnzPtpCndj6vpjUhjj7sdAfqp65xOjD/0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deAKfLGx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deAKfLGx"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f8893bff3so736638b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590797; x=1778195597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=deAKfLGxEtEG1PYHmc5nu+2bHX+LiDVHMNYQ+CNhzCxcf6rkUxP+lB3BUP28pw8pTV
         fj7bpONtsf1pmC+8iTN40RZrjK2a8+nYwjoESeJUiJdDbiuoIsRclWPH7tCOB/44RYoJ
         Qx8jmPwrgSgwKUk8v67IAVaD9ZMrlZ4JF3Tzot30fVwynxxWRCizXka+Ofj8tUsi+qNA
         5JLh+uIR62xxEv/qsybFBW1ZyX0t/Cu5CmU+dfx+HKVpipi5UMrHGgTO/NUj/gB4pmpN
         kqM/QXUKC4ADyMQnozXKTbxjoH+hmz7NDLOoNUZSJvuuOZYEghzwUl8Plxe6cyVSah3A
         6b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590797; x=1778195597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=e86AcJMq50k6ztsR+/6bqcGCD0Rp3ny8pQ8DWy4DteVUxjg74HBB8Q4ZrBOFOqVnuA
         ETccfPoNYuX56ct+P3doMLo8KuBu79Hx8uX/gbX5n+K5lD/ObgXmeyrTl4Z7F9vPjLVn
         mXE6nUy5naRYJn9OaSJHBtY1meYFGPFEbJ0i5PXVcrx5Ix1rzP3uL4dc2bdQplTijqBo
         ePnbKvO2vPCvwo0qsbhkNWx3jaljV3suJ3J4UaYNQj+kRUoQWPj7HDZJ61Xxu/yLjei0
         SMPqjf3Eb5JpTMUmyxcmTOU6g7q5lgllaLOu8MHLpf77SZuhmzmhPMXTZ4933CtDX5bD
         TtYw==
X-Forwarded-Encrypted: i=1; AFNElJ/gs4OzSnffGCXwLogBLBSmyU00YeNkTRRZ8x7INOSpABWiHW4bYl6PZPK/WGRoB0nqXNSmKeF5QzjMHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLgqWNxNIA2o4lreSpgsfII3Sp+Sh4qYaJBbTuMrG10R0Y5Vh
	XQkhYjFAo+aG6k61g1PklMraGLEf1EZ3xcdBpjyNpoduB7x+uxQQfboV
X-Gm-Gg: AeBDiesldbXw8KL8u88hcmdugBVwJpz0IdRh7uH4GQmIkuBATlxjDi4KNskxa3FfKTW
	1qHfB4a3lAShd4zOSLP70GH738O989/PNvUPjnefp5aapS8tcEcIB8hIhVastanGUBw0uGOFZ9E
	WsUdLXhY3gUI7dqt4lh8QEj/VTVbkp6xO2QvKPFiU7o690rPHn1b4SV6TnElpzRy2LSZpGqPTIS
	aZZOVNqn4qApUBGeGjwygyRurbWOBqGLB0mMaaSAodowykf/5BSe3m5n81TEIZFKEVM/HsnO69R
	Mcdm+oY57KOfMDorsTJOAeJ2EsguLqqOVe0BRrbv7Vi7ofp2/jKO8Fqvq9tVrFytx7Iq9nbf6+U
	ixQGbIBEXgJ77Z0MSTN/+foho9EVCY6umBwK/UCnWG9Vr8I+3eKJmllfdKYearObdSJN507yw6q
	3bMAVHbyahkrwUas1/g29b5KWL3WZ6g7CEcNhFIqDSVGu4eIM=
X-Received: by 2002:a05:6a00:430c:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8351a59ca27mr541087b3a.30.1777590796764;
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm787335b3a.33.2026.04.30.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:13:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 1/3] hwmon: emc2305: Fix fan channel index handling
Message-ID: <2bce6b65-d09b-4237-be0f-3b53698d8031@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:53AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index against the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> The thermal registration path currently uses a sequential child index,
> which may not match the validated channel from DT. Use the DT "reg"
> property when registering cooling devices to ensure consistent
> channel handling
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

The problems found by Sashiko are real, but they are pre-existing.
The locking issues are pre-existing, and data->pwm_separate is for
all practical purposes always false (there is no upstream user of
the platform data, so it may well be removed), meaning there is no
separation of pwm channels if the thermal subsystem is enabled.
Given that, applied.

Thanks,
Guenter
