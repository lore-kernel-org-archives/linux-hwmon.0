Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C73CDBAA;
	Fri, 18 Sep 2026 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721030; cv=none; b=oMriGZj0MFFdn6mnb4Kz37TUIZoqP+8oOgtr/fGr+b114LUUfB7HtI8NzL9wdZKkmQJu1GZKIkgJ7fAat9v00D8ny5vllOO4uWOJ0DHGSnYpNHKe43B1saUgXeu5X6JfTGQ8uaLfEgHX2f8RGGVV7NMpfcz7y9st2UXbxa9duTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721030; c=relaxed/simple;
	bh=gQQTKQL6dxbcFSiJfyALXWOOobHnoMTOqFSfNJrzzDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LIH3Jhd3Vxk8L3vI93MTxpZGg96GLUjC6+GZpnPYKrR8BCajgCYaNRaaQYiQ1iAW2m0GkFCTC2At/cpmgpwYPXre7Qd5k/i3CySQ3yRs1zrdAOYsDJJcqNAqnmRuGLyW2qTlCZQbJXSnLHxUaCtcjjaMrdXEPRqrnverYgE3qDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgI01fe2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgI01fe2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985BD1F00898;
	Fri, 18 Sep 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721028;
	bh=gQQTKQL6dxbcFSiJfyALXWOOobHnoMTOqFSfNJrzzDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EgI01fe2z/dssV05WnmPA0vBwS4QhF4p9zOUMcGf3Ec8p6pfo5U/WMLHYIRX0PW1f
	 8ZX//ncz4VeHjToXWbyoHnx/c5GQb/QZEPZdPkxE9ikQZOgikggT2V4ud7tRQyNt0M
	 yXAQ+9Zed1WQOfv2qA/LFvC9kh63fnu99UbTAl/VWmsAIvAm8NupgYiuvwB417TLBK
	 b5sJLbMZRN9zBWco7I45sEjR5rUB9Yn56YvFic4nGNGVJXUrYgPs8gMmc5dXl/lttu
	 Kw24mQMSRa5e/WwZ990mDhHlL/Ktr+gBiFCThyGxla7NEB9HLf9HzzM5x+RmMNDyHw
	 yQXdPGGxYMTRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyemail2@gmail.com
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918084042.19541-2-syhuang3@nuvoton.com>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-2-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 08:43:48 +0000
Message-Id: <20260918084348.985BD1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
>=20
> Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.
>=20
> The NCT7715 supports an ALERT output, so permit the optional
> interrupts property for this compatible.
>=20
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918084042.1954=
1-1-syhuang3@nuvoton.com?part=3D1

