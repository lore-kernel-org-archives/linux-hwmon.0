Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F4427A16
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748113; cv=none; b=Eono06GAF0+6WB+g/f+BLGChNoEB5KeNlyc5B7hfJ80LLQ2wsyjIxwX9T6tpKOap68BfUrmpssB0n7+3k22OfjjdnIjiWRRiqfC9bdSUS9teanYzjl13tbcvDvYPaQDy502QteW+irobufMZm1uMTQy1xxOgCV8bR944E1noUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748113; c=relaxed/simple;
	bh=i8ONpixMujFX/WAcwrYwZhC6OCLzpFUm7/dL2XKRKRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VthXF9dzVT3taMNYRzzZv4vMtJB1A0TnnANo49FsEnHY8FPoExgqqBmoxx8fXpC2DKZmmvUuoNkPIP+DnF8jd8UWj9eEfWJlR41Tv9xSNKf7cEPdMny6a2stkjQA3eYlODndsANwKTtGdfup56aZYXcWtocsmRM7+kcpA3ym5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmHhiotX; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmHhiotX"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3078e0dcd67so6087586eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748111; x=1783352911; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnfYZFFV0ryFVGO4RHx8uwQIWAFO9eQlXqtuzCiwiyI=;
        b=cmHhiotXAi/+1/XBDO+AngGh2lpfN0cq/Jo4ixTa9BY/pm3xBJ8AkhJlb1GqHoz+Iy
         8e0BNwz69DsFKJ8eUzNk//657bOzam6AIdg25SJlRsS+asTkP6v0xiyfRO/r1F3BNvH5
         E2O7nH3JZyAl6h2DtvyQZgRdffeBAKVqNFrQZiMdqSgt4mBQtBo33XZGgDTeG4Ri7Vgf
         2UFoRloJKJLX7N9jxD0mdhev7YpOOFutRt7Jm1EaQYDAwdvQFjoklk129vI8P1+ryMWa
         qk28TrJpOJbqVbyRbHxgBjmP+zv0J9fsh5jbaub8h8pjxQ3oDc7PNzVJk/JCVVzcw1I/
         xgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748111; x=1783352911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnfYZFFV0ryFVGO4RHx8uwQIWAFO9eQlXqtuzCiwiyI=;
        b=loAwd+02mmqgD9IOxIzHly/clEz8+buGl4319MKP6KkOT6i+l4eNe0e/UYAI6SaWtk
         FG31qlbj+pHjlNRoPYS3wkJSNJG6MA8BxMrHaOIEX451jFbKVWYsnlSzADvsB0mMunxX
         JdaRlPbsTxeSP+ovB770eOVdXgD83BUnzLz6b5na5hmsNVMhzT8KHKbbAHuMIO1tOpcy
         AMiexDwTFzi/upOeVZMMgSQvH4wDkTkmN0/TCQvz6ZWZBx9Ghd38RMwIKYPCv3N3NBib
         x52QPhVuCRGlvkWKApO+S4hJwI/BpU/JhEAVn6VvCM/Pgkz3Vj6pa73BnMyEtCHAI88E
         QngQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiNFCegRT3u/sMA49zPD9jg1s3EcjHgfG2czycug5e7WXuBvL6j1+MdAWqlf6FLSNrIX1cIUKKZk7dVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBL4LqYjmDipAGunj2LVQSoebh/VvAZNwrDua0753bl1j+bbic
	IHyPQ3qbyMYngju8rG2j/XyASQsnk7YAKG+p5WMBxogzjCPRFHcfFOtfVgt3vg==
X-Gm-Gg: AfdE7cluO/PMoDEvD5pRhPkkiTLGDM8rUDkx79877P5VdG2c0sBvAveZQl1R/9jxIGR
	twegK7fnJ7SxaTJ/xa2wwTlwV1Tt8iZQ81QC2/xKgI9c1l4c6grwqtshsXve8oArOMbhT19r4hq
	mJsaWzKX6Um/Iqk4FRs4WswCCIgHbH+GK94+yz10cHpcqmwnSots39olp/1fSNuLFEUTu/KSl8+
	byB+t2ekUxZvFR/jeF1t7bF0M5xQU7wEvuVpKCEEokS778SNnYcSzl0ItJmaX2X9YN/8BQLww+W
	Ax6VGTeWomFKvvYw5A9C9iWdsmfVwnIAI95xObJsDyTsxZFXuWEUbyYafWT4C2testKM2sVX6x3
	cQ+cIPLlm3Z5tTVVCukBq0elXTRKXPSSNC/shM7NMa+VUqfuH4sosHTpR9WKnUi/q+99/pe2OA8
	h8UiIm6b/BNfPsnjoSn+8mbc39zQ==
X-Received: by 2002:a05:7300:2150:b0:30c:472a:248 with SMTP id 5a478bee46e88-30ee14ba3aamr4290eec.32.1782748110867;
        Mon, 29 Jun 2026 08:48:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm51583295eec.8.2026.06.29.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:48:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:48:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Message-ID: <b1f32693-608e-46b9-8fe4-8878fec580e4@roeck-us.net>
References: <20260620011833.3568693-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260620011833.3568693-1-rdunlap@infradead.org>

On Fri, Jun 19, 2026 at 06:18:30PM -0700, Randy Dunlap wrote:
> Expand the table borders (upper & lower) to prevent a documentation
> build error:
> 
> Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
> Text in column margin in table line 3.
> =======================         ==========================================
> power1_failed_fault_log         Set to 1 by a power1 fault occurring.
> power1_good_input_fault_log     Set to 1 by a power1 good input fault occurring at PGIO3.
> 
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
