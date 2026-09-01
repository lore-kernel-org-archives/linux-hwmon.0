Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13304415B69;
	Tue,  1 Sep 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297290; cv=none; b=DpIw9TLHMG038FuMg44hPlzclGkVq+1kxOkDjl3SuDyXKmlJZWF94vrTAzs9ejrSdinlCLLkOyBGK8jZ7yyYJ8Qk2Ox6gUTYrVWLTDQmAtmKVfbb+wnx+z/i9OotqEwgm2b/iVJjeUGoagxGZniPWhMvHFnWBe0o9ughH4nN+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297290; c=relaxed/simple;
	bh=YoAti7FKrMgASGEx2GsWO5E0FAlFHTJStXasi1CK+ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U7KnB5koy0UFGoQ2BSjWH3t01czop7KLsJUW7L43pxhCw4qB/n3gfgf1rP4MrjeNqT77pwtav7jiV+njB53k7Z+zqPeCvKCOVBEcNz0Sl2pUeakskKjOyDi+ZW3tnfW/qvE56uLt5UuiLTPSBis2TwVDFF1gFrI7QhmhudKOkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqGO6Vp3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqGO6Vp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5AF1F000E9;
	Tue,  1 Sep 2026 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297288;
	bh=YoAti7FKrMgASGEx2GsWO5E0FAlFHTJStXasi1CK+ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eqGO6Vp3dUfysOZjPSeiIovRnMfU9LydjECrP+WJK+neMuFBLVE5oqmMgwo9sCyVd
	 YZLCQQn7zuyIgqvg28ZsCdljG14xgM+oPDXzYWZx1Dq+hkiGdb4U720lq2BkmWKhTs
	 2VWkW2Ymk9IkLOSSXrrwgjJwVMwe4W9M6hBFpIPkiXrxD+F897fnCNl9NpNDwP2Os/
	 ExHsJMlDlbhydFB/ecoQe2g7n2eguvMz2Wn5SFZrY8I/isd5GJpCWyq65ZB5553jlP
	 iwXFdXzAK2HCjQGIDDKHyTFr7J8TwIV71CeEJeg+7mY74SQ7W3aAPMHgL76euo2mHi
	 KI1rmZ0tgoTcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:14:48 +0000
Message-Id: <20260901211448.8D5AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> TPS53622 and TPS53659 are PMBus-compliant D-CAP+ multiphase step-down
> controllers. Add their compatible strings.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901211129.3607=
92-1-sanman.pradhan@hpe.com?part=3D1

