Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAF38944E
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 03:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035972; cv=none; b=vBxwPSUChhJLYPTX7RJa8zyUnW5V4HFsE0q57pBs0zQRvAj1I219maN2yy7nf8KzsnxviXo3y9hq2Smkp0SacoitAiGmhS6V7rr/R+WaqGpo6J6V/ivzmrjbstdouxIVDzpttlUaGTEN/pNOKD6Hj21ekesDiTl/NaTlHbm/xLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035972; c=relaxed/simple;
	bh=0LuMvyH6AWssTl8j4YQjDy+O7cpNJwqGLS4Y61YYrY8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gZ5ezgD8fQCqt2npz/fB08LjAF4cymOL0/JO6RuC+El5xBTgojuoQc5FnqjVhXynBHEvlF6A9ofxF5qaHGhpJd56ECLlG2D6z6e+Nh6o28aDxTwea6xZKFbNZl/85bis1d7azOAJN+f3eZAeYtSkVCX0IkaeaP7tAsXVCMEQFs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/9E0wDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/9E0wDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40DC1F000C4;
	Thu, 15 Oct 2026 03:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792035968;
	bh=0LuMvyH6AWssTl8j4YQjDy+O7cpNJwqGLS4Y61YYrY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y/9E0wDyJrh+ymYSZLV3gdWtmt8CkCqVrU9Zq+mpPIPgmBmY2ZGKAzpWrhfUB69Vk
	 OYhCe6znMqDQEMpA26/eoBI22yA4iyO5/LklWavo1/UYx0Du1Gyu7n/h95r/C0k6Hq
	 +ic1jyJ2ov8GHeqIvK8IMKhASjogeRg3jl3z3I+IDlw+zDfZEoz+ZOQ9sB+QjCg0mW
	 G4WdaM9okBNXmLkP4jz3PjPG602ETfsJUwcBBWb5xboNtUEcTiUy6gf5gghkSQkqa9
	 I7k/iGybgYXT44bWsNdy4Sb6W1WaPKH6a+rlwXVKo9zL4VNkSQHlgF4iMcV1blhxbW
	 yd/6upP0ZVlSw==
Message-ID: <sashiko-outbox-172226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Avoid overflow when
 rounding threshold input
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261015033841.390615-1-speyrott@gmail.com>
References: <20261015033841.390615-1-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 03:46:07 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The SYS fan threshold store path rounds the user-supplied millidegree val=
ue
> with DIV_ROUND_CLOSEST() before clamping it. DIV_ROUND_CLOSEST() adds or
> subtracts half the divisor first, so inputs within 500 of LONG_MAX or
> LONG_MIN overflow and change sign. Writing LONG_MAX then selects the lower
> limit instead of the upper one, and LONG_MIN the upper limit instead of t=
he
> lower one.
>=20
> Clamp the input to the representable 0..255000 range before rounding. The
> result is unchanged for all other inputs, because the subsequent clamp
> already limits the threshold to 0..254 degrees.
>=20
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and f=
an control")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-171941@kernel.org
> Assisted-by: LLM
> Signed-off-by: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015033841.3906=
15-1-speyrott@gmail.com?part=3D1

