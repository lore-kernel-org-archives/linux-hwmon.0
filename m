Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDD82D3220
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756278; cv=none; b=DL1zL+Yd0js5QP8xc71XkZ1kYJpUOq5p0CSYpbGKdfOwo0Ra5AA1/UX4CzAs73K+5E5FkvRwXIebTw9g9F1atVE5a7Zwn/FvvxvXQIy9VBwDMaegl75nILhY4QVM90WFqUUBMDj+Oo2X71RnqSlzQt3LLfJF6WNGXWjwd0UkqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756278; c=relaxed/simple;
	bh=eRFw7L1LrWemAzPsbQNVucfSB4G5vXhe/0l1rv28Iz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VMwVuay/rWJcY4tNDVTLvh4351g1vUMa7XyKf+Sd0Xg9cIyAdhJ+VKMrHZKXJP53B+r8uIjqk1VI0prP+PJVQUiSz5gL5uTnOY6hDIPr1ENUYfHHvfZKZpvhcpzS35yAPfczgirv/FvQ0moEArnesXs9NEWC2FVG8noMAYUhRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv+pfKXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv+pfKXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9393D1F000E9;
	Sat, 11 Jul 2026 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783756277;
	bh=eRFw7L1LrWemAzPsbQNVucfSB4G5vXhe/0l1rv28Iz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yv+pfKXEyJzsTA5iADL2xDstnVoHiz4hhQMgvKiBi6KSU97RXZ/TaAElqqsL4O6CD
	 NYn+ii0gAW5t2TAW0gUIP0ZNxbQmqggULs5Zp97eoNsA23J7rgthVjQrm1wvZXfOS/
	 8AZpWLXnFwykkE0iAykOqXUer9sIt7FV7fphYJ0Gb63BdmDvhJ2R+tLlYIgae8LyAq
	 LIqg2qBLRoPkS+t7DKySYVL+S+PT6IoqphwzoPd3IeSvKTOSIXD4NNB0Vu9mmGhkSv
	 pR1jxJGEkwjxX0H4gpSUwyQDZKGDIy60EudXfiYiIDLps6TFFhz2FsHJjKY/QTWKJb
	 Vn5DMT+w3l8fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix looping over banks while
 reading from EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711074217.554656-1-eugene.shalygin@gmail.com>
References: <20260711074217.554656-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 07:51:17 +0000
Message-Id: <20260711075117.9393D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Do not assume there are only bank 0 and bank 1 available, just use '!=3D'
> for bank comparison.
>=20
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711074217.5546=
56-1-eugene.shalygin@gmail.com?part=3D1

