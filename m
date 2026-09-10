Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AB379EDA
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 05:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016847; cv=none; b=GbKRTfJOZormWMBpMtvULJbeAW47MTH3ifRYvblc02tP+egMDdAnXwCM9OjGY5enPymuxoP7IeFBFOrizjHp1NY8ho/AJlTxZqB1etTG1xa8KcUjxteRZ1SUYXqn2xG88t1Ywaye5p+3IMrSS+7ZHPobZ+8yZTG1BszP8nyz7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016847; c=relaxed/simple;
	bh=nO+Y7oymYgSn8KM8tXt0jXm1d6M6jFVboo4uLcweifQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q2Qg3bZtVYXspXaTSkFr/X5NFHg6XyDSSf+JUL1EWobk6ODxR+vk13VOGVIkOQ0nOLknRY4i6qPSpKw1ciGckjO3Ke9CaQfVQ0V+t/qFPrT/v8FGSLYlCS5u+toNIrMFf2LaokjMe2iKSZb3zkgtkh6Y0xHunQ54+nY8ZsaAiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp2bOipa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp2bOipa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814EA1F000FF;
	Thu, 10 Sep 2026 05:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789016845;
	bh=nO+Y7oymYgSn8KM8tXt0jXm1d6M6jFVboo4uLcweifQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jp2bOipa/Rcz4hq23xUHzurHzn53I8vg+iSgN/pKVSCNKR5edAqpQEzw9fywGxExs
	 AveCas+heg/Ku+YR7xzYxpdlaAVzdp703wj4W0W9aM2tXTUCYlNgJG24+llnaRuGe8
	 Suphog3yRCAXjpO3wToXXl0wzyWZjJG6VvkcvxOvRtTSBHA3NaqShYTXuERjMj/BhG
	 IZuxUSICuKab3898S7HyOpFPeQ/tflOtYPDzc0j/SWNYLqAOAq/tdJi+A5GT0e05go
	 THxLW9b92U7Kcqy4oA2mWjm3GmAQ3vWz47FWte/uPtKo8N3vvKGQHg9qUo5K74XHbH
	 Sn8hxunjQONmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: arctic_fan_controller: dual-license
 GPL-2.0-or-later OR BSD-2-Clause
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aureo Serrano de Souza" <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910050401.279868-3-aureo.serrano@arctic.de>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-3-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 05:07:25 +0000
Message-Id: <20260910050725.814EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The in-tree driver is solely authored by ARCTIC. Keep the existing
> GPL-2.0-or-later grant and add BSD-2-Clause so the files may be used
> under either license.
>=20
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910050401.2798=
68-1-aureo.serrano@arctic.de?part=3D2

