Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E153DA7F2
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835205; cv=none; b=NMbg+PVDT7e9NU0m1P0gcnFSmVz5lHNIFPvVd/Pq3gcXfC/j+5DcjNIP/Eev82pa0zGYyCEmqp5DLjiBlJNHl4L4aaB9QSPbYew9BiR6cL5QFCtgKxxdLeuyrAmURKhiJ0QjxZMd9x+kRvXaRZhtc1VPuHYGz1UZuivEaCqUwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835205; c=relaxed/simple;
	bh=ZZC/7pTR8Z+M22c09b+belFKQ8vblnXKj0LhFjGY9RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPZHD2RlCg4xiIoQ5T/uE/obSelWIdjBuBNnavHpbW6VJPwJxHVC219eslrQo7d0KC0RXRuiT8G27m7DD3i4nq4ukEGakWMnS5IB0jDNPLwQ5yGSrHeN1Cmfhpt6RTnUln3hPlvWE7yWu78fOukuLeAP1nI7izt0+3xSE/DiL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJbUy9Dp; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJbUy9Dp"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12713e56abdso1472233c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775835203; x=1776440003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWET2ruDlUVRXbekIo0f8Ls4HuM1RWM1Huitb0VTboQ=;
        b=KJbUy9Dph55REDZ1FRu72OqpvDswTljW/TJNVHaN3B3xDAwoSIK0nu9HxHQVF83hDI
         n+sAz7pE/ayC1HdcylhLAO8ZAS3Xiq+pO+GSN4l7hQLKwYoxlyviQ1YujDMsBAKiY4JI
         9UIGYI59s2EN5LgHdaxMXPET6hsTtZ6MebaRiSC07X+KTj07FGR633kMfBLa967V3rYp
         PU9gYGXxYqz36QbSVygufY/ul9m0niq27QPKH/8gluu+/mjesh/bzc2+QcVBH29RNn0j
         0Je7jhkJ19teX8kGDKm6oB0/gv3nTEPrzTV/klHtwGHGfTxkaFXDX3RbBjZvchqm9P8i
         t0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835203; x=1776440003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWET2ruDlUVRXbekIo0f8Ls4HuM1RWM1Huitb0VTboQ=;
        b=r6ErmVPbOrh6hZy7EA4C/+9Xax0naXEZKtlk0cXIS77yLdtC//UWEydv9sVA4brszr
         50SLDzkespB1rLvcNTkD3GbRdGS3nPYqSrQKdajzL5yo3heuMyiyPOLs9PSiLQO8BScL
         gwSVyP7+lKL52Ic9CkOdbSwsZ2DeoaakCBw9ScoZ4RvdK0P/I60ZAbdVOsm2iHDUfWrk
         jZOIrzChaXB42auJ8I1J2rqc4Ly6qqETDY9aJI+PRTgT6IXgSNKUCa7/wYGn0W6+VbcM
         NhxOM3U0nUAbU0ZNHNIxEEoXjzGzZBBSV/lNWkZvF4NIyCgFf6V1pHZudTCzLBcmeTF4
         WQ5w==
X-Gm-Message-State: AOJu0YywzBJMsHIpn+MW7vHv22kmkOc9YQT1HRmGZfV1Oci0umnniXPN
	Adj8j3HSCWih8HgRJrNoon5zDFN+0wbgCsD6CqKxTOQZi6X9GpRBAycq
X-Gm-Gg: AeBDievLOq9HtoXPmHK8cx9dBP7U+lZO4lhM1rjvULH0JHX3ejTzfN8btkiqWqJVauA
	gjwDzJpbcBnxo1Q2Bh3M0gFQr+s7lYGVfq2bA3GOo8RZ3//LOd/9DyrGc32fxy8eVTVZtAEVr0m
	YpNyqa6pDx247TgzZQsgQjz6KRmQ4BfREhmkl1+DKUtQbTTF5oHYHu7ryZWku/W4Q2cNrGswbW+
	ufglw2+tAjZJ2bMPq7Ys2S9TEW0v3/NabYFFVz8LxVUdsvsVS/xlLSfl1/+TnEN1Vk3l66fomXo
	GmCE9vvB5sl6ku4bM5aBaCnF2UZj3sLyWcsRGoc2w3/sravkPmCGxKdilHjh2dJWk7iYAioPJiu
	OG+kWHzap1fLv8kjGdcqsrKpV6qSIFmmUvMP/K2a5/UCmsPZ7SlXhYhnGwwRUJj8H093IiOPiBR
	V5rCBZ6HLm/cpIDDY46vYb2JSVtp1y1JqIbcPsM6/oO6Ju1dA=
X-Received: by 2002:a05:7022:2393:b0:123:2de5:346e with SMTP id a92af1059eb24-12c351300a7mr1590257c88.0.1775835203147;
        Fri, 10 Apr 2026 08:33:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34352490sm3699164c88.0.2026.04.10.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:33:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:33:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (powerz) Avoid cacheline sharing for DMA buffer
Message-ID: <7e05f89e-b719-4ba8-bbec-7f9cbfd51909@roeck-us.net>
References: <20260408-powerz-cacheline-alias-v1-1-1254891be0dd@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408-powerz-cacheline-alias-v1-1-1254891be0dd@weissschuh.net>

On Wed, Apr 08, 2026 at 08:45:50PM +0200, Thomas Weiﬂschuh wrote:
> Depending on the architecture the transfer buffer may share a cacheline
> with the following mutex. As the buffer may be used for DMA, that is
> problematic.
> 
> Use the high-level DMA helpers to make sure that cacheline sharing can
> not happen.
> 
> Also drop the comment, as the helpers are documentation enough.
> 
> https://sashiko.dev/#/message/20260408175814.934BFC19421%40smtp.kernel.org
> 
> Fixes: 4381a36abdf1c ("hwmon: add POWER-Z driver")
> Cc: stable@vger.kernel.org # ca085faabb42: dma-mapping: add __dma_from_device_group_begin()/end()
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
