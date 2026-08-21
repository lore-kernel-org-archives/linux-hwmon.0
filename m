Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB31B78F3
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349352; cv=none; b=ATg5Z/jAN7HbPojWEn9wMl/hEIVsbYOsYEf82HO+8XOfOEwqSdiAEx5shHAFPY2ZM1D88NRnDucBqi6sAgRhHCArb7p16SNFmzClGJFm/sqCPfKEq3zhKSGpLEDBVWvOl4QVl5fMjLAW/QIbxF29CyAG+2J1ud9eMTkT2ClJUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349352; c=relaxed/simple;
	bh=vhOpQasf4xoT/228xJ1PYuTpcYW+FLI+RwZeH6WJwxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2JndjkNjhVu1sM7mQi9bdop/xq+mmUUmZS2gp5Jko/qqthIR5VP4yphLfQmdD/7AxTkq+v89NOd7+lz9BkTPPdhbVi4bedODpDbD+M1nf4qMPoskmAAt/vskJY929nbHXxn8TmOp07MDqzg8um6FVzDuIWtYehGPBHaNLM0Xeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHtid6bv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHtid6bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F961F000E9;
	Fri, 21 Aug 2026 21:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787349351;
	bh=vhOpQasf4xoT/228xJ1PYuTpcYW+FLI+RwZeH6WJwxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHtid6bv1jqnCq3iN/pIqMDYfAUbxbggKWvk34zwmDeiJfd2Jfdc10UlgQxdssAKv
	 Bx0a8IXOLPCP12109GZeD+OjB6xhHSZY7Jy6KC462pmn24OAE4gV/+eqvveDkbKkOx
	 RsbDT+HKdPlk6GIJGpXjIiPghf9Y1uVzKouIiPbSq3hfnWGWvgFAAcB1N40qQ7k04f
	 XNmX1X62aIDOUi4983351IJwUnZTC/mLT5FzElAWr4cFqWvTGOwgNCmULpiZUzdMkz
	 ihcbR3DUd6rx7UgfqtX8bcTvzbK4pfa4jj6d6+2+f50a47kAqKYB3gTKIvWuwLils6
	 p6Tp7yIqRehhw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go
 Full Speed control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Dash" <mradityadash@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821214728.87773-2-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
 <20260821214728.87773-2-mradityadash@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 21:55:50 +0000
Message-Id: <20260821215550.F2F961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Selected Legion Go firmware exposes Full Speed as Other Mode feature
> 0x04020000. Capability Data does not describe this feature, so
> lenovo-wmi-other currently ignores it.
>=20
> Probe the feature during HWMON setup on those products. If the read
> succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
> selects Full Speed, and value 2 returns fan control to firmware automatic
> mode. Reject all other values.
>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821214728.8777=
3-1-mradityadash@gmail.com?part=3D1

