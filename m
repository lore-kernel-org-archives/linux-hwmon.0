Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BF1494DB;
	Tue, 30 Dec 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085741; cv=none; b=UDJoTV3q2tqMyoS+UE6+BPoZVOSTdAbdJzxzk2s30TXosybBtNF+T8+11ZzWzj/8mYJfm91gMMf1cSwzbpZXnuZ/l3z2bC/mB9iPeVjmKJf2xV+GjXYEgxKaUxqjl0h01Ja7FSbbTSA/6m3EHv7yfwct2esCNzfQpRhfd/aCQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085741; c=relaxed/simple;
	bh=bE9MILNnLsFz7tI42DPRzad+074GdFfylLv52n33+3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYzcEapq/XpPqyLiP5RMpVvuRhyPbpwETRZSMwUEVDAxaos8Ym357r82RXIplZyMvYd2W+7Rg4rb5GLb5uY/sji+HqA6ASw8ZBrhteLWJhKgenE7iAanDwWrWNcPhDkn+gtXLQjtPDqrx7e47TCtkQRce2ZqB/c3tSxs1vigc9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfnBZRG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfnBZRG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4E0C4CEFB;
	Tue, 30 Dec 2025 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767085739;
	bh=bE9MILNnLsFz7tI42DPRzad+074GdFfylLv52n33+3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfnBZRG8+6QkTVGfggoo+K6TKkE7QBYhmKPEwcLHDQQ11prJOkImTeIUtEo4uCtCS
	 lnzR/6Qtew0cK1GaSEVqRfj5UGhfnxMVw5mdHVytpCMmPXSNtomRYOqD1RPZZiXvF6
	 sTaTVXU1V7EMYfa71HByjXVOou+jDY2i/inHsxrNdHKJ1UdtAJbY5poEBWix1rVXlU
	 y+Mr4SkR3j1fujblDaqjTgAOvdutRTSCK6ux1X6HDoWTJcA2VHHqQzEmO5nt1yd7NR
	 ihUOeaRqe5RqzwMJWI/A0AXctgDmH4XqNIV8dMFAiryO3H/hGZQ8DYF7GLh/nlkkjo
	 z2r+o7hYyJ3dg==
Date: Tue, 30 Dec 2025 10:08:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: Document TI TPS65185
Message-ID: <20251230-rustling-mandrill-of-domination-ddc04b@quoll>
References: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
 <20251227-tps65185-submit-v2-1-1882024b8f33@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227-tps65185-submit-v2-1-1882024b8f33@kemnade.info>

On Sat, Dec 27, 2025 at 11:20:36AM +0100, Andreas Kemnade wrote:
> Document the TPS65185. GPIO names are same as in the datasheet except for
> the PWRUP pad which is described as "enable". That pin is optional because
> the rising edge corresponds to setting one register bit and falling edge
> to another register bit.

Nothing improved in the subject. Mark asked for proper prefix and you
used exactly the same prefix, so the same problem stays.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/regulator/ti,tps65185.yaml | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
> new file mode 100644
> index 000000000000..7cc5a895c2fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps65185.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/ti,tps65185.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TPS65185 Power Management Integrated Circuit
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +description:
> +  TPS65185 is a Power Management IC to provide Power for EPDs with one 3.3V
> +  switch, 2 symmetric LDOs behind 2 DC/DC converters, and one unsymmetric
> +  regulator for a compensation voltage.
> +
> +properties:
> +  compatible:
> +    const: ti,tps65185
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description:
> +      PWRUP pin
> +    maxItems: 1
> +
> +  pwr-good-gpios:
> +    maxItems: 1
> +
> +  vcom-ctrl-gpios:
> +    maxItems: 1
> +
> +  wakeup-gpios:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description:
> +      Supply for the whole chip. Some vendor kernels and devicetrees
> +      declare this as a non-existing GPIO named "pwrall".

GPIO cannot be non-existing. Anyway, use name matching the datasheet.

With these two things fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

