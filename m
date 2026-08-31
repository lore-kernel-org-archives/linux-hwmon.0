Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF85432304;
	Mon, 31 Aug 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193034; cv=none; b=GOTwKl8gVcc6DMAlovm4bRJsPLqa5MaxguevyR6DQP7+AY9uodgukmIl8qkGAlYIo3cFyzD7GJzswZIkmca47+I6du12lWL4rpWzvCOUt9UvoL9Rb7za+2dutgmMDBvMrYvSnulCMOI5V+R65Uner71PJ8kCd3T4JAfOhURxD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193034; c=relaxed/simple;
	bh=IZ9tkYhnH1vA96C7z6Cu4ftCz8YGTfMsksOfi17jQmc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ryryuNwIvjsNvHixeXxu//UJTRDye18Foz4DeksPcxFNBzITJpb25JIPPn40BHG0XXeWD7428QDXXnIATbFkTQnR8jazk3LAC5VBDjLqkvEtHNxaWZ1vs0u+QQuiiurzr7wDT8uE1QjSUCNIqjno0U9Ubr3t4+Nyk467G9x7XzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQz1i1I/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQz1i1I/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45A41F000E9;
	Mon, 31 Aug 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193033;
	bh=IZ9tkYhnH1vA96C7z6Cu4ftCz8YGTfMsksOfi17jQmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aQz1i1I/T1fxL9PjfvnrYjR8no0uYpIhc6S/NgD1rvfpJ2aJCQVAAQS0cTtDet+I3
	 SW/uXafMomUjPWJ7eMNqSv/QJ3t62dTNnf/gaVqgDST5V0tKDkYBnz95Q1VWZ15hx+
	 qM4fmAPGInasowZUhJLBAXwPfUuDR9KqmkfvPp1qmiGt2kvljy0x3UkIOnTr0X1ycG
	 WgiuRzkcI/cTMEHEv8qGzLssYOAngm+zXJgBLnNaMaKGHKqay8eVrwV+jBbkUHH0i0
	 ax5Q5reO7WzguLRHaEC5TrZOZr+jC/3gnMnoZGTf1DMHfa7Aai/q9VhbTUzZoAwdY0
	 V1/ojUtkro0/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ctl2301-v4-2-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-2-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:17:12 +0000
Message-Id: <20260831161712.E45A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D2

