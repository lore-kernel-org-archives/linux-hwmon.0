Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89D377A93;
	Tue,  8 Sep 2026 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851337; cv=none; b=hdaNb+QV7RcVdel2RvVvOlZ+nSkAH7rXP7PVgcT9bALS8N2zCztCUsFznJJbwboTfU5jFrl8X5osY+AVfkBhLMIk7AXiTNibHgpL+Of/zhQbGHOHhWcLANj/PT1BmLeavOQb1abkvsJcOx2Jk7K6EZWhNlZpDsZV7G7x5TyRev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851337; c=relaxed/simple;
	bh=wXILwgGEwb7IbxpXRJK2hNSYWg9MIjyXIEMVx60BXD4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r7p9bzPAM6EFFh2Kshhvh1ikN8DHRR+/F7jkiOcTxvUhYhczt7RWuSANnkyLci00F7pB7pU28tKUnUDqJk4s2PKJZFGR8QQ4DLaL4ApRnEQvXXrhxNo6Inn0NUyF0qkAn5g8Iljr6QhBU/ny3JaDqqWe/PFnMCusnC0A5wo9+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHWMGzwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHWMGzwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A35F1F01558;
	Tue,  8 Sep 2026 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788851335;
	bh=wXILwgGEwb7IbxpXRJK2hNSYWg9MIjyXIEMVx60BXD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHWMGzwbbCvhUSPxEMM1JZC8jAzOGVILQy8LD1Qs0Kjqheykv9cIZsxD2MNqbiF85
	 RX88vsf2YqrpZwAusvqcuLhOlwBiIX1E/Xa8dba5wj3CMmbJzy0/0EQeKdgMTC44Yv
	 WT/ADLKChjW95/F65R2sTcLXrVGodDClcAmzZjssPnc3U6j/18FnOtH/8izCoJm6iC
	 syRakCKdJPcgPp/A7zX3ThWSW5o7Ev6VUKiah/s/u1KEa7zwi6EQUBldfnZC7WiXyT
	 FSoksFSNnqc3vEx+Ykg0F4zFks3lbjSnU2qkMyIOcYYTtVgjserN6TIHJJG52C1Qi2
	 SZipo/6KgGH3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260908-add-raa229639-and-raa229640-v2-1-83c75b61139d@gmail.com>
References: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
 <20260908-add-raa229639-and-raa229640-v2-1-83c75b61139d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:08:54 +0000
Message-Id: <20260908070855.4A35F1F01558@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
>=20
> A fallback compatible is not introduced because the available
> documentation does not establish DT-level compatibility with
> any existing supported device.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-add-raa229=
639-and-raa229640-v2-0-83c75b61139d@gmail.com?part=3D1

