Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134B42B733
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569496; cv=none; b=FImu7DDoZBLAVUvpr3A/QrP/cZ2zUzOaQuauwXLN53F4Smy/KqjSNx+ZGr4z7idaE628l+03jnRO7uChwkyuawIFTHwl0f5hLO4KWjktjAFlJs1vInv+hxsTWV8W+RLvc2kMcUeLamggDMmgDXpt9KYhimA7WQO0jBCchUqW1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569496; c=relaxed/simple;
	bh=TpyWBTtCvl89I2VI/PwXM64XWcoldK1gMhZ8XyRoh1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCSvsX6Qc2TPY5rhXiOKtY4oKtOn+YLIwBOrLE1iBHZ+yLcYh4GRzuQqCIBBAkDEgDDEICEYXCmn1xB1p/hx2kyAmN+6TQFJFlsBkrzHiXUNDgH0YOtNk/fVZQmQRAGKSHnLj4BQt9rrimTjiV8FM0OCgFIXk8LVdn83pq4thao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0a0ytkw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0a0ytkw"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so846229a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569495; x=1778174295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=q0a0ytkwvlBodDBAaRMQyIwLGoAapp6RJ3H4Z4nYhytUygJ1UbUN96oGBXWeN3QEDF
         S8wAHu6xoAwmy8Uy0U/H83eJW79WC4NnjgPypuEV8cpfzrKoyCSgfKHAF4ucrHx0YC3Q
         pv7Roi7KDfoKATrN28d/YZafXpTQ285v6/GX2QRwme2CWxe5ek8AqQ92rTgovAKxllXA
         u0Pn9uOFLVij/21oe43hUF3BMCQI8ryOqx+5o4b83Qx7ctYvdr05VRtzlv4BZfJYCyAt
         agPIqeZHDmxg6uirmusAAd71ocz3IJ2gd2MWAP6om7tDW8n4pV23bKfiIcEDz8xNpMN7
         C7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569495; x=1778174295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=XvYjNaqVJLXjYQaZXYEb77gcClPPbSeblcjLFQssQi6uZuIutaCVlQcRXUfOQO01tA
         YRrV6RtqLnh3dDnZSayE5chpl6G0RTkSr15kPStXuEW7OIJFKyKq+JGSdgEKjW8aCEml
         AKnys0L0DA1UEA6GOmi8rPxWuyf6PbMkHbOoauwUC3zVxrK8LOfWtt88WoW9+PhqjmA2
         RpXuvx+6E+P/nkFTZODvsNHjMPhvSrtPMPBRC/+d62/qJhfsxxI+0Zd/G9gYQ2DQ3BmU
         EAtk0F7ZUnIJNmbUcscFMGKMBSe+pH51cQKU5QETk7r/RKXxxLHZfHoy/D4IMENrLUo5
         iamA==
X-Forwarded-Encrypted: i=1; AFNElJ8IKprydxWQs4hA7MkQ2kTlgzXvO7+H2eD5iYbLf6pRO+aR/5Zs5aFTNwmszq+n0qOG4wblEvaDOptgCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXURVWOMHGZ/LU1y+p6CdNh53j89IsGwmCwHYOYCRTLLKTKg7J
	HeWA8XauoJAB6przcW0Ag3c01qfBs+OeFtjogV1cZK9wxiCjNRObl4O8
X-Gm-Gg: AeBDievFaP/QYIF2sGe7wkTOSTkL9PnPpQW/8Lrl33NMlAqYyOLp73M0M5IjfhW4j5h
	L9EeqlOYnAKcdZ39ZGlgmkQBs1wBGX6F3plMVepYUp2A6D7lASXC0f9JeL/vvg7ozCt5BuCeSvr
	MW2KOphT1OUavMNYMTQfzlfm6Ir0d2ZRiHscZBgdkg3cXWD1424xYgVjHDaRg85ef4oUcD8in9h
	q3WFgaMf+qu95VAoRIkLJHQLvD8U2s3Tqntr0Wy29wE4eHe0vyR3eQbsyg7BfOe7jGIg/ySaIwd
	IOdqQEeWgjfzG7UYF/+uwUkT6JlXUtU3Oyxwhvc/HuUUfbWOrb1o07pQqpfxzgUmRxuZp8ekI5Y
	IMWbkhnAweqHxjqJYdIH5J0dN9K9rhIljciLmnSxRw62Y6NyWXVdId1buDRNNYINx5N+ITyTg0B
	DUL7PmTy4P/K+fc6iXFD5FRPF7fMisDce1cmdjnSCa/Q93Fec=
X-Received: by 2002:a17:902:9a43:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b9a24bee86mr28418795ad.23.1777569494783;
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad28c1sm1886155ad.34.2026.04.30.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:18:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add MP2985 driver
Message-ID: <cbc39633-65a4-4313-8035-56d040def5b2@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
 <20260414092921.1067735-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-2-wenswang@yeah.net>

On Tue, Apr 14, 2026 at 05:29:21PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
