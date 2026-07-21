Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1E448385;
	Tue, 21 Jul 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627477; cv=none; b=cdjiMp7uxWpj+vH5CeOaDclzQ1vyaYI2BWfNevaAu8CbXsgBicEyTCNArTCEl1V5VwK/ehlA+dHrnLB7x0ZyEyNl0pKBfhFAtbYtYUQgwWOJM0pugK/IwcdcBiEuCTmBMqe0ZwVG5H/SvM5zEHpBCdaniEBjTPdImpFPp7CrMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627477; c=relaxed/simple;
	bh=e/8eEwQxKSM0rJjhEeoprTTOPdc/dHOYfAITKHSolvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fx8WjmsBYPAlClotJWjqq0LPN+2JLxz1zJZc6S8lqVCEL+OLhk/4P1waYGclds832Or/0ONXty1Ww+eqTWxCdTLTzZs/8i1e3vpFcQOLJSAc3lD9b7lNcflEPm/Kq6p2+NQNa/OgeaSdVS384DmktqkHpKnM7tMDM9+VPhBMBWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS4e44Sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS4e44Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD931F00A3A;
	Tue, 21 Jul 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627476;
	bh=e/8eEwQxKSM0rJjhEeoprTTOPdc/dHOYfAITKHSolvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kS4e44SaDEKfKcF6G8EF2xsJFBysnsmuYzBnevWxd6ThwXfcMubRclTinbYRTi5Bv
	 ZEUcOqW8u5D5E9OhQ056xioHNifGQLQ7qYMgWC8g1K2Hc1WWZbe4jGVEL4C5/OGZxn
	 AFpJsWmTNRUlyGg/t29XY9nl+HboLvgfCWkfKUk+DNTqBFZD2YXVotmshEpxhHo+9N
	 FII91kYpcgE7c8r3D/npCmZHyWdhly2f5kT+ycPc4HZe6BkXvSAZ+VmjzZ+unpTT9B
	 WKsXXkhaknWO187rv1CpgSHd0L8hPKx0hXNuj50b6txjyX64knCQAjdLNWZGdhZAFh
	 0ZD2V/qcbyXXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:51:15 +0000
Message-Id: <20260721095116.0DD931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D1

