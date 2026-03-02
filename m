Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233073FD15D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463889; cv=none; b=e5HIb1RYylFkW7rWP0kHNkPzHo8Tg/IW8irX6kR+4LTY+EpPNFMlcyIh+3jsS/w0rvJKOafM658u1cMte+ZWh4SQQ2Inc3w6j+5WQmDDyjJdQwvNtOgOJjtKotLBtUNr4I+fWjDAfiixnwuwwZOEkOSQ81/C/I8aYaHmL2jq0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463889; c=relaxed/simple;
	bh=Z3QuW44a1cqmJAISoawP8xM8uOw+Gue0DhunUahM9Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKccWpKsvFpuFthJkZo05lckZWVIQ1dFIF597Gnmd9r+oRCRhgdLSizIEOJ+Z/8ZQa9hNyFp9QKBZwUAFKuoc23Os7+6ES5dr7X40LKa/n6A5jT7O2CULlH0B9Zglqu6LNeBOK/96csPjp/8e/mlGYBM8/Z8p0G6HS4CP0fsk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WruRTr3d; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WruRTr3d"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be06c02f66so2976479eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463887; x=1773068687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=WruRTr3d7U8Z2pIdAmkls+egdPYBPfFo5wW3NFFWeXLLB0Im7vVRDV2PrNuz/yhSDR
         gKnnwBCz5L2+ssq4RtN7eGYiar4EGGRUt9E53m/NBS7Nlxfs6VI7Lh96+7vbTiEqoqJa
         TVFQjVM+SQAvjg4Ch01zaCmsaYptDT+dwtberO2qqmx5tReiPHRSnRfBzfCMccQ0Jqix
         +ofOK2wGc+yCydQycFKQUAK/xrxibd1Mp4ZA24mVUaV7+eUC6JgZzXOTJKLNCbClgK/W
         vC7YJna+FfI39W3pq+j+wDP1REc9Dkuv970+3OTsu8zYjLYcmoYX1aFWQ/h4f2sqhvzI
         939Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463887; x=1773068687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=keIBJg9JvUUHilo+1QOQten0vhuXA8YEsRbGgP2RqNhrDjh+iLycegLhaTZFfaS7Ld
         2cUMU1PkKH3xkLl5YVJIYlUlGN63zj6wL2bJbgLFw9KxRtswBIsm7tPcJCWPeH8c00EK
         sIJaKv4Gjd/sNuoRMs06ooUgzhe/ZDz5Ndwvj/sAQUvHDTGtexc4bT/XZaonu2DvR3tR
         3DVBx+5U7Tm9Ty2GyIwGm7yn2of6mYLdWYYn9HRHPOUGHSFbgj8kwica6o66pMyrHGjN
         PqnxtjPRjqxKdfvktFQmcU33Ho8nwf9XUGoWyj9ysPekPMAXUVJ4xvUyS9FMVYvufLUl
         1MkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbbeAALIEzb/qWXSaPJa/BmiczG8w3fhczbvbdcJCYkdZMwWmIuRDJnt2JpRoZgAMt5RGvph/3Pl8qWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOBhIfnlf31+fHMKWNq1eEehyNllUeOmdAEu22BWNZ/brBDTd
	qQr3ZmTL0SgPCELKRiGKd1DOwAc1q7l207dX5rEwkizXsPSCcD8ucNse
X-Gm-Gg: ATEYQzxXsa2jv+W17Y3RDsGw6QIZO8t7SYTEUFTFfh3jtrPNQeGmbc3Jkap9zEakBjI
	E6M84b55IPtfBNE14Fc5tbpD3kOAz1F/lGYTHwVtYYNenNxDgWgPotSdazSC1Bw7HhRRUEfeqbG
	POkkfl2ASxMbftdwyw9V9c6axsXy0jUEMKq63pfCGZRi1QCwKit1le8SZZA9JrvJ3YM9x5i3r25
	Pci9saowd42NaQ3aL48DwhVh6a/HPNBAhMMjFcSY75oTOaNm/G/VafjlIkciMKfg7GSiH86SyOh
	pd6b5H0+t0AxbujapwucWKUFJSkZrtfKpgzEKkU3lf7LGasxVnULQUVXcA7hokuAwQLh90JX7Aj
	nb1zQm2JXO1ywlqi2TwmQXGSHv7vF5auJLlQuHWfmMbvLQKFgXgtf80GnNBAU3L0oeJDgf50O1+
	Wq1Kh2HJEwHpRKcDte0iL03rb+9JVeSfpFquMm
X-Received: by 2002:a05:7300:f194:b0:2be:142f:d48a with SMTP id 5a478bee46e88-2be142fd895mr1194048eec.27.1772463886899;
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23c01sm10987949eec.16.2026.03.02.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 07:04:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 7/7] dt-bindings: hwmon: sl28cpld: Drop sa67mcu
 compatible
Message-ID: <917915df-3a4a-4cc0-b41f-106b5933db20@roeck-us.net>
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-8-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302122540.1377444-8-mwalle@kernel.org>

On Mon, Mar 02, 2026 at 01:24:52PM +0100, Michael Walle wrote:
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time and revert commit 0f6eae86e626 ("dt-bindings: hwmon:
> sl28cpld: add sa67mcu compatible").
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied.

Guenter
