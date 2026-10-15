Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146345FFB4
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102973; cv=none; b=N/CLreqOjG9XvioXwuo5ULobV20f9ir9re1dB08c/8Uni+gJgMkOrHQQxde62+m8f9hP4m4J5Fn+glzXFUdi0Bct7dMa7ieh1l54vTyR5aeZBuB8nLPoCUYRsHoIG9XUd0Z/2tI24q7GjB5IJQk+PhxQh8hhvERKZBOu/ENPxtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102973; c=relaxed/simple;
	bh=FwMKtr5RJFjM/rJEUteawW7uZXemcd/2EutJ44IJAHc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LLXebq6ehatEN+Oh83ZoMAHVksF/CaFXi6JpHcVzmFgIZHwIS6Usg6byrQNibrY/ck0ewlQ8FOPkxSd6Gr9CaZrRPPUWvrakyE/P9zUSPVBkExMILan3qb0p4jlJeJO4WwkWdtW9xbgP8GGI4SvPZKboUt0HvAqxb4Qzoqw06Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bn02OPAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bn02OPAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30381F000C4;
	Thu, 15 Oct 2026 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102968;
	bh=FwMKtr5RJFjM/rJEUteawW7uZXemcd/2EutJ44IJAHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bn02OPAUZfk2GcrzRRpH5DYAcoH0vWYktoz0e6kWz3//Qxie4OS04o1/+Kl9IKxNR
	 rEXZcGFO5TbCbQz9rSMRNaSYXbEesoaXNxWwl1dCRPEH5Cb3IlKB/9vb5oRRr8+efG
	 9FCH+DbnHfTP3cXa4esAOQfUPyHyaSJtKESADIBgifjwJ55S/hNU6Uv6d+g+Tt6yxc
	 0s7JldYSxI9UuI3Ip3v57yH4gsk4uFUUw0cjQiE6HWvLS1ETriElMxWUFoo6WnCrrN
	 Kj2zVKr6ebVgruAAI5KUIK7IE9iYItZlL4Ckok8nmnnItVDbVO5e8/X+ieKiKnErPc
	 go+Dj8L0480Ag==
Message-ID: <sashiko-outbox-173445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/6] eth: fbnic: cache hwmon sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-3-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-3-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:47 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Each hwmon attribute access triggers its own TSENE firmware mailbox
> round-trip, so reading the full set of attributes or polling them at a
> high rate floods the firmware mailbox with quick, successive IPC messages
> for data that barely changes between ticks.
>=20
> Cache the last temperature and voltage reading and serve reads from it
> for the remainder of the current jiffy. A single TSENE response carries
> both readings, so one transaction on a miss refreshes both and satisfies
> a whole batch of reads. The cache is seeded with the FBNIC_SENSOR_NO_DATA
> sentinel in fbnic_mbx_init() so the first read always refreshes.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D2

