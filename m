Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333698;
	b=naLuha6WjiCRKBP8rlQWFXh/X0RXYsjtMjNBjzhq0aTDo63fzoMHYXw31jKYph5XcjN/
	 +XJNIN27SyKFEn/Q41qww+Noc6e2Mg6LdjwA/8Wps5z9IZSJ3M5m+fbWarNMkURwehqWS
	 fEZ9JqPi02HB7fa/+zm1QCXsuhVBPiO6/qJCqAYI+7MejkbV7uwYwQ1EU1WBTDFsCWixq
	 C2PmRtint48Q1KwqYo+p4SWrcouWaWG6CrF/LW+cvyyw3EZ4yd2lOExZSUeWe/moirH6h
	 LpK/EztZzSY3GtPrJEI5XePJl1MBLE/Yo872o8aA1fqLrtB3gnpdgffFzC9Vqh9t+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333698;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oDHFGMcAWhRD792o7b4k4kV2QJ068RIkAFxCucDIXuk=;
	b=xm6hFLKPrQFrsjM2wbSy+lBVORb/GPiuP9JtGyBqGtH3VBWmHGa8ftdm/TGrcR+RWl3M
	 yg+opzvQFEbubipJzCLtsiXW8G1hGu1aMqAsR3ZYK9HbTDsuC1ZDR7O0n0jZ4gwvYKRne
	 oBUXha6606XEYH88W/Vr5+Q9UugWy3VmBIk9BEoqYHYETVjNfeXeDC+m55gaOg6WPdKAc
	 QXH5pBNEBm995zgTJETo2lWHfwUd7lylrNJLrOP9oowodpDTwbyzK2GtrBUfvsLkMD4k7
	 nIagrNY7X1DDwMKMM+L8R6LU/tAU3ZO0s2dbBvIJRz2JQMSFJ90p6giSWn099f82vMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAsLFdjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAC606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAsLFdjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E671F000CA;
	Sun, 22 Nov 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795333698;
	bh=oDHFGMcAWhRD792o7b4k4kV2QJ068RIkAFxCucDIXuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAsLFdjLFPJeIzS4AY9gp8THg8tAfWeP8M9faue2T9K48XjrGWZeU1F7HXdbi61ZN
	 XbWYozjBX1DaimOy3RQJrhhqbiuJH30/nPTf+yN8bIFY7e+ntrGFv4Uy9p3PcYz2Th
	 IMIQKI7AETm5/nbY/664lVf9PMPogadnQnbJSiY1BfeGHjTVxAQtX89IXxtMBcJHSZ
	 lBNsZHqac5L8cBv1xX5SmUCxzqdfQcCwGY4Kp4CFr4pV4xnAlQO7roYWF14ciaRWlO
	 SJq8LOryCPjqORZdRVBWDJpyJET8Kj7hu/tEmdpJqubhnW71Mch1U2gLoCUdJZ5Dx7
	 Y2Dimuu7j1qmA==
Message-ID: <sashiko-outbox-227795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Add PMBUS_FORCE_PAGE_CHANGE flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261122073322.1712843-1-fradensky@nvidia.com>
References: <20261122073322.1712843-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 07:48:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 2 and 3: no issues found.
- Patch 1 ("hwmon: (pmbus/core) Invalidate cached page and phase..."): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122073322.1712=
843-1-fradensky@nvidia.com
