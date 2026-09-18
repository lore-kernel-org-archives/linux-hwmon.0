Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8697499F25;
	Fri, 18 Sep 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731340; cv=none; b=i6t9QE1p0UvewBrzeUyLD5G3b1YZ2gTdtArnCEmEZBoch7EeAJF8CM6Qt+kVLD7E5TTyKemMFTdQ8aqZAqDYCbNyihOFx5E2Cpw/wskfeMHIQjDKgv4GlzpQOIYEWrUJvoDHW5ShdTyDDmfvuIEGQfJm8yhErS6DLGTPmUFNBMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731340; c=relaxed/simple;
	bh=toJmEXNWLM3GB1lXX0xzB7u1NVNbQnWAt22LnWkn1yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDN6ubmj4v6TrbvGWpfXeH6qu4k5l+G62OAvBedK3HEUxIR2elmDDQ0Owj0w3wb3oAXLq2P/vihsl28mG1ic7lz+Mu8O7d1J2jERjlsWomFm8lkK2ukBiUmRj+lPxhZDE2ViZcx4i1shlmdYzrHadZBUjOoHWeohh6KXXSRSuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgVpfAR1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgVpfAR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3EF1F000FF;
	Fri, 18 Sep 2026 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731339;
	bh=0mbDCG9aoxrBG/Rn3UOI+IN8mXXmMTsan8LmCVnyhlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgVpfAR1Pqq6gjrlfoEHy9DBjiLn0poxCwOCknZGxSgkKFxdl4H/X2eH0k2jmTPmG
	 dlPh86By85g8S73BRseKuRzFdDkc8A6MqNyDqro+gsUCe+2j1RjNYD3s65vJvJhhWo
	 gXAcozrmB7+PGCRzD6TAd7G0qcOVqJikw5eQ0loL+BVVImmriQkOwHmzPWJ1dVmK83
	 rAih7yhFPc4Ea/gxXQwp4LTx2R4pzjjlHO7Xbna+tgIf39GyvH5FOqGJt/Mget6Xmh
	 bbepNYNMPem04b/btmnqFD7XxBL9Sx6TIL/y3VDzSqjsnhgo2z+WxRYR+ucBDKOVr9
	 SsoB6UVFJHQiA==
Date: Fri, 18 Sep 2026 13:35:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
Message-ID: <20260918-calm-gainful-turkey-8ba016@quoll>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-2-373516d347ae@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 12:54:57PM +0200, Konrad Dybcio wrote:
> +static int asus_glymur_ec_resume(struct device *dev)
> +{
> +	return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
> +					     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
> +				asus_glymur_ec_suspend,
> +				asus_glymur_ec_resume);
> +
> +static const struct of_device_id asus_glymur_ec_of_match[] = {
> +	{ .compatible = "asus,zenbook-a14-ux3407na-ec" },
> +	{ .compatible = "asus,zenbook-a16-ux3607oa-ec" },

Does this mean devices are compatible? If so should be expressed in the
bindings. If not, should be expressed in bindings commit msg, see
writing bindings docs.

Best regards,
Krzysztof

