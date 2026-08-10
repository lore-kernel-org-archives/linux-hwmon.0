Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFD42FCB8
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390915; cv=none; b=OGnBBFqKxqoSNZJ2M90AFu67aiOaz6irP8ZZr96P/wFCViMdAVGZquY+VKCnnQYUDJZDBa6e0uU5155hn1WFsD58u/0YgrkCD9WGUu9TZ3j3n74DfZohbr0VDlQ76wJByvTanVkYqxIc/WSkE4MRPiIQBF5SVlDwUmX14a+dLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390915; c=relaxed/simple;
	bh=RyLI6orvzOxmOQ2NW6RLUwWE3JHPXyIiTa6TO2F7Y9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZVokKjRGP77C2i1CB72JQnMerx5dGFkMVR6vT+ybVULpFhAlFqL7MbiLm3H8KFej3n0P3OfMm8LMZit7/W7Ko+FsXIv1UgLCwDzI3qhphUMmW7XckTUobkI9Xq1IbDYnBbLJ6SNYKirwIFbtbsXrRb12LnT++uzdiCJdf0wmKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y01ZoDbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y01ZoDbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD7E1F000E9;
	Mon, 10 Aug 2026 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390913;
	bh=RyLI6orvzOxmOQ2NW6RLUwWE3JHPXyIiTa6TO2F7Y9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y01ZoDbLxv8Z47/zdaEWgVVIzgFes+oKPNoJtBmvXXvLAGiKW3/SjP2rABy60fAda
	 cQX/WD8MJmyhFrT5+2jWyVrVaOUbHTjyTK1r7jiOM/8gv2kzZcI+1+XNrgjGFvw97j
	 luE24r/7GL1SZ5F5s7BwMUapdRneALAKbt6h7Lntvll14Ri0fsOGOGhILdDvNnjBFp
	 X/tfL9R8f/+GO7V/nK1uhu7jKT4gTGg+ze+I3sVUFPd+S1nbGMRRX8KB/zX9cuFTxw
	 rps7RsapDE7DrFWjzkmaUL/DgGc5Bpr0zfaq2aie63z+o0rSoLtU0pSBVGSzqDxNDB
	 fJ8i1sj7kiPVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Fix core_data leak on CPUs without
 PTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Szymon Wilczek" <swilczek.lx@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260810192344.3733721-1-swilczek.lx@gmail.com>
References: <20260810192344.3733721-1-swilczek.lx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 19:41:52 +0000
Message-Id: <20260810194153.5CD7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> pdata->core_data is allocated in init_temp_data() when the first core
> temp_data of a package is created, but it is only released from
> destroy_temp_data(), and only in the branch that handles the package
> temp_data.
>=20
> Package temp_data is created solely when the CPU supports
> X86_FEATURE_PTS. On a CPU without it, coretemp_cpu_online() never calls
> coretemp_add_core() with pkg_flag set, so pdata->pkg_data stays NULL.
> coretemp_cpu_offline() then skips the removal of the package interface,
> destroy_temp_data() is never called for package data, and the array is
> still allocated when coretemp_device_remove() frees the platform data
> that pointed at it.
>=20
> Release the array in coretemp_device_remove(). destroy_temp_data() sets
> pdata->core_data to NULL when it frees it, so the added kfree() is a
> no-op on CPUs that do have PTS.
>=20
> Tested on an Intel Core i5-1135G7. The driver was instrumented to log
> every allocation and release of pdata->core_data, and the PTS check in
> coretemp_cpu_online() was patched out to emulate a CPU without package
> thermal support. Without this change the array was allocated and never
> released, and coretemp_device_remove() still saw a non-NULL pointer.
> With it the array is released and the pointer accounting balances. On an
> unmodified build the release still happens via the package temp_data and
> the added kfree() sees NULL, with no slab warnings over repeated module
> load and unload cycles.
>=20
> Fixes: 1a793caf6f69 ("hwmon: (coretemp) Use dynamic allocated memory for =
core temp_data")
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810192344.3733=
721-1-swilczek.lx@gmail.com?part=3D1

