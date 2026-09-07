Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F191309F08;
	Mon,  7 Sep 2026 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764244; cv=none; b=Plsr1TPvlByGamq83q+e+wYCBrxLNb8FOTS98Ldjbmhfk0FBJyrgM7SgMUmBZJGCzfGn9jKvAuk+7r7Z3JuvjPndPguxOEYbst4yYVsPKKhSaf3RbF++HiQjLMVrhv0IQOmg9/vGETuLle1uA1DxpIry/52NlQINaJPdRyFQ8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764244; c=relaxed/simple;
	bh=pZYoTI/HhSgtsSpho3lwPdF2beCaNbHPNUmdW5Rvei4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aw4xcpjv5uqSLaLHW8BLHZNY6feMUvRFD3r/UyfFfFVODxOrmleXhMT1xMG9+e2yC995ovlWIkTjJ3Po1vVqZqN6l8n0jNwoZ1HBte5dK/kZe5FQlzu1xuq7rJmGxOYq7puBasSv2sTd/ospLgFx7GKSPkiMwbGHLBqU9UtY8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keaqrE6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keaqrE6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568161F00A3E;
	Mon,  7 Sep 2026 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764242;
	bh=pZYoTI/HhSgtsSpho3lwPdF2beCaNbHPNUmdW5Rvei4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=keaqrE6g5+aASVmMuL4Q/DZtCzeX2bgzmmvreDopKGrS5uxYKz8v0fwaZMre88C3e
	 gkrfvbv0ddoWGHC2pt57xgwuaTUByfwzbkXCN09t7CGFl2e7fBcDzrx6us3dsv7MOR
	 MLfc2r3H+NB4YpgDLhZS6VHWPk5syP9AvMveB6/xIyTHcXflP24griZw7KwXvDeCbP
	 WHo+dEIpwxbX5V+RSmt2asXuJnAz8QFily+rg145NdwnwoNkVUIqWMkjRR3td+vAHL
	 asyndE8rS5H4KZV3GvYqdiezVYNXEiP9tsx384Wtcf6S4IFY3dx4qOvvwKxoobiTc7
	 3mYsFRXXdfb/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 06:57:21 +0000
Message-Id: <20260907065722.568161F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-tda387=
40-and-tda38725-v2-0-1d051d63aa01@gmail.com?part=3D1

