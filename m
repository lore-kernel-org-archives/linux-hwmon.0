Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606B3264FF;
	Thu, 25 Jun 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403730; cv=none; b=Y77D+UssXxBjqBqGt/9hBTe333CvJnGmge6Y2pw0qbIl6IdH9zypRavfIBs+kngUcgsciyoF1xKmLmesp3IrUFR/vUZZQANCROIRJ5mq5d4PuP0DA4UNHK9cSJbIFV+rw6ZxLLEfCCn/vKpHCtsOqP3/TEpY8r1xoWAQAuRsSEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403730; c=relaxed/simple;
	bh=xpV1Nmm23JWfQdwgn+tHAMRAQEifGsUVWM2NNHsBYY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cLqC1SVwT89k4EYPQ3LjpSBa4IqTthoLipTHOlo2qr+jcucfevb0VBd/aGBPeCZqvs6aCtjGO6nih4w9FiA5PD8TTZ1EPwS8VDiUWxD8yqYdi6Qx3XsHeZNS8BcMPBujVfsdWfr4c70zNKMhBQMAAwJ71+M4nDE57bh4+Qi/MJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9J+kd/0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9J+kd/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9452C1F000E9;
	Thu, 25 Jun 2026 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403729;
	bh=xpV1Nmm23JWfQdwgn+tHAMRAQEifGsUVWM2NNHsBYY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9J+kd/0UjeKVxDKwfbYm629qEOCWwwovdHJs9AR9Cd13jNalmN5DXpKcT87oFX30
	 Hl0hFg4MvvBPVnJGpgdvWaZlxlqnie7JZUyjx/ExCjko1IepN5EJoprolGJDApq9l+
	 oGXWz2qNaE0gTm0ZBspMkBMtCWf4DZRclAFPq4t1YxFkeB1Zp2GRETLRKsiOF2JecU
	 STz5Y9QzrsChXPMEJlxgxmVQ2JEhtc53Lfj8ER1Km1wGbYIl1gH8teKYpZAW78c9ec
	 BnFCT0/amh+FWuk7zjsDIxKsdYyzyn2gxP8yLYLQDsQw+VA9garPkiMiFN2s91fuWz
	 /Tznr7R7Ke1lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:08:46 +0000
Message-Id: <20260625160848.9452C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160423.1788=
2-1-flaviu.nistor@gmail.com?part=3D2

