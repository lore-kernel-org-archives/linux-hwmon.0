Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042000;
	b=ARjWcZWcEQEdT1zpJhheK8a/uXipOrID1KB1zEOCGQVzVq1XVGh8Q7uqjsOEcmV3GdoC
	 5Vi9Hj3CyLemIa/eS36t7DDVfqWd0WKC2PtK7B6eKjw0FXI7vrHELw6s9FT+CugRPo5fp
	 LtSlvuaF2GIfX8He6GntTJTwLNQb/2mR2c6ZnkBw9jcJgI85viu0I2D5BoP426xcSH80/
	 +Hy8pUttOzMN7QwPU73yvbcwZCUqx8WKRN/IkzMmpr3BYv+pFpKpPHH7i9t4FNlbKyzLv
	 dshkVEjj3gf7tUspqTVyNS81WgRrcUnq5vsPVtdDr0/LfKFyJUXb4Wu7tDKdXSmM+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
	b=hOnoZeCPO8T9lsuBT/SCUDhgP1eFRmBYo1lh/5+h1aEt0N1pOv4orx5TthlX9w2N5MIF
	 9O08jMMy8dngThLN6fS8A3YmAf4wcCdLtEb78joBzg5TDmRgjrRFMDvTOMuRnpNUXN0eR
	 OLDJEw5yx839MVBXDorYYFvn9okP+s/+jh3usMGJFKmbr8Ocgbocv01sp9p2hnArdt7mf
	 jQhkpEo78gIiyJiIMO7jOrlb1KROp8krIsaqp0jJ+m4uBfGJ5wg9V3xj0bu5jUk3kdwfq
	 He7+3cG1X8a7QqR8QQL8RVXk6PwD0BrH8Wa1Yr0oqdJe5l+bSIZC1V86zv0pGR13WYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA00606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-19305bcb72cso2482664c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041999; x=1793646799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=CQQTClelF4Z/y1v1UKcARaJfZ2oWDcixPOJDkotrofreXPGW19wumCKvJyACKbtJ2j
         3Ldi/Kz4d5QPEAc/T3wJ09OqTnf3OU/JbpSKIA02sReTxeYEOAWBMCpTGGmEtMrqxkUK
         CrTHirElSsEtq+lLIc3g7mzJfNsqAROk8B4TCgiKHFWBzabG/oFAIVlb2VNeXijG2UPT
         sUNyumvg5MrbwWEY9W1wuUL5DcJvvEpUic+iRRZsSXSdxe5mWvfWzBwMYvJoq9aHLzVY
         CQL8+kLLjqhfmjskjxHhFQsd1tcAEprAG2PozEDtk6zjl9Kb9qlg47kJnucj0ixTqTHg
         nWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041999; x=1793646799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=Yp+7aR8TFMmNWs0+o/KuPuzug+rWidSjbkqJcDPCdybKiwXu09tu+TtDdZWsnMZtYq
         zoEytetWyBDcmZmLRf3wYZDe9etu+3w3x2+OL/WNeNJ8lJHgwTFj0qWlqGe0tZ1YlHIN
         4X1mT9zk1kfnI/osDgKVCVKPxdDN8b8gesHgmhtKtq6a962aWc4vL5XVni4ak0AZSq9R
         WyNL7aDIyvwHUq7IMhL8cQGw5S5DCYQu1LB//f9yF8fPvJN8bPpykf+4O6s78wPsjJy7
         S9HKJ6i177crke32UCoXMctZmsxRGQ5bgYiH6Kb6FKSZSiksgZqMPahA0urLYN3BygJB
         um6g==
X-Gm-Message-State: AFq9FYLKfhOTKev+//xIXVkNFsWi+iq/X0y+MpTPtZHSExbMcSz0ah8x
	2l6ONhg3uNPi0S4rNb8Kyor1UXCnfIUh3iRJo7TPrjaJqP7Vomhqf/4k
X-Gm-Gg: AYBFou1Y7ZHMxUtUMdZ7pQn+V2Qy1Am01DiNtKZ71TDjBlsnI1T2lI1znpsNfyfFAvb
	ZjSDpqknJYx9GgMea+U3su9U+VRghIzIs3VFm7MhFxvtKMtUsbytUfZu3mwlHF/HPluA+QW6/5+
	VcQEsOptMgRFE9NyxBQfiBn7DNCU7T++cViSUyAbDz+w91KG8yhcC2Lw5OZIxcbVGYHEamZhpRG
	Pr8ZnZnK+QREuXjKjTdIRbfvhQP3rIx9zOIXcOQCeA1d9eEzbvpZ8uiEUOydoR1Zpk0YwhYn8pO
	Cqz8As4Zos+MwB3Z4hOVevvr2muShkOQh4IPXFY1fFFpVWFYkI3dxygH1uCDq1VMR8c5L4BOpGV
	I5xiDBP8PYJBazUhmv+fWpUcdsnEVANpm3JbGmQnQ53GBzgjVdJ1fJOlM9nXpvGwJ+OFvxhhNW6
	3lwlATiarzdM225w7waEwsjm8Sy8VwXElB5SdZzQOSFi04aZUZCe26lYsw5i7fyeogaffxVg+sy
	1izbgLsm1v5O+GlyMyX2nMibn27QgfhI0XaYFKw0ssP5zVnq3TcdCpI/xr85WQRTCN5NweBFasS
	U2fYknG0+VW5vLY=
X-Received: by 2002:a05:701b:4309:b0:151:6e80:baa9 with SMTP id a92af1059eb24-19933e10e2cmr10466847c88.12.1793041999000;
        Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm26826628c88.14.2026.10.26.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:13:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:13:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Report the duty cycle of NCT6687D-R
 system fans
Message-ID: <0c8f35ac-3c92-4b1d-a027-7d8912751109@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-2-someguy@effective-light.com>
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
In-Reply-To: <20261004153250.516730-2-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:49AM -0400, Hamza Mahfooz wrote:
> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R. Its system fans
> are connected to channels 10-15, which have no fan output configuration
> register, so their duty cycle is not reported.
> 
> According to a reverse engineered register map, the duty cycle of these
> channels is reported in register (0xe00 + channel - 10). Report it for the
> system fans that are present, so that pwmN matches fanN. To do so,
> support up to 16 pwm channels, indexed by fan channel.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
