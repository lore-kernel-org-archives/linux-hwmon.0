Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBBA39F187
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297786; cv=none; b=EMQF1taZjuJ0elo9Up9vt07zN8YaKsZeaHZuASIZ5HO27axUkqFTnnYvniUSQcMHbyYVyfotjCtimOgzR9wKTmtxUDM4yR77jP/qtbUJORc1Uce88LabHmTYIYtb9JZ8diChj8hF75nYaSbVolZNnYw/SqigjJ2t8utti8SKKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297786; c=relaxed/simple;
	bh=xkcswpi19PZph/QbXtNojPgmF7kYURbu7QXSsFQat1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dj2MwPUUuoIP5W+5Cp9zVbGWORiMy5F0gStpp+w86/yXwQm89maPzFj7ZdmrH3Zru8njdNV77pLW3D785hzfgN5o6iWJPkjx12HTf5cBfOhX6I64GFXc5/Jok0P4zYZ2NWllTH/J90xs1GudHkcFBtGnzLwIhPNTUJnIooIBFjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPRyDa0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPRyDa0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9031F00A3A;
	Tue,  1 Sep 2026 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297784;
	bh=xkcswpi19PZph/QbXtNojPgmF7kYURbu7QXSsFQat1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPRyDa0rZ/NTRjWdmNhHvKt1MH222yPd15RKcS8CnrUHIDDcjUHgyW8O1ILpEsqfI
	 idNn1ksLtwnjeqRk1ff7oLRKAAhRODyabsLU/7m18UrDWff8i++Z8rp0RxdefTi+Tz
	 fMMMWZkDoOhOj3vQqwP8vb4CWLLB1pTdwINNm7EXwEAkiSVyRNNeD2lGqy46OKwsFG
	 YrMMtMgVkgFqGEW9Idpry9x0rcw0UZrcClKKEs8jEM56X+wU2BjhIhFE0xlwHbchos
	 KKAzrgY6YiamKdsqKz+z60EVT2wGomcK28BvP2os+uVh7hVHR31ROWflCDZEtsQwaV
	 WgJZ9ilHCr/pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-5-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-5-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:03 +0000
Message-Id: <20260901212304.5B9031F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The firmware capability response carries per-board temperature
> (min/max/crit) and voltage (min/max) thresholds. Parse and store them in
> fbnic_fw_cap, and expose them through the hwmon interface as
> temp1_{min,max,crit} and in0_{min,max}.
>=20
> The thresholds are always exposed. Values the firmware did not report are
> stored as the FBNIC_SENSOR_NO_DATA sentinel in the capability response
> parser, and a read of such an attribute returns -ENODATA.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D4

