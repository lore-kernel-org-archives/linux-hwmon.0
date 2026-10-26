Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974229;
	b=idyvGj1JCHW9b4TJw63QyBBYjBkRc6JjysKkxFpGDZSer1qAN+djA2J00fQ0E0IKX1mI
	 6YP2rXWOPsoVF77j2+vuMoAR5eNPCRqrvS5Vu21Sqe4OvDnOY1wIsL29UFX79ehueL62z
	 ajQD4lhzdL5TJbYJxE03V4Tduo3Ue/PwAgLaJ+j3qRhh44ZcsdJBuRvoR5Pa8EI8AX0HM
	 qmqcQmcdlrhbcSgVtIq4xQPhEVoxNrZ9w/xe8Riu08i8wLr3kOhGodLHv/90KtZv/Onl/
	 5AihFk5d1GbazH5cObmNSVDyUEiZFhoSTuXdm+/b/V1QIyF1jAfKtZ1S3pY8QwKVTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
	b=Y1YnxlHkDF8mFaGA/PlAmwMPrj6RlwDWGQdMT0V/WHfJU9ZD1mu4rkVXRdw8cP4Z7NBW
	 HyLJnOMlou4h2QhV9nnNJbKpGkl9OJiDvzrqVB4aVujMztORJypLzXr+fJ0vETqeSr/qW
	 2IIcZqPhEMgo94dK8dMfRQFis2YDmOHHuL5Du2/k1uOTTCFjLDgedgC2VQsicWwUqOOiM
	 oWIklJSvDEoJqNhVF3C9u0SQl+PY5Oap5fwyAfxzicJbpyk5dntaJrQQtnUhchaRUsA2/
	 JrTZsr1odA2ln/N6BXggESIKimO8WalefRhUQ7L1o+Y9xWW3JX7dNEyjSVu++sX74+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c5O6rA/0";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ACB606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3ACB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5O6rA/0
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2246393a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974228; x=1793579028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=c5O6rA/07U3TPiUdjyQl+0E/1QGQKFEd/BuZr146AnkMngEg/j6CBnibvZSqG0Fd/U
         e4xYnAbkCcJZ1k93qWPPfj5VllNNTSBCgJV5StBfQdExN/DGAdLuzUg0d+8BpiUz+dWF
         8k8Yh1uPDnH3nRhntCgLGxU/EuI7hZF/CcR4oFQkXMUVcuTWXLK9tsE7bHqwgN19O4Zd
         Cyeu/xE4r6nEEXj62dltqk3zE19zxhJyrgAJVuQnqGgjnQ/LBWSIkIOro2427PZKPcis
         CuBDXBzun4bni3YIS0qe8Wr7agcu2YNAB9TuCWvtGR2SX0aXsXlmznXP+M9fy4lE0ZeB
         LV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974228; x=1793579028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=LxV3wb0F5KPQ/Pd3fpZdt/p7q2OCZ04QlvwDJmsUexl8Q4gl9gT25YIJb60NONjhqj
         hi6RHgJu8GgcuSFxTa2rEilwZJQcWOvEOAwuJ97egkxYHwMsWz+JqTHTFD40dSJMTsM5
         90TZ65vhiu3w1aW+S9F3VYr2XcgaZ3Tccy51rvOS58jQqmuRXr/TAk3/jG4km62bXKHJ
         A28lx3tp4ZmuxXJvxiYofDO3XsG/w8uGgNffVAGkrw3okr+ALkb0jAoamK5Af0rTPBJu
         tcnPScXUIH4UMgfke/7TfOgaM+yCiu2nTtscZm+r9G/2zCahyl7PiKNXaHwwOFSM/ncR
         egQg==
X-Forwarded-Encrypted: i=1; AKwUvBzGiHMPgp2dKq+s7e+IhFmGcP1Um5h1/ajugqGpWqw8/dyuiszXMDvQkQobhcUoGcx9nQvEjLRRtboUyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIotqk5mmRTWXV/EqYcCXtao2613J4KM8UwKcbncD0NeQdyFND+
	5EMLv9HsN73pr4O8Lr9KY7OP7Q8p+/mQ1r80t5jMn5KRBINidN9bGwq4
X-Gm-Gg: AYBFou2+fNQRanrKnBtoQk9pabyz9tC1YOXzBFXi7idf9tAKSR9X3c5LAPtASOXd+nh
	GkyVQVBz6TmXK7KqtNcvaQYBZDG2BUeRpoJeNkQAOCIREGW1Yz1dLfykFbVllxsojzBvTBnBtil
	VFUvTFb6Qq0X3ybXs8LFutgkxeisGENdzMfbWBVgvNsxmoqloleW47aM4Ib+UHBJjl1CwN42d88
	Gn7vdaqsLMPwdgjzWMyhJiryuKe9Vg+6DyD+tvAnUTCZw/Jy8hhH6SxlBVMBRxno9482cbyfR2y
	CIDJ906w6eLF+OeeLSy2/v6StwsLHxMv7QYn0dxfKeHFQrYXB5xUX3EVgrTA24nLLzCMdylRvsx
	1LWBOXKibLsivJ2HSvUpx9Ms7GohTRXcaCnbzA3UDs1DPXceL0f81/k04N03AeObFDllAVP7QRN
	0p7W3ZLFhouBDFG9VkhK10pfcGg+NrHUH9rSIe+oXxSZgH2fD14k+tCVtA0fsbttGvTUYmhiMMX
	721o6KrDcu0Wmsw3apwh1FCSJJY2LNxN8uXfxsNjkTJdSrF80v05INyGaKaWp8bEhJCEQ==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5091396a91.6.1792974228365;
        Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm6406037a91.2.2026.10.25.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Message-ID: <c5cdf9e3-919c-48c9-9717-8bc801ad207e@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:49PM +0800, John Erasmus Mari Geronimo wrote:
> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks
Guenter
