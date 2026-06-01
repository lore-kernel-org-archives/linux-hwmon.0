Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF238D41C;
	Mon,  1 Jun 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305182; cv=none; b=MvFbFI6Mh3kDv9knLZ/dkjK54A2euv/0qPCevgyY5kvf7/yhbtQtrC2bHYFLLSAy8oFzL4TfywZbzr095OHoO1QXajMA+xMWAAT5lfDxQfQUJPIAAZ9mltY0o1cF5CSDLPFjn7K/teVg1ft/GR5sHBbIJVNh1wU9nAaCtTUS0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305182; c=relaxed/simple;
	bh=GtQwOPZ2MUslQZ4SSmE6jL4MZMk276xclW15XL+H3Yo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XQC06wLvrtCF2Z/U+MRl0LSujVSCz0Y+5+3DmVn4hW8Ql0ejoNcpAjvO5FcwRPaeAg2Zj+MWbZ/K/hTWMOGq16Jc6lNfocixm1X86tQaeUG24Onj08bOh23i1co9LFUm40oo7cKWds2GLQF0/UgN1SgYObS8q72BgDmILG8SA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqUTAI3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqUTAI3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDAD1F00893;
	Mon,  1 Jun 2026 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780305180;
	bh=GtQwOPZ2MUslQZ4SSmE6jL4MZMk276xclW15XL+H3Yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lqUTAI3zy5qluGmYo8yY0/4vmCDomQ7KZBgeYWgCeNi+YCTkXhM6b5cV9W7693Zx4
	 DUgZvoYOj1Hw0Zn1UF85182g36ChbZRh7l/MgpqCv+yjuUSw6EQ4dhCBm727P02Kny
	 KkxRA+DmdkzqDxL7zRq/Y2ZIZcp33nSMTTwNAxbgyCxIp14FmBZgkLRJ9miOQW4K2C
	 52NI7i14RIpan82ZkWQlN+VtO2uTK0ATGfclUs3KdEgxsZWvx/199PX3IcgrINGohS
	 lzAeIU9ITfM8j7RUVoxHnSCP+PUrYkW3GvcMixGhkvLkDjU0yGyVPO/xE/2oFdzv0i
	 yCB4NIWGfjoNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601090925.3781-2-Ashish.Yadav@infineon.com>
References: <20260601090925.3781-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 09:13:00 +0000
Message-Id: <20260601091300.8DDAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP730 eFuse.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601090925.3781=
-1-Ashish.Yadav@infineon.com?part=3D1

