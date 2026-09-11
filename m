Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE562F616B
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087957; cv=none; b=cHIKfpwLMrumc/g7/MGOKPPYGtVlAdgIwnfURJbzKcIJ2lWjIY2oCXaT28WFT6JV1rHw6jekv+gq4PsVtBaJiWUhIV2Qtr4nDKD5ijNeuFsCofTptgIlVWbE4NmFFre7yPBQdBqEZKr7joWUvRb6tY2DHGQJjDRc83rFSU10Wjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087957; c=relaxed/simple;
	bh=BQwhpDXzKhlCLOD2afisIUCnbjz9JJ1EqqAaObvs5Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiVm1O2GV3djKD5D0LRQoOXpZGHh5EN+H9KMyZQZ+IhNRRo7/jdsicG4RUJFoplZdLz5FL7eupVRJjpI2WblejvJPZc6cZKTvx2Ly5cyOwUi7F+biLANytA0q2f/jDi8wI4nOM1VaqC5eEBi69RQ7fq5rqPAd6/d7hCj9lnSyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBX9KeOt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBX9KeOt"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so2339605ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789087955; x=1789692755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jBly9NASd9J69NDrsbFKmvoK4r9VuFsqJ2PKUMl518Y=;
        b=ZBX9KeOt2lUFbN6TnbzRVMZfrdoeZ2a/Y7GvH/KqKOPjHrmqYIHAQ3YAGKm0sa2vzk
         0AHAc1VX5ycw/s9zlWAfzDuqSAipWV1DywWaiABdXm9FoTF7HNGwyUwOfGgLZNTwgez3
         KuyfKdeH1q/Oam4EHg6cbmzLztl7cabH634bJJ3+yAfSJMdX6F3thQRPmfjaH5jkikD1
         g6N4YN8XlQjsf72EuePZyjeYrI+F8LEwlCBufLNTlNTd7vjnTLkqAR/XI7/eC4wpUMMA
         SfDYryrAXG8ayzQW1qpZwoFARB98lkMYYCkMaadfOwnjRJz0k7txreiOuzZCQQhWg1ZP
         IvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087955; x=1789692755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBly9NASd9J69NDrsbFKmvoK4r9VuFsqJ2PKUMl518Y=;
        b=LZOBP7zkATL91WkyqwkqX1WKA9XAqvLU2sZWT6W/nMH8I+6XdfF+0n4ntG0bwAAzea
         PsO0gtSa06KJYFASOV9GUSATgozTtyOhchBOmXDaNofWi492vzPwO9FQwJ6kDgAd0NY3
         lXhYSqubWVQZLo1vDTKHLqkmsF4gIxnz1MFiOukXPCh8l/W1VlZypFJltBlRZmFTZWzM
         SQJoINNM9U3iQBFu0AeVNOuXc8p+WtnH3qEcE35YxfiyyjZ7ZnTKg7aaybgqB6FG+kPC
         asXlPmBSMTd22aTvR5PATQ8IdUMdfUpQfcxholeT5bVYqmI9kyzhiFzKrjWWTJThXNPe
         u5rg==
X-Forwarded-Encrypted: i=1; AKwUvBzUooacvQcovAiql+Bx/ERtuMavRg/TauTQJj6QTAGDcg8L8RcOma7k43Mz5d3ZI2PNJ8LxIS5DsvFFOw==@vger.kernel.org
X-Gm-Message-State: AFuF++m/Mfhu3QDyXunffP7IgFJZJPyq9L8NE2ivTm1iqCK3Dg4wuy8V
	khjjoz5Qmz0sl2wm8mV0hhDN5EAa6BNvAJTNqBvzQ0pIgdMMPPSZTIfY
X-Gm-Gg: AYBFou1xaAsMTLnzEIAg/zutC4s+Q6jS1j0n3UiwETZ7D9mGe7hlD3GhwElD8QIP1ha
	wI0cYU8XC7bAx0TbON3esyOuZY/CUP27EgC01Li86gRKHEke814nGN0cISlIzXZ5y7rGkjm24Xz
	eZNL+nitexcX4IjMdIYHLZuMLpJzhQTXradV5W3lJOj+1y8vjj7wIbYdGcjVZLjUoKMSTYVtBy0
	BkwmLwAm5Lg9alj3bVutTor8HEtWI7PQGm7MNf/6l1TN7qNgjTNISvzzFhdni2e/ez8Mlw+WdN9
	v5897K8C6eunFl+ZON/4LzfKYxYhYN5GulTx9hO/CiMnN/YET1CffGMEBOFLosXfbQI1c95mz3m
	IPuVyC93cx+juPlEFh9vKPyehfU2WYKcQsE8kdRbN6xah0Cm8Wr7z4Jxxo7qpG+e6zYGfHEZO5o
	eC4XbA+2gY8OA5KMP83u8oooN+z6Y00KFQGJgVkBVRL2ZcdtvAQsE4iBk1nU21tpG3IMmG6zkIr
	14E4IIXNo4w
X-Received: by 2002:a17:90b:574b:b0:39d:985b:4274 with SMTP id 98e67ed59e1d1-39d9bc66ac4mr2247804a91.5.1789087955396;
        Thu, 10 Sep 2026 17:52:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf2e22sm1744557eec.2.2026.09.10.17.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:52:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:52:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] hwmon: (k10temp) Stop matching Hygon devices
Message-ID: <591be587-d6be-4fcb-bfeb-a92812e25b34@roeck-us.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-6-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910082734.3771675-6-wanglin@open-hieco.net>

On Thu, Sep 10, 2026 at 04:27:31PM +0800, Lin Wang wrote:
> k10temp matches the Hygon F3 device and uses the AMD SMN accessors.
> These accessors derive an SMN node number by subtracting PCI slot 0x18
> from the F3 slot, then pass the result to amd_smn_read(). Hygon PCI
> slots do not encode DF node identity, and their SMN roots are grouped
> by socket.
> 
> The derived node number therefore has no defined relationship to the
> Hygon DF node or its SMN root.
> 
> Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
> monitoring requires the Hygon node and SMN interfaces and will be added
> separately.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

As reported by Sasjiko, the documentation should be updated as well.

Thanks,
Guenter
