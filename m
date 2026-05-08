Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36163225413;
	Fri,  8 May 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269342; cv=none; b=ID6YaYXV3UW/Xrb9Q64LZOIbYKWk1cfcBNoumJog/VFwUclajq7jg6v3HkjhjGGSJfgWLMX5/3+ng67Oiih/SRU9NQ5V2Qw+w3RfrBjwPrKCH6eJCJDWM6xBU+4K0muU2YfndxtiK01jYjLGj9VuXP0b125pkN7A57mQChKiNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269342; c=relaxed/simple;
	bh=6LLThgPsKCo4luhvYam3g4HUxa2qra3r87IZq2X3Gf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMDhDajYAczsNKnSL3X0G2D8cv2QKrGq7lqALjaWtqJ8eos/qbe8gYcKoVJml8WLUMduEg6RAuaLjZefPKVRhNKl393wSUaII2EXgPyO9s9BuH2m8dsRr0r1awPnN5qMZm+2JY/ZPwvTWqHKwvgH2AQpFexsK3ygm7gJc7RUnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQwjSJHQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQwjSJHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94438C2BCB0;
	Fri,  8 May 2026 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778269341;
	bh=6LLThgPsKCo4luhvYam3g4HUxa2qra3r87IZq2X3Gf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UQwjSJHQczO7JZ+A9XT9Oe1OExFO+XAzrjX6DsxP8lnrHA03ydBGQFLGmIY34vCQT
	 RHwDBqKrttaDgldlh1mbWxoHmYkbNqE6KdnaUocHTnW9MejddI9tn/6/il/o64w8w7
	 nXPQ2mif72y3/A2rSp4fh+dR90lzpI83BZ8H4uq/aCohwVnKGEYRK60spU5qVbCUS3
	 MaT8vgjJpyKyOiTgEZLJLkzG/t+bE5+x6nPcxnznMzWOeK5uq1TRQiJt6uJ5mPCeUU
	 W7p3PqeTXk2HQP9OpYPoeFZ/BUK3+9MAzerF3tEXTgHnLri8qBBVQ57XPbuKtCooih
	 JU87dk5f1hj+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta
 E50SN12051
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
References: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:42:20 +0000
Message-Id: <20260508194221.94438C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string and its description comment are inserted =
incorrectly, resulting in mismatched descriptions for two devices.
--

commit 9996702d5ece9eeefae380c70a0a1d77e2a9cf5a
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: trivial-devices: Add Delta E50SN12051
   =20
This commit adds the Delta E50SN12051 600W Non-isolated 1/8th Brick DC/DC
Power Module to the list of trivial devices.

> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a4..0f10368a13865 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -100,6 +100,8 @@ properties:
>              # Delta Electronics DPS920AB 920W 54V Power Supply
>            - delta,dps920ab
>              # 1/4 Brick DC/DC Regulated Power Module
> +          - delta,e50sn12051
> +            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
>            - delta,q54sj108a2

This isn't a bug, but it looks like the comment and the compatible string
are inserted in the wrong order. In this file, comments describe the
compatible string that immediately follows them.

By inserting the new string before the new comment, the existing "1/4 Brick"
comment now appears to describe the new delta,e50sn12051 string, and the new
"600W" comment describes the existing delta,q54sj108a2 string.=20

Should the new comment be placed above delta,e50sn12051 instead to keep the
descriptions aligned with their respective devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-add-e50sn1=
2051-v5-0-abebdcc29665@gmail.com?part=3D1
