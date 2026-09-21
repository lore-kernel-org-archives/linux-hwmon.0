Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022A3C4168;
	Mon, 21 Sep 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975693; cv=none; b=Sl4906/xTtZWlp7tBmn6h2UJmWIOATlDOznbGXsUZjvQwJnW5+7pChS1LjWWSDvZChkv+f52oWddTr5txJicvTPSMrYydZu2m2qgXAbelMyeh87wa/FygrlOU4pNeiHMbymmkR31BYBSonD3luhQMokyBplf/wOrL5TWfpzI1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975693; c=relaxed/simple;
	bh=6+bKnSKvSExu33JG3bUIaq02dcPIEX0e3plaLt0KpGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUGodOZn9ykVvbyPasJ+XLXrDSExPVpVRmeo6fgWm07caQ6Ra3irOnCi2+P/0/NDvlD19h9Oi35hA9Q2OA3ezS2VwiUl1JVmkUd5PjjG5DssDQXxSDS2Zs9BYt8V1u+LfPpWEXiPjTrWf6LHkmiclXqNcK+Ro2sAclwvkwYZ+ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnvmyoYK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnvmyoYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E831F000FF;
	Mon, 21 Sep 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975687;
	bh=6+bKnSKvSExu33JG3bUIaq02dcPIEX0e3plaLt0KpGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PnvmyoYKXQe4rRgn2tqnQ30UMcP0hyq1/djE7lOqaXXnMyy1g3xnjhCf2XvPxqRGD
	 7WFnVFYBg5yUC+jUuc9CRtm5r/rQPzOeBWcy76eME5flostFhF7UKEF7/pJ72LQ2t5
	 WOk6XCmHA002RBd27/URce3tNBiuwvXVEY+sfSeuPemhPt7ZDgzVUHsLmYez0q+Zd+
	 uRCi2PDMkS3iaG5avw5zJjoyohzHI8rwK2gcM7h++CGGyiSB8YD/sPaA6efvTGcUPb
	 jtu46SjsxKmFbV/llvFLTU1uNC02YagOW79tywDeFgjwxNwYzw9BGagpYiGIyft87I
	 fNWA4CCNF5Rfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:28:06 +0000
Message-Id: <20260921072807.44E831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
>=20
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
>=20
> Add a MAINTAINERS entry for the binding.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-axiado-ax3=
000-pwm-fan-v3-0-3def8b6ffec9@axiado.com?part=3D1

