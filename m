Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513047F3C4;
	Wed, 23 Sep 2026 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158748; cv=none; b=EKTz3B6MXesNmshpfFnQ4BCd205vNOsHXQLjTP2wRKl/hx/HV68UlBIABPCif+KNRWnu6Ge0heCyWqQSGMqaxnvdZ4ju3XlTCPYd4t4ElafWoZXcSl1K3QK0l2yFUlgdIFBpY3qHqHgHz+cL3V0bymZC7y7fauAiDSLh5pwLYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158748; c=relaxed/simple;
	bh=J0+u4PF2pZL8CtrbQae2i+3EILELJcJVOo4ZE1pqsCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bXUvcYZgWcrC9ynqw95VJSXvpgl7MZJE0evuEBqoMecPIGXVhPXxS2c0stZlSDseF5tCOAt7QjEFnFXji8VMnSA/SPGcfRXnovKQNRz8XdndieTICfFDbKfsnVFZ8sYrWamncpPF5FjGd7gjS5oYu5iXhW/0GtVjO9wYcX+/4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNoKZ1QM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNoKZ1QM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59A61F000FF;
	Wed, 23 Sep 2026 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158739;
	bh=J0+u4PF2pZL8CtrbQae2i+3EILELJcJVOo4ZE1pqsCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNoKZ1QM14JHWH+ESUew7qNSkgxg2Ppz1XMsHmZ/kd2tJkmAAJ5/t01xrIg+JsxmQ
	 GNdwPAbPzrFUfzaXpag3Zg3dtubKTiTXcrzTHLy6sgQEeJH5q7m4kqZpeamwehWsLw
	 pkptrO4gtNSHnu2UcFATUM/WSiYxoWKBA+Oy+PCtiqTPj0gwH9Ohhy6VXnpIcdrLYA
	 rppw8JWDX/tX+sPnEsKHt6eqR96skPhuhquu+svfGApRr0nTROnbxnJmDnPzcXyVdd
	 U9C/elrq6/gQSRT6rPqjU7ZtWxz48qbshXizwY/lodSDyfpx7W0KA3LgoQgzCI771L
	 QEU25N5TPw5bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: embedded-controller: Add ASUS
 Zenbook A16 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260923-topic-asus_ec-v3-1-2bf3bb9da879@oss.qualcomm.com>
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
 <20260923-topic-asus_ec-v3-1-2bf3bb9da879@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:18:59 +0000
Message-Id: <20260923101859.A59A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
>=20
> Introduce a binding for that class of devices.
>=20
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-topic-asus=
_ec-v3-0-2bf3bb9da879@oss.qualcomm.com?part=3D1

