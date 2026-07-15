Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5023EA97E;
	Wed, 15 Jul 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106642; cv=none; b=gHUKSqhxZWhotafP9u0OGdLU07Xu2JrP/Gsdr6N0wcQaeYc79Bfrkkxz6xtws2QWqdv4rZzcgJOE1axNt7LIQGefRnd0+c8jrqgMeMF0ZfhK2yCtPbi53BwIlOWKeV6hGxunG9JLWUlgoRba52gd7erUqaQrcWbapfw7+avL8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106642; c=relaxed/simple;
	bh=aEeMlN9+1Qit066TMylGzOE60Ri9/ncJU7uRT9bsQ4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6vsCxn4FrxWsWfd2as164i4rDvsvI6ojEUstPhbZQH2HRK+hyV7GNEMNvU2mY1jErZpZqgXz5gI1sZb7mvIvKykmnevy7Lzh+sJNhEhOFWzas9ffIFiTQ7w4ujfLMgJhjKGyBlhJZc60Z0WnzxJvN3ui9mPa1kY6Vs+ROjFA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv6hynUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv6hynUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F131F000E9;
	Wed, 15 Jul 2026 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106640;
	bh=aEeMlN9+1Qit066TMylGzOE60Ri9/ncJU7uRT9bsQ4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bv6hynUgN8/pc3TXqW+A03qHTjsnyTImyeid6wusXTUNNFM7jB1lFjzpN5MB+mnlt
	 XDUNlmqfLBw1mvuNxM278m5DCPs80cXuY8PHpQhVtmJPA7yKr1BOYHt+8SJjIgmZFv
	 OrR4ygVVeGmh/ZQ79sSs+bdYbjvOQ6RP9kArXQUMUagY9R7P6ubGQzOyGM9b6i+3s1
	 O6vq5of76lJQFl5bXsEd+NqlQaoLkzeLCFT/DdJn6RFUUAAiyDGbmqDJ2GJZX5zc+a
	 V5Ng3GzPSmJYUbMA1eIJIEtUmHG+IKRaiwJHLfjkmiLkceCpWHOsrhU+c3upq3BDMr
	 a9jAp0jwTHdAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: Add vendor prefix for Kandou
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:10:40 +0000
Message-Id: <20260715091040.77F131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-kb9002-ups=
tream-v2-0-2fd390383da5@amd.com?part=3D1

