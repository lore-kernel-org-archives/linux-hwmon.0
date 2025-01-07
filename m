Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C51A18D626;
	Tue,  7 Jan 2025 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271250; cv=none; b=YVOQaVFtKErl8pIVZOgx+ZDZGTH9oMYJHkobffryxBJmrhEOr4aEAWfNAj4pVvvSolSF431guzVT1uQaG4Pq7hXXHT22LnecHuK46z7QVZAVzhT8d/tD49pnmQKk+2ETlwS9KBzYbfLKZS2bdPwJsqvX3M2/p5A5IEKooPCdQVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271250; c=relaxed/simple;
	bh=7qINVzSRNk3vj8MQhvUH/NExVu6XRP/94mOpbdmMIbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndgVe2L43wrXPVpvsOUjCzjQSrKJ8H2ZkD6/UNhc9mKjSN8upzBh1TwclV8SP7naUz1nbifsK2liqaxD4udLXJPDpHe9E8E/YZJftRNdchAby/2RhV6GZg6z5A+kJr8KixvmQ7k2qTabusjC3PtI7m8Z+ex3fEXh2XGuM+2g1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jqq+QKgb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jqq+QKgb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso23190145a91.0;
        Tue, 07 Jan 2025 09:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271249; x=1736876049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nHxlDNAcH0JhK7UnLqlESIxm/+Pc4+sMLoaMkbVeg8=;
        b=Jqq+QKgbJN2W+CZdlDpcXkrtgp+0tvP90RD5PqGwrDU34x+uR3IKwJ5BHzyoajBCsa
         0qS2qReWIB4pK+xHwRP+/A5xHgtuD8Yu/xQeOgIw5WL5yqhM/rbyDFLfr9ELF39uS23Q
         1Oq9Zp0hKQknnUjlemPn8NatmLZJrgAeVzw2zTOH0IImIGSInyGU3RkTXgjTFFLRxB7j
         PilWWqiyOxPP2MPOQxxpQxvXk6uPYvNzT9ZrB1YtA5ikPev+6RYZRF4XnsoeXncA3m+4
         JfcrCX3peorvjexfyc3lQlATvYzqwP7ojS7gCpV/EXtZk76Vn8EWjKMcm9Ht9OXGzQr7
         wEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271249; x=1736876049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nHxlDNAcH0JhK7UnLqlESIxm/+Pc4+sMLoaMkbVeg8=;
        b=Efu7jDdAdD1df1V5EKQUrFkU0fXtIMJK7ekR5raCDk2EpfmVsvRVpAogaTOA7WuaxG
         ZvHgYJzHLlWpzo8YXOvZprLcf8mFy+zGP6YSuiqfn4AFTiRo7WfJa5gHM1W6mbg3SEDe
         Q3sencED69rXGUS7q84QG5RubXNtZXtQaJ4rMMH/5WPfkk+EuOb73Iak+56ENv2dA+aZ
         bDp/kZAb0palpxuv7bqWSI86FAiA5jq5D/beUkgKgGEv9D94cugTOZV1DoQstpgFShyW
         9ntxyIx9rmRRBmWDxfhW/3p4iD86K1ExSll8VVGa1W9D5/3Xkos7Uzz+i+0RVLr18OXq
         wzWw==
X-Forwarded-Encrypted: i=1; AJvYcCW7eZjWygJAgPZUNAziQlBm3irqyO7TjdXBHDP7aHg1u83zssORi6kYDYuErfXHKne7eCVNzRRzs5uOl/Dz@vger.kernel.org, AJvYcCWw0NpiDa3jMc8yg7HdZeENIDP3xDprcJzSuxQ0//Ff+nI71KoUTvNsM3WtsfpV0NBL6utBmjPR9XdF8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOqiW4fmB6hIr+LrB2nypquVHlfIEBvk83fUSeO8MGPz/n1St
	/x3Z1LdYIYiTMb6qCWKi+3StSaSiC/nW/X1KGhddrCgb8GfSietJSAP4xA==
X-Gm-Gg: ASbGncs77ta5OyshG9gH9dqOguzmH3tQoaTr/YxT5irFU4VGWoY3PGorGuIBYobm/VJ
	IhAftfedX4Dd+Yi0pUG5IiMu2YZaa8c540CX+GxuSy4qXSQczRYnUxKBp3SIi9LeOl5S0QOpXgZ
	ba3dT/VeuyWTCbaZfRmwuKddVkIcHOd8mWQgNcP2psZVOP3s+Zx7vWNrzQe9mV00xINdXktA6jC
	bVFcnJ+7uZr+3yU91b0F1zPjH87jVfuK93BfFQBxn2pqm54DqbehtU4Y2gvP8jKC34Tmw==
X-Google-Smtp-Source: AGHT+IF36bfit+xCyLJI9+9cEFY3uZ1gll3CEGkeSpOQVlDRmxvpt0stWbTDq0fBYcop+sFLa8bW/Q==
X-Received: by 2002:a17:90a:d004:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2f452debd5dmr86205041a91.3.1736271248686;
        Tue, 07 Jan 2025 09:34:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dcb0sm38075274a91.35.2025.01.07.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:34:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:34:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from
 device-specific data
Message-ID: <3d14e483-036a-47c3-8802-1ce3adc97007@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <cf3ef6ff-632e-4fcf-9c13-1425e444a0e5@roeck-us.net>
 <dc38e8f0-2262-487e-902d-6e13992f0f51@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc38e8f0-2262-487e-902d-6e13992f0f51@math.uni-bielefeld.de>

On Fri, Dec 27, 2024 at 12:05:27AM +0100, Tobias Jakobi wrote:
> On 12/26/24 22:04, Guenter Roeck wrote:
> 
...
> 
> > If such checks happen in the current code, that should be fixed
> > in the is_visible functions. Any existing runtime feature checks
> > should be removed.
> OK, so to reiterate: We don't want any feature checks during runtime. Only
> during probe time. And during probe we just create the attributes that make
> sense for the device. What we can't decide on the level of attributes, we do
> in the is_visible functions. Is this correct?
> 
Correct.

Thanks,
Guenter
