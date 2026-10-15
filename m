Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D93F9294
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102973; cv=none; b=sHEgq16nhpHFAWgCUwwVvBNCs79bnYeEssR16Jv+/G6zmYneINEEr0JdMtuTnn4rngiZOPMTsBGshiCcOKKx4tWmUGDHdaiL9RfmFLtgZMcV5vZtiVe8G4cO9PPUq0cUWTI0rWJbZgUgXWSqjOsWM8CKdXO5SNoN/TUu1mSGjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102973; c=relaxed/simple;
	bh=ZIwl5WCqzA0Y8S6XP5pSOJiwJZKoebJr2TcNz8FsFvw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fHSa1y4CpV0hnv5hf8WblVuvqQOgnX5FsjttE5YQzFlmAKOUTs22NHn/1A6orfF6U9QaDn8xraHVSnpuft3eLRSEJg8wZ5/yaQseQOFJjgLgd8JbmgKWaC70stZsBzDAl1MJ7RxQqVcrrC2yb7K8XyivLQIXrfscr5owrScOHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh+QR4FW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh+QR4FW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E831F000C5;
	Thu, 15 Oct 2026 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102970;
	bh=ZIwl5WCqzA0Y8S6XP5pSOJiwJZKoebJr2TcNz8FsFvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lh+QR4FWG7i/MBLnGzQTfUGxb4hFfa4WE/Gh1Bd2DCZsimQOOA4TJtqmaNW2hIJeI
	 zhWvMxxvveDbJCeQ7DTXvLQnwmUhrNOztYartD03oX04mcxexg8ZKe0mbufCSmWZCY
	 aIYFyQhTNlIU4sl9g3Qr66qdY85sTaI1Flf467TWjW061cUFETcYjlMTd63UjQXdXv
	 FOqyWSQNcri6FidRf0RKZQUDf3/GuAZJ+vJlQzcYDhXu3hyJMN/eGp/iR5tYQJfgO+
	 Spxzt2qvdS4Ic/NEJVv57DX3mC5iKDVcj4GsiIeZR4s84lcgccA6oHKxxkzQiDazqT
	 woS5McaVDQ3GA==
Message-ID: <sashiko-outbox-173449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/6] eth: fbnic: move sensor read logic out
 of fbnic_mac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-2-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-2-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:50 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sensor read lived behind the fbnic_mac get_sensor op, but it is only
> ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
> call it directly there, closer to where it is used, and drop the
> now-unused get_sensor op from struct fbnic_mac. No functional change.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D1

