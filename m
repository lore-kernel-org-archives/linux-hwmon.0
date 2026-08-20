Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AE449B17
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231836; cv=none; b=qEAM7W7S8ftJvmZiHyVpUDjORah4QjtF2z1tXv53Ph+xkSrE3TRkQ9JKQj3wolQBujz8inhkl3rHUIraukqwllGMA36M6gRWKLEeU4FmnojzCDQGEzOFrft2B62X5Q2Y/bo32WHgGBbdy/TaqOny2JbCrlZNkpv4I5ZYLqdMlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231836; c=relaxed/simple;
	bh=D2UX0DJ/X3F3dPL4Hhm8+7ErL0AhDZmZ/5jNDvxzJyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E3Qpt1k8zmsfTRAmS7kfkMhTxharrZtAV/KQwUnSTggWxe8uw0JDcPP2OAR6KFbXG87vic5APpQgzzTJ0IJj5oD8/PtckWKZL0SJCDyNCThibDvZAZ5KVdWlD3hUeRBIgoRVe2/6ZTVwaH+kmQWRhxYdtJlCUZ/RJ+0C6XpjGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXbiH3hN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXbiH3hN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449DE1F000E9;
	Thu, 20 Aug 2026 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231835;
	bh=D2UX0DJ/X3F3dPL4Hhm8+7ErL0AhDZmZ/5jNDvxzJyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YXbiH3hNw9cosulsxpL4oT/UNQEe41Pt+WB6TK2QN6GYosVRgXn2nWdTTsCylbMTo
	 0dS02+7StDAzV9dFB1TJD1SmE9F9PI8ztasLAqcRF8DcFUub8PP74ZNnggF3VxHQ8K
	 EIeQW/Q8KbyFQWw94bk+Y68FLYInmTdTq/QC515PCaSBr+3mvyMylsKkBiWGop1Z5C
	 m/tmEQlnOoran/66ieYuUjTi9crhvHYLslfoEtuzbFrXaJ1KHCOuZrzsKSVq59Zj5U
	 DcsIJkGQh8KZQTaREPc3vNEJnxQ8L1FNc3HC1EsZLbBMmO/1SwmCVu1CU4i+vRmJ/h
	 HqQX8MzAURqVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-3-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-3-fdce35abc41e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:17:14 +0000
Message-Id: <20260820131715.449DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Instead of passing an explicit mask to alert/limit functions like
> ina226_alert_read(), introduce an enum ina2xx_alert_type that can be
> converted to a mask internally. This semantically separates current from
> shunt voltage in helpers that use function masks, which previously saw
> the same mask for the two functions.
>=20
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-upstream-i=
na2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com?part=3D3

