Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748CC20E030
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Nov 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763219712; cv=none; b=WC+6v58aC48liwCVs99GI5478kXnpBGbsW4RCLP//mSQfjCU4RUAS7VrSGp8Y1AuKCwhpOLxfZxCDb+G8y0swdYoJKeI82bos88TaR7VQz1NXWyzmZlGzbcP5qNRrdiX7icaMFiO8DceNbNBTUb0/0VVHjY27UeY1i1T57c2HBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763219712; c=relaxed/simple;
	bh=iC2P/olxuaRhoEOZ5G9GKyvPMIzT+TgbtiZDDLFgqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMap8XIJQRx3PkeD92RRxBTh0UCmaurS31u7/uwXr4L9ATDyJhSzxdkEHdPvgDMU/Q2lzCI5cBytDnSCxGCxLUT4zQM46uTBb3wVnugZOiTYLQGoSyg7vksmhr8eqkn2hTLlDUAFWnxo2x2xqYJfytscDA5F9UHtTCawqX6MdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B39go3bw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B39go3bw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso1785883a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Nov 2025 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763219710; x=1763824510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NABF3TsnCCexfj65arckaNkOPfPx2E47DSFG3TtkK9Y=;
        b=B39go3bwM+Mx+ydrlzdiuQ5rJV2f4Ome2qVp/AidwKSiGNCg3FTZbP2jRZ7pPHfAnN
         5nTti3VzbyjPYDYoO37aAbLpoL6gyzCJvHjlqJsDwbs3ml0NTjlCNr43yKZXzFleKPOe
         jg7zfsAmvpzOQHf1UbzKcOegbbQ8mmh4vaWxrJDHIAJA4cIXYbG//bR8fO41Ivi8PCyM
         pViRD29RSDCw/TM/xCYdsLxLEGYjwufS5vMzKul/xM+zGonyUf8Kd5S72hlQwLfxBWh9
         qoLZcj+QmxD0gPnjzoEYcKAqkLnaTmPNxdyuCZbrynibFvUCAoqdF31YRxDj4TRKq9AB
         zp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763219710; x=1763824510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NABF3TsnCCexfj65arckaNkOPfPx2E47DSFG3TtkK9Y=;
        b=JGtxp4cRSTIk791EW6NRhSARVNQC95REmDzGgtbzS5f8kk3kOcqH2NChwxfHc8eTkE
         HWTbNClynTBMxa529JR8a+jXBF4ynQoBg8yl4JmBBc5UGrfnFLebj2VjzJqvCPrGzkd5
         LMgK7QfbBGybWRxqHFC2OBvznheZ7F1dXEd24ZUGamIGkW+4gqT6fVLuQqWf5/ZGFv2g
         asfToCZhKdxa7+3cH76qDZiHoailIzjdwanPhCMyWmqM3GdgdG+pSMe17DOy1DA5Ax22
         QJvCnOIN8ogtFspZekWtwP9XGSx4HGPsCzd3Ua2ZPyBQYHC0AR7yfOynIOqQuGh1yz//
         z04w==
X-Gm-Message-State: AOJu0YwM+ZuCQ6ygI7ebbuj2qM2nudnZt4UszUJ7WW3/N7+dLLc4K3wO
	H4mTYxuRjnejFQvTv3Qw1SqhJ1L6eOyw/cFP/8HwG/Opy+/B9a+oTSxX
X-Gm-Gg: ASbGncsMl+ydgM9r26imucE0ClfZ0WKtkjSIR0q9cI3la2uxhIVEi8kSiuJg/MjN09Y
	nIl0PnzhEXKUVMdXIqmAHHfH7D9+lzNp9+YxHeEKUVAhjMBAfAahPvUo4C/IQ4JbIB34LJMt5gh
	opcBEqraN+m8OYh8RUAhsD1ZhCKp2l7LtWmudGqC/9yB33y9OvUaqO2qSjhPK863DP8FFbWTWtp
	rxO98OTC605rLKrrfjM6v6TwIUFpn4Q+g7gVLwsaVz9tOvLstGoIv3TDYSGYpTxEf9QRjIwLBtO
	D6fUZ/mI9nkQoEGDsJxlq9uufQf0GX1SFQeCs1fypd0dTmQnzVRRHQvZP9XSvaS6a63xHy3ofo0
	w+Nn6LvJaabdP/tf/SmeBYeQERVFDPuS1VO/7wzFOLGDAMJQvulyy+4ex+SlGpCKYl7xq5A5XW1
	j4lMIsmkJRUalSpuuS3Mxg7FXoyQITn1YTdA==
X-Google-Smtp-Source: AGHT+IHxIDzgSZ/q4oVog+dOzIm9QtKIazWUfBvAcFoMFTbY9l+gvSLR/P1DykK3e0jgbu766g8WSg==
X-Received: by 2002:a05:7022:7e81:b0:11b:9386:8256 with SMTP id a92af1059eb24-11b938683e9mr631277c88.43.1763219709482;
        Sat, 15 Nov 2025 07:15:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm23133075c88.1.2025.11.15.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 07:15:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 15 Nov 2025 07:15:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add entry for ST TSC1641 driver
Message-ID: <2b2c987f-3af7-4f00-912a-5d34b40d81ef@roeck-us.net>
References: <20251115073134.1345535-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115073134.1345535-1-igor@reznichenko.net>

On Fri, Nov 14, 2025 at 11:31:34PM -0800, Igor Reznichenko wrote:
> Add myself as maintainer for the TSC1641 driver
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Applied.

Thanks,
Guenter
