Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392728;
	b=uujZcTJjq0rxx05Gw+aOn1WN0ILjYdgIDEbRZ3aq+PWwQmCC/GRbs/E7hvoJFvhcfxFs
	 aPxqMj+ucRD76Jlh7FDdvq7RR3F1RbKXlxlFBg1Gvw8U9Ycc/G1L6qslOJz+3mtXZk+vu
	 P6r3oN9FXKR3en1M7OdJmt4g8aWVwTLarq5p/5LES4xEc72BNR/4RXLboCAMM/CpEsrT0
	 GiV84ZPe0Pj25ZoPRXmRL7hr7JgtrKzzXjYz3TSg1ZQizliX390jWjJcnWUWf2C+MxmND
	 rnOjFHOTw5Ta0f9QfYEYZRI3abwWOBQc46ZNhM44KHPkCUhMcYeMDJFRJi1MBBvUM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WHzBCWv06+W8uw7LVNCe91UEUXDkV8qVa/Ge5wvtwDU=;
	b=t3HNAv5SjaUPrEcriYPErkR6pmc0zUFtwd/Ac27heZpC0WR22JWp89Wn2Uf4kwOWU6b5
	 nckLqNbHqlYzd0ZPjo65Roedk/4GPyI/k8Bxt7FfSUFxTg8v0FjJcChYhMjEGNO/Hd9Vw
	 ERhyEAl9ZVSIpICRwNzGCsgPjMO1JQMAUGvkqrb2fR31z3bAWGuqFYvoV1ulVL73KB0RN
	 Ynpb7QFA0SLk/2COsBbiUQmOG0BneO9H4JxYICnqY1+FzZnu/DJMMLToboUF0RkmEydjF
	 JE0o4MjyiuDBzFdBDBGWQMjLrrFp2iAfBjkZsPCYuj7FLn6dqqGrknHkulislmmwRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl8oyjAi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF5606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dl8oyjAi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D64B1F000C1;
	Fri, 30 Oct 2026 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392728;
	bh=WHzBCWv06+W8uw7LVNCe91UEUXDkV8qVa/Ge5wvtwDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dl8oyjAiU5yoi5noJZs8Vl9rYezFPJraJ0ZiZUTL51PNeAa7ECzZ+s3mEzJBRap8G
	 lWV+BGxFnTqsZmo5ONn4YrLC3GLpl4E1L6reJYH5PKcITfstftA9Cuo83vvFGspgsA
	 PnaSsVuBZ1TyudpoIqaYy7KW0Zda9gVOdU4wGqkALYRwq64qm/F/+VL9JYdnfEhkfe
	 l53V9uQLeIzwL58NJPucDaym7BhqJglktP6IaX2e3hsFAT6qWxnaE50vrOgmnQD5/v
	 r1IB70g6LKJB1YJF+Ykz+EOjgiKvkwYa9YmVPQL1SeEboKbijpG3vrur1OaWuRq78O
	 rrtGDtST9MWVw==
Message-ID: <sashiko-outbox-191486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:38:47 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
> no ID register, so each part and factory preset has its own compatible,
> including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
> and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
> to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
> an output current correction, so neither has a fallback.
>=20
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-fs1603-v3-=
0-6f8963a74def@nexthop.ai?part=3D1

