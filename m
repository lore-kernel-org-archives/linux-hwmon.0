Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05141686D
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379184; cv=none; b=HDrick8p0sWduFoIFe4SmxApnniXL6u5vY/FHoNao6shdvk6NUjDN60xjqPQbAZkOgrqdnXgCwxHcYUL4yyNY6caWl9waSWGhBn+2nOkiJbfUOPkxuV9BQFJFS4HD/0hUsBAtBNbqJSKtDEKtj44J75RRcVvA14B2kF8Hxf+04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379184; c=relaxed/simple;
	bh=t8E5gQQ01457+bCBT4QBHsxttb1UN0ky60dtyBwh3nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqxffLxJ+NS1NGNGTuhOTn6rCCLBW/GzBuX0fgXGSt4IJ3yoA6F/6zqEufTioffxTLHj+nsWvlPhfI/C4Kw4udLHW3uItfh6VGd3E1MLIcVETHl/1khGL07b4MPunRJG1wrsGaLbE6eijjWSvtZiKnT4CbQgtJcprVraYFGfTVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeFVEd7X; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeFVEd7X"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so84322a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786379174; x=1786983974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Np/evzwwro5HL67wM3SgJ7mXafU0epyrD8Tg6dJk+p4=;
        b=CeFVEd7XKvJY8JK5zZymtmDVUg5myYxB5onv6prgwSLDpNF/CHYAERplZA4s5RZO4J
         jKlEEdKXQ/NZJhbScBvdA+AYZlfIZ5Ov2vniAS5DPnR7NpZ8c74VJuBPlRkY25YMJU+A
         tP/Ys2/UzCOtD7hcrFfKoTSs7fqkPjGEe+8SU5aGSZtQEU7l9iisB94+I6vJpue9rpqg
         2O0eidmVXvaamAm/Pas3QghuOZ/MRroyvi96my4X12aqi+85NMfWK9DVK3foYMxfGKwC
         rUIOpEatIsG6tmOjaCdo7bXSwcQXLDDV84ubMK3Ez46aDSv1+JAyphbYjd5ZcG2frXN8
         BVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379174; x=1786983974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np/evzwwro5HL67wM3SgJ7mXafU0epyrD8Tg6dJk+p4=;
        b=XK+CaVkPDOVIKJ41xqnOkLR1n8dM0RdIqNdTqu5QNDUiyGmE168tadPf6fOeMBs7mD
         jx9YRl9hRTWdThNxdqmm2QVgXQcCm4NF0VVDLDz6gMhuVXcnaoFB0+I8uBd6q4Om3ugQ
         VDSbAnMY/UMRZi84MRZl46TBHHV1xuFy4YFtJGm3QsBVQtKfPuNjc48jvUAh7POOfA40
         qJgvucaVuQdxkXTM4nKvldkaVHAoCylaJTQX62vXr6usRCrHsmCp1YKT1ds7NWFfyzeW
         S/+gMASslHTSvctuHxzablimeIeg2NlzGjOuybj/WoELcllt94DlYL/jUd4iB6qPGova
         GEgg==
X-Forwarded-Encrypted: i=1; AHgh+RrR5nDoB6/h3n4Aou0+Av7uC3cXNsvoMnx0t32gPW5+zKHTKwtq8Uxbq96i0SBi+Wqn+TfWkmLwY1LqZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxml5qKr94zaFaaIvwJZTN6bu9n+Hhme1h6w3bCoNAwhrHvzTMW
	EU21Y3Id5tmlWLzPIc2U4m045t1p7AhCEjSiN8M9tbBWM+y/4Sv1lNiD
X-Gm-Gg: AR+sD12VSYuy+ak+58lLMbzmG5WmPm5LCyHILlXi4ArmVXrFz2eE0Uc2bjfNNEEFcSk
	XT3bL4TszSwBLao0BCd+AeYz/8p09lVuoz11wgh60HWP+o1E4AMM+7kjNX0a4awlWSoGRZaHRhQ
	6m52x7pnatk5LckvKdqnEm54QucOHPopvpY+Cj/NkWLOZ2CY7e5HczJ+EfGoKb8OWHKDqdlqP4C
	rD/4tnqsTgt54FFpJgx5euj+UPMTi66qRvlW9o8MF7XrsViMAu1TZwGGAulrLoUptGORZKq+PbM
	bYKcjYrFnjTRbeJcuE7XSatxSsBIzyLM8v7PY4MNULxImJjAzAMHrAQ0uA4Q7NOsvO3xXEpU2nr
	ipMFr4iLLOMS8AIMmxAODuSBFUdd9y66FkqZPRRpqgs+sobBnB+zcNaLzZq+Z1VwLN90xej+zX2
	J5JM5h/PStutT550yZe1y9X5GrhBUM49RoRM9GI1tVHnrPkdrizz5Qu2i3/+btDUwwlJTPOq/Ab
	nzZob3Vl/BY
X-Received: by 2002:a17:90b:55c8:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-3928479c13bmr8512895a91.20.1786379173993;
        Mon, 10 Aug 2026 09:26:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5195a4dsm206563a91.4.2026.08.10.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:26:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 10 Aug 2026 09:26:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature offset
 and crit readings
Message-ID: <fd46ef36-9e91-4e26-bd65-a75c7e4036f6@roeck-us.net>
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
 <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>

On Mon, Aug 10, 2026 at 11:28:39AM +0700, Cong Nguyen wrote:
> max6621_read() reads the CONFIG2 offset and the critical alert threshold
> registers into a u32 and scales them without sign extension:
> 
> 	/* offset */ *val = (regval >> MAX6621_REG_TEMP_SHIFT) * 1000L;
> 	/* crit   */ *val = regval * 1000L;
> 
> Both attributes are writable and their write paths clamp to a negative
> minimum and encode negative values, so a value written as negative is read
> back as a large positive number. For example, writing a -10 degrees C
> offset stores max6621_temp_mc2reg(-10000) = (-10 << 6) = 0xfd80; the read
> then computes 0xfd80 >> 6 = 1014 -> 1014000 instead of -10000.
> 
> Cast the register value to s16 before scaling so the read preserves the
> sign the write path encodes. The temperature input path already uses an s8
> intermediate and is left unchanged.
> 
> Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
