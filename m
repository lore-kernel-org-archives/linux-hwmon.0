Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6948A2B4
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634775; cv=none; b=hcbQobhTh9/GXTZistQ6r5/scF4zTTwVxnAh3eqh4uVIBBYxnymxmVZqoZCyZwLhzahzR4VVx3Wo4sHeagOjolYE8CMMgONxWSPMq19NfFB2HuuWyE2p7ol7dN9xQG9ibYhmaO01KXlnd4OoQlHGpClV+Rns+XNkDfb2CKPrLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634775; c=relaxed/simple;
	bh=KQ20opvkjHbbFrKeb7cw+XR2XSW8V/86AhzIIvcd7D8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version:Content-Disposition; b=V/7bd2oWIJ/ZLe5HQcCsn5p41TadlYT+4o02Zuz6dzhs3yKlkCVRmnbEfAFb8xbpY4a7w6ZBfyPrMe1Mu4mOLe/X9s2uFLO02SBJP7cVJwYV4uP/t7udPg9rbSYrPVhIolIZJ+TYLIXmK6rOTddYkn6v5ZWF7t10TP00ukI8+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qACJvlEg; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qACJvlEg"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784634761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztkuwDQ88U1nWd7JbtRXsUpUUy9QB7MYF8hpKbkABIQ=;
	b=qACJvlEgENvt+CPMwYacc4vTMOPS0UPeyhultL+5KrkDylnrMT/ITzMnl+JU9Ki12/bC82
	D+5PMyJ/CedXJDSf2AwNGYA8JOPth40bScw5t5G+y6mRhenBcdJTTB4CuqrAuwueFoS7YA
	d1/fvgoV/nkVvvlyMb9lj5UY5+2BkpA=
Date: Tue, 21 Jul 2026 04:52:34 -0700
Message-Id: <DK488087JL3G.2007ORR9MUHGW@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
	<20260721100039.0E6A41F00A3A@smtp.kernel.org>
In-Reply-To: <20260721100039.0E6A41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mutt-References: <20260721100039.0E6A41F00A3A@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 10:00:38AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Is this drive-strength value supported by the binding? The value 18
> doesn't appear to be valid according to the SpacemiT K3 pinctrl binding
> schema (spacemit,k1-pinctrl.yaml), which triggers a dtbs_check validation
> failure.
>
> Since the driver's spacemit_get_ds_value() will silently fall back to the
> next highest valid value (like 21mA or 25mA depending on voltage), could
> this cause an unexpected mismatch between the requested devicetree state
> and the actual hardware configuration?

Good catch. This pin group uses the 3.3 V power domain, for which 18 mA is
not a valid K3 drive-strength value. The driver rounds that request up to
25 mA, so I will use 25 mA in the devicetree to describe the configuration
that is actually programmed and to satisfy the binding.

                                            - Troy
