Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2441EA90;
	Thu, 31 Oct 2024 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398704; cv=none; b=Z8CXAwBjv3SjKeO1XnuAl77um7byaXi5/6t4Tgftrffn0RZTy6A+pHAVPoYFpDMb5fnFaCO0IX3qgMyEsymeptQccRWo+eyqT9Wzqc3NOy1us7rXPFVRdstDTuXXx6SdPd6V4dNdF8LOD00pYNE7Gu5P8iFpexiGcq6K2djMd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398704; c=relaxed/simple;
	bh=kR/0Pxk459rWEyGTEDKYRMfC8DiaInmUZTUtxxSNPLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GofEe5yjqzgSPfdnxa6b3o9oxnjqnoMqvD+bSIJQW9EFv65YGZ/WpLfmsXVop1Iz7A1T2LSjBzJMswDIKDF72LN50Ks3NRt4HwW+EmPc/3tCHE9L8Ef5v49AoWXvTyGWBP8tc39IHr8noyOvAY5ZmehEgiFy+yPQzdPiryTFXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdxNqRUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdxNqRUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF927C4CEC3;
	Thu, 31 Oct 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730398704;
	bh=kR/0Pxk459rWEyGTEDKYRMfC8DiaInmUZTUtxxSNPLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdxNqRUHraWlE5oylexV69MRGpC+DC/o8U6bp6JF+UAGjUymuPiTngCMHr6g0wkzs
	 pUVICgZWxlGVyKetf7aopoMoWkpjUasB7m+VQYT4eyZngQamleJDyzIYroCWoE9alq
	 PS50nNwx/r+3j6F38F/Ncr8L+0Z4pYlVoMOtMvxYc0IEXK/yGJsHgg2gxI4yeCohG8
	 i68QD1kIm3p0KTRXfT1C+tm30KIcqtHu/wgbYGKucm4rb2DNYslCszoBZNAyFnBxY6
	 ayL0xJYJZ4MQKVK61iUHRA4z3otQf6hRKoG2hT95/eX5zYVDDFJNNsWK/bn4S48L/+
	 tPF0GYBDfXZFQ==
Date: Thu, 31 Oct 2024 13:18:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	brandon.howell.jg@renesas.com, grant.peltier.jg@renesas.com,
	linux@roeck-us.net, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, geert+renesas@glider.be
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <173039867893.1263948.4560760756076027047.robh@kernel.org>
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


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



