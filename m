Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44F481FA1;
	Tue, 15 Sep 2026 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491143; cv=none; b=ihAv3aHZGioeqXzItdJXNbOy9uqFvEn7YuA4szoJa2BvuD2KRWeGum6Ab98D7Awlvv7O9RXxABJEtGqoe9zzNvlixw+da/yI1v/EYeOgRTUDfNIA3HCq33wETgKbRe//5faWbAZ0ZxGBTOkSdcheeU6ALUx1Sn7nsTO9sDNDQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491143; c=relaxed/simple;
	bh=Wz9JVD4v/LCfFuZUEO2gzlrTp+YfhBTnHPQFjJDjauU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NObMQBaVxzm2YdQxfcm8T2KMxxT4nqFp2OhRnosl0R4Ktbgv9YSvjc0EnQFOJd9yshJEAam+bN7qw3w5XeGaZsPRKTnrECG01zx7ygKqbQGn4MQZZyS7dz1V4y2KrLoWTo8emoskQj48s3zga+W91L1k5Zj+FoSfTqMzMGTwjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cu27p9fr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cu27p9fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BF11F000FF;
	Tue, 15 Sep 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491142;
	bh=Wz9JVD4v/LCfFuZUEO2gzlrTp+YfhBTnHPQFjJDjauU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cu27p9frb/mgIhmH1gJ9zbBgi5zZ6zgDlyPAjBRsEFHtGWRRT1YRwWDfqnhhXSqps
	 wGG9GT9ASkF/1ewGM8FUETDS/Ixuch/uAhmgiqDvUFX/ycYpgrYTialbnN+zntIa6V
	 D+cjdRKxUkY6/7p7hzGQs+OOWLY+bivLCg5NthN8mnMASBFlLaJVbVsIvPk7ybLre2
	 nEsfpd6Yx7lWtR8keZ7GiwSIbx7LA7Uc/39MohPPhH82Zv+/eIqbQRBc8cU/zmKYK6
	 b8JShKVVdznT2vvOQsDoo/PJEeyZKAcXvWI8yztveXfzhDzfymQDaWvhdH6R5juW/s
	 DnxO4KAJIc05Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915164823.160977-3-sanman.pradhan@hpe.com>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 16:52:21 +0000
Message-Id: <20260915165221.A3BF11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> TPS536C7 is a PMBus-compliant dual-channel D-CAP+ multiphase step-down
> controller. Add its compatible string.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915164823.1609=
77-1-sanman.pradhan@hpe.com?part=3D2

