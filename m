Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10747142A;
	Wed,  5 Aug 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936640; cv=none; b=KNcDtlHYh/JZeuLYmHAkJF74ETzmLuhQTq71rrtZc2iTYSNSXPJeMUYkCs8uxrNKv4/JNbi25YiLpSA6Z0o2nMR5wZPaOoUE6GAfEQLc5GF4800N4AwJhC3B1tiagW4oYO2UfQrSM09m95iRaJuHXgC/AcwCXYFdY9TLhy0LZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936640; c=relaxed/simple;
	bh=VRMObcTTk/SYeilCpt7OjCxkUD7YC2VBWNRIRgtRktg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rv54mkfjvCVlAdQm0Z3tDp0GgPMrCbAOzb42+VTDxHspquQNWYrMBB58uQUtLkOBNUZo17rwQqMrr+fXggBDD3CmoSrPZJcUYOg9NU++PDL1HcNige+yzpoVtBvi7i5FCAjsdkFvXdB/RFAnkxadM0y2AT/1qiFzxQGOd242PJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nukb/Shy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nukb/Shy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86DE1F000E9;
	Wed,  5 Aug 2026 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936638;
	bh=VRMObcTTk/SYeilCpt7OjCxkUD7YC2VBWNRIRgtRktg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nukb/Shyzujv1+fiyIW70iJU1CyHzsq4oEap9KMWM92dH166uWDgNG3r9ofOR2mrO
	 p2H7MI+bJ9bRLfc7M4TfdxBwhF2d5mVivlVU+CyP2F2TWCrst25C4G/WvGbtXlEdjV
	 wTiGo/5h19uyZptaKwsD5Nnuuy1AsnDMMk+Dx+Vxug48r/AcgHMISSPGWUMXfPv+Yp
	 FJtQA3ouMSZZ9jX6po7lEIfgm2NUYH7iI+4Z19zfuc9OBImN7gDoVm1nU/vQh5e5At
	 yNt3Zr8XJKg14BPcuk8R3Ik+hqYNOSc8UpnXGCYKiDA4yVACcbO9SlGWSkPTF98JjG
	 +Yr31sFScUC5w==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v6 4/4] hwmon: (adt7470) Add thermal zone
 sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:30:37 +0000
Message-Id: <20260805133037.E86DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Register the ADT7470 temperature channels as thermal zone sensors.
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-adt7470_th=
ermalzone-v6-0-5605a5f95467@gmail.com?part=3D4

