Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305885;
	b=DlVtsN2m+Cp2KWz35Yms/UKeRViV2KCJUWn67P7zruUPddQLZmukEYFlar9PVGfSPC/k
	 StFVtPkgL7o9kXEjVnUUvGfnWPpYoa70eFnvRDzbFPfyygTf0FSdqmadQMcVCkBOfZMfI
	 V7sDtovdQOjZf3OKGoLVE7AzqiYy2MdCoAUbePp1+930MsSrwMu/WG3II4n3RaQsNhjr/
	 pY+S7gzcslqSqNG0S5jilAiYud3KZRh8OiHdBr5TDUDw4L5uodl0ACpQ65hKnWfE+Eadw
	 WGbK5j6PibBX9/S3mCY7Wp5OuFW9sW7lbens0BBqVZQ0EVv7cruJawiZrMGwJoxNlMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305885;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zeCzpXsZDV55wvVhdTX4OY85nxyc5mhtQq8W21+eei4=;
	b=gCpoRtwChKaz8f0YB4IjeEWNfDztg6jJKhRvC+yUdQg8tA57A6VX4x4RsQwNYgYxMhFB
	 LAXfUMyJFL4jT2vx6NKhd7Sqq5GxLJYJh65AzANqdKLmuha7KLA8XMXsH6TbIKqfXHRey
	 ad2VytYO49ABqdGekIzgkkLnH0W8nU4cJalzz/YYfYfmCNdt0snpR6cXqacyYPcHArhxl
	 rnY2EibyLHu/8u6MoKnwszG3zhcYjo9Jgl1JEl0dskEvqLtD2Ie6T4+XltOa9lZpghbrS
	 Vn2oZ4MU6TqmiEQgmhIJWSvq86IhomLXwljxfaIRzk7t7Ws2iwGB+a6jX6c1/lumDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FYxSZY/V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95363606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYxSZY/V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B06E1F008A3;
	Tue, 10 Nov 2026 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305885;
	bh=zeCzpXsZDV55wvVhdTX4OY85nxyc5mhtQq8W21+eei4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYxSZY/VWqXpuApETGNxAdx3pkmK/ZtKCncjLQuCiS8jua4KsMfFVQbM/LdOF2P6f
	 2r5wZy1IrdRGMRxQWX9cnHcGu8DVrmB6ZLhF/Y48cTJ4HoEq3WUq7Sd5TmljLAGgi3
	 FYo+IXTOMe6pr9W9H3eU124yy6+GXhq9lv1hkpSDiilGG7qJslQJM2gXPgDNJ4vDqE
	 SPnHnU8HNBK8ayOF3sHMOnqMpTvPRs3rLnkYf84qf4gsGObRGPzAQXmb9waDt1DgQW
	 gOCG80vt5K/csQEfKvgpCDBaZ5HOYk4TBZdDrS18hlh+n6020l4pHDI1FYvjDXfhpV
	 hdMBLsBBN5W0Q==
Message-ID: <sashiko-outbox-206851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: ltc2978: Document LT7175 and LT7176P
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:18:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document support for the LT7175 and LT7176P PMBus buck regulators.
>=20
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-upstream-l=
t7175-lt7176p-v2-0-dd60d28383bf@analog.com?part=3D3

