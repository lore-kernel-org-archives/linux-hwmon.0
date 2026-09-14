Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21832224AF2;
	Mon, 14 Sep 2026 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374234; cv=none; b=NlMOmSkVtOKymosmjgbT+sMul8Iq6qS8SOo7UVh81RaW6dw4JkG03RN7FHf+kAQARBDJuOqbyjo7zTI5GctvzB9g/QJyEnRUHZdeuX5F5ORjY1nijGutP5sTdaC3LK4PlMoppHiPgu5O/FEb38KEYPOZacXkpnLWy0WcuuxV8ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374234; c=relaxed/simple;
	bh=67ct0lyxHF3GzAGZ/KR9FKhg81oSNsM3UuijxdlWD4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gq5OsKWtSSwcB12bvA+ICCVEa3h/77A3i71oTEHZuQ5BQc2QLX0+j6u+txBwFd4u44qHy3QgsLjQFY3QU+SF+hFOt/QqKFxZ3HmM7nhN428dSLS16dMp5pX5PE0FAZq9U3Ie2MmZEHrfZ/rAtYG4OVaaan7vZbBC27LPmHhEn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxGbzJ2I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxGbzJ2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB5C1F000FF;
	Mon, 14 Sep 2026 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374232;
	bh=67ct0lyxHF3GzAGZ/KR9FKhg81oSNsM3UuijxdlWD4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxGbzJ2IlkJFBCvCRMVZcTIk/1NJhpBXwooFYqo3LEhTkzKL8EXZBJqR3bxRzkdi/
	 AiViQPfxkJaVO4k22wCkPC0MTNYSdEKI/2HHxEsH1mRJhBZXllNGNywuz0W2YmiDP2
	 lu/CymAFhxK28ZgGqRtve2clg73JxDTyA/snDamRxNzzZFaRDJTMpcBwuO1WyoWzP5
	 nGWfc/83ApF/Sd6z6dZtddcntYypR30mwZT+S1BSBJlDcCvDhjyLpdWS+tPsREwlvc
	 kdSdOwsYbn/d4t+y7ghhVMEhWUqzwPr3OEZalQEYmlN8VAL00Jkwptrs6Dlu0VNfWx
	 Grika2V+XHRxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:23:52 +0000
Message-Id: <20260914082352.7AB5C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
>=20
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D3

