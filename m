Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231811;
	b=dBIu2mVPl6WgEb6zW7zSgVfKrxoao5nlCMc3b85NSKNGliHCvbKJaeDF+WA3bNSUtsUj
	 TJWYV0hnUI16rSW5/RdS2r7Iwd2Sl2l5Njxq4DzuQA0hLuZgyWzm8wfTuikcNp+b9SxGT
	 X2/c1oI/O1Cv+crHQ/C/+B4GcWGhovFcs8hNj/zqghuE4RJ+VU0fLwUgG+FhlK3gqS+KW
	 ecid/WO4PMbLjT262YlZNpceRaraT6vdGE0RogazG04rS6x/mtBoITrbdqpdnq4J5zYeS
	 xY+UZQUVwVZY4vH13g9H0MwNm1wr2JuPYvN2FC3i4w1hN9gyPL6mAMWLiIjcgD03Fhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231811;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zAHWVcbYNjPrOtbPtrww9i0ipkOfHeXpdq2N192XUmU=;
	b=ZG3o3QDq+hPPA77px7vGgpYK6DKul6DPt7Yb16YEjKV8sD7N3WUKZVWyvkiCVcQTGEt8
	 NThtGavhTZmLdNvdwTSCVxNIfymQGYJNgIw6tJoeQM7fHrc8uqs7m5CfEjk3RqfR5zWOp
	 kDH3Y+k9pzUGMreNzkh4XzSisVxYK9dLvLaVmo76TCX0zwFURgBmvWam+cVx66ajhz/KH
	 MAgTgyHWZM1DvaO8B2iHuDuZ8zSWQQLtUwkxgtHCEKM8JZtJIxszKFQ0la8sHsDLqFn1G
	 7qZEAVZqjSoFzScMlNIxeS75RpNOdYl8WeoQG4l39HRBmk0v8Hq7gduUGXiDwi3knqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QC1ZmvkZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C447606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QC1ZmvkZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BAC1F008A1;
	Mon,  9 Nov 2026 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231811;
	bh=zAHWVcbYNjPrOtbPtrww9i0ipkOfHeXpdq2N192XUmU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QC1ZmvkZeOn+ceagL58Jw44SfkpQflehuhRbjBs+qFeIcyJ1IwrbWrNiYrIwD2XIY
	 2ZPuMUGDIKSR5Xx9worJ2QCMucJSS2nrYsT6YQW6R4dI1lXFYvEktKbxLHbc5lBgrS
	 NC8HGM8OgmZTvjVftxsut8QWuck2JY9hJ/1lBXXhgO+1nMgEeNQOffe/rcY8SvGveP
	 LUEOWPNGPGucmM3ntbKy/svVvUqYOo3gNUm3AgcZ0saGxqz503pYNPq73eMjaQdeHC
	 GQbr8gRlRCmNJXkcy9XNaZd4LrSNMySvCMsdkrR6W8LBKTGCNHMF2JSSFze4exU0dC
	 OywRcnucFTDbg==
Message-ID: <sashiko-outbox-205020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:43:30 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
>=20
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D1

