Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B513793D3
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693620; cv=none; b=Gzm36NVYXEQPZ/aOvTv8rt7tqY1Hunpr//1gXaWaf23OvCxoPaAjKbQ68HFcZYcxpBwKXxuy7qxN2I9cS404EhxpDXF6R44HmovCH/oRPqfSxuC8P4mx28ZehQQewipwiJYQO9KQIynlg3t02LRMeOANhNiKGc2KgQWFQXrpTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693620; c=relaxed/simple;
	bh=Da3AYKJ8/m0wlyG2jL7xAkStb4LpIvBDNpuE8iamBRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBvbL5jQzzJ2h02Jd8WqpGh6B7QjmBTOtwb0NaQw3e/mu6+9sf+RAOZUlB7Pq51KEWWjNyV+0sRfDWeOfmLaXLRxWR4motXzYQpSSqtalR1hgX8a4e5O7XrCOzIgbVVFrbhyEEa0FZ/o2YRoYZd7xt3YLAmRZAj1VqlXWo4Wml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRxC3m+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRxC3m+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961D31F00893;
	Fri,  5 Jun 2026 21:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693618;
	bh=Da3AYKJ8/m0wlyG2jL7xAkStb4LpIvBDNpuE8iamBRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dRxC3m+zA51QdK+4wHM4VgIhnxZDG+tq0es3GkzWm2lXZWExr1SSUcevT3wdexCOg
	 b7Ph0RRdB/hLQy86ekYniXYIHx3N5vpaPIjQgJXG6uwG3GGjONouNqiURCozECkOio
	 Aln5vIe2LxtrG3iFOY7Jq+lRBsT6ljDVNCMdMEf1u/Lkf3wn3kXzbfWyy7jrjeYi+1
	 /2vh44Fa/Y5BqOC1KKAOQZunIZe0Sw0I4cuWeqY4HtKVz17Tws5oVClxD845oFH42A
	 6S/9lNKcctQ67Em7tDyTJH1sYHI3I0x2EfhWi8Xe/YSYRexcek5F0xDSB0fG1H5t3O
	 fhxR+9yXXUfOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-7-W_Armin@gmx.de>
References: <20260605205937.530897-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:06:58 +0000
Message-Id: <20260605210658.961D31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D6

