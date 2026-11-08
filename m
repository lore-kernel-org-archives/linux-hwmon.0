Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130768;
	b=X+EpPu3O9RyLDdX6Wl8L31rE6GuSalknspB96V151+H9/wl5vsP1PAill9onZy/3sLzD
	 z356UPUFrianjexr2/hT9vAuyRRL578PvcKUDaKIsdZ3VpwgGVnXo5es7j1t/UxVc4e/L
	 eGqK3oN230W4DvMXxA156RThbxV01JbaSewVEQsUd04eRI196kj+hbCDijFPtJDPX9Jvy
	 AxnkFEChfXhFaE7NyfkV36q8kYimvkNoSVT5wo684oHDoNrJzIifmjrDp3XELWEzK+0Rf
	 N8NMZIvQY8rXbqb4QvnHx35dW+EIxn4Fsi1XFGZxSpqYBYNvQGMNTF68SWtI65ddAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130768;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2BDj19JXYkQWB/6pnqvXKOWroB6/4D9wX5nUFE75oYk=;
	b=dTUdHshiVflW16kYd1VbqzAPNDifkulNhdpsc66UrhQaB9SZNEj2qfQKzw9tSmUwJ8so
	 ugSspXqhB0WaaE7QGreSKbimGe3+NtMOlN1ph/WSjZRcamXWjC5SzMHv+yT3rwit8nqUY
	 dKQFTLqYlF9MrGONB4K5N7X0HBnNRnacaftCjtK0Sh1AVZL5rhKncR8pdy9zenZM1z/jB
	 EKzrlrBOZmReLLaAyRdnFJVgCnssP/zOVlmYSmJiPD/PLisB9qFBKHOzPmzN5D999Vrjt
	 kGO5i1z0BJA9c8SWksU4RP1x7LmD3COyBwlWCXVMlPLm0pUOdZV38KttN37sI1h3FqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gzr6AW9p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB4606A320
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gzr6AW9p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620391F0089F;
	Sun,  8 Nov 2026 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794130767;
	bh=2BDj19JXYkQWB/6pnqvXKOWroB6/4D9wX5nUFE75oYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gzr6AW9pjnPx+Jiu5HdNwWF3/6QWGh214XHXWTpUWdJ7T0nUuu3ddfMDtColhUneG
	 5mpM8pNDKX/h/Gn7LoCjEFuOHIwyZfneAdWN/1NkxzvhgIGUjiOx3vbhhYUZuval5K
	 LsiJ0xrYXEvqO+Zpl1jMwv4Y7MF3qd7cF/AYjLCI29INWaszVUkXDrsAm8D7PT2Nwm
	 iY/ANy3fY3EgE0GehU6BR+hDVD9Pn72PVMWMZHRilU5wKyoHzDbvsFU9A6smqKhZ/t
	 TnYvqy7kRJB3wkv7Aj4fWcK6EecEIq+UIrrGDxhTsmnmIOudCcfRreLky8FfQWs2iQ
	 lSEynGuQ1+wTQ==
Message-ID: <sashiko-outbox-203659@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] hwmon: sy7636a: fix negative temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108093602.329554-3-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 09:39:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The thermistor readout is a signed 8-bit value in degrees Celsius.
>=20
> Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108093602.3295=
54-1-pmazzini@gmail.com?part=3D2

