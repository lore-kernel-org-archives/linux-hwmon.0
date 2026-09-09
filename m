Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A49390CB0
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978664; cv=none; b=bFxfXk8prvSPf9EPc1j4LpFOojIuVqe+DWavczRK6codddKxD7QpXfiSMeYe+KKgEP9G7pCpqs/U+zLK6S2l3GdOG3EqoArq0/VCOyVClcad291wsw/S/xWLOOgegb92cV9LDYHTsVmGcVIKAHODw9hTfOvXdqcKh5o6BgvEzig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978664; c=relaxed/simple;
	bh=k1fNC4H2uF86tzLBIrbK5S9jZjBtBKsCBwd5adg1Q34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUnNIeYbnCZvS9lcejHFdNv4NaOBxzweNsBrH7GREx+zSvIGAfR8dWjFE444QOA2kstxBRw5F4UBR3JE3929XFDFmk2ByUP15ZMFYppLawE94QgwTNffcb94mQ8Ce3K+xRIuWtcAA1BlxywQKmxyeEbP/Xwv+G70UJX7Ai0gtxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM9yptr5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM9yptr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8947A1F000FF;
	Wed,  9 Sep 2026 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788978662;
	bh=k1fNC4H2uF86tzLBIrbK5S9jZjBtBKsCBwd5adg1Q34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QM9yptr5QjWAhuoIOIxN/8QRqDbfWCSdOcGoomXlNinBzKqHqIzcOKeN0nFOVGqYh
	 o4fe1nXrKTVgZi2lLRGvRdPcXNv5GDGwZNvPZKDf2fsO3SizQtmCKgayO06iBjDIlx
	 A6/oP0pJX4QoZVZuipXz1Jw0mIS+B9hM03Y8MPq7OxcBH0TYHsT7ng6ZFkKNnefdXL
	 Yuzn78geFUTZwH24nX6bs/zbzMnzAA0HG7Y5mKUFlrNk4r3DQCHLbiYao9FjSpxsvn
	 h/jHimiNyrc+d4dSUIvG6KFBYjm1c5tr16G5EZAIDJ5I6unTjSJQG0HHrK2wpPTUFC
	 lWqo4SUrTxt8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 18:31:02 +0000
Message-Id: <20260909183102.8947A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
>=20
> Also add the NCT6122D/NCT6126D.
>=20
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-bootlin-hw=
mon-nct6126-v1-0-4e85615fef10@bootlin.com?part=3D1

