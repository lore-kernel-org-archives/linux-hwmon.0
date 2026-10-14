Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE883EC6B6
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001305; cv=none; b=dsvkJyHLMdRH/5SwX1FjxIJ8jrx6OvrasvZU1WrEhLDakLx9slWeb3hFpXSvUqbLMjTwEQNzj7JVNSLU/KtZbX/YtDehh3SjoBT8zDGEKYVC1RSrnMQpMPumOSbfY4iYuscCjU2GNZ7jdPVPnmR0kcRz2gwuHBmoVcOaQUm6QmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001305; c=relaxed/simple;
	bh=4rDgWP3bI3fHkD18tYMmu9rvcNkKO65okVhsfiBot2o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KYPc2qOt0lLyWgJsIsJBa355nVcj7csvYBiZzM8vUYtDJW16FVEnkHKGh0i3ItZmR45eAHv0rn8wn3vWoo7GY2sZDTtEvEQZAu6hVbARRHlU6bDMnEIJpUTSoboEF3Y1lG8HkVQ6xZCw55B87n0+QWw9h1j4mw7WemATNl4EdP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+rfrisL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+rfrisL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E61B1F000C4;
	Wed, 14 Oct 2026 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001302;
	bh=4rDgWP3bI3fHkD18tYMmu9rvcNkKO65okVhsfiBot2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+rfrisLI3cE8TFcgECJ3QsB/HTRa9zbA1tMMsnOw09Zhm87KXS+Cb7LJ2Rf4ZEhN
	 tg9FjCtgCUfnkA6XPW3fa5x8XcFa8HUYbqJi1QzHBu+Mq/SzR/8InvzFmZTRj/aJOY
	 sGgQ/hiwvOVUM4jyVOKQjpNA6LLCvlF21DqnYXzPmzVZrhmwThXikfRMIrrY7Prsuv
	 PCRjDWX9opGUMG9+t2yfZ0mFEpzOtk85A5pqJqH81fkbgDZfwGdcQJrxWz00E6A8ig
	 7VblI+ZsKGMKpuTM6mi55bn1AakExtzBZ+Z3tcc+PCmjun7oAgY68QwqwoMalaP+ye
	 txJFq3+abAMFA==
Message-ID: <sashiko-outbox-171661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] hwmon: chipcap2: fix be16 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-3-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-3-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:08:21 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver currently only works correctly on little-endian
> architectures when writing 16-bit register values.
>=20
> Use i2c_smbus_write_word_swapped() for writes and get_unaligned_be16()
> for reads to correctly handle the ChipCap 2's big-endian data format
> on all architectures.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D3

