Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2653043D9
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176668; cv=none; b=cqy+mVSAectEFEEI5syDuOKzLt/iti6W1Tkvf4hIEcxPfw4N/bChEOTC+uD9nbQcCW0GicL2+1VBDxSofkXhEW1eODbIlLIAw0t3tlQkTcy/dE0TQZsxHfefJMxFpqrmHWc5rUvOWx7sz/hgDDe+5rkVCcjD21ZojJmBNTCrG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176668; c=relaxed/simple;
	bh=mtBA0u2zmGq0a2MGuIEhHntpKrb1PWHsWelPyxq+mgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LarRYRv/y36LtsrdIpQ9mEBVGDAiSZtAwh+PcjtS0Souzcm06vR2JAnobta6sSjoIF5nL0cG7+z/8AAloiNSoQ65xKX0wa6eji8hc5DMWIj+Dw8WMGBIdWcBsM3kBCGGxoA2jKJt6DNwnh4Zi9j3twsyqk5O50aH3Q0xGTJnqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW9M3/C0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW9M3/C0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so6027868b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176666; x=1764781466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcMa7YS1DgWYWG0qWV3ulpQwFpaa/lJNJbsYYL98q+s=;
        b=NW9M3/C0Kqwoh72a8iBPZCYkVd9ob0VmF5H/HFluleIZQgof4FAsB/4MbGW3BRxdKq
         WHR8SDhtaWY/QlzoDhTk+Uvj0ySFkO9npkN4bOs9DRJUaYwjBBgX2gB5VWSHvbKlICLx
         1/VCUwGsJBt0DrpQOO93x60Kny2apbNBf0lELBnHmgMlP1DLW3Sv8k6uOLw9sLX/olaG
         pDvekFX80WcDKPsOgOAHuM98/1sA3TrHt6/jqRaxLlD+R8xT0bsEBvZrO2Se2LfIjDgM
         9aUYKkPPIDl1ITCwHiOVlMRLiXOk9YBsX6isO/6oDE1lgBeU0YMzbOedv+mUiS9apq08
         MLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176666; x=1764781466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dcMa7YS1DgWYWG0qWV3ulpQwFpaa/lJNJbsYYL98q+s=;
        b=qfviT7OxvQeR0aCxUTqheAFma295vNmNhGk8jpOmTO0RqzZbxPFOA01tFQEtRFfML7
         CsVwgFPAJIB5QOL9iHr2fw7fsTfe5sKrGIsdh+xH787v0nvutmXCU4HXNS1+dhgYp6ju
         Ym+2dHyliX9yt07s9dCmbYQXBih3PEHVIb4aulhaTjhn0W96d6pbNrzAQVvwIh3/GlIb
         rkMbwSXSp2abAeguMqeGcpIoB1WSwbpTIsIXQ7hO+NRJZ56BGNsyJq6G1ON6MQIMbjgN
         UyunpMfyyHJ16RpnfKW5+f2sKDXT6yUHRHUQsiX6bEdtx2J0ELhXQsEb3WtQwiGsvgrH
         KVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxJu9qid8lHlj5vjpcSQ9Wt7Wss7sS6h7oAaSNXu3ud4GmQB5n4f2kKUKDg/mdLo4MTBhvB2K+2TqggQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyKDwxWd+/fukRHPjA6hUeN1Lfmfp4pd6OMw1GuWGFaxKNFoC
	83C7JjJ0BsQHOgddM1sENgVWx94+mp2p9AVgBG9Sa7v+g+lOWGdh+NXO
X-Gm-Gg: ASbGncv3hHQdcv8y/PZoK8sRMHFoM1om6HXNq8sMTi4pZSFWJGVKuYc8/MMqMBc23if
	XRq9JqA4LM88EVU6yyYTkiPB9XoV0NGRJddFDYhY5XuV7rJomRHdpjBFK9eQEtENX9UiHDbi2zd
	rbOWf/6Y0P3y5/hI7ag67lBCAjaNcvL9idZq+fLTzHCzdbkb6zsXRW5qgz8eaQ1cZZZYzH/BWfW
	ZSTzQV/HPZjMqjPQf1OT0Az29xToyo4nBAyX1yZxfOB5aur1NQS6HM49DKi6BpQNr/y/ICFmVde
	wZkoA0Nw5Eeu6gp0ZuuOq2jZxpjVLIo/0UwxmxYslO+PumgedEeYkQ+oKgeGvziNRtWXrGbFIFE
	ND/z534sjZeXznCoSds8logfKESYDswCSGxB3ADs7h/V2Gcyv9sZTwn4NQ6zBA7kPry1pBu/oUg
	6TpjxOiczb6ByBPUYmm4pj1yA=
X-Google-Smtp-Source: AGHT+IHiTfrpDC8jrPMuMFeq+Lh891KV6VVKCrccOalVuFiom1F//gXS/ibCIvnXaX+wwSwKlZdfpw==
X-Received: by 2002:a05:7022:f415:b0:11a:5065:8763 with SMTP id a92af1059eb24-11cb3ee2197mr4989378c88.5.1764176665673;
        Wed, 26 Nov 2025 09:04:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm96584727c88.8.2025.11.26.09.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:04:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 09:04:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/5] hwmon/lm78: Drop REALLY_SLOW_IO setting
Message-ID: <03303b17-c133-410e-b442-1ab6d82372bd@roeck-us.net>
References: <20251126162018.5676-1-jgross@suse.com>
 <20251126162018.5676-3-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126162018.5676-3-jgross@suse.com>

On Wed, Nov 26, 2025 at 05:20:15PM +0100, Juergen Gross wrote:
> In lm78_isa_found() there is REALLY_SLOW_IO defined around some port
> accesses, probably in order to wait between multiple accesses.
> 
> Unfortunately this isn't making any difference compared to not having
> this define since more than a decade, as REALLY_SLOW_IO needs to be
> defined while "#include <asm/io.h>" is called to have an effect.
> 
> As there seem not to be any outstanding issues in spite of this having
> no effect, just drop the "#define" and add a remark to the related
> comment.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Applied.

Thanks,
Guenter
