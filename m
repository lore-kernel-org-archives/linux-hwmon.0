Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606833612D8
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 01:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787449192; cv=none; b=VZvcTItP3T00ovRqqlocRfywI/uq0OKyDix6i4rD3BiyRY7igqtAuNfezbHuhRfRelNoY9SNQEdJBHTKyF/A+EXZtkIuI2BOiXuJalmUPcRMHFymnfd3f+esrvM58kbe6F38TH4OgiMNfi8YY2wnTruH55ApcsxJDw2lLyQFH9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787449192; c=relaxed/simple;
	bh=A2M0W1mcW2JTJFapx0O9eD+dFPeun+2VKulF4yVRVsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dACggDESFWob0A9+D/5rFRNdoattbswqAnWrtSDb+nCeeLwc8U9TFeuuRXr5KGjq9y87oRais0PHFdAr16q7CMPwe95225lKmu7xHg3fMujlnIvMUEnWWsYh1sdu7jHAZ9RZ7Qa5UeDh7eJ5DIYiCe6sO/34O8PQRpZkjyPtZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yag+Qqv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yag+Qqv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8781F000E9;
	Sun, 23 Aug 2026 01:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787449191;
	bh=5x+vwHL2tRadv3/X6ZGQXA0kLRxgXDpBd1gfwU+e9U0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yag+Qqv85ADXQgiTNzAjd7tuf0KQaT97Gbiybl9Z6FvPC2w08h9x9nxODUerfWnt5
	 pwH1EAggMM6neRLXK09BWwJnBp0QiaxYn0S/blOJzQhAJBzvvX38niDwV9oyBLiyvZ
	 cRXOtQf80C6sn3pWqqxAzVNvvY12aWriYMnaVjrG+cZr8wxiDxTnOGoYKhjfBN/qEp
	 +EEaV0sZ8PpO/XT1PpGV4Bx/UoZeIajw0LY8H7pHv6DnZvBzmX3BXhiJWtdJfOMXh5
	 s2pvqajwYekS+ScEj4QNWA/hgtEHX33XWhMRImRJZ/noFzzErOYU/TFGqdUIHqacnV
	 AxbKOO0zoutAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) fix non-kernel-doc comment
Reply-To: sashiko-reviews@lists.linux.dev
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260823013841.2884472-1-hanzhijian1991@gmail.com>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
 <20260823013841.2884472-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 01:39:50 +0000
Message-Id: <20260823013950.CC8781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The file description comment starts with "/**", which is reserved for
> kernel-doc comments.  scripts/kernel-doc then warns when building the
> documentation:
>=20
>   Warning: drivers/hwmon/yogafan.c:2 This comment starts with '/**',
>   but isn't a kernel-doc comment. Refer to
>   Documentation/doc-guide/kernel-doc.rst
>=20
> Change it to a plain "/*" comment since it does not document any
> function or struct.
>=20
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823013841.2884=
472-1-hanzhijian1991@gmail.com?part=3D1

