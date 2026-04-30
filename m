Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48238424B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532450; cv=none; b=qW8M/1ZJh+CzKJZUdKLJ8gdZpgxrCU67hXYja0I8N2g85tv+Owx4t24aJNo1CQlUxu6VAcy7FBghkpykiOOu05GDGQkMWwjEGpwaOUlHx85HFqsLs4keII6Z7FmaNE8o3GmcHOOJjcTcoGwJbEvfaaLgId3Gg3kBpRA1IkfC5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532450; c=relaxed/simple;
	bh=M5ee10l9fVXYbRQxphqGFlk/iuq0fpspHL6iVYfie+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dnM0s0eU19h+yrQwXobL681PbVt1159fXYGHbF+3OmyhROBYUXeDQWgZ+bzHe1HUgt2OJQjSuV5jFz8XtKTAhCdc79UXzVUAoTmWlxoHeHp+smSZjlpM/IK9WVuIo4Ui9V6J7AYw/6C9trNHcqSd4eHQRMzMQ7PqakC83JJBHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lb5rqPze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lb5rqPze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B702C2BCB4;
	Thu, 30 Apr 2026 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777532449;
	bh=M5ee10l9fVXYbRQxphqGFlk/iuq0fpspHL6iVYfie+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lb5rqPze0E+B3Ag53Masp2oQkJ8esnjOBrDSSlXpePSpiWwN7AO/5nvopZAuIc3iI
	 yrweOcKbrDhz9IFl4oVk+sTykScTU91t1qwHWHdNug70bHpQe6lzXXuFCeH1eQ520i
	 8WmD1mr2pMB1CFcw3FUzeVXIaQdf3DCM5fAMIYwK1KJB/4Z4hnhtuC3QsqDysTcZti
	 eYpJHsgTbNG17C9yFiMrRZJUwQkdEC33kJqfhavLwVklvXcMIKn1b++iXY2OBsHmSw
	 wqNUDaSZ/6CYtv5FYqMDV06D77ih+HFwvEwocIJLlhDku+4uUusccjxEXQ/qMfpq+C
	 TfqEULzW5cnRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430064444.1615-1-hehuan1@eswincomputing.com>
References: <20260430064444.1615-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 07:00:48 +0000
Message-Id: <20260430070049.0B702C2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'label' property is required and restricted to an enum, misu=
sing it for hardware instance identification.
- [Medium] The '#thermal-sensor-cells' property is defined but omitted from=
 the 'required' list.
--

commit 5a5ed34d17ea4e88cd80b5a8e96e21dcc65e9f11
Author: Huan He <hehuan1@eswincomputing.com>

dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor

This commit adds the device tree binding documentation for the Eswin
EIC7700 Process, Voltage and Temperature sensor. The SoC integrates two
PVT instances for monitoring the main SoC and DDR power domains.

> diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.ya=
ml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> new file mode 100644
> index 0000000000000..ba89b829ee947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

[ ... ]

> +  interrupts:
> +    maxItems: 1
> +
> +  label:
> +    enum:
> +      - pvt0
> +      - pvt1

Is it appropriate to restrict the standard label property to a strict enum
and require it?=20

The devicetree specification generally defines label as an optional,
human-readable string. Should the hardware instances be differentiated by
their reg addresses, aliases, or dedicated properties instead of imposing
a strict enum on a standard free-form string?

> +
> +  resets:
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - label
> +  - resets

Should #thermal-sensor-cells be included in this required list?

Since the device acts as a thermal sensor provider, omitting its cell-count
property allows incomplete device tree nodes to silently pass schema
validation. This might lead to runtime failures or misconfigurations when
dependent thermal zones attempt to reference the sensor.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430064107.1598=
-1-hehuan1@eswincomputing.com?part=3D1
