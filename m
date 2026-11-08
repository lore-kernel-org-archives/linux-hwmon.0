Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110583;
	b=4QGg+kEzPiQU4AKhly2PutN7AfXnnZ2WAAjtowo+VYgVb9ufE1VQ461SqF+8Ffp6dzRh
	 iWi5n7wzSkKqWDOwKgBqwUZt/VF+0D2AOYQPy5WCHVTUJmvmE8rPkJGBjuOBbqSb3+HDu
	 BB0sYFIDfdhwQsYXFnUzzaK+ymtn0CRzTxd3UiYcu4u85s0QDzLKmzh4GrqO6XC7wQ77E
	 boqfRsuFlJywywR3OrHwI9/Nv4a1apBOEg+fSa2GBSMVADMaaIdNAC6SwzYHd4t2VQiMM
	 lnzPMZnDKHsI/2Ircc5xdnb48yWNT+4mjME0e4vOdGuaVXCgmzg0wG2NDJ8Ye8Y40wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2byjgcW6jcVcqWK6nUx0rpl+f6R2hzGVqNVAYW/InFo=;
	b=mVC7zGEBMsZMCriLvPuXISzz8j8rxFw5kMVmyFopOGNUFZX5AvrCQPELZ51s5GU2ktVj
	 wcyS6LNmN3E6FZb2B/5xeTdJxMFQaiNn6wt09hcxDdiMmmoCluhnZmWh58ZbaXi5TTgA9
	 Oy5iGkzFMJVLKiaFLm9LUraDRURV2ChyfNePQ3ZUA+61OS3TdFuvBvfktpH0JD1M+qwL8
	 i/S4U+b//p/bNzK8s2gBYo6KFuQJ67NRYsaAug2mPh5jAv5mPASH0qrPLTQbKmkTz8h2E
	 mbBmoEtrb0cqkBUiIpZFjBxqwFxQBnSxRoSiMIFlVkdF/AmrBN+34Ke/Pyy7LkdU8aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJZ7aPjR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136CD606A31A
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJZ7aPjR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634221F0089F;
	Sun,  8 Nov 2026 04:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794110582;
	bh=2byjgcW6jcVcqWK6nUx0rpl+f6R2hzGVqNVAYW/InFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJZ7aPjRriktxTciLVgZiK4o2UHne44udbDtDtN5WmiMuHZ58K2iFkBAe+lazVLoP
	 QItxPWEqO6plAf7D5o2ezIBs06Uqo0irZqYIzI93rNN0a7qFLzMKI+Uj27lnxB1HSO
	 VbmB3MhKHS5bt+Y0ppES5fR9C23udL5peahvnKhyDmwshEN3e4f7aiqj6BVvyA6EO8
	 L2+mgBLtW4ptuXnS/BLMhQHgm8gzntL+UglPdCmpl/oPJtTWO4kIFftKIMk41AtxQp
	 pGpQtpHXMCwyHxyyjWy+przwOcUHgIYak3s7qz988JVboNtHVsf/Z4OH8N6+km4iGL
	 8RNY9/1FTSnog==
Message-ID: <sashiko-outbox-203552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (max31760) Fix the local temperature limit
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 04:03:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> temp2_max and temp2_crit use each other's registers, so reading them
> shows the local limits swapped and writing temp2_max changes the
> overtemperature (SHDN) threshold.
>=20
> Use the high limit (0x0C) for temp2_max and the overtemperature limit
> (0x08) for temp2_crit.
>=20
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller d=
river")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-max31760-f=
ixes-v1-0-a61450463059@gmail.com?part=3D1

