Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C630C37C;
	Fri, 29 May 2026 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780014602; cv=none; b=ZtzV0uG51G+df0EmVbwdzHHVheWsWt/cZG0aROukh8f/+yT0bs3rGAaSEg7NU3NuykpfYYTgXzSemyM0+sd3Om1n89EvQZWCKh8J+IfwbWeIPi7ZYYfzMGN8N3M5oMCqUHtkDK/zZXB2aS7knlx+MPPlscFdbny117INzFCkDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780014602; c=relaxed/simple;
	bh=+NrPJ1ZLO5blblyKbX1WVNc2EkAFscLrrTRA3OOgpRA=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bKEOMXJZva099eQeRa0bSMRFdGDgn3gs4kvkYmay8oh2G+rmf8kfWbib0KT71PTDqiu3vv42n++fkO7+abOgLPSIMMmcYNLAVJfMQwVfcWOYRgvJ/ABNhNf05CD0tOFfnxnNaN2xcDwa52hzM3HcyHdVHbAGUWNd5SRGAsy1pJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3KguJbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3KguJbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8334F1F000E9;
	Fri, 29 May 2026 00:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780014601;
	bh=+NrPJ1ZLO5blblyKbX1WVNc2EkAFscLrrTRA3OOgpRA=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=A3KguJbQemSHyi4fHqactxDpIkaebn13cvixiLq26kWBo17+ARnSv8+ZRfLZDR5dW
	 shTYut0AcQexli4Wf0I6ut8rEOVCbHD3hwZYnHFfzFAmQOIa4YD2yalKBjIiQH0u3O
	 5Klt/+0HJi7Y6WZXHgE1j3hQ0UZBtx0zhELqSYUfMSooLBwY7KvZ/EAdc0eOr7MoYg
	 DJuXRPbeVT4nNH5lnysIpqKKwJF5LpajJ1PtYuljbOh32uMYEvlDWn4k6bBGXsHDvw
	 DqVYqwPlsBjvxZHMiC0J1iK2B9lbIQKKELpaVDYaKoe1xma+kMhQYZKD9wprLsWFd3
	 zYgCCgtbJuUGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260529001903.625737-2-sanman.pradhan@hpe.com>
References: <20260529001903.625737-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 00:30:01 +0000
Message-Id: <20260529003001.8334F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529001903.6257=
37-1-sanman.pradhan@hpe.com?part=3D1

