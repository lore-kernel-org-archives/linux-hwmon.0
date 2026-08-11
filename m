Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2E3AAF54
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463786; cv=none; b=t9hF+M3UcGLKyfEdGXdxA50Y+zPj5XUtFebOflZa3PXY2mPF77AMr1XeqU05X3nVWsf2NquiMTabTfsBckDO3dcTIPSNFOWEicaTvZuYOubVOc9ffBgKF96FJY9+e1r+mXZtrbEMwZQ71DsIyashbYaP55lsMcOk16L1lTBrlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463786; c=relaxed/simple;
	bh=Sb1+twgrOTWLGdPeeqQJ1dS+BWBviU9Qq9qcBqdu+MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3t9WEed2EAM66cQx9dTVXo9Qxmzop7m50q640Ueae1qXHkK/2DDlnhGnTgEMTZODh/A5yg42B5ow2O56LSQVLRUVqj/1qeCBp/B53X0VypiovFzf4Y9VksTtqnOGfSRUZ1Ag3su3WLp9C6BiJhEdGgJaB11tjOloJJJb7x/Xu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJxJ+7/r; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJxJ+7/r"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso864175ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463784; x=1787068584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7Um8ni1h3/FFAIOsbMa44HizVaLVoKUwq8OGzurZ7s=;
        b=QJxJ+7/rBe2W68AzP0o2g2j+Xdj8Fn8F01HknZWf++Zv1BNEH3mxS6KYbtmIsTEln4
         Vs/uI0am35121TEhhKZW+8nrLo2DUpuRxmwZCiJAcoSYa4/crSF5MB6OAkegKVaJC78V
         Ncts8LGvWaYcalwtcTiM+z9O/0oCLO610xSDBgs0+0YS/9pLjUzgL05sI5Iy96DHOE6s
         9twwYLDcE8L2KP1s/fcHbR3p+X4zSVO72YCYhVQKGH+dzLRhkXny+q9nJrvBIcHo9e6B
         qs0gC+Gf2ZUVz3u251R9XxsTHjfblsm106rjV00altt/szq3ZA8RN+MT7wLJEm0rsehG
         maPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463784; x=1787068584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7Um8ni1h3/FFAIOsbMa44HizVaLVoKUwq8OGzurZ7s=;
        b=B8rkEv5KN4+RKklLu5eHMr7fiwN4czahKnCU0yQ/ODlsGtS69lsHpX7nTQ26QjZLPF
         l9FMyiGiJv1CQkvgewPfrWLiQ6q+5NdanzU4FtCXmentrRvahTIepy/+KQV7/UdPqOkX
         4USyMVS4yyEI5TKzwH8bAWaTPbwtbvM4gDJajJh2rmzfwWyj0ly9wD611CR4rkEsy3jO
         5t2q+XzDMCOyG23wz4adDk5EGmnMx602IPJROamVjR7oT3ihf34gLBZIGsNFu3nQuaE8
         4K8d8A4t5EJ4x2C54pW8VLXRkeF5q4KQDnJPL1tZYvKc8XTD3AT4bOv7J7K1e2fIzzqr
         4e7w==
X-Forwarded-Encrypted: i=1; AHgh+RpCn0fl2JAsRqIrxBfoQWzUBSKEJbKQy45GbgeYj1qd34YKXp1lW+a6bV8mKR5HD6kPq0FAZFE21Me1FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuyaGCNtxwUqrHIvw3RvscvjASo/bKWwpxCo3Lhc2JOQ8cSY3
	6gxxeHmVyqkn4JYB2vehk3GIjsP4G+cs7ZoHhiK0pjwaeZKRaJtH5Z/M
X-Gm-Gg: AR+sD12IFbYfoJmEbCrY630GhUAiqOqUgBSd+2ANbdn2DTy5NucV1Xl7/qpMVyw4V5i
	8jY6Cztu4nLWaMm9hEDDezit/27Bo6G3ywBlRFsIz3PdDzVOgteveKPFbKcJNxzD4xA7glPj19C
	gK4SidljrjQUjjeFjqryyG9ZnWIJVToPDDTEONrK9bqsiBWkYLcVIFN81sSQ0H3jvWa2wTawHMF
	3nAZJo4tU9k9WhNRt4mBBrLxhUYUnf2Y177mP481VHYOrTkhRT1Nca33r7QrhI0VEE9oWSp6Prk
	/j0m0r+XRW/xcmPYJXo3yuC4ObMYQsbEun8epgsQ2Yd1YB8d6rwuWHj6RPgyyPoyJNLA5mtZOR/
	Aq95bI/o1L1kdg7uKrnUl32ZTeascsCO3bPz1hJz+cY7+2ZZr/hX8gravUSmhmCouUolzna4sKO
	bjmIcwgycKjGjjbVyDsmJGAwNOrw72pZWW4Z62hLeq3K1X8FkaM3FbKg9b83bLzN3+tFzriSQ7G
	A==
X-Received: by 2002:a17:903:4688:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d317927528mr51471865ad.17.1786463783806;
        Tue, 11 Aug 2026 08:56:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31623c9a6sm10392305ad.82.2026.08.11.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:56:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:56:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Message-ID: <1d559b5c-9259-43d4-a72b-c1a54d62d85f@roeck-us.net>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731113007.145322-2-clamor95@gmail.com>

On Fri, Jul 31, 2026 at 02:30:05PM +0300, Svyatoslav Ryhel wrote:
> Document the basic hardware layout of SMSC (now Microchip)
> EMC1402/1403/1404/1428 thermal sensors.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
