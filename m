Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B831EE7D5
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230053; cv=none; b=VaBjQgsaMmhYoQjQjDg6kAiRBa/+MBM6v2UReS5Co4qG+lh2sC5fzNZo/Z5m1wcjY+u9ypl2QDNKkQLO2s7ZKIBkhydGfLaH4lFfzewD7QxFv09cyGBmqvtjMyNW0nlDhOlW9vq8iYNMYYk4xsb23d0BqJ+toAH7FDh4lYdl5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230053; c=relaxed/simple;
	bh=c4vg/yrkkoYodLTyK73OjzTRN+kuxvBTfJWAD/iCs7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMYNTRIr94u3NuC/+D7JU/DRjVHfaWB5gzI2pWrVPYQVKAOpuC9BMqQYL45bKLIAt5NDTjB2vyQhzX8snBNoDNHGZYhJJCzV+NgP7jtlJzhvXPoqMzVgQVxdPtalt1U6C5L4NExeIW3HBWqvRR3tz5kBAgP6JQLS5J9M519pThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yld0IW9N; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yld0IW9N"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad617d5b80so23274565ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 18:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230052; x=1774834852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLt09SP0vtOYo03XHu6SC4VMmvfGM5f6co6uv+DFIx8=;
        b=Yld0IW9N44V/PyCUaC1/ZTg/DDgyZ3CAQtRgpGXsDAfCehSGBx/2u5Pk/pWPNzBVqt
         eWUVscVkQF30CEOd87w/IGgKpuS7k1+F0vX+7ybTScAb27NDjuJe976xwRt0jqgjrQdO
         oowf170Gpo+sn/oSvMIllc9fJsoI3NqDB55sD96ZP5oIcz8qb6NFyLnQVVVGXm8ZclUN
         NBo/Ohh+DHaDLrPXG3YeIPz8S2218mF3bydBVLaz22n+fQDe593+Q4jK8tHrZ63W/RWy
         jhcZh0ALV50kNw0uK9aJMniaM5fiIxegffbYiSqzNp+yseRCUmiJfxAlOk4ieCX4we9O
         rxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230052; x=1774834852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLt09SP0vtOYo03XHu6SC4VMmvfGM5f6co6uv+DFIx8=;
        b=sa+BltDD5F5sI6UkcpB+gWhUNvAIJwbx3vlZbFqXC5R34OdQTT5voyR21FdTenl2O+
         3p/4c9m/nEVCqQRCn40Zb6k4WcGQuyfQQls++cuEJ8+QZ/g67IGU0Pfwbm/xSAx2sHVm
         2oHBBf5ksNPwj6SYy8jS1a4tRR19JQqnOsyjHDja5J73qrnsxaxp8puxdqvsOuSCGXnO
         KuanxZqMAwYOmrT09sWU3X1/xIig9If5CCwmX6O7xABtT0DUIF3Tu5nLQymnBObfpPYB
         KWBHrsmDm3s23dkzXW33tINbeaxHfiTfErinFSurwP+MdOQPbevAv6WHyCKwfn7DgE0W
         SMNA==
X-Gm-Message-State: AOJu0YztDeJKLuny7BVHo0H6uq94LwOZKF/ZShgK6NxJu+G1geLdKlzt
	es6jSV0aHarOxVA7By58/Xad97ISycM0k+62Kagwd9Y8PoB1dhN1mPKQ
X-Gm-Gg: ATEYQzw4HQ5GhvudYuvF+g2fRJZ3buh6P4hFVUbRTjPv5Dzh+23C9lcryxbstF3J/nS
	qNdmMmHKea9B7L4LUkzVJvMSaoMMSfnipAG4meyE4LK24pk61HLANQ4UTfWzZUNcfiD6TPbqqj8
	+ocuiJ87H9Sek56GwqoZfxfFX+wduoeqSx5NrwH8pqck5ja40rx2BLHnUSVZ9m8BfnbYXHp/rBi
	amrHi+9HMKCtjbVVgTTULFO600kS/XO7UmAR+cm+rYHGp+jSWN8TcqlJ6J+41taEFHevCY7oC9N
	JpazbXDAsb85wU+FBUpKA8pHcPoACtoy0HKzfSrUyuhhJb/fyTQ+Ii6rzcMsMlJu0FJv0Ggo6Qq
	9sAFcAH+iXVJqeuPdxOFibxyAuTQF+KT7cVbSJlr8t0WDnWPJAbS9QtlA2dI6MfUjZ7JqrytbVF
	uIEf2a6/C9XpJn+FI2h6n897xFlppAkxOz/Dqk
X-Received: by 2002:a17:902:e5ce:b0:2b0:4f82:74ca with SMTP id d9443c01a7336-2b082826cf1mr89062095ad.53.1774230051814;
        Sun, 22 Mar 2026 18:40:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b6dc8sm94873195ad.82.2026.03.22.18.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:40:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 18:40:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"iwona.winiarska@intel.com" <iwona.winiarska@intel.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (peci/cputemp) Fix off-by-one in
 cputemp_is_visible()
Message-ID: <36950a5e-476d-412e-8f3f-da74e6e5303b@roeck-us.net>
References: <20260323002352.93417-1-sanman.pradhan@hpe.com>
 <20260323002352.93417-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323002352.93417-3-sanman.pradhan@hpe.com>

On Mon, Mar 23, 2026 at 12:24:37AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> cputemp_is_visible() validates the channel index against
> CPUTEMP_CHANNEL_NUMS, but currently uses '>' instead of '>='.
> As a result, channel == CPUTEMP_CHANNEL_NUMS is not rejected even though
> valid indices are 0 .. CPUTEMP_CHANNEL_NUMS - 1.
> 
> Fix the bounds check by using '>=' so invalid channel indices are
> rejected before indexing the core bitmap.
> 
> Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
