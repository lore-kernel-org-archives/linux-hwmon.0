Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182F830C373;
	Thu, 22 Jan 2026 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069606; cv=none; b=l7ywujhEizq1YOad5tjW1ZxL4bauoiqBZn7JVenG62CiLt+RNSPNhWt611QEVp+YHRokzl8PHJAfyLx5WlbSw3JpuzRN/yRKDmsKJ44xD5TeiLuQXYeOFAqQzAIbsWOLUHiuwjXhAxpOXW/MIA6lgJdYILuRgslbjUM1MWJzzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069606; c=relaxed/simple;
	bh=CAHeg8HSLTyL4u5efT4cjYDAE+GmmJmalQvHMcYAods=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8UdaweQPEpBMv5uPPXHRmNk3QNwuSbPiqCyVO/HOrbComPlBnR0QoAuUseWy8gD8Oc/kUVIYq88rlZ3kYophenZ0W0yE0u24OoFcH3WlWlaQ/kmQV6YEBCXyVcR4A2NNIPBrq7SwdMCa++nWJg3vqVK30aXMoZPsVbLRIf8vmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2dXxySR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2dXxySR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13828C116C6;
	Thu, 22 Jan 2026 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769069605;
	bh=CAHeg8HSLTyL4u5efT4cjYDAE+GmmJmalQvHMcYAods=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2dXxySR/ulwB4O7X4zV7anKO5F8kKbHAObixPR5JDllkA7RAVkwSd745KdZ1rRQF
	 acf+kbH0tZ2KiO8tG+sXsJwplHshXKVKDZCv6gB4co/KcBTg9IrF3BU3FL9LBFbiGn
	 vwExwVR6zwgxFi4mvK8sPm4OCwQS9o/ihgeYrrBIGVxaxkHCH2vA76zVMoPDvJ8CtY
	 jrIFB1qCkwQnM891NCtn+gPzWACAf9BH/gxhMmDFF5WJ/1Zsk3ckCF7m36t1ADC47N
	 2ptABpCDnb/jpi8Vemw850lf2kOsDFhOY8A718Sm0ndEI+bQ8JojBinYBAvep/5K+2
	 WFsTGNuBD5okA==
Date: Thu, 22 Jan 2026 09:13:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Almog Ben Shaul <almogbs@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, itamark@amazon.com, talel@amazon.com, 
	farbere@amazon.com, ayalstei@amazon.com, dwmw@amazon.com
Subject: Re: [PATCH 2/2] hwmon: Add JEDEC PMIC50x0 driver
Message-ID: <20260122-adamant-stereotyped-bird-e7deec@quoll>
References: <20260121151947.37719-1-almogbs@amazon.com>
 <20260121151947.37719-3-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121151947.37719-3-almogbs@amazon.com>

On Wed, Jan 21, 2026 at 03:19:47PM +0000, Almog Ben Shaul wrote:
> Add hardware monitoring driver for JEDEC PMIC50x0 compliant I2C DDR5
> PMICs.
> 
> The driver provides monitoring for voltage, current, power, and
> temperature across multiple channels, along with comprehensive error
> reporting.
> 
> Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
> Tested-by: Almog Ben Shaul <almogbs@amazon.com>

Drop. You cannot send it untested, read submitting patches. The tag is
for OTHER people to test, not create impression that all code is
untested but here you did some testing.

> ---

...

> +
> +static int pmic50x0_panic_callback(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct pmic50x0 *pmic50x0 = container_of(nb, struct pmic50x0, panic_notifier);
> +
> +	dev_emerg(pmic50x0->dev, "volt(mV): A=%ld, B=%ld, C=%ld, D=%ld\n",
> +		  pmic50x0->last_voltage[0], pmic50x0->last_voltage[1],
> +		  pmic50x0->last_voltage[2], pmic50x0->last_voltage[3]);

You did not Cc any maintainers, so maybe one of your 5 CCs from Amazon
can explain me why exactly random hwmon driver should receive panic
callbacks? Do you see such pattern in hwmon?

> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void pmic50x0_panic_notifier_unregister(void *data)
> +{
> +	struct pmic50x0 *pmic50x0 = data;
> +
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &pmic50x0->panic_notifier);
> +}
> +
> +static int pmic50x0_panic_notifier_register(struct pmic50x0 *pmic50x0)
> +{
> +	struct notifier_block *panic_notifier = &pmic50x0->panic_notifier;
> +	struct device *dev = pmic50x0->dev;
> +	int ret;
> +
> +	panic_notifier->notifier_call = pmic50x0_panic_callback;
> +	panic_notifier->priority = 0;
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, panic_notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register panic notifier (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, pmic50x0_panic_notifier_unregister, pmic50x0);
> +}

Best regards,
Krzysztof

