Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753F28EB;
	Wed, 29 Jan 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166672; cv=none; b=TQIw2tpFb9txiF1pSGAglofe/AC+wHXgtz5hCZJxe99dcmLatA6kGHTs5Kvr486MRMcNRHLnZ2E74UrcIF40xmb+0ubzTjtGgXg+I8H9/OY7R6VI01+FvFvJfd6IOyuDqA9AA/ynIDcjmS/HCuXU7+Akl6kNj0RJbXKjQmCwJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166672; c=relaxed/simple;
	bh=yOaEsussPoFBUXTkYnFhiCzEDO+UdfBFLNm+VUfVfs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rn1gVQNRCzNSWbX3AOiR2buyw+fvWzvYDBjl7DYTPoNS+bqBf4P+Vo6qLkal0DPCgJ+VsLZGxeanPiavXZNI3iIM6MkYYxtaargT2awFiVxJnSIgqEqwSf2VFKsvw141a4XIlj0Yvcwyr9q0m7TF8cyI8LQJHYD016UqRW9LQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oa3w/sw8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oa3w/sw8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21c2f1b610dso9152725ad.0;
        Wed, 29 Jan 2025 08:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738166670; x=1738771470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8QbVNZRMcVv2ZyVBP5Op4S9+xpgHdRPrK8dOKSdrcc=;
        b=Oa3w/sw8+psmmprpxTGB7tDuI1j3RKkiDrEUD/3MeuEO+Qu8HfH1SDv64XaGeGrBHQ
         UYy94td84azZcVmCVBrS5TpJhaT9mpXLNVA6gepJ5B+Cv8TBHKv27OkLYn9sin+mkfMX
         4qIA3YjiOsGQb1/I/CZpMHv6Mniip+eNbSEEOUMnGWtMqk+shnzemo9tbru+drRbOF31
         6pST5IUzF8531NR/7e/KWucB+LMYMcvYCjkyvCHmUDjWNfbxnKqBORpyuMYF+0Cbnf+W
         jk7yGbhwoqfp6TnMEhiQcwohXyf9EkjS8zfzcB87NLga1Gjxh8d4mf2k59OWXC3yKDvW
         aDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166670; x=1738771470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8QbVNZRMcVv2ZyVBP5Op4S9+xpgHdRPrK8dOKSdrcc=;
        b=c04u4Cy6yB+BjKeXI/DSg8TrzGq0LkPk6ebALLvQhc2koCCJUdu7LoaJU/qbRFXSaJ
         x31wkCaFHkouMluNZl9+mx6LNCX0D1leLJFtkC2mvZUQ5fxxzmpx/4G5X2he03CmoUn3
         oZ7VlZMk1iWLd7DJVSPRYPidHiuUVvvFr1ZstTquT/EGWIMHcV1EB9LcqDUZLUGllfNV
         9CRK75H0g5G6XrQo812/pOYgUbjCFO3SVbuIPcYZIZDvAfH9whpJXpHggkLd3qOY/Dul
         3eGN7OzPKAYUL4SpJril9DDL5hT3R4xk74v661wYoezC98nDanJEWjc4BtyWScjP24Kk
         VDVw==
X-Forwarded-Encrypted: i=1; AJvYcCV/bIjcNvejeaubMoaYXWK3Yh5nvcDBsXAJDQNID1SIyxE2kckpgKNGjtN7dgX8NiNqZLtCofbhu1OtmJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyyo59vvQcvVocBro5nPDQXkOF4POgccf59UyInNBgLUzdLowV
	9mJOoh9WDwGFBQc8Wz6F/uFwOcJlER5mszi1irVy0DTotbg83VJKhukeJQ==
X-Gm-Gg: ASbGncu90pQ0fV5OYuR2zb3CxvFdbpP8lIXV2PIOcWgiMveaWMGNVleKMFJ6hVNoJXM
	osw0jEhexFv9oosq1wRjrYpgj+6kt7s5sbANbixMtd7K/KJN+EJ4VmtAU1c9cD+xfzYV+g0q9WR
	PNGODJv4NRpKBjFbBYxL9C100w5HvEtBBPwTJFIeUP0D//+ja0oYUPbrwF5TEMTE1LKbhqHx3Kb
	8nXI2xZbZmkg+XqJeCMCY/WwzBLQyaor/aegAspZ/0PFwRVeJtRKfJcFod7DKD6p7fQapB/AGX0
	XaFFriYLpqFedTxP1tEyjiOmpQwq
X-Google-Smtp-Source: AGHT+IHp1ND/1vgrv4toJ9izZ9XKn7Uos2tcfXdefLzzzRQgPCuWDDcZfO6grF0ulskKy7YsWlJkyw==
X-Received: by 2002:a17:902:dacb:b0:216:1357:8df8 with SMTP id d9443c01a7336-21dd7de15famr56361035ad.43.1738166669782;
        Wed, 29 Jan 2025 08:04:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fa81bf3sm10464314a12.24.2025.01.29.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:04:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:04:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 1/1] hwmon: (gsc) drop unneeded assignment for
 cache_type
Message-ID: <16d2ce40-325d-4722-94b6-82fbc5999b83@roeck-us.net>
References: <20250129152036.1797725-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129152036.1797725-1-andriy.shevchenko@linux.intel.com>

On Wed, Jan 29, 2025 at 05:20:36PM +0200, Andy Shevchenko wrote:
> REGCACHE_NONE is the default type of the cache when not provided.
> Drop unneeded explicit assignment to it.
> 
> Note, it's defined to 0, and if ever be redefined, it will break
> literally a lot of the drivers, so it very unlikely to happen.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter
