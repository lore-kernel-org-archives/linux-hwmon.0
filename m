Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC5389116
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785960343; cv=none; b=KbiqBXePZsCVJHU11p30PWOJxnnZ5pfihYmbuPOxAVqildtEiU5/fZGkuQPqOQ+r/IT/jTzO9d8wPGuRZ5v4emtMjtk7A6m8QgpyUdb/Z7DysFbxwb+oen7cjl/pbqWTxnZb7jmZfmF2erVpxqJuSC30MRRgUZqZVIYdLSPulrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785960343; c=relaxed/simple;
	bh=QLBb9yShHOfL0wI1DwpvImR0Xnk0CTtxaPsKmoXnQVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CyyVHkPl33lJuGJY73ply/oN5PKmhMzGgtPtpDHc0bbTtDvYhD8IWC3NJ9tSwtLLIC2DMH6jzXYkoDMvIDJOGwbr7qObr+qcBTIPiFZKLZ64UHvBGCc3OHzOi6ZaXKgi5lIufLUqDvFYoAecxMXllFWxHBHwqQsBu98SRl/sWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGCoVL2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGCoVL2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436221F000E9;
	Wed,  5 Aug 2026 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785960342;
	bh=QLBb9yShHOfL0wI1DwpvImR0Xnk0CTtxaPsKmoXnQVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGCoVL2iyrGN52ZntTw114T6Qc+2ltqghkUAZRYkFILdEFQw5yr7Mi7sKYvvf8rjS
	 EC4xB5AxD4LE9USehrYz+lz9HKEYIIzoa1ZEQSux9lshdxcZ2DXdFYirNoqVbOcsyo
	 DoOZhC29C2MVfnlzTNx2rE0uJZ3l1rpnEgvvVF+yRGVV7H5/MpWnQ6PebSMzeoFTn/
	 hcX9OncL5oloRBD66BvaZWDh8y1HX+qhLj1sA2+OoCM6uwy6OpH5Tfq5cbsNy27ojf
	 vvrWUl4KypKY2OzTsUhqTi0qUsIAt5+guoTLGv75zjJN3vTCpWyK25tx1zBymZuFuO
	 /Gd2lZlF5LMtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (core) Use const APIs for the dynamically
 allocated sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-2-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
 <20260805-sysfs-const-attr-hwmon-v1-2-4c0cb2b290a1@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:05:41 +0000
Message-Id: <20260805200542.436221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The non-const sysfs attribute APIs are going to go away at some point.
>=20
> Switch to the const variants to prepare for that.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-sysfs-cons=
t-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net?part=3D2

