Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7019C37B012;
	Thu, 30 Jul 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426637; cv=none; b=VMpBFkuAmam1sb0l9EXYtChe8YcW0oDIVNU20K9iZux355vLwEqh3I1C8wfQfVQ97ne+36qApSkZB/tfDpre6Fvl3vxAGZKXZCQ9peS6UVAEooEOpQSxiniPdkynzpOVA/+ajMSkr0i0kL0wF41NOHMAqOfXDDhcNDHy/06q59g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426637; c=relaxed/simple;
	bh=Quk78WJztHLTCIwm3HwhjJWnaGuWmcjsoKQc8zxMUs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=apeePhiVYI5Z+09ecMP7yZ0KpTSy3lmTL0iVDCk/+qKItcl6pX+XZo40c1YbUMbKnuJqUQBVKFO/ZTHWUhV1CLFEZ8zE+gGAnZDY6bX0GrHd6I1WXuqXa8xbyvN5F9zQhYvCgPhy6dDaV+guqHCI7+AJD+rQ1+7OGDwPpqtrfYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUEfnur3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUEfnur3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC32F1F00A3A;
	Thu, 30 Jul 2026 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426636;
	bh=Quk78WJztHLTCIwm3HwhjJWnaGuWmcjsoKQc8zxMUs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CUEfnur3G1mG7HbgDbd7LFDce1x8etFEPF7CLodffe7L9JB6DHEjlAi0QtjKhO9aj
	 x12OsQi609Ov3vP/9Z2yxPnVTm5x6XuB4org5KisKAD/hExUJTQKiQLsY/3E0mEPm+
	 KT5x9RClAhIGxcsIm8f2vG0XE7cU22XhCrd9VCtLU79/xcSPeUR1ly2bNuU70UPOKT
	 Z/SJJpXnJbMVXuSd6rREAKSoi58cD5QAQj8o5g57T03X3aJCh3w0eMMeVlSMGZe6Dh
	 owoYgKLDUpN7sCBS9Hfj22M+XucTteTZJ1+nPAH/m/ziniGVFGWcAQ09ePAobe2MPM
	 7tfzuhu6LbK1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:50:35 +0000
Message-Id: <20260730155035.DC32F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> The MPS MPQ8646 PMBus step-down converter uses the same
> mps,vout-fb-divider-ratio-permille property with the same constraints
> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> to the existing schema.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-mpq8646_v0=
-v7-0-e7c7ad768d5d@free.fr?part=3D2

