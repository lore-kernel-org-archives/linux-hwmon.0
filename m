Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047379;
	b=Me6SsT2t8oOfh8eR/5axAgyqHXQWJpBeynpmmy5lYONQiALYcLjBP+l3jJtrFC5kBWhi
	 w72sUWEr2few3JKXioDrQoOTeDD39yTwsUu1/RVFjSmOuMjEQ/jIT4F0eEQmr10xSJ6eZ
	 /gmb9pDM8ZAStJAytUIVkJGBes5ZTZG07m1lTfuXOI7uu4SJwFiy7JYQbWljFUpX3nmQa
	 jBHV5zZDnRh64Igmf7ziy9X4fGHpdguNsP32r1ezlt5VtjKvichqvJ4ajQ/pufULpwMP2
	 /qrZOnRN4KhqiwOSwEuiw5X/ww0y+TjgJumYfeQp7C7ae54TkaHHecSjI2iwkXyxDyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PgoH9Ntjxm15KB5dF1YVPATSG/xL1bP49k+o1Bu1T+E=;
	b=fKdENKJbkDjG6UPNFyNBUxgg9V5Kj6SLJLQD2oOvdXNERpYTQGT/ZfF8nQZgJ8S0WqXi
	 xzNrMmoO2CsMhrBy0dLZJOzIBVEJaAeI4wDDy/a7eXJsroAQ8Cxi7Kv9EaBOAzQbzD7LL
	 JfzRJ06Y1jDNVDmvgX5JVvzo8I7KH6b0dR7NIYKGL7ZW5HOwGKg3zmJwpcEpNa9HXe88g
	 A1eLZfbhVX//D+WNZmY4ItgJ6i+/mZIo47ESvb32uGPRbOG50X+5xjm2zMQiGpBGtYs15
	 Su48V2Wc1g8ZsS021j8qxU5dLoDq4x9WWKgE0Qld235HBMrl9Ts+UfjpJ9+HQa8To9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGJl4ap8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF6606A333
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGJl4ap8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B651F000C4;
	Thu, 19 Nov 2026 00:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047379;
	bh=PgoH9Ntjxm15KB5dF1YVPATSG/xL1bP49k+o1Bu1T+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aGJl4ap88dL4NxWTFnaotSYEGEuMJlCqcrkKW9oeAJofTNdND0rhOBW97culxtJrc
	 QYcWtvLm5TDGzQlIYR4hAZAdLIh47aSfcpPAa6sFnqmcQRSaVBIznmJaFm6LkHcf5p
	 +AK9XncvMTPzzT3EInjFiyGvxVb38E6XiQ6URur9UiXYWeXxZQ9iVt8re82a/9yiFO
	 2uaFqh7tFyf/DLAatRjvxEsyqXliUipC5q2Tf4mR3UdUzHgcnvlzFMh7GhYtqUKngc
	 rUW1oFTt9UVhx86AAeH8QfhY7pE7pfs+NsrEZQ2gm8pelylcsnNPOn5IbofLyPcYGV
	 FbNXDDMoGdkxw==
Message-ID: <sashiko-outbox-222240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-7-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-7-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:16:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D7

