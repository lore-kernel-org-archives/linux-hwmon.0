Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7D2877CD;
	Mon, 26 Jan 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769459225; cv=none; b=Ty50gSKC34ntT7JgS6sqoqn9Y9BXl8dEdo/qdUkK/n8FRqb+dYS4yfAsO/SkUTeJ3cV0Ui0Vims4X0yVeTbhreJIBK3wgQOSVnBFHwWgxLh0S5sZhSmmYhzHgNKx7nGlbvEGiSyEr79wPLy87SlUp91NVvW+JOSdvIpVJfdIKcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769459225; c=relaxed/simple;
	bh=4Th3x6YqstcCMdDyhnVHDRDU6P+UfQAyCiz8/20Gwrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbmhqEBL4WaaXH/54WSLS2x+w+h8dkjSrFcJDUI64lh9M9ELAdx2ejHaAVz2SY2BxogWo13oD97svid8qUlbWqvY50gvsRWxs/kFZWtP4KTR09KJFhwK2KYmvRhykMsAVNNx/hRb6Ko/U5kx3fmdq7YaomQ6TJ1zn0NKP8HEnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBT8H/Lv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBT8H/Lv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC93EC116C6;
	Mon, 26 Jan 2026 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769459224;
	bh=4Th3x6YqstcCMdDyhnVHDRDU6P+UfQAyCiz8/20Gwrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBT8H/Lv9j/BBkHjuW71tE1Xxidtkqq8pzJyz5uN8aCI7dEc0z1kF2c9LLYPLSoOJ
	 RcXugfBEFb9Tmk3lmfk2u69224oPGhwXAXbqC2BvIZLqAC/jkX7atbgxq5v29xp9/Y
	 jQTp0dt8qi6ujc99gSQSoiM5GaKcsKuBQTojl7ANftiFi58D8JN26alBGYv3/m4P0n
	 QD/qpjGcls45TgmeeRrqoEJ30yj9ECSxO+yNvT89Ty0OmlqDFG7PameOk973uxiulM
	 zoRc3HdTysWR5tPI5hFq/E8qmHFALJ+jlDqJ6+7uXgtjmTWcEL/WpyRmBrhhZwkbqq
	 7M0eNrCGSApXw==
Date: Mon, 26 Jan 2026 20:27:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux@roeck-us.net, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: add STEF48H28
Message-ID: <20260126-unmixed-reptilian-c990a0072988@spud>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QoRAMD7I2OVjV5V7"
Content-Disposition: inline
In-Reply-To: <20260126063712.1049025-1-hsu.yungteng@gmail.com>


--QoRAMD7I2OVjV5V7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QoRAMD7I2OVjV5V7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfOFAAKCRB4tDGHoIJi
0hc/AP9+jTJrMIHaSRw9QxJSCuzyBuzdh0V7y6YMSeFbuG+zzgD/aBIpFdIBfYZ4
pz/ejgUfzpZDW3sur3jlH7BcrwXjugs=
=w2AQ
-----END PGP SIGNATURE-----

--QoRAMD7I2OVjV5V7--
