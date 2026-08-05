Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3403F86E2;
	Wed,  5 Aug 2026 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922079; cv=none; b=JbSxgkNjDycqveaeBH4MstsgEpe0+LKBqc/oVHljTaf1l8jTpZrpy3s24Ha5bojKA58RkV24PFTvUVCndUOa8PXnMdNwW+uwl28yHnGTj17JoX9zzBLB4ZZm3/duPs+JxrAYKqBrJPOsUtubj1C8SLKT91aUYRr4WWri5hL1mJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922079; c=relaxed/simple;
	bh=uuZTCRfQ1oucNWt6vkV+dmhCjVeNGSry8cYpISU5A8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EaTO4zswmV9PIR0HBlMaoQ9jJNWTmCFvm02m/xjGWaz/IAFO5bJPAjTs8NocMcXn95rpAjyroVMC+AF8vO9n0FgcT5nEwgld8HZRJfsJhMD3zpfEB+ZnILq/NvkuVIbH/iAlQAlQBj4x5eedYjLnNo3A2ako34LyCIaCmNhkG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBFSBrTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBFSBrTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1F31F000E9;
	Wed,  5 Aug 2026 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922077;
	bh=uuZTCRfQ1oucNWt6vkV+dmhCjVeNGSry8cYpISU5A8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TBFSBrThRxewCex/vEOfvpA+YT9q15uyFUcwqd0zntRgehIMOsUSVgqL+yc3jv2Kj
	 OxUXLcrpRep6I/8R5hR7p7b/MnRb1l+tthaGr5FuOR0L4EkzAwT3ZZiMTod+21kWgc
	 PfYGXz9oxrepzSfMSRGeV1c9OEvv+BjPWwuWT3FtaDTKcDG2UKM5pC+ADvzFwZtz6i
	 /7rJ6onMW0awcWweXgH5Y0n4kTEuHpmsmAyNWITf3Gzb2TBBp3scm9xT3YmREY3YUM
	 kkOsGAGXlNRhbbUEiIZ56nOH++Tom+bSCmpWwVkkoIWepwCZvFK8k0axDLsVfGlCNl
	 hzlfobwQiOinQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:27:56 +0000
Message-Id: <20260805092757.5C1F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Link: https://en.sensylink.com/
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D1

