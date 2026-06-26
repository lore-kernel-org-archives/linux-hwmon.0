Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C536EA84;
	Fri, 26 Jun 2026 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459170; cv=none; b=SkIFSlTUeINmHs9xTWQBw2srSp7Ln0MlqMEfT8VPAaFLJTj6AivjM9N5EuwYMV7gQnTgVW9B/YscM2UjyCPiqkaLAhVc6WBGUw1pQ5+MLg0HlJ65h4ZShEYA1NnXsZ+kTFQj344ZuKgpZZiyL9Gjj01DkD6jhie4n4KhAeyDz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459170; c=relaxed/simple;
	bh=u0fPHrLYf9sLm0yYxI9gWkNou3+hcuvKtsbGuNTxgF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGo1Mh2hjIhBf0HYET1TaU9QsoliiKjZkUQB8q1dHhyOft/FCLETVqyZPPbzTRIIA22G3yOVSFUiAgaadAW+/A/mM0uMF/vjts5PjFjZrrByzxOGInoGcHm1QEsYbSCYJMcQdfAvYwEO+Kv24TFfOVPJ4AHUhW1efJ0/HBxUxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnvkfHcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnvkfHcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1781F000E9;
	Fri, 26 Jun 2026 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459169;
	bh=u0fPHrLYf9sLm0yYxI9gWkNou3+hcuvKtsbGuNTxgF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnvkfHcS8iZG8i5dQBxX4xVV9GHvc56YD6Zu+BivTWrbVc8YmGpkSyCfNo5MsLQfP
	 SF9NlJsAT87wLd83ljX6PgKqMO0Mhb5xe/vptNxIsCP1MVM1lE7kOVoYDRFhyPWVKj
	 PRzeUk5UzJwmpEggOZnCu/GEHOvLrXVlubM0s1I9i9+N/O2xQvlMTMhSagLdK4Jcob
	 hdOcOY8dgsQqJqHVuHk4OQz9gcFIuEztB242xwFFWjYU7IjoVJgw2NUymhWIsnmUVg
	 tFh1N/eSlgKCCTa+OHRNG9pNXdvuTa+TvFk1+eHOKuiCCBE4qya+hXE05vwcza4s15
	 I0GY+bnl7stjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:32:48 +0000
Message-Id: <20260626073249.3F1781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D8

