Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93943301001
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454931; cv=none; b=s5O5rUBYEB8/zpdcXgUk2vu1ykdypQnUWeN3sBqD4zSilQr2iaZUrTGdgHpSg6SvwvTYCW8I6TX2g4lOs9xxC1RP6A7Pg4pLdYpGZHOqW/lbAdEh553B1TNS/AU2f1GDiJFD3JrnsfZKTaW6xmA6LPkWRcwEVqNORacyFGKDUDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454931; c=relaxed/simple;
	bh=O4un/WoNhEAplHVosH+Aiv2Xzjf927LVhRMRZoUS6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eItAyVyAcyCL95n+2WGhzh+jaCZH+vpSU7MXRgdwp+qYpuD6wTobxLpfVJub89WCc/vxM+9PTPY/z9DodxzICF1YlKwmI3Ft/+dnu4BnukGaw8PGGZhHa6zz+8biI3R8WaAPuWP2ICHrrORzE8eYLxMEO0iOlYoEmOiiunTEvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsdQu+M0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsdQu+M0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7930132f59aso7331982b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454929; x=1761059729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiOXvz3p0iDVrGhzRlMs5DQgf7JeJiwBe95U5RWF0Dg=;
        b=CsdQu+M0CwjN9qg8/L8I08lcBBnKJc2FbbwgpePadFlqLBYwt83q2SnX0tHN7lKxYO
         AMW0C/Z3pagC5lmoaB+8qzE9rDx7UkaviSFrNN9iXnY1y955QRx++aQmGlzf9GQJGbAy
         tq7fgi/hKLB7jprkanLbGLe1oKS1yTmR26eYzcx8M6hXtLWbhzTl2rt3mq+BZBxaeDgU
         55fZ77ipyqYRTIm4gjtLa/sgE1MmcGXS79LGKfQ5ajhqF6nf04jtKBMDFYNdtK3TTTS6
         iKipjHwIzqPuqmWhiX6tqrNN1W3wn2FEod8+TrKbU5dTwYkuCB2t4X2hVJCcJrvpJ8co
         QjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454929; x=1761059729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiOXvz3p0iDVrGhzRlMs5DQgf7JeJiwBe95U5RWF0Dg=;
        b=Lx0k6Dm93+ndbwbmd/C611QBQm2hJV5R2AG1jZ2vtH8fOJ3iAgHf7rr0Rt5PrTO8KR
         z1LhL6ZoOGlpHuN2ZeCLKwr/5gexrMECguAbQzkFvUdxwUmywaj4f89MMvPfXHLnfghw
         OlyUScDBJD6rkYBP7gsrG3iUsmAiMPfZAIia+F4DYI7qm1dvheBxe/Q9EALYbq4W8j93
         Ro1svv6QfMjq3nH4JXhMhskxpMEn5jyv9OUTTLEWDxlSQCvsw3/X//jvebxITIqaqbro
         m/JbcT3PaUzIqG3Qf+Um/QKVf5AKRnSrg4DT8JZXR6G2U3BX5BNKxHqPi4GOsYJwILGj
         VAIA==
X-Forwarded-Encrypted: i=1; AJvYcCWd+OvQOC3ZJqvqbqXEc8vei7jTcpdbXw36EYRUxiOz2NzS1wnSIWnpaJoxrwD0R/o6uYNUp6imdjNIDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQF19njG3I10gmgVzY5T/61TaKojx4d5dU9oM/+U0S5b1zpQr/
	A4WY+ExwbeL5NQpoYr9itPNpviEGnjaed4Ux/cOfA8G+xahopEO8aaRtjwbPHw==
X-Gm-Gg: ASbGncsUmnnQTdL5dnLqjV0lxru6ElxRx8abtlJ8qvUn7tlhTd9KZxlLREGQRir9DlW
	XQIS9qTBxZgnIxyRxKAIOiDIgW0NTz5OlFWr8UgBY/kcCIvbV5draPpi2lUIafIlsQJOTlUgzHM
	N43qZOu3PIo2ElgDTCL9tq9Jryac9vmrLA4K+NX4o3qb/e4Yl1g35Q8iEBoip0fhUC2gfg+qGwA
	moSGa2ZQLi8ePlSNAOohUG1TjHHhaHiMXMU8OfJ5Jj34Ce60m+66SA6dkbgPC96jKT/3PzfjOWc
	ntVSvhhLujy6vA+dV4z6sLKqa1iosZGlYANzdRbN8dS0ip7X6RRI0eBvPseQNFHf5FKF9Z1JwV0
	wwVdPRxFiuKl/O4bo3GXz3zMB3VRa/WuheoX2CQtGmDtgb+MAzmbk7zNoNavlQ9Tx
X-Google-Smtp-Source: AGHT+IEI0BVlTm9byP6/HRgTG7Oom2uwO7sMtrezChPyLSYd7pcFGMnXeS6UjCq7pllo5lsSGFSN9A==
X-Received: by 2002:a05:6a20:7351:b0:251:c33d:2783 with SMTP id adf61e73a8af0-32da813ce42mr33664357637.23.1760454928710;
        Tue, 14 Oct 2025 08:15:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm10258315a91.4.2025.10.14.08.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:15:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:15:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Convert apm,xgene-slimpro-hwmon to
 DT schema
Message-ID: <afaddcb5-09dd-4a34-85b0-3c9ea8dacdc8@roeck-us.net>
References: <20251013213127.692373-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013213127.692373-1-robh@kernel.org>

On Mon, Oct 13, 2025 at 04:31:26PM -0500, Rob Herring (Arm) wrote:
> Convert APM X-Gene slimpro-hwmon binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
