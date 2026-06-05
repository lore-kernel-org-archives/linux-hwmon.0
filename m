Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B734071FC
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687499; cv=none; b=qvo0ENNkSNDvaJFOxBN01V9UWYNmZwnamcKPGU+uCAJ3K5AQaBaV0sy5jsz8TbbjfCaCLi7qaB12ResSqizpwVwQmcgnlVgJMg7yVIrqA7idc8sDlHlwASQqNXEjQWOt2PoksTaQ2qskxX/RR037XRv+nOG0FBjdkHGYeewADDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687499; c=relaxed/simple;
	bh=pkhzY89gjMNqKe9PHZwWfFtTUV+Kz2FxDzGnmLP6fQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpf95X0EC6JhVsio2FDRGk2o/zwcb2uEpqyALgkMFTOTstSADVPEvl9RwkeChP00oPxxaYSl7BM4dvAtVv2Wwo+Ie/iNDJNG1l2IeTPkRdEryoH63RfmA2kdMXv+1cp0IBtplCvbOEzH1zUgx5VW81frhpBg2tMsx1CiA3SRgzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moZOq3zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moZOq3zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319CE1F00893;
	Fri,  5 Jun 2026 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780687498;
	bh=pkhzY89gjMNqKe9PHZwWfFtTUV+Kz2FxDzGnmLP6fQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moZOq3zoBBDYnazKowPapXDY1pNkKqz+RUrk0ppTZ8VPb8RphQRRB3NPfAHyCiNIY
	 uQDi25b1rQXNpb5yvG+sXq3vkRk8/cedz1NsT8DuS61BnZ0gvLKxXErLLv8zrJlDCU
	 NWI7+zUu5YSF/s3BojOZYZBatb13DMcUVyx4/SMKAhpEoBQhbpImLzU+MvAdhN3mmU
	 Tr1LDlHcDd6Nu4uYJ5LFamCx1wY4hJ6pG/XXXiTfhBIhdPWzXBP2q0PsXDfSSrAeIj
	 WX/E+9KHUnYSB1d45aizuGksfHXpJ/n7ECrn1r48elnM7uaP64gaVfgHKZRe2d9OGK
	 /oGO2asPwvsKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] modpost: Handle malformed WMI GUID strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-10-W_Armin@gmx.de>
References: <20260605181433.188847-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:24:57 +0000
Message-Id: <20260605192458.319CE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
>=20
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D9

