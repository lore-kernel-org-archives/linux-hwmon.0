Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F1431495
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133726; cv=none; b=bVrqMmtOyx6WH02oGOCu5mncOPK5tpwvDw15zYTSLGJ8bO85Azb/QlKTMRldnOsZBwyrQk8U4hef2OIWOOFTSagkKBdp0iwfwnAB9xJxCqPG4p8t4E3BmmY7iaYmCHoU2oxo9Ximr1DRstNGnLQ181/HImLt7vBSYIQVfsWQP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133726; c=relaxed/simple;
	bh=kD4OjK5IZfS9A6GPyAJLu1PbaqUqO0I8HvELgZDj3Zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JeSCEraF5EY1WSu91sVgJ2YMP81/0526+YGOWFQ1jZVVzOmZ8JYWDNE7R+IX4kOnGpPxeenX0Do3u2/ENyZ3eX/NtvwnNKw7rpBPkXoZEl+Kt8eYdJOhUhBjJmegytjvJJI4ZYjUECJP3nl3NRMD0YRNtVzbkd8I3bi1XT6nHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F78f3twD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F78f3twD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F131F000E9;
	Fri,  7 Aug 2026 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786133722;
	bh=kD4OjK5IZfS9A6GPyAJLu1PbaqUqO0I8HvELgZDj3Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F78f3twDuyQrM7IFclcSFUrVY3hMPPCBlzmT2DrKrzS279DBk1ibjV+DU788hAFdD
	 foXGW1HWZMkyf7u2ekRvS8h859TQXwnHu6z+ZEw1YkG8Oyiau6zDsiX79t8kVYyS/W
	 nD+woX2vSR9CaIDCBF7mKtt97mI7QucbgqMXVel0dVPbSilkESmMMtfGdzyQsRdn0H
	 NGqsQLNnlZSPyMSJ2YFKtO6OYf5+U8dy9IOVyT/RK+gh0Y2pqgBsQMtrQYxo1YQBl4
	 WPBnUyvbr+77G5f40gUuhtbFF0mPyKbOgcfUD84eoYKRVQodrTJOFANSPJbiPt9zFQ
	 IuEY/I3n9RS1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (core) Constify PEC device attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260807-sysfs-const-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net>
References: <20260807-sysfs-const-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 20:15:21 +0000
Message-Id: <20260807201522.56F131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Mark the attribute structure as const, as it is never modified.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-sysfs-cons=
t-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net?part=3D1

