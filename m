Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFF41A55D;
	Thu, 24 Sep 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239729; cv=none; b=UWvjdlnxt7qLfYCdQmbwR/Hgf9l6IbxtZIlCwUSLapCFSKy5qjvvtafZ5H2zUtTDQLCzVcu4VftDrUTMOmQnqmI5vRJkY/tkbj2sueg+y5T6B7M5N07uT01AZKcyufjDcwepWJSDn/88cWDk+IYCkBiFo21xFS5kWy73yd631sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239729; c=relaxed/simple;
	bh=JkBpVU12sxYWQMe1LL5JC1wA56iLhKfmljZVgKAnWlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=abQKhFkPd+VvBLHu4JulJGqGk4lxiv1Ze6Ehal1JD4KrimmzsDFSCUHp+b0hmLfubqRkZRcCvEtJiBPoA8HVSbOJsdxZAKXEWzInM+dRYf26xn2XCp5qQ/jB7Kduanyg8VkWtZ9hZZgeE1a8CFd8MfBHteZQP51ZvjoiqOREUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjeT3CDU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjeT3CDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062E61F000FF;
	Thu, 24 Sep 2026 08:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239728;
	bh=JkBpVU12sxYWQMe1LL5JC1wA56iLhKfmljZVgKAnWlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KjeT3CDUKnPl/HI2dOhsvWvLR+3WtKbpaLiJPWy2ILRHyyJMYHtnWOi8DGyyMmEuw
	 g24zI3N3xq6t1YPU43f8CpFZB5Ce+EzMrB0FzHhuUstKB7filo3z305284Zv2BBVJq
	 OC/7ReUJnNXA8lEF/iWqQFbU2JBapeiTxwDRwIo3NK+1EGpggXzkvGjRUmzNVzKKvo
	 kO6TAg1ttP31Z7PzpjKcR55RgplKppCRqBF10Em+9tCenwMX/xe7PSfQHCB5BlJgNg
	 VSOOOKKZKQWGxLcERpqZUynoSdmWyOW2JCvLJfxOWrNuQd3/THRk+rfo1doVXDDy44
	 vpEJO0jyCENCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: lm75: add MAX31875
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924084121.82-2-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
 <20260924084121.82-2-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:48:47 +0000
Message-Id: <20260924084848.062E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add MAX31875 compatible string to lm75 dt-bindings.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924084121.82-1=
-johnerasmusmari.geronimo@analog.com?part=3D1

