Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6D367
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Aug 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633021; cv=none; b=KXVkVmXvu4MBzdValYR1N2S7nQZT6FuxRRxY24KMpJ2odoPLF+PzbNzDUCcB8aCHQKPDuC9DjTCzZ0VIB3ngfIxxl00F4IyZnLRLrosvPYJyzFVEJ81D9CybFLpxRUbmWVSSlA/N7WViBMu/rJeCmNWhmN0QPtWg61ASa96zTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633021; c=relaxed/simple;
	bh=lPtFO4knclBgdwp3greXDS86+7OGU2ffkHldyBKKq3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DC61l2lAouoG4U4e/VqfFZst1/pobSprYQqvZmqDIgJjLDc7R31Kiq+U/bhC9NwrF74bWEu4B3tSodiE2VtsIkhJc1CyjpsE7Okv2HN5jmRPNk967n8Cv5lT5zGWKzIQmHQlDpBycNCJ20ZZi5vnwcAl3uuWQ6jyAULWY6vIgyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbNYGO+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbNYGO+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5D2C4CEED;
	Fri,  8 Aug 2025 06:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754633021;
	bh=lPtFO4knclBgdwp3greXDS86+7OGU2ffkHldyBKKq3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RbNYGO+fVtxhRxUM5O1SFwVWNN9hHT13bglm1fSHmdgvQ4IJS9xkltl+Y0fU4zyGR
	 4rO2Ut14bTB7YZu1cTZgrvupkXVt4z10E1cdZxIJKqGv6+dqttUW2wJHnId27AMcpK
	 PgBIqERdcZjIa6jnIkWXz3VmS7GSO18dMwsGACeU+SaQ8DeQlNcdXE/VB48EEeM1tU
	 8iTgVdt1e4biVedKTTENbz7hY0jNo5hQAYZmGzIFGwdTyaEQrHzHJ0O+kz1NlHNg7v
	 f4ZGxK4c3fiSXK/YVgSg1UdSH6JeSSFLEfJr5HNid8GfSVsmiB9ZHsCHsCte6QMQdZ
	 tqoLGjstPoaEA==
Message-ID: <4b4dba48-d8c2-41ba-a80f-6606d4231a18@kernel.org>
Date: Fri, 8 Aug 2025 08:03:38 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (tps23861) add class restrictions and semi-auto
 mode support
To: Gregory Fuchedgi <gfuchedgi@gmail.com>, linux-hwmon@vger.kernel.org
Cc: robert.marko@sartura.hr, luka.perkov@sartura.hr
References: <20250807215037.1891666-1-gfuchedgi@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250807215037.1891666-1-gfuchedgi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 23:50, Gregory Fuchedgi wrote:
> This commit adds optional individual per-port device tree nodes, in which ports
> can be:
>   - restricted by class. For example, class = <2> for a port would only enable
>     power if class 1 or class 2 were negotiated. Requires interrupt handler to
>     be configured if class != 4 (max supported). This is because hardware cannot
>     be set with acceptable classes in advance. So the driver would enable
>     Semi-Auto mode and in the interrupt handler would check negotiated class
>     against device tree config and enable power only if it is acceptable class.
>   - fully disabled. For boards that do not use all 4 ports. This would put
>     disabled ports in Off state and would hide corresponding hwmon files.
>   - off by default. The port is kept disabled, until enabled via corresponding
>     in_enable in sysfs.
> 

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.
</form letter>


> The driver keeps current behavior of using Auto mode for all ports if no
> per-port device tree nodes given.
> 
> This commit also adds optional reset and shutdown pin support:
>   - if reset pin is configured the chip will be reset in probe.
>   - if both reset and shutdown pins are configured the driver would keep ports
>     shut down while configuring the tps23861 over i2c. Having both shutdown and
>     reset pins ensures no PoE activity happens while i2c configuration is
>     happening.
> 
> Signed-off-by: Gregory Fuchedgi <gfuchedgi@gmail.com>
> ---
>  .../bindings/hwmon/ti,tps23861.yaml           |  78 +++++-
>  Documentation/hwmon/tps23861.rst              |   6 +-
>  drivers/hwmon/tps23861.c                      | 253 +++++++++++++++++-
>  3 files changed, 325 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> index ee7de53e1918..328050656ab8 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> @@ -24,12 +24,34 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>    shunt-resistor-micro-ohms:
>      description: The value of current sense resistor in microohms.
>      default: 255000
>      minimum: 250000
>      maximum: 255000
>  
> +  reset-gpios:
> +    description: Optional GPIO for the reset pin.
> +    maxItems: 1
> +
> +  shutdown-gpios:
> +    description: |
> +      Optional GPIO for the shutdown pin. Used to prevent PoE activity before
> +      the driver had a chance to configure the chip.
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt specifier. Only required if PoE class is restricted to less
> +      than class 4 in the device tree.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -37,7 +59,27 @@ required:
>  allOf:
>    - $ref: hwmon-common.yaml#
>  
> -unevaluatedProperties: false
> +additionalProperties:
> +  type: object
> +  description: Port specific nodes.

Yuo should rather use patternProperties.

...

		IRQF_TRIGGER_FALLING,
> +						"tps23861_irq", data);
> +		if (ret) {
> +			dev_err(dev, "failed to request irq %d\n", data->irq);
> +			return ret;
> +		}
> +		dev_info(dev, "irq successfully requested\n");

Not useful. Drop.



Best regards,
Krzysztof
