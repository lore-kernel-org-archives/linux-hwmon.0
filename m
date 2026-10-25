Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901890;
	b=M9JBZvGyrTlFBisCAxyYBzZAQIJ8duD4jgr+sZBl8U1NtRWF6kNogShsW6JFjbrA7qXo
	 iGI659wzUBY6f252cKySyTIcjRSgLDj3oObTAri7oCJ5LEmCanGjoYoNQ+WQD7CYLu7x/
	 lU2Og2pNzBWuUPfPbegladTZJkEqTyTYHLKJNCy+OYYmUealoGvXEc0y9Ss0DQdcJkTX5
	 OCIktdNUt53NBSntjcONTr1ByZU5S9OXBOpSxCCIk7YaI3j/Ye+RLw4CptfwY/GrlKCXN
	 s49FwLFKozo7KLjbKsZm5FVymFyv1OA9bfhKtPI36vmE03798C2Hawd9x0ZU6YbNdFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901890;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SOzHgLC9o+5/5GT7UDqCQsJc6YlXd4ktretm0DZhA68=;
	b=GGrhA0KNFsPi1qoouPYXm1yaBfnSJIPC8y4RL/eFhYXCe1yq5BncJ6KVaZuDmjpRwN3W
	 FNTkq3M488GXufoGILEgrTyEz7SKhyNosONejsqld/IMByy1StrM8gW/spjQr5l2YE2rL
	 XPGZ/wm24wA8b9bTStvmt2nGAVstifBDZST0gExqmi3+nYuxEyqEkv/eX13MeSKe38BAU
	 1Ugms4i66R7ghVK6xnizHilVoKwDuxr/r+mtZwa7PpEcPCXWu/YHlpw9VgkG75+7jQ7nx
	 v758CzN65cvRqLU4FLcLF0bCmGIBsGo8WMLF/u0rYRz6S8fkeMjM9u892KR4keGTHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c6S/8OVp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAAD606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6S/8OVp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13251F01825;
	Sun, 25 Oct 2026 04:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901890;
	bh=SOzHgLC9o+5/5GT7UDqCQsJc6YlXd4ktretm0DZhA68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6S/8OVp0/uN8yQKorbnsVrbkIPQ5nKzx/uKcn9OD2fr4fMpKAtYHBC9DOm3y7M67
	 R19GwqMI9HLlaKKsM7oYvgNAz1/3lRkByAmAkdXvBk2UHpGCDYnH4au+vXbcrDZdH3
	 ikbiO0hwuAAkaBmENS4J+Qn2oGnmxqYS0ThPsXEFee+k23lFy9PSMrHjKqfmilJf3W
	 6r/4lvR6R72OhppzmDiDT9Oq1c8fjKG1fu2ELzwv7x17wnlnvWl2JFkoxc65VrhUD6
	 xJ8oZ58S9nzu1cwuwy5S1AIcNufX/j24Pi5YeGLGKe8kKHlBPaxyvEUSlw7vmII2ru
	 ixAMne9T8xcDA==
Message-ID: <sashiko-outbox-184052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 31/31] hwmon: (pmbus/zl6100) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-31-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-31-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
> zl6100_probe() to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D31

