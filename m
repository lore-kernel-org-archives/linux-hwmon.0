Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217563;
	b=bHLKlUixCXnuLOHwCZqoYE2DOQd0QC77jChQDsMdU5h0trwjpbk38zyFKG+inMFHeIBY
	 fvYwcyua509Ry/RoIjjvQsYeLbRPfGLorxTt3oKU/R2MY9TsCOtHv099+ktDarYUWg/+p
	 Qe0s+unwvxvoPcFCKAxvoZrdMMVk7rjNE6Ela8H2shOdvCSBJwODBsu/I6mjaqMYBKE3Y
	 qqibno8SVF9B+yMVwDaYEtrVq3WkQpBRg8zWFE0hYl/EnXUi7uBnxnIz9Y0KneYY6/lE8
	 vd81qEXFz67HXP61GJmNwm/6ttOXsgZx7PHjLVEhoGRNxWlEZnGTkUCBngCL+c0xt2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217563;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8IE9s4VxUkFaAsMKwKM4nIVf27D1y4dKThyXuKqKm4g=;
	b=mB749DPg8Wi4ZtT+OI4CfyB39ntDjxYy41N+v2xKOpc5F3tMiiCX/hVXxgIWlHKe1yFM
	 syiRzPjBm5nGFtsHH/pMBYmhxCSWC67mlpSXHB99aYloZCN7vKkYj183Bvc87JCVwVX9M
	 QQcdTsCxEVpgu4CW3OpD9P3hZdSfDUL0tX5EW8sHq/nDRLx6sX2l+dfow9bfUJL5eP2QS
	 QeZkNMU8JBAwl7fAwEiVYEPTr55vTbLApUxDluyUPq88h+7q9zdWUKpDWtaHlemk4ksYW
	 ikIq95FPG6HobRsNGfP5M6/FEjGhJs8DnhmaBP4S/1oJvTUDXIqSJ1Jp+Dso2SKa3ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCneRsok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26CD606A322
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCneRsok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B531F0089F;
	Mon,  9 Nov 2026 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217562;
	bh=8IE9s4VxUkFaAsMKwKM4nIVf27D1y4dKThyXuKqKm4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fCneRsokXqUcTwW5ttvy6DxzGZ3QmKXgofftgheIU+G+WHEs0mfENbNp3PzUBRHUV
	 GiH7A7cyK4E7ga6E/63S271Hu2d3zeEUoDbcY0bbj4QN5L6JM89tnQp8kb7Jn4PlIC
	 o4HqDHOYbZUW2zeBnNPKe6LNo92DSXeyb9fIGJ5uHjgR0wQOqJk3Hp/5JXebLCuCyu
	 TRKgFV1nEvrsg4siicf8z+bWXXns1WDzg+pDD+wDUPcYD7Wdcx5Pe5tV4cBqS9tG8z
	 jborbKsM2+p9ukZDfN94ZsLcsULufQcTIGkr4pMzf/wt5PZnkGrb+3G4MUhc5/ELWz
	 h8xY9rJxAHGqA==
Message-ID: <sashiko-outbox-204740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83795) Clamp fan control times before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109093722.5508-1-zhujun2@cmss.chinamobile.com>
References: <20261109093722.5508-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:46:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> time_to_reg() adds 50 before clamping the result. An unsigned long close
> to ULONG_MAX wraps, so an excessive stop time can select zero rather
> than the maximum. The same conversion is used for fan speed transition
> times.
>=20
> Clamp to the maximum representable duration before adding the rounding
> adjustment.
>=20
> Fixes: 792d376b4f3f ("hwmon: New driver for the W83795G/ADG monitoring ch=
ips")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093722.5508=
-1-zhujun2@cmss.chinamobile.com?part=3D1

