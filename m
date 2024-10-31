Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428A1EA90;
	Thu, 31 Oct 2024 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398735; cv=none; b=cx6XJOoo1qSntosZolzN1/NW/DI++/d+DcwIW2Yegc049hEQM5qwMAauQVKReblrCzcIthhECLRyNj0B6JnKia3mBmjoosdBMcHsLwk/KGpFJyUVWCOTAOMaHwxs5mjCITzuM2EpuQfh+6kc1vqLRYvLupPbXgXNJm1Vq9YiCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398735; c=relaxed/simple;
	bh=swfyAWz+KuGcvOg5/pBNf+/VuNK6sTL+2g8x0Q9+jY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkVRH4mhAWFStmnkh2TDdglrEnVSgg3cxDemG4+w+HyF/m4UJ54lqUZJKU51ZsuKLb3lEOH22UgDI1YOcqss4nkC5dDnHF4sJJqAAz62VhDU1LV4SfWXg/hFxBDElArK1TuOJBgHo7wgKUxjX+Hrnt74zwoa0r0I0m3n3OIGMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSGK9oTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSGK9oTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B94C4CEC3;
	Thu, 31 Oct 2024 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730398734;
	bh=swfyAWz+KuGcvOg5/pBNf+/VuNK6sTL+2g8x0Q9+jY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSGK9oTdj6KUr7zHL2yBhdC2lRNd8+mRRNmwNroKCK2nCKeLYRavAPFnGBdHkp3/l
	 pH/s7ERqH0H6OzQKJIU5DhaEm4sJUSrBzFTnMW8+inH4xoH6NSDx0xZmfku0ybuuyO
	 CFViss8tN3wzpQyTa6gOcxTjWPaedtscCCL4l9vYDALPe+07YQWQ6mudzBFwAPM/ZG
	 f50dyErthEA/uhbHJqEcqSPn/PWEJLug5PPnO90nD4gzvl3FKb8MAqow8fXr3822Yy
	 zSMboo6UpzTFDZRUKTIeaFV1Fxa5tHyJ9NdM3kIcgKBZHPvZnnXBzQQW20c2mpt0WQ
	 D/mKOU5qdpxkQ==
Date: Thu, 31 Oct 2024 13:18:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux-hwmon@vger.kernel.org, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	geert+renesas@glider.be, linux@roeck-us.net
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <173039873243.1265310.6496312167200756242.robh@kernel.org>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>


On Wed, 30 Oct 2024 17:41:39 -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> These bindings copy the vout-voltage-divider property defined in the
> maxim,max20730 bindings schema since it is the best fit for the use case
> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> used by many iio drivers was determined to be a poor fit because that
> schema is tied directly to iio for the purpose of scaling io-channel
> voltages and the isl68137 driver is not an iio driver.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

