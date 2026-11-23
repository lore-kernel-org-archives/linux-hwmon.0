Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440934;
	b=3grfVqGjXfpFAsUv8eFm1dCrzs+pnSFAkrN3wX05T0Lsg4SYCPdlv/FadiZq1dov2K8W
	 kR33rGrdfcfTZ651nBgjmAg207LYf0TA0v/Z5bpgKeoKzYhz2+vMjcmBxi4tPZGFROcCj
	 1nCagDWCi5X/oZBUFzohF+wR9tBTJQmjOVvXG5r3oonnV0UhFc/fQ8GbVeRu8eAeYYjtm
	 zAlKosFFj8A8uvzXQrLAjfme4LSG8s00AWvaflS8WKRk70X2XIw/b1WmPrxrbOQwb1yXV
	 qRBV+YW/AZehksh8c0bhsA6KKejcubQaLVlo15TsrVseLvodFFZio05XjrvZwGogc7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
	b=seDzoYwQQWzi78uh9vhKZfQyFAUsM0MRZ7H7ooWp2pP2Sk80BGnP296lDFsIRD1ChLw2
	 C/nP+So4zu3nBXO65k4Rsq86GqXVgcik2jwIUt9uaTWU6u1jvFBo5SKR3J9L1H+HQBFYv
	 9mjXjl5R6mdmXg5K5BaI8ocwMRkv/7dnUh9YK9ZWBACDCNa7wDh8NZGB88Y7ZWa8TKmYF
	 qsZBTvK1JpN+300Q+I8LUNpcXfDSIchFCCuL7RMbZgp/ekovBTDOzeWId0B2+vF874JBV
	 5aHd7YAE+nLbae9KFk4J0m7b4qEFBoxtdY1o1/Ly4vbEqd0ZXQXZvW4zK660xp30uvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/ILaTU/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F5606A681
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8F5606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/ILaTU/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so25822215e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440933; x=1796045733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=v/ILaTU/7bWg5GApb65WLg4awDJCuN4p4XNf0kXaMPqk/HUIGDI+Xbq06i9Utpmmib
         OQqr1eVnIILeeQbJEVc6ncw8bSGgj3jeChoH7Kk9A10TQi44Ww+KonrQbb+HgffZfa5x
         zFhE3RBlJLcMCY1gvOlSZpysY7c4VWE1XkPTGubFxj+AIgaXW7naxrT2vgHXIDW6ki9l
         hIOob0L9YMtximd5TaiqkDZTYXkuCXHIT/d3HUok6+HqvuFW6kipibWhKWZ+yfM/8J8J
         t5Jm4wul520REt2NLt/eRPryrwbjLY/Me7G/0vHxU5v2Lo8Si9vl/jxkpMFKhXHiltgP
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440933; x=1796045733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=a1ZjNRF77f4lQ6d4m4ySH2aXMupgbEMx4dIEIaOFDpaTJcVK3a5OHMqY2V/4kSnkRb
         djjiu5vnVClR6twror7/iQuqF9i4F9lLw6CH3dB2c+Uky4O1RsWYXWfl6TWz77euN2JB
         SkWbiGP8YTMPpyJN/q2IwJHYT5bT4fzCABPjjjqKvq1K7UrMnI/vp4EYoHUePDd1pTqF
         KA68MwB0VIdJxbLcvFB1I6hXS/QRc0gGCZdcJ74xUMB61ewaNC9P2fh/YytZ8gUOBKLe
         e58f5vXBi9OIsA6PQ/Pd5GJWBUzRWU5Lkm7ON16i520yoTcFWVar5qsdNhAwonSwok4l
         fOPA==
X-Gm-Message-State: APuU4Z+4MVhI0cY0J6X6MGSbzS2HA0tpxPvCckGMoNhmeyACajSE8G8F
	oSO12tMbpBeHcJDZ1VBf45amLt8N0ekEsn2mFOsAjgRjxXIeLfV0hpIC
X-Gm-Gg: AZFdTZcReLGq8rjQAtlxeuc4AVGN+Br9LQrqyhBrMjmavYb7BX03zrXaKEsF5nJ03rx
	2Xn/qw8li5yYAghqycN0eo1x4oxoODCEllecZcMpuwdwbvcIpAT+o8vP3Uq6mUAljc0JUIm9Mgu
	QCzkmm1T2cS1zrcR9GfYwpM3WYaCoAO+9dHbfmDqXXv8YE6mKiJw/8a3fWC3uB+92iNeuQd8Px9
	LJXR1F08V9P5SPO6IxrY4tiZE5GBSRNm7NiLMa4YPIwRZJwIUzqBsVHhsNcp6jhX64OlMvmUg9l
	gHjjEG8Dyn8SvhahysQbd/P1C321/KNND154rMN50XMAtKpAsrhDMpw1CENUw11n8yysMCmUEKO
	L+5X+GCPC4YZ3wa9XwKS+Lprl2oxpCDd68aJ6f9ZHoq1Dm6zQrjPEfXEP0bYSLznwcpzinlC+Dz
	6ziNmvKMk8WRc1JDjrHBnc9XoVeyH4EtIgop3Nt8Ww/ffd1iIW6epoEVmTnAu0LpsFTrAqeq6r7
	2m14eD2JiXrkPtwWmGCBH0XeSn5TgWoQ9Z+kBtgFjO0n7Mn946aEgsxCqk6YCR19xpIWJagH99D
	WvP+Jfi1CVWal07uUjuYwqW1vlhdIQEqjahvuyTVIiyQvBuKYI2NsKc=
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr224576995e9.3.1795440932435;
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm504183485e9.11.2026.11.23.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux@roeck-us.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tony.luck@intel.com,
	ashok.raj.linux@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
Date: Mon, 23 Nov 2026 16:33:38 +0300
Message-ID: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123080822.3426355-1-jgross@suse.com>
References: <20261123080822.3426355-1-jgross@suse.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 09:08:22AM +0100, Juergen Gross wrote:
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -67,7 +67,7 @@ enum coretemp_attr_index {
>   * @cpu_core_id: The CPU Core from which temperature values should be read
> - *		This value is passed as "id" field to rdmsr/wrmsr functions.
> + *		This value is passed as "id" field to rdmsrq/wrmsrq functions.

This sentence has been inaccurate since it was added in v3.0:
cpu_core_id is never passed to an MSR accessor. coretemp reads the
MSRs with rdmsrq_on_cpu()/rdmsrq_safe_on_cpu() on the logical CPU
(tdata->cpu), and cpu_core_id is only used for the "Core N" label,
the sysfs attribute index and sibling matching. The current driver
also does not write any MSR.

I think the sentence should be dropped rather than renamed. If you
prefer to keep this patch mechanical, I can send a separate coretemp
patch for it.

Thanks,
Asaf
