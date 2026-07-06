Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092937BE7E;
	Mon,  6 Jul 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304408; cv=none; b=FWQOOnJmWSovDzCc5vPTsPkZmNgk2Yem9bbMOOaAUlx1Khkqpm4AP8H49nic11LLcpc5ytESSDHE6ocDPy4OVyStSo46ePDzjuat+t2bVOfBhFg8tb2J3n1boZb8Ldx69Dh2rqL45BaLAe7wPjT+KP0jc8WJ2SNhBKkxwNy8CTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304408; c=relaxed/simple;
	bh=kAfT/P4rKr5P1R3y6O8Hdp53QQ8ZZu3b8zF47LVhiwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/f0GSk1XfZlgOqAxap2i52jfN5m38BKYJQ79BpldvXOIZswZHk4/ukJ2cCPQtWmlYp34YV4/M9j0kUg7/40ZgDqJDrAwq0yhPGTxj9q1WzxactYASFzYTSdE2lQqfbqCflpXPnyXT+3hPBCIcvjvchwmBkMOpyWNzAe3OhT3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrvm47l/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrvm47l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BF41F000E9;
	Mon,  6 Jul 2026 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304406;
	bh=kAfT/P4rKr5P1R3y6O8Hdp53QQ8ZZu3b8zF47LVhiwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lrvm47l/PRkJ8TdLOdy13O7yngh1TnAFLrF74/8in5mip9AOz/a1xYyAtUyYZ1vtf
	 kVXwJokRcY2HQurGDpfqfzTJzm88Mr3QHJAG/vDagvwThFyhudFWcqJrMMEKbjm8l+
	 6orNigr7miiHfZf43yn6HhRlMj68iicsGPPw3touwgVYQTfP/KqfaFieyrLeDdzofz
	 TGlhftFodGKatx8mMKBSoyPcJViOKsih6M/WcJT0nCfjnlV5ieasPglGiECzJoSDJS
	 JJXWopoAg0bWXZp6IOhOVffYCdg+AQGllGlDInX4XwMjGcONCcZygoGncOBZYvYmTO
	 xhOgA5yezF4aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260706-dev-max20830c-v2-5-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-5-37761e89bb5f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:20:04 +0000
Message-Id: <20260706022005.C7BF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging
> for MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dev-max208=
30c-v2-0-37761e89bb5f@analog.com?part=3D5

