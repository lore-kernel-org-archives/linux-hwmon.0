Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694EE1EFFA1
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716336; cv=none; b=gFCt8o6Et+I8HJKTFwFAlV414Ru44Rma+36DM1UoK0MKfjw0H/Sctb+DpgxZVa7rIQfWCm/eFBFtauuxQA83beiGxOWHaPrup38mkwgKNk21HdJUPLhB5X7C8Dt5fEaJTDLsZ1TVbHP9jYQS7uLOhXYB1OrbDx9KCIs3XdIrGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716336; c=relaxed/simple;
	bh=V8bfvRKVf1iNBXbeumQpRo2SAL4HWWOZ4/Tr5ADZelY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=canK847xNXCa/U0RJ0anAd5m2b/xvhsxI74OYKCU4txDQB/VrTqpN/HFAmGUgeXPnfNIrPpOslsTyiZOOZM8pktA/heEHNpJFM5fOh0zFXWQeH3/FNlcNOfpnWqNFDSlejkyiEU7yW0SDcDalHdecejfq3rP1twcR5Fq9a074kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Voyje0Bh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Voyje0Bh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD16FC19425;
	Sat,  2 May 2026 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777716336;
	bh=V8bfvRKVf1iNBXbeumQpRo2SAL4HWWOZ4/Tr5ADZelY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Voyje0Bha24DzsGUQBJhDQmg0pgdBzN6ilxVz7S3P2RUaIdxXXdFGtC9uXYLxYY/v
	 GObXjEtYBbL4LKWNW0Edzv1I5YR/a3JLDmEM+pGM/wWtCJSKzWo0wpP6p3UNIM3aOd
	 7tMv91HwT4eK1pzEbBoSAvOwCqaON8kE4KtQHhTL4oZ+GsxdQYXHJexfRPtH2xk3xh
	 eULaJ0XJ2nIu8kUtu3Wio3vn9D6EjoyT+iKxT2pAuGzYkgbJT0EqRjtz5POqKBJLQF
	 ah3YFFF296er4NS+/8tk1cjdSl9/aN76WxLfRP82qIOtyKLL8K6jenlDRnldP+2RVH
	 ROzA5VDcvXNFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>
References: <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 10:05:35 +0000
Message-Id: <20260502100535.DD16FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `dependencies` block forces `adi,pgio4-func` to be explicitl=
y defined when external fault properties are used, breaking its default val=
ue semantics.
--

commit 95d75c53b856792667507b1a119fd7e090fe8173
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dt-bindings: hwmon: Document the LTC4283 Swap Controller

This commit introduces device tree binding documentation for the LTC4283
negative voltage hot swap controller. It also updates the MAINTAINERS file
with the new binding document.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> new file mode 100644
> index 000000000000..05e2132ad4d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> @@ -0,0 +1,272 @@

[ ... ]

> +  adi,pgio4-func:
> +    description: Configures the function of the PGIO4 pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [inverted_external_fault, external_fault, gpio]
> +    default: inverted_external_fault

[ ... ]

> +dependencies:

[ ... ]

> +  adi,external-fault-retry-enable:
> +    - adi,pgio4-func
> +  adi,external-fault-fet-off-enable:
> +    - adi,pgio4-func

Does this dependencies block cause a regression for device trees that rely =
on
the default value of adi,pgio4-func?

Because adi,pgio4-func defines a default value of "inverted_external_fault"
above, omitting it from a node is perfectly valid. However, standard JSON
schema dependencies check for the literal presence of the key in the instan=
ce.

If a device tree defines adi,external-fault-retry-enable but omits
adi,pgio4-func to rely on the default value, schema validation will fail.

Since the allOf block already rejects conflicting configurations (such as w=
hen
adi,pgio4-func is set to "gpio"), could these dependency requirements be
removed to allow device trees to safely use the default value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502-ltc4283-su=
pport-v13-0-1c206542e652@analog.com?part=3D1
