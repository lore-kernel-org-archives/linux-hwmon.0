Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190E19D89E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341640; cv=none; b=bh4Ptje6WP6kA9VXZ0Wb9SBdQ97vTXZfeQW9DYeJh8P3AtU1w3jMj0LVnugo9CliH5+ygkuCdTt5sUi5ph+j/pQqDoaQsMrp+ce8KhJ4YLmJpX3khRABG5Fd4KJ2sjd6Ja722ZVkd79Su/jrQFkxnjEwoMe8NLLouRQaUKdwJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341640; c=relaxed/simple;
	bh=OtsP4QBJo/QQfeijQpHyFypjTXEdBkC/ol+rLalK8OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byqMaYIk9bIFveoBej+KDD98NYTlAo9VKAm/dWeo811lnQgGO+BSsrBAktgrGuoB7Ik3lbUBmRcu7DJD8iYp9fq/zz3xg+6DUmMr6qbPrdDCo0lhz21QoTDx1q7l8e0emJlzUD+kMZt1v7TB1QRzYrpSJAqTvAPaXzkxu78iJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBzCgbAR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBzCgbAR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so1520084b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 12:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787341638; x=1787946438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1QIGS9D8gpK9URduGL5oVTCiJC6QwFkwaFqcuNIH2Bo=;
        b=rBzCgbARNOaHz+NdCRXjXMJCS0VwrI6GVHWKjT6KAShwNR7liNLkEfx3wFhEhiB+aC
         pVucSa8/RSaddda8W1yyiWB78GoA1gGaT2HcBYihHW1tqdV/22DGYP9BMLePoJJLrAt0
         acxaw72xXiIh51kJI52kJBm8Md86Qtd5xjuo3XMO7Le4gA0EdnOhAdaUuoHsmGEegRB1
         QIrxR5QISNijSkJyaXVpywPSpr9Sx1iIDAzcOf+BD+wFeFXZ4c9IUJhTBf3QEy9EacDG
         cEbD5x1hEZ7cy1AAPcXANyQ8dD+t1B5l3Xl1pCWNwojqv7cIjFIqrcanC7zH7RbKeCoW
         0eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341638; x=1787946438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QIGS9D8gpK9URduGL5oVTCiJC6QwFkwaFqcuNIH2Bo=;
        b=OoUDXySLDnuGk2ZcAF1/jWCo2QeP07JlHxFpJe8CXKZtmVBxz3woaqOv/Kl5WtKKbU
         qh01r/L/mF1MZgC7BEJMQa2avJmc2z4hGaZ1POmaHg56vd7OhiNSsYzUWXstzg8g1SVB
         g0azfkBI1kJvKGjtYlFj4nmDLp0k/4yuasK2RE8ObvEu1R7888K4F8nBw3IJ3qeFCZix
         +RScUVVdN1yIKvuZVm1jC7SSevJy+lXPf8YJvY0DRjzn9G/fFyCg3OoT7ZxQhE8IBaKE
         XsR2Dg9SLqD3yEXoV9BmiMXJ46EIUmNIRm5QMmzT/kae0oOJQXm28PNw4h+980OtG4Ix
         dIkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3uQNZOYr2yAzEO7M/GA3Z/y77qc0VUgqInyQJhmp2UlT7wzvqNcAqsM1HLsYc9r0l4a1tPsgHNuqavw==@vger.kernel.org
X-Gm-Message-State: AFuF++l1NlTsN8t07Oco0qVYpTUpDUWcgpHJt/oQDo22K3dJAiEO7U1M
	aI2JDYjC2/FWHJuR5pyMR65MuHPQJoxiIxA2WoO7RdMk/p6+pfsyoBffPTeMmQ==
X-Gm-Gg: AR+sD115znRUKXq1QwgyUPciWbs8wTaGUSvn8NkFD3FtrP8SjW6LAGzuwJxbXPNCdhp
	hiqWyRSoG6O8mvcRwCbB0rXYVVFKO2kRl2sJFVU8S1WYE0Y6/oXQu+aS1t2TA3vG9xK/AEEizpG
	+5P8cvGuVJmhfGsFsRz6oODfnOqLnijd4oUM2FrRj9wP3tO5xS4rozGpjCvIf5oHhn/+Xm+RWOt
	EHa157iYsDvTOgXnKFr8X6SElFKxUUzVYwDiQ1lXpFtciH6LOc7F7KNR0qMt67BR/1oRtvekimO
	qIYvQzG78POtfkQGSfvvnbLc8rT8U8JmwNBXXXUCtUIWJ59n0H3SLZ04JjzxrAlD7ojpR6ehpch
	oZIgv3HPmKRbP9Oyxbamjj/og6znUPY+PTqLGXptZ+kyPHLnX8bcSMOe7LRBgLTm01Ar28P5RrC
	Ac7jRB9UvKvQGeArImUoqXUvDeM1NIyq9iAM2BR/i277J/fre9rZZ4E9M7kN646n/kfrwzg6w44
	T+8dWkvnjex
X-Received: by 2002:a05:6a20:c78e:b0:3cd:f6c:6cdd with SMTP id adf61e73a8af0-3cd30139176mr19309732637.16.1787341638486;
        Fri, 21 Aug 2026 12:47:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm29097058eec.25.2026.08.21.12.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:47:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 12:47:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jared Kangas <jkangas@redhat.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Lothar Felten <lothar.felten@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (ina2xx) Parameterize ina2xx_data in
 ina226_alert_read()
Message-ID: <5a9cbee1-1bf6-4a26-abac-1ddbcd46f888@roeck-us.net>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-2-fdce35abc41e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-2-fdce35abc41e@redhat.com>

On Thu, Aug 20, 2026 at 06:09:22AM -0700, Jared Kangas wrote:
> Mirror ina226_alert_limit_read/write and use struct ina2xx_data instead
> of struct regmap in ina226_alert_read's parameters.
> 
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied.

Thanks,
Guenter
