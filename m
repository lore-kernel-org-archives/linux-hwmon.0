Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCA3D093B
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 20:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629793; cv=none; b=sxfNKIQSUofOcp7nlSOEq2w76UmBEwcajsNDnQbBTYbAr91x4dfH9pWjdJbbL73/Asqr5vvrp9XG8Qd8B0fBx0X9gClohTEFd1abvsMxFSnSk+n2vb8hxaiSOmfDYAcOmTt8J/+mLpUoriLNYWURf27UItAAvnJ198oVQx+2fIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629793; c=relaxed/simple;
	bh=+vHqU7pJJL6qhWH5NP7mnDhXCRGoKZMwFADEmZIlJzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qc0EkHOxFG23RMjYLI6CbsRE1RI2heUDYXwdPcY99OTjquYRNJeNBePcxQ+BPhGRPbnkbkR4/dXdy7q5dKTSaSsIz1gZTY/DzbXDQ8NLf6xqzt7T6B4vKE8CF98i+nT6AS3YItLBgAItXiu5c9rx4S7xjg5/Bj4dZ7XD//GXcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6CWVFU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6CWVFU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB27B1F000E9;
	Thu,  9 Jul 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629792;
	bh=+vHqU7pJJL6qhWH5NP7mnDhXCRGoKZMwFADEmZIlJzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A6CWVFU95lFo3zAXiV9TQtVTT9ZV5rso2IsOvY4Aq1u+ZjkDdmeZK8ii0ULQl1576
	 EtGTBG8Q2oszsc/uJSzpGDaJGajI1q0hBaU+ghxNDWXCNH6zgeDyVAv3FSfLppmDqe
	 Vp4u4krCL4ctE+Y1l+tbNTPLo39huIzwVhAZxslmb1rTw47PA2F0jEpk4vx6jr8UJa
	 Km9zBziDg1lhQqciJAAauc42/qAWWygToqZO4g2/UZlwTGuaOjKv6dZuS3tl4HCPYH
	 mL+F/wS5SDJE2tvmQSMmYh4HxdN8tdFjTS4pkfrw7x9dNNiJUjTk+UxWR5TrgL/14q
	 f4VQyxX0lSDDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E
 GAMING WIFI7 R2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260709204037.1998433-3-eugene.shalygin@gmail.com>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-3-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:43:11 +0000
Message-Id: <20260709204311.BB27B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
>=20
> The board sensors is a copy of ROG STRIX X870E-E GAMING WIFI7, thus we
> simply reuse its board_info struct.
>=20
> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709204037.1998=
433-1-eugene.shalygin@gmail.com?part=3D2

