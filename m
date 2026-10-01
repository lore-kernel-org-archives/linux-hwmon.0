Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF813B5E15;
	Thu,  1 Oct 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843819; cv=none; b=dsc8VyyHBTAmFmka3PsaxH7C2BI3QBzQsF0oqbL6gajn0hyifG55rFwpKMuCo7dXtjfh8AYHqW4NcA93o9BFdCbfCAtuog8xFnhQUFrmjerN3LKYLvWcNLp2TGfP/SUT9GDF7qDDgBjB68Ak9CRyPxOJtLj6tiwpVNFUWBK/s/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843819; c=relaxed/simple;
	bh=cIM859v8l/YEVYNXIO5l1REe+92jXs5WPfwdoE1/Uiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk8u+pX3lEqcH8MBjPxv52ZOgQaYwcRK0NtTC0rZD1AbMWerwHx4Li+0af82KOsdShgg02oOPzUeSb9CaQHerztqqvTEP8Lj/SjZXZCRJ02KVjeBQzMRlSglTsGcVOYPujwBSumVLM2ky0W2Nu+DCLDCwtSNf3gs+SjpNj216yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8kRElng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8kRElng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221871F000FF;
	Thu,  1 Oct 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843814;
	bh=KFp1EFM+xEQMVEncLC7aw+WLs5REGk74Ynj58s9psyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8kRElngCeqzl9IWS9g7BePDVYFljJgI9r9jpgezmpsDFXPtMPZQMoFNi6PZhL0jj
	 cWgCEx52fkrdGafIi2ridMuG1mJWHFufdBsFcxmyZSeIcr9yzsfYX3rZRjNCOKnEIW
	 vfdqVA2jDTor0bHABQ5BNAaTEdgGaevpbU+8EUXM87FFf7PojnbsxkfKyNwcuGZmxT
	 F4oOcD9n1FuuDwxi1C/TR5mzjp1pcJjM1IPOt5jA+212/y4kvpzXPogjNoXYozYdvH
	 W9qeNmXmlRcRVgAEWPbzZOIF+I4esPTn4BkDcb7o5SmRwCqovlDopUAWvTwl+XtOsp
	 QTmyZyrWUuxjg==
Date: Thu, 1 Oct 2026 10:36:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: jedec,jc42: add #thermal-sensor-cells
Message-ID: <20261001-icy-wealthy-centipede-be0cf0@quoll>
References: <20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr>

On Wed, Sep 30, 2026 at 03:44:51PM +0200, Vincent Jardin wrote:
> Since the commit
>   032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER")

Odd formatting. This is one sentence.

> the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
> 
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

With commit msg fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

