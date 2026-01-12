Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175B315D49
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253332; cv=none; b=cIPdGXT/6ZxZ65ueqmJ8BOFUt3hDQNkNdsMlCrg+IOUVqKYbNoDFqggCl3Xr2nRv3/PQNXu81xCpzqAv83dV+4wUZouh1sdnG8h5u64T0bt05AaBkMJnKN0IdyHrukrxMYWQ6UdmsugI3Nc8L0IOQT4knIsMT5DD6ttidYLWTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253332; c=relaxed/simple;
	bh=NAok6g2OhhLViFwyxa6Ddh9WC4s17WzX+5tVoYUAvPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPkSPWkQDMbHPL44rOhom5WDPnd1c1HnwUPJ6G6pYbCl8Go7VNPn+rHNeqJl/vhxaW2xiCOWmIHtY2nDhs/KMgXwm3ybWGGLN48Hn4UpfurWEGY6mhL97eSfBTAzpEqKD3x+Gd1FLIP8zE8fD1uwn273mJ5Fp8RmtTpNFG0vkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3qSC2za; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3qSC2za"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2af41f558f5so7231715eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253330; x=1768858130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1z+dFJSISv9ktI4wzjQMFpRDkU4Ow7YI5pXQfjtcez4=;
        b=T3qSC2zaPRsjooxFqsraOlEYYURLXwD3Cm43N83RhxldDjXbAJ1nvx8UmDGrExaTtG
         qnmo1o3vkO/vJc/5PX+0Of/0if8QhOYQhfI/oyAqyHKXnxcrwQbfzNrCxWkpPyEZ/+P+
         WQlM1c1mOoXzoAeTYinpiZkGt+YrsEOqTTa3U0KywbAxVySSRGXVOBVMd2++iergwkPe
         aoMZkeBy7bpSWwr4krgkoaeaOxCJoQDPpKdT78FRyvZ6U/atBVpOMOqnwLQ2cP/Ze/GA
         hyKbOr5QTOSDdxnRQWZgaKExeeU0oimGmvJ1MWAqqAg5SRWljWHC+DavvRTs1ZgU2nXl
         gr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253330; x=1768858130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1z+dFJSISv9ktI4wzjQMFpRDkU4Ow7YI5pXQfjtcez4=;
        b=niOzqbPoNX6npG+BtSixPuUkVjvsr5CSxsHXgUI8lJjLtTHvWfIe0ueKj/GWbAkaiC
         ILSBKyWTpMsNl4sz/O2gfYpt3UIGDPGRFQEaazU8W/LYWCwpYcBECRc2WSyXOUGop9rg
         SFKPGK3NF+bbEAytE1FZINHo7hQdL1yfUptKrm/wuvnjcTopFDm2pzz9rrSuNo5PiEZp
         HZ2HlsPC9I3jBZnpujC9EgBC8bYq74YljhSRHGZ926ao9PfaOQfeL1/Ym3abFZkdS9Ed
         qRENJoYS7/B07LYnSnIZKmMJHz7Cz3KBCVhu6XIj5H1BN7Dn8nP7FsAb3+aTnNp+gm79
         7VKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbqV77e+f0WpWG9MKHjoII3n30R38pZV+DONCZ2CQaPUhgrAb/IM0ns5b1Y8RK/RXnYV+D2s3Q7VEaNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVs354LvIDTOrWtdYPRslz3ktXb5FwGg/Oc0kRntWY2Tv7eW5Q
	XlREUhJSLFnRrmRO4BAQYSbjAHbaIyQLk1tzmdt04QPk9ZNon0cNR/nt
X-Gm-Gg: AY/fxX4woO6ghk1XVj9VbLgYPDyti1MRiwmobb2WWSk80ySczxJngxv5BL/GwkalBij
	wOjhBPeghhr2sGiMZahJkV6sb5D1yVpe1U4Giyp4oYUR8tHpAQF9SKY6ieIwTcddIJimrHUVH2y
	0490LFLIKIz/LS5jjsl7zmQ9tWVuvNqTiLHZo2ojBvEAAQ4+Enogs6Xn9mmrWuWRxNpGw3igTe9
	hRnvv9IjotjlxSFeQ3SEnJmWiWjyZCEfJyS03TA2gviXE2LIdCPt6c6JuQTngObYkALBekySz57
	v6LxX54fariVACR3RZYm828qBpiCdWVBNuFIM8wgjK50G+TcUp40FCdOMKJ/vl6Kx3js7l0Mp2i
	zB7SHqTaYxHHgcjit66Xh1DxaulDAkR1sriPNqkSiF4ltxnJzt4XBDnOEKdOZoN9HRqRD3PGOkd
	DwFUrn45v/U3r7rdtOY6py9QcQ
X-Google-Smtp-Source: AGHT+IHjbKrN+etxYXkYijhrJ6Izl3XvP+Q7Gj3fYSee7/caYJVI1kWMTze2pg49bLDbaHbLDvJJsA==
X-Received: by 2002:a05:7300:a945:b0:2ae:5d9c:9548 with SMTP id 5a478bee46e88-2b17d30d35bmr17272350eec.32.1768253329912;
        Mon, 12 Jan 2026 13:28:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm16285221eec.23.2026.01.12.13.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:28:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:28:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ban Feng <kcfeng0@nuvoton.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (max6639) Simplify with scoped for each OF
 child loop
Message-ID: <aa415341-de51-4e94-b778-7531ed77a28c@roeck-us.net>
References: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224110702.61746-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224110702.61746-5-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:07:04PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
