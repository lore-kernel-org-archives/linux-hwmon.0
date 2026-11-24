Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539824;
	b=5kzIWtyTY+N/oxqj8cBUSF+lckAyiaUbo2Lp5VRjccYuz6QHLAHKdj9NPtkQpIFiDDC9
	 YFoBCooDkbkpbN7PfofDjP/zVHMQ8MQOz9uFHHw2oBkHwQGiz4zNnchIWQHCiUTv+Mrdu
	 NZiLeLyE2Zz00+4dZmk7YDb0KE42+LiE4Mp4QBq5kCuwbCAPN6fmzVA97sKfzm2thtlqd
	 Uw2sEGQwnFhRPnaUhhddhSOLMeGelHySJsFFFG3DAOJ6bRh3YxOHu7N/FRggjeF7QDA8V
	 ueDZCrBoavsVCeqsdzNA9DBSzusV4FT3Z8p/NOwJcQx/p4JCsM/g4Rr9QkyxbYs7Waw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NCAaObyaDj3HLd3NJszum2Suby7d81Mt/JzP4ehDeVw=;
	b=UFLRHAqzPK1uxhK7HuKNNynwHD7QBoymC99oAL3i7Gvm4OPxcyOwYQePsJjW7GZXzayA
	 MwZJAjwDfgz00e+AYxEww4lts6tZwsQ3gNr7QU9RE8g3kR1bj4UGGCS3+NXFgxbQtEZeJ
	 RUjsOtyn8sCjbqmzodPMqpuDuV0NUJViDdf7K24j3/3JjmEr00WA+FUhJ1CXQEz5QTjNB
	 Zkykq/RNr8Wmiln6usT2sgGBMeHhtqrnmQ4EIUMbTBhF2YcrTposcTCA9KVNV9o19irYG
	 9pnICTl9AEmwqZ9Gw87ljW0VQ4hME1CtOsFLide92rn+FTvqAtyxsomQ9q/WhiKiWDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQm3bVm9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699BC606A327
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQm3bVm9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8741F000CA;
	Tue, 24 Nov 2026 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539823;
	bh=NCAaObyaDj3HLd3NJszum2Suby7d81Mt/JzP4ehDeVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQm3bVm9bCiNR8RXxemW1xzfa/3Y9qUc9kDdvNBaE/t6DRyysy3CbcYp7vfUliFhg
	 xwBdNrzpl6Y60BxYSe7+o4b8EMpk8R0/Y8P0MjpTDUi/uIsgQ4yIEPTxdF0IxVd1B3
	 hMpUxJhmASFLSY81SUE8CfYyjrF6BarpNimtCeK7055R8Kg8GmpLIaNG92hE45nTdl
	 m6JI2H+Y9cUhKchFVtTFg34iohnuDGeABI9rtkxOp7GoLHOmUeUZaQHovQCbwFTy9Q
	 YGTCGZqNaa/9Z5T3XjImVnnXlb7xZr4r2unWwzGE1C0QkHMvoQ6GknNjbnoEl3akQc
	 oXm2kq/Q9mj0A==
Message-ID: <sashiko-outbox-231648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/3] hwmon: (pmbus/ltc2978) Add support for LT7170L and
 LT7171L
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
References: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:03:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-ltc2978-lt=
7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com
