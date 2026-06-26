Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5B3DB62F;
	Fri, 26 Jun 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459344; cv=none; b=nV/CGeLCE7vgFo8A8UdQzqceQvjQSuAUPeiQ9V0QDqHGXbk6ieaHvl7ATTm5Tud44smES5pW1XSu6iK8svoFhMd/5zbCB+1qWx9simm+TRArP7skh1vZnJ3nNlkwxMVdglAcyHRfAlCcZlpNSBxV3oJ5t80CKRz8CyxDNiNEUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459344; c=relaxed/simple;
	bh=qhdVjQPF75NhnJZNmSA8dYzMPpfTjQ73yxcN2dDw+9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lp5zpvOOap4DW7ZZmz+KBNGMAwLq1p5o27aOMZYXX9Cr/dGdFxh5fjf/T3V62053JuXFISD/MjZW5TB7Fe+eoNEcI4p/Lljbje9xQrVBnsnoz8xizaTVG1QJd2OOJyPc51HVDImhBVY3BpgLo+RjKYM8me2KGasPz3Stpj1yl+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJH6PGG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJH6PGG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA471F000E9;
	Fri, 26 Jun 2026 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459343;
	bh=qhdVjQPF75NhnJZNmSA8dYzMPpfTjQ73yxcN2dDw+9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJH6PGG9cdarIlvzAuRn27EdXsW5ssDhqmn67mRaNon9zMx4SETIxK4x36ZQwF4Zv
	 vGCIchL08gCK37sWPlg7ohWk2A3LTcQyB0FRadWZXb0YRoDfzZj9elLGHCuKQpx13r
	 WTa7GF/PtrUe7dKbVKoVoKRVwKv9ZExoWVeOo38LOgt1oPb7QUELgkFiWSyE+sm8UW
	 F73R2batlMvht9us2zF4A19UYnyPgrMkYZmqGTM6y5IX1dg1c51ROuzULF69Ygz4nw
	 AeQl3x12N36juoSmrsUNdOOopUA3t0rILtwaHc2vnFop+WnEGsBKO1DerDxB1sYall
	 gva77yQ9+6oMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:35:42 +0000
Message-Id: <20260626073543.5DA471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Support ROHM BD12790 hot-swap controller which is largely compatible
> with the Analog Devices adm1272.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D7

