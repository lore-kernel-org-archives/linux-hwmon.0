Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0708C2D9ECB;
	Wed, 29 Jul 2026 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300710; cv=none; b=kz0tjzYcB8ELtMshs8OMUWeKg2Ldd5d+dvOhNizwvVKJkWStAC1m+4ToCcuQi7sKGr65jVe/BCp6EU6GAUOw095rJuCZEZHNkaIk94+G1Q32aDSdrQZC9KpqpfO9eXqO5/aIcAfNSy1Dn997Mj4LvcaxH9KcI/vc2yvhhTqDx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300710; c=relaxed/simple;
	bh=KF+bLJ4PcKFcY1U2rx6RWeEGIoV5QIubLi80fa0KrK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R97ostzEm32hpNHc+V6cYETN5Br1KhkzXtbz/kbVLdJGhelwYzVHgp2HZ/bAF2jRahpI35t5lQpok/vNvAhL/JTU9X3AXnlfpARcx8m+jcmsQZ3Gskwpe/eaUgTQGmRR3x4GFZAOXNamuZj4kl90Dol6FaaiEDncCcDAiismTGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxIjZCVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxIjZCVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8841F000E9;
	Wed, 29 Jul 2026 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785300708;
	bh=KF+bLJ4PcKFcY1U2rx6RWeEGIoV5QIubLi80fa0KrK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DxIjZCVzKsThyXVBHIqxMAh8YmweqPrd9SPshKJ/JJRnf95zkHopEvrxz0gpZoUH0
	 b+iyThKuYIJP+b6ZRBmi7zNGAo+5XRLhH4CxGBWoHvb9Sjkt3VOoebgCEgWnJ8cZ73
	 +4jI987eInMHlNjaKX+oKun+daR07/r4kGaQSE6JkBQ1o9TSb7e+nKWtCLTIE9/M2a
	 66ZXJ1gLPI2YaS+9IU9rjGGsk0AqdVsvUxSucq4H/B7zTqViZk51WihKTpykAYWZf6
	 ojFeBLruFWVmjLl0VEm/HfweHdnVgk0YYpi8cUb4UZPPgIh/RvrITvpBGrbCS3KAv9
	 sW1cQpTo/HiJw==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v4 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-adt7470_thermalzone-v4-2-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-2-c14039dfa0e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 04:51:47 +0000
Message-Id: <20260729045148.3D8841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Instead of a magic 255, use a macro to refer to it.
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-adt7470_th=
ermalzone-v4-0-c14039dfa0e6@gmail.com?part=3D2

