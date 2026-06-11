Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB932332635;
	Thu, 11 Jun 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195929; cv=none; b=tiJrEWgKxn/8Y31MYRwFuj0BxatWd560o0pjqb+O8RJls/88B2R3yYGFB10GAFC2+GBnYRFej/2ciU6JeFqMcjBeS3rluGxdDQb1VjhwbAkpm5GhV1hSpa2dtPTkvNvg0adlbZAKjRFWmKXDhEjpYuATiUo3o+hN2jyMXzDgImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195929; c=relaxed/simple;
	bh=6FySkG+glYjf4ZDyk3xou1Yfjb1g720YZhbquuf5Z/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KecMpqM8LWqyWIXF5azUGVShCc+9Kdftyvex+diehvScERefSidMs4X4fbXsPJ17TLDgmVQXv3Y9rGvV0OajA1ZMBuQSzMCd92aviOKKsxud+L9Bkd33GW1b4U4x4zB+LjOsBHj9FrD6E8gabIhe0wyYAgpdIaEc1ENCp2P/na8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixT5j+fc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixT5j+fc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445EB1F00893;
	Thu, 11 Jun 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781195928;
	bh=aFyaJd3eEW45BpXIfUcCpGEEeHbiAowOimlNIYOftnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixT5j+fc79ElnHBbkZm4Qv3VhNah4swHI8cpb5qkPYT24274Dr9oTtS/eNEEjuaoz
	 qiIVA3zODlWzGZA+I+23mPnIbRqa8Y+d/H6FttGvH9pqPP5mT97omZ5me8a2MC4yfl
	 a1JtF+GDqCADINHP9u7Q4zSmwuhEjIlJPS1dLKjs3VUMnu+scmYE3wHWmqlbjTVWg7
	 wMelUVDFkvWrJGSJvz0p52l/jZIpZXUtqD5bH0S7ewp6CBaLR67Pg8CJzSlkgC9rxu
	 uPDBxLP3ZONFFgiMNCLmlMXKTAMSwTAlp4Xz47p36SiJOduUMTS0lAUtl1CQB//WYe
	 fpLj6z2oWghCg==
Date: Thu, 11 Jun 2026 11:38:47 -0500
From: Rob Herring <robh@kernel.org>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <20260611163847.GA2925321-robh@kernel.org>
References: <20260611074335.4415-1-zmzhu0630@163.com>
 <20260611074335.4415-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611074335.4415-2-zmzhu0630@163.com>

On Thu, Jun 11, 2026 at 03:43:33PM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Missing Conor's reviewed-by.

> ---
>  .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
