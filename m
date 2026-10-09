Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECC92D8796;
	Fri,  9 Oct 2026 00:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507510; cv=none; b=Z3+yRuy0LyoUCo0fRWE1GEwV/eZcm+aVnUymi7k6h+uwh/XL5VICWpNqgVxDrk/4/STZk8mlV+0x77CxvRhR7o3xSGm1JONHzQBlsOOZVxb7rwxc7Cu3FwlI3LsQwHtE467jTpEDEtlpkl05j0hj9NyI+/u8yGsn2ZBcs5pIcy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507510; c=relaxed/simple;
	bh=7IhBCy8uspg+h7tPPtmM6eHEUB6OVQE6SuVh6R6Kc9A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RtvQJKTOZUavRPQ09O1XQ0x4DLt16/vlVCSKidvKLDL42X6nfYFjCa+JKj+/ohsS45exbaPdDa/k5V0peHKVhaVJDiwFzZLYY5oLbo70PCnSaE2xnlapu/iO4AYgbAouK8CvYyZKunEXtXfOL0saQHGOE+66Rx+xJRJj6H31mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWP9g4F5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWP9g4F5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DF01F000FF;
	Fri,  9 Oct 2026 00:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791507509;
	bh=7IhBCy8uspg+h7tPPtmM6eHEUB6OVQE6SuVh6R6Kc9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWP9g4F5/dX7o/ckXDLrrDouFZtkrI7cDEDsOYQpDUrL0/rMcTIU1ZQufnsvVDbjM
	 PwQl2Fe8wV3lMwDQzBC+OSfupguIe6EQoQLrPi0slB9WzFwyfSkcWL71eXx3b7to0X
	 j1kKkncUsFQ1kosFOmfjnZQA2qTP9CN50dEW/4bR/aGreI86O25GmnKOnUseQd43Yb
	 qImT7VyDPAYEdlVAMhvPnJXxyg9U0KT2XxlQZcjnKJb6epAwfc5t6f2Hkyxi561sfx
	 je+Xm1Jdfufi8vpDvMdgleyIywaCqjBjF2H5mC/romyvYGOsy6uxYqUpSJRDE7GeHl
	 +CGlo5wzXt48A==
Message-ID: <sashiko-outbox-164691@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 00:58:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
> only a reg property, so document it as a trivial device.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-hwmon-pmbu=
s-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai?part=3D2

