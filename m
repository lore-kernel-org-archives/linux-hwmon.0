Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26062346FA0;
	Thu, 11 Jun 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169021; cv=none; b=Xq0fOcCXurVww5lJnEIT4VA6xu0kz8pRag8NcVn4piONw9tXjFNr5NiMdWWmc0ZsG6O2KNeHLVga+jcDboi7umBPGlUXvF0N5GLmB0USqylvb3Vp7RBxVvjB8mh5xMoI8PjLBiuN7cdVyZO6F2qKg3xUC1rn9rEHaAE2SpgcTgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169021; c=relaxed/simple;
	bh=Nj2iQKdZ8vhHEIrQlb//dITR5I6yLP71nkezKOGMixM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MPcSDma3l8s4Jon8liHEFnSbNI+YzvOhRDoCJaCq6218wzKUthIo5hpxqDHt8MQojGOzTFMLGofBAradJYyo9tHW9ESnf3QXFqEENlPlOiqydchHbyQAMoUPYHE5FRL/gacOz6hCkFIps58J4d18g/gTTUretqUtuFtDWY8jY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfy36DyS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfy36DyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB321F00893;
	Thu, 11 Jun 2026 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169019;
	bh=Nj2iQKdZ8vhHEIrQlb//dITR5I6yLP71nkezKOGMixM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfy36DySEHm5lA3D0Vd9G/JzigXsOjUkaW5PvFvsYp7LWx0dyU9tEKwnssI+ujgbH
	 LR0r5oVJ7J//jyIqlW1KGlWGQwhd4eD8xbIE/Oxcsw857WUttOUuxogVjeTDYpL9O5
	 ksz7klg7kpZr3ppBP1aeiBN0sWG1LYC6cu/yuxUKtw/2PA6AKIjS4euCJhqoOAYMQ+
	 CQFpVPmzYpz/QIiQePQfuuWJU6ahFeInO1BOTIiEBhjnAD7fiI6s2ZSFAxcwcW76xD
	 B89GsvqVg5bIo5H2Bcvsj2dXDnEMuYQ0OF6e+0XRA514vyclTqewui1Cg3Tf0peiGt
	 g1DLk3a3h/9ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611090610.757-1-hehuan1@eswincomputing.com>
References: <20260611090610.757-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:10:19 +0000
Message-Id: <20260611091019.7DB321F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
>=20
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611090505.734-=
1-hehuan1@eswincomputing.com?part=3D1

