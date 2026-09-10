Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18BC3AFCFA
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029169; cv=none; b=c4rbmhEhB0cOB7P+sPPY9VukGpmtNATtienumczERlsG0SkjxOIINrXfamtZzUXQcJ8Wvh5wBoyCAn/QInSpMz+9CmUej1TGJs2Bk3Y5WunPrydNgB/6EikyDu+Zo1OBO3s6yrMYbVkecxDrNaaAtDGwYbAIdCej3kIK2+/pTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029169; c=relaxed/simple;
	bh=dLgXVjwW3Dt0wdRsERursvHa+ug+zrLd7LqRheLlmSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b1DYFmvvTglEW1r6kGu5XDCxII5bUjHpsz152VizZzkL6vuKsIA5bAj7G1kbk29+4V9KTyH4UBdYaIc8esrvl/k7Kq/TDRbs39IiPTNFGS3R1XyPT+hIlS9h0sWetesRtfrPX38SIGugoS8wKe3M6446OfPb82HMwy53ZAVFad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAk5k1tj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAk5k1tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A891F00893;
	Thu, 10 Sep 2026 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029167;
	bh=dLgXVjwW3Dt0wdRsERursvHa+ug+zrLd7LqRheLlmSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oAk5k1tjPGRAVgEYbtMUhMjdOfPJk069vXc7FFX5Kg925CaEu9ap+aL8rl8hiR9Wl
	 /b7S2PlYUCqlaB37L1dfjfCOVuL9N4oIDbxCshqEdTgooeX4PxI+YO9n5rFSbGUqYv
	 VI8IEfZQqONu4A7mRRcdpFGCKkwMnFzG2juftlH8NjQ/e+BFtWwpywG/eQDkPNAzaC
	 LtF6+TRpDHrVQiJz7Sy6Rl5LRNIMsyFj0LH7LYA8/Jfe8Xz01Laj7RtN4M56pozEWM
	 EGacrvZpWehHam1ntqhvW+TI5eYOCeaP22Sj9My/DLq1WLD3HrSfZ8VW4TMBu64mGP
	 SSQdBN9NDOU3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] x86/hygon: Add Family 0x18 DF node enumeration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-2-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-2-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:32:46 +0000
Message-Id: <20260910083247.27A891F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
> discovered by PCI ID and the PCI BDF is only an access point.
>=20
> F1x200 supplies the socket ID and SocketPresent mask. The DFID comes
> from F1x200 or F5x180, depending on the CPU model. The (socket ID,
> DFID) pair identifies a DF node. The cache is published only when the
> socket IDs observed during PCI enumeration match SocketPresent.
>=20
> The resulting cache places Core and DDR Dies (CDDs) before I/O Dies
> (IODs), with each group ordered by socket and DFID. The node interfaces
> provide node counts and identity, F3/F4 lookup, and PCI device-to-node
> lookup.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D1

