Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901836;
	b=Sgp80S8H8BpFMUh54W65aD5aqcEEU0fhgr0IruCD0+xNh8uTw1Vn33KbAUIDZCwRoztO
	 /ENjQzwGqkyYq8qpkv9BJIEU1mJqK2iH0qb7FfdAFyKFWsmPhTghnZuawSOW+l1Nrx61Q
	 jTfJIvhmp0nAj5NNRrk7w/O9ZfFEKH6JYlCNqT2NVtlpq/eC+DRUyY7XHzbM+v4QjOjXV
	 qwbWZSB2JfdTV/b3Z/Iq2o9LvIg3FgObdMF+e3ivA+z31XREHBlHXLWm7mZaU21/JtKIx
	 uchhQkSM/GQVHPcmcOodtOlpdnFA5deK+Jw5sve5Oh9ZM8aP8lwOAfTRWoJNPBNCTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YlmkUbGyJLSs7ZHbp9XnhYaqTYcpcx8txHV8Br7izLU=;
	b=X8eX/0FeSZDxsYauXEdIDnkFVppft6rz9ecz6NB7SsbOHo1/jf2LYQ60JBZ4dOGTYVBN
	 nSkxcN/CQGaTLc2rzuryVZovl9EYOhAJSFD7kxCHTJgHDCfKE0aV0ed23pYSG6EmF9zYf
	 Q8PN44WDSu12QBJquVY8y0YD5Ux29Aw1D4VClsU+qRg8veeGQzRfTd7L+arM4/OkKPmG2
	 LKcKqIR0vNGohQhplzMwwXPyYRoZ0f1JyojMQV1bWk4OagTwBDttE9n/UMLuefEf3e4CM
	 9bPS92nfZIEmj2EjpdIXQHRmKubsUElkU0dSVyXS/M45DVizhHLjzDJ0fJaKC6VyIZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cozSZIel;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE9606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cozSZIel
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AB51F01829;
	Sun, 25 Oct 2026 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901835;
	bh=YlmkUbGyJLSs7ZHbp9XnhYaqTYcpcx8txHV8Br7izLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cozSZIelkz4ZjGQFVYYAgoAy9uqwfEBZk1aHdGPsl0U0Wd0uQTEOKq3UCH6J4WmAn
	 baj62unkJciVVqL7FcdMYxucLjpu7T8iZtyxTiLaSGo1IaHhxCjEknXESqT97A6xd5
	 KptVrWjAtTujQWW6P4E/q44mdWZge40YlAEdt2TAF4dFs0ILXf7O+GGrIMJYPjnkp7
	 SoLLmxuN8feRQ0g+2lbfSNQumuQruOEVulo2akmwnpyPQ29ry8W/bMnyLv5bfpULU2
	 to4KBTtig4D8ge9Eza78IWr53dgL/vOf2utaB5h1zmMuvv+A4DAmb25qB3SbG2V6Y9
	 3MuNdskPp4sDQ==
Message-ID: <sashiko-outbox-184045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/31] hwmon: (pmbus/fsp-3y) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-12-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-12-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:14 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in fsp3y_detect()
> to leave room for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D12

