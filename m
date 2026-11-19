Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110473;
	b=uqLVRlF34k3UXD2X/v/uO9T9sFtGbr9R/KYe+YsZ7Z9W90RmUQjrIeFiHgd7FOMeDzw9
	 9WRmoJnacHKxlAhqmH/fzhTWC+FF3b9vGK8lOMwlifVtV2tDpg7syhuPiK5g7Q4x05DZo
	 s+woMnWSFYMrdXiuJCDbG3yfTBv2WPBnVnaYmckTdSOFJ9sjgRfnxWrwWgA9MmHxmu+4h
	 QHYUddqDEONxm+mmyoozxwP+n5MEyHUZ6pep3pH9OArQ0PaW8Hp76DvuNx1bGMrREzXJC
	 r2jTyJPBXJczF6CnnwkVJgRY2mqIS5hr6zLPgzE+YT7kvpuXGUuFYUnkYbsSRq/VDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110473;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z05LOMxGfGffpApYQeSVbyuNMVkuTiPApIHFwdcDmAI=;
	b=o8RIQ1SI9xpvEcnTwvyFctgiCkUbBnvTgNB86RsfCqJfUClnFkh7RkHDgNVvoSbrFC/S
	 laEF8IQHRSTfAblydi6mcZMP6i+GBbrlvBn8Yl2V8Io9XgBdSfmRCllR5KlDejVhsHmlu
	 aJVhQF220jIAxhwXXRXTnP6eOKFqV40wmQ/Fwvqg6cyTJY8xvBJ4hBetcegkJ+vuzS06i
	 Wo14mss4/PhI+pXdP9AbRKk6sz1kVc6jYmO141gMyuRaDvop+68SmzEBfu9vXlyUbKtNq
	 Xo3HzXkq56PIXqLuEcLvPettoaldXlJtZM/0HDJdw9vsuCj+5NpPceYnYOrmvsMQvhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvsiIL68;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD47606A332
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvsiIL68
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9878F1F000C5;
	Thu, 19 Nov 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110472;
	bh=z05LOMxGfGffpApYQeSVbyuNMVkuTiPApIHFwdcDmAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvsiIL68ryrYTflXyi4PsFzLdH4RO9I46td6dmzKkyizg4mZtediDyQo17vnTcPgX
	 k58iS74Dnpib6fIcp9ZamEPK1y2LZEYSeQDbJ6bkcmcCemtzRx2RKC/aVRQc7qW5uH
	 h/jc6cAKwS51wueSLyjIDpqc8EfFbSGwaT7TgFLEPymvPNOxHyD8JV0TFFimyIhve4
	 Sc3gl7oe7HMMcj+BGolILxi7ibqWJQtTbC7AgrPzyQYy4yN1XOsrZoNuEPh5gw7xID
	 1wjwLIme8xwbW1JS1Jek6GUZY/RJs5RPRWjNxZavL6f/VRsoF8enLONM1CjDgJAGei
	 mXZkOrokQqlrg==
Message-ID: <sashiko-outbox-223721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119174548.1324539-3-benedikt.niedermayr@siemens.com>
References: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
 <20261119174548.1324539-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:47:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add documentation for the Siemens SIMATIC IPC EC sensors driver,
> describing the supported systems and the sysfs attributes it creates.
> Add it to the hwmon documentation index and list it in the MAINTAINERS
> entry of the driver.
>=20
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119174548.1324=
539-1-benedikt.niedermayr@siemens.com?part=3D2

