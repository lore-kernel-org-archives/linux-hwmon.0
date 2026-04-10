Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970333D9DD2
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838144; cv=none; b=B3uJgFy3/QZNcokn6ffPySog/ceMmlGNTBg6EQOH9iHGdhCgGmHVWZREDbMugLa90WA+EALJFTU4RWLIoNEiIM8raT5nEYm/0YIqlqCjCc1TL4G/EasW+msa6psW8W09TCtFaQUogT0NvdIFV3P51mY8eXRsvRkeZeEajw8k1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838144; c=relaxed/simple;
	bh=BBIkEk5IWn0dgN8UubTAKBIOMBYqreRBUyJgp0WUWdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD9sA8I5rGQFy4ySPmzzRccLkK/0GyKaUQxVBy5BuHgjw7FGhWQlC42nCIOwz/OBp6f48ZvutM0eQyfBhFJmNaMkey1+gZt+W24iTnXZ0i0ElrVdo+NEWuflQ5JNzXcDQwzzqtuYQXAVRggVbyfN2j182dUL1P8QiWYsBWRd+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIcQ5zy4; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIcQ5zy4"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128b9b7e3edso403290c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838143; x=1776442943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=KIcQ5zy4WnnWRfT+vruB+DhxD+8sbKr00/OiqrrZGReIyT4YTyfsLmVjwLgFWTNVHN
         dnjIZhfj4MTQB2UsLYUWwhdwWmxaTFduiUdrjw8tXkECHSFJ+dDpSCvxMtNUYYqixcnZ
         PN2mi9JvYnFFy2NYz3i+ZBnGAsieDtoaQxWh1muDdgGIipaX+i5+mZxcP5ZI0JOlNMSf
         ABcQpxq7CmdvxAGbabLHqRcp8O8XWIIxkszwI24UX1jJYi1GSJMp1BzVDpdEMNdka5qJ
         WN37W5cGxZRsCaPm5lU8gnebn17uZ/UzfJknmwvTB0XzA1V9PKn+IG04ApUnYXpMU7Of
         9f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838143; x=1776442943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=WRzuOAm40dEltVD5MLHmDvjxLRXrgiTgifYQBxrrrw9TBfBKQMzmu6gjx4+QWwrps0
         0MR7nd1BXwz4IPr7k5potfOA2QaGTxu0ytz+AyzT4jj0909bmmbLFlhu6RM7onfS5EEY
         2j1ds7FNEwRay3LAj7hRMe5bKa2OzBbmcLYGPq9gxvAESlmaPWjIsXzjMtusG/Kk0ZeS
         CcKZfAeOUGbNjKAbo303xK8NteMjAQV2gBvif6e+xyUjK1JpbhhfB34ic5zEkuk01rps
         ToesOfvX14OiR6KyaGXF9Enw9I/KXAPHx9poFVoJlf61gDpB0vfBykO//eJp9MrPsr6Z
         fCZA==
X-Forwarded-Encrypted: i=1; AJvYcCUHzvRdcEA071Ih3j8yWxfGN3DU2/rv7OdN2DLDHFroaLEKdnOXMSsCEFk6rfnVs3R6sX+b2BZEJVz0OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDipwFD2smgPALPQhPKUd4H5lx7HLfujsX8Ml14ioXi3lQIwpq
	e0UYa+eaAqehr+R9Bp+n+KS0CYaMcaf0rQIb48TZgbWg7wrQhjVn1Uhx
X-Gm-Gg: AeBDievai9lhD3ocfy8aYYR63ibRSPT3N23gUMWbwdcoMS6RCrwlIeGttt2Y4xXz1Od
	v0rgD7ZdPkOGvnSRMtRGPk3FhBsQBzgPfkuT30rFr3vKLYkPuv3HLTW3HsREx5yCuy+TiEuixG/
	geZruUVUlvgaNH2mfhRqLU9yF/RZNnCtwU13/krUBhlBe6x4MxxqMUNtiI6bDOeEbnYWwCysICK
	A831vVZjdsX5JZcQx/ak/fPE3JNSs0h0ZDNQbXTq5UTY3R/KmEwkqolTtr/FLjcPM5NLGGtmdI2
	/ulpN0k7TmZz8nHWdlYkr1H2/pSHy1RIxcWnnKV9mgskC9wRO0cVb5pUBR635LdB9PvU4XLnsPO
	NulzCwQVr/PY2/FSR6l+mXSu0N225eOdOGBYC0eG+ko0fdKPuPOgzcN+lSKqB+e5yroGHt4EjaC
	T3JtBvbtEzV6MpUmG74lgfC53lbB7j9hodEuuVbBdNbQKYPCk=
X-Received: by 2002:a05:7022:60a7:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c34ef7bbbmr2055222c88.33.1775838142675;
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4445290c88.9.2026.04.10.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 09:22:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v12 2/2] hwmon: add support for MCP998X
Message-ID: <3025e1bc-9801-4483-b03c-f638767c1465@roeck-us.net>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
 <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>

On Fri, Apr 03, 2026 at 04:32:17PM +0300, Victor Duicu wrote:
> Add driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter
