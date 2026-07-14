Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBB3FADFD;
	Tue, 14 Jul 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017972; cv=none; b=tYJgHGp3Lj+RkCNHXAGMfZjqISh+UYNyRId/KBdporvRY1xodCxCBX23NZvbOMODbgfJ7B8bcll2w1euB5If+skQK4Cu7kZJ05/bMuuWlwxYhTPfSHSkdnbWNYDf50z1Cyd32SQFA7kPbeqEDkWEQwArJzNpn+taVbRwyq/VOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017972; c=relaxed/simple;
	bh=b48OZ9CaVQ8nyQDDUxCsqw0CCUVdQs21oJGISNQety8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMthdas5enNyMPeujT34cxGa/1wQn0HePAKFUgo574lHBJhe8OkvvYkGUCrJjhEWM2rdkl1ZlIoG+sKYgJhsSwTmX6YbSRKdo16MeQ4hVcOkYhjPajwMtrvG7bqrNTvr02WNlRXfpsFAwT0Spejc+fzmOufz37czkdpALs+obQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0bAn2gO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0bAn2gO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A490D1F000E9;
	Tue, 14 Jul 2026 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017964;
	bh=b48OZ9CaVQ8nyQDDUxCsqw0CCUVdQs21oJGISNQety8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B0bAn2gOkLXCCyJUL2H+1S7XDBacWebt7YDXXD6yTDfu2qMpHxPC6KSLeZd0dFKeE
	 2zaNBOb5oJGDMiJ2wn6BqfPxIf83UQUW2lRfJAHjzNG/2QR/j7H2IY3SPFAyBN5cV4
	 kP/sEygL/+iiwwxmilFU6303ZCOyg0l7Ld0yR+hZ9FALXyWRBU5aAOKly8G7WUnCvz
	 R0A+wjwUgEawogXTecs6yj2GaVJfRVDBv0ZorJkNJmQ6kb+VY8LTY4kQuXlS8PReLR
	 mtNNRE0XBqmAS2bNTMU9O+uW21y2nuiDtvMPjfAyAzdN2D4TqT5qwgPoiADYCyhC0I
	 llUb5NT+V6jHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: hwmon: Add Kandou KB9002
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260714-kb9002-upstream-v1-2-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
 <20260714-kb9002-upstream-v1-2-8fd2f0b135d8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:32:43 +0000
Message-Id: <20260714083243.A490D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
> SMBus target that exposes an aggregated die temperature.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-kb9002-ups=
tream-v1-0-8fd2f0b135d8@amd.com?part=3D2

