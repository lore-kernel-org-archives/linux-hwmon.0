Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104479;
	b=TXXXSMziZCbRmTfiCSaKvUohE8g/AiWCGoGfrVJnRI14TMVlgQ7dOJibxr1EiM8q5rFY
	 ABG2BMKrOd6wUm7xOVxrYOFldH9E8LODKpNyW5ESloC/la3NsgIXCHDHDPHEJ5E06aVWR
	 6VDuvsbkzAeIMVlGbUaDJAkbdEo1CV0RZvc0L/6Z5uSCrHQvbN4l3tvCEhXSMLmr65mTr
	 ZAi3UzLJJWlDevHqrdMxUnvZOmTm2q1/TlsRli0rryr40Wj8a41A6LsAAMLV7DFBtvIkR
	 13drU+gm8mPCPHNUE+nM0U/krHZihKn4j5LiYmKalEX/f3yav+RDyB1Hko4MSIquWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zltIFyCofu1LUu5wJxH1fZ3Mn5cg11BRC9u9phRV6og=;
	b=r+/lXwvIUZB9932OCTCXFdZkPI9ukFurDz3IbXX2Fp2qwVITy5/KXyQHvVXRYTFlqypS
	 jj9ywFWG1miGQsQltb1u7GT6Tqq8TqR2yNZyCHHAAyAUvebJBqDPlSC/WKcRSF8bYNDSb
	 9Vbu2VtZM9eue4UGRzejmGaYDoxr5hdpdWhhoqtrNoHikJHEZqekCh3XmmiZpSR17pUTw
	 7kMnhz25uhre31hl/yYnw9E5sx4caEVwosVfy63x80k41/mgk7lXBcoUbA3PWQ73jHUQR
	 yDbnpucBolwo/iaIibqRbtscZw4tIrz/dF79zWaDqn3bMFlzc6+vfp1S0Z95+QXYeSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAbyatsS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EAF606A330
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAbyatsS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6818A1F000C5;
	Thu, 19 Nov 2026 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104479;
	bh=zltIFyCofu1LUu5wJxH1fZ3Mn5cg11BRC9u9phRV6og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAbyatsS7i4wt1DEowAi0ZDUm4tXmyAVjrbQtc0mOAvYFGvNgBcxMYcEqqOHaJAMf
	 k48yrmlPVTG2pm9P4qj1SxM4jG35H84r7CTgX1FQ/5BLLxb0SUsXDLKeucqXE7+JXj
	 QLGJDlfrr5iV6GQMY4RrRS4VKgY2ZP+bBij5Hx/i/jlR9ZUQWlCobvxkJdL68UJofk
	 TZtmt82cmRtOD5DE24iNPl30BL9d/Jy1zTz7uH0gbbrSn6xOkbssuyDhPbs/qmf0v/
	 7F58bdDoD5mw7QWuZDu+IuGXxje7nmMm53GPNuc/VptvqEsYKNDBC+41jASBN47KaA
	 MQ3oPpVbN6kdw==
Message-ID: <sashiko-outbox-223476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119160210.1257890-3-benedikt.niedermayr@siemens.com>
References: <20261119160210.1257890-1-benedikt.niedermayr@siemens.com>
 <20261119160210.1257890-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:07:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119160210.1257=
890-1-benedikt.niedermayr@siemens.com?part=3D2

