Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185BC439F75
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994695; cv=none; b=tdKd+Gki0LVSQzSOWcEtz00RTeL87bvMI90XuonH3RQyKnWqMs2gYxm+aFcNXSQHeXFQJB06DQjOtxRukbvDqyv6/xNetxOO3Zl8OmWR6dbZHCex/0Tn0wrGZsKBqiQPGSz2iySsa2tKcBWAReSg37y5LmeU8UFNE3FuFQLICvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994695; c=relaxed/simple;
	bh=CQrgNrtyz5X26UJ9zZpWBfQbWCctJMsu7i+StPMI5Sg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HHhAigtAGze0vimtkcg4QWFrzJ0Y4wvHr6b00GTys9CKsHX8cg1r2Pgf/gwa+cwaRr3oWbo7H7Wi1BDoWkuPE/mU9J9BM58SIySFujooA6h04pATyPyluloIoDuwQ2NDpEXHc11nFMHnyfeELPUUnsh0PFzg85RHDsOkbaNXCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WofpkZ70; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WofpkZ70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72AF1F0089A;
	Wed,  9 Sep 2026 22:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994680;
	bh=CQrgNrtyz5X26UJ9zZpWBfQbWCctJMsu7i+StPMI5Sg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WofpkZ704nHH10NsM3LA+jh7LS3j2mduLVmMpHvx/eH7N5IIWn9uzK1ODupAdorZF
	 wkN/CHAPrftlX8H6Ox79EQbJcHhC0vdi6nlwx8mRaV7edvHknlDIeLMVGSyDDp1SAg
	 Z2TcTClaGQCZpaTlLzgCxZ/VYBXhm3jat3Gfkqw8/jQRhDx6VaP0ubvg4OGEsiL9xv
	 ttHYODYBgRHQSS5lGTPVgXAARefvvdci290kLm+2BZ29UHYbUeT3C7iCwfbzmxcE7h
	 6tLh0L1ltnIDBa5jRAbnpRpYU13mK6RCdEBgFXPbDvUpU0aTsEflDROHpbLdsxghhx
	 KzeJM8U/HnhBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/6] eth: fbnic: move sensor read logic out
 of fbnic_mac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-2-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-2-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:57:59 +0000
Message-Id: <20260909225759.C72AF1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sensor read lived behind the fbnic_mac get_sensor op, but it is only
> ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
> call it directly there, closer to where it is used, and drop the
> now-unused get_sensor op from struct fbnic_mac. No functional change.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D1

