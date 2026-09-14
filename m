Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BD2F28FC;
	Mon, 14 Sep 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374114; cv=none; b=l0sUE5FPGrwRWBVeEgu5DyrBothgPtniHn6qKFWJ1fCnlFpuWv6o1lmszB4cULuaLFmr6NSTnbuOfgFbg5zGbtOHVRrJvT2dxSYq/niMTJsMM1XP8MDK2SFIHOWxN042uu5cFNBSfajTByuJqwoaZj0RhLRJR9ij7JxcrEZwy8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374114; c=relaxed/simple;
	bh=ZAGRE73qI9THXhpR9Cz31V71k0lX7CTNwxtzFTo9THY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gnBGO6cZZoqGI6jlIMVu6F3ZxIHZc1e1NaHTtISp7WzjSKLrn6ZzAaSOdq6bkhcb5gqp+e6HHeEf0tOuAwa80POHpcya1rC/yJ3BDjWUPZSuEMb2azEm3f1gNW25C13ckopPfcD08NLdxcHLuZnWtP3JN6t5RkdE6hD4leRO+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGt4aOox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGt4aOox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5631F000FF;
	Mon, 14 Sep 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374113;
	bh=ZAGRE73qI9THXhpR9Cz31V71k0lX7CTNwxtzFTo9THY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGt4aOoxi0YbF8xQrhyzjZmSsAxxglOKrgAVy0M3ePBqJJxPejlsupjUU0MCPbzoC
	 1yacvc/DTzPcqBy5SN8tVm95EhhrmOhpoivjM5kMSkjNMhaJL3KOMZzccYISLUkp+h
	 zuZrnZg9BAr2GEX3rUlOrGi+yTZ2mBDRsoyIypR7ml4vPgzZjGxclsOrLHlj2rXCmx
	 KaOvLvnJEvhsxYOiQGPfch9N1Sv2K0g3JYDXyWeGXCSQh0qCMz2MNp+9J2XoQ2fFDA
	 Ku1OwCcKE5D9O5EXn/RimxnWHrkQH0XreSL2xK9l9mydLJLK7FS5CEUWsElXtDMB8z
	 qQvftjLH31YDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:21:52 +0000
Message-Id: <20260914082153.1B5631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D1

