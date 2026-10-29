Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300351;
	b=kjdLRAyPnDfFPACKOXRqgsUmVVacJYWJ9dEGWEcN0D9zrHwp/nE/9u82fOybglr0TATr
	 8moo2qoYFKG4kLqEGtD+rvneXJJ3lve5LnPdv9UD3zoCwBcJSI8Hbbb5h9wshbz+DQF+D
	 L6eHAAPI/CwT9xrDNWe3obz2RU80ZsuiNp7Io6nLs1LxzuC9dAjANZwsTIUlDWIwGW4Sv
	 vSo/wgY21BhPWaMrvfC/2MS5/YOap4g6GZtBfOQd/X9gvUGgMy8773N9AAgfzZPVgcSnn
	 a4OP7Bs/apxh6t86qTB+AKOOgeDp26aXS1ZeAvwHdgOypCGe1Q2pTqX5pCyCEWycLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=FCMT8g+ItFadpFYnf1G7PkjhORY7OuW6c4VMprQi5XGprk2VkXF6SMaAxfuXDD84NAYz
	 Ya+kOWbL6fb7K4ND1tkl8LHojdOqW3FtkCbd7FD+y0Dw0AnvQA97JxToZJAYJDtCMiLSB
	 X8u/4yXuLjq2x5vyZM9tGvLCP6MFou3w927agIb1uLvnsAyUC9P0LNI3If+C5Ge+6IxtR
	 6YP2jeZz5/b4+KjMD/PwRwggnVPZTJrpInuOm1rryHsPYrzsbKFQjKBa52LCa2h+v89aV
	 xmp0L2vABC3m2XxZGLMeOIaZ4dvP9DfBoy5iptPcrh1wXhHDkkUJxIpj70lOIgrWgtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF7606A31E
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so21100005e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=wKHfFSVmSHenG0U1iwKgtGSi1UOPPzW6SwGJPjDKQxqwGUCxJEvCn1DjSm7x+7dlBI
         tUKS5X1HwuZkVolpmPhJFNwbLcWP4O2Ey+tlKOMSKe5uAIMYifWViWBMbQNK0ytgnkU5
         TxpYpjDnhF0RjngKcgEl1OEsxC/rdKP63x/HzurTG3ZCmbKYurx/pMsgnAebRGdPVULt
         X6kw74+yrE1gmuUM1siaydpKy5zusToKzYM/zlLOoKSiOrcEwuwMelyy8U+A1MF4630N
         +VRIg7uYp5Eams5/R4YrzMxIRDiBSFhS3P/ldIwkkN9aFhmNkbr/qpcLWvL6VVYZuboa
         npsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=FoZf7BV1qXOle92FwIqdklXYzVaYdY++0aZYGo/HGluuJYL+ue4IZq7taNSugtRsT6
         GYvzMVnB994j/N5cA8SqPSloSUktQChy7O3jTXzpEbUfxJNUi1RNyrcrOBjOo3cRmrFY
         qR8HCUqBhxvAxloEq8zs2IF29s/IWqTrVOgSD3RxMQsfwTCjDs9MpO8VmIfI1fAi5sF7
         bE/JxUn3ykI2Lr9Q/HId+QDqaRKasyQ9ADxijvYmaem1cD0t5UiTT8SOuC2xaEGRJ8J8
         Hv8pM2mO8RmuOVfGwAGOhRUhkxczqwfe33UvsLHOWsC/YtkD/cyLDfpE+pGQeGVruwRf
         zlow==
X-Forwarded-Encrypted: i=1; AKwUvBwRkIbGd+34KG0c01TZgU90VQMPFxce9iDWo+YlTU2JGXCUwLCwXHBipidhb6hA0z6kxZl+/R3ILaAO0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5gtP0IXBIbQuD9Dwsw2q4rIuQB8LvwhoeSjloDZLE4SKvQngl
	8/187DvG7QKjQrTz5NPeJYj7rDFS0GkRw2KMX9pfXLM2oO4HzOh/dJs6
X-Gm-Gg: AYBFou0sg23i5l0d4ZAKyOqhz//adp/1Jpm4LVxW/aqTCylTnaU4skiR5JVBtFtfoOx
	gPJDtVHArLjkLjGMOF0gDq+HdITHxamF7Kwv6RIxB1dctTn1vrKekyGEDhyxEvf36IM3GqJqlpc
	KEjU4t9uN1AJlqWKoi2RyX3UqbNUUH1OEPPTsLsH4GLAdzkeekrH74NYrZALTprd8rjE/tLu/g9
	aO4F+rIMyqJUVjcIumahWqVV/1TwQGQtb9Bqsz19EYDBRR+eaGbAxXS+qkZ9X8s9g4X5d+UFuKX
	y88IWKJLRS1IkGJJwqFPllqzqD8TMWSIRvwRD0OpJ88nwhx0MJRTjJoETnCU5O6yydZOuz7hP6F
	SeKa98kzA45ZiwG1kL9g4+AQyeaStF+doj4rmCWWTQ6sHAh38tUzswyk4JAhuskSRYBWmZfbcPY
	yOV1zoTDdV1EWM9o2WfuAgwhbW6uHFrPxWvJP7ElgZASxF52CK0zQvvZZryazDFq5IgyESPIQ2G
	WKLi0nmRakCu55K492613tf1/iafHY+AcNpJHeIKkjn2w/MGt8F3pjoPlXzrce2UnirAb86y5Wv
	4Ag9saKJSWisG6BZ5h+LNHZ6GUa5NyguxmYYNy6STiR2T0pc15nQRzz5f9HD06Oeg0gDaKQiojs
	DIH25em3L4/5jwWaXIORMr6bsm5GhiRl0oRBS3I24gbeOKD4DvcKKyYz30a+pxkOkHAyIUYAEFq
	qIgdA/8SBCuuRh
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


