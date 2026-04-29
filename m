Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524D325707
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490652; cv=none; b=ViqLbh3J7Q2yrTz1dt9r4tWYzlZHgrTc+45tO9yokacu7PaF53wd0cw3SlULyhPgGPmguV+k9lX4xyBYTNjhdxwxQDdqlW+/7yVYf6dUiZLKjTn1CkElrVYF0MMeWwvrF6xoncQWbDKLMRmcIoeiy/LX1B8Z49USOucG2O2fEBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490652; c=relaxed/simple;
	bh=MfeA7ouiM7d9FOcUTUSSZ3SL01joWPA3jm4Bc5ugD/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0mNsR5N1ixTSp8JwHk+1i6gLc5ksOGXsMvGuZ3hiEl2wO6Ky5JJZ+yUNSieeztXgmeb3i0eXqCxcvTX05LJWUfZA/HL6dWNW1ZTLauljBksWFGM/Jq+R/sxZyVGLvwzrlq+0kUhEZNPQvuzurgkHjsPz8/D3RaumBsfv/5oKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBqatMsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBqatMsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F8FC19425;
	Wed, 29 Apr 2026 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777490651;
	bh=MfeA7ouiM7d9FOcUTUSSZ3SL01joWPA3jm4Bc5ugD/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mBqatMsZJBRcMbd1nUIagmnwy16JOkNMvMlMLKJPlDJ/8AqOXnjHLUQBqBRlRBaF1
	 +MJ7chB7gjEx0dIfZfWXdQlbG0Lc6pujRnOhL7DH65GeR/aChgJhu417E9U27PHzOR
	 QeGsuQDjZBgK1c9YUVrpEUrr+fVdxYsXTOLnBJsw/6TsswAZbKcF1uJ0IyX93zWG4h
	 pbe827ydE5VXt/UZL3MPwEa0I+EJ6RBJO0zSB9B2vte1wahjWYoTajWFRlGP95SzCI
	 BcvfmRCKB5kErwwQ39u5hhP8FZwhwlipdyttgAfgcSumIdEsIoFd9twfQ4eBx8FHzw
	 +0N+a3GYDfNdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-ltc4283-support-v11-1-27ccde619dad@analog.com>
References: <20260429-ltc4283-support-v11-1-27ccde619dad@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 19:24:10 +0000
Message-Id: <20260429192411.87F8FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `dependencies` block unnecessarily requires `adi,pgio4-func` to=
 be explicitly present when external fault properties are enabled, artifici=
ally invalidating its default value.
- [Low] Missing `multipleOf` constraint for `adi,current-limit-sense-microv=
olt` to enforce step size.
--

commit 06a7fb3172f7064acd0275a6c3a0ec99c7ab6d79
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dt-bindings: hwmon: Document the LTC4283 Swap Controller

This commit introduces the device tree bindings for the LTC4283 negative
voltage hot swap controller. It defines properties for sense resistor
value, current limits, fault handling, and GPIO functionality on the
PGIO and ADIO pins.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> new file mode 100644
> index 000000000000..05e2132ad4d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
[ ... ]
> +  adi,current-limit-sense-microvolt:
> +    description:
> +      The current limit sense voltage of the chip is adjustable between
> +      15mV and 30mV in 1mV steps. This effectively limits the current
> +      on the load.
> +    minimum: 15000
> +    maximum: 30000
> +    default: 15000

Since the description notes that the value is adjustable in 1mV steps and
the unit here is microvolts, should this property include a multipleOf: 1000
constraint to enforce the step size during schema validation?

[ ... ]
> +dependencies:
> +  adi,gpio-on-adio1:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio2:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio3:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,gpio-on-adio4:
> +    - gpio-controller
> +    - '#gpio-cells'
> +  adi,external-fault-retry-enable:
> +    - adi,pgio4-func
> +  adi,external-fault-fet-off-enable:
> +    - adi,pgio4-func

Does this dependency unnecessarily require adi,pgio4-func to be explicitly
defined in the device tree?

Since adi,pgio4-func has a default value of "inverted_external_fault" defin=
ed
earlier in the schema, a device tree omitting it should still conceptually
support the external fault features. Enforcing its presence here might force
users to redundantly define adi,pgio4-func to pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-ltc4283-su=
pport-v11-0-27ccde619dad@analog.com?part=3D1
