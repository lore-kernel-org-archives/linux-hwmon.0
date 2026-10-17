Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94731F30BB
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792270469; cv=none; b=NYykYcBVtjtF++ZYMJI4LJYKA9pAqqQGpwaVlLHmEDukrNJ3/lNLA2XUPmr7jw3xuhninzYLrb6eNHC9brApK5OFESzA8SsDodVkt7qNhJCHKZB46l3G0QR3T/8oXCF6qQ3214exPHjAJtVpOwwDJs98277QysjSm6ZI9sr9FSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792270469; c=relaxed/simple;
	bh=2hKk54ma5yojIpIx3+ug6wm3A0Ay5PHr8vx0Awj/25Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PTFSt577GTLCC1hieo+3Pgso+UQToT7oFrPDd9K5bHgi8vK7GvvI3H8lSVPqpGdnp1P9K1si0jDkH+0gmXW/sYEydS35HBsf+0hnzHuz97Sb6mvgAZANk2RDAVjw4U1joJhCd3KzZo+M0zG+AGkAF1wqvjR6Ktv8Bgt4GbkTSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9s1CHB7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9s1CHB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F4F1F000C4;
	Sat, 17 Oct 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792270468;
	bh=2hKk54ma5yojIpIx3+ug6wm3A0Ay5PHr8vx0Awj/25Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9s1CHB7zE+dvCMhkmFL3RbzWhDI6ivMZmytNXFGVskAv2V9srjiuqTzaeMdoAIsa
	 TlYc+FmaFodoB6KramB1BYEvb+q3osOiLXxe1K9SN0+uZdbJgUgW4/PFF31S0hPYCv
	 pDtQGBoBR5FPhmMLpewUtUTXBLQKrxoXTp19yypyk7QGRbdR67Bsdjq2gf0LdQFEgg
	 qv9QtnHOCTVzsYk6c2rWLKi33QN0Nr3NQmw0YncZnKh+EtlS5S4PJxTQMSS8apJX8Q
	 XdjwWexdoDk/Decz3TJUCHrqJT5zvDsZ8g4IWjKQg0i9rbCsZS3E+zRMGmBUjGcs5a
	 3nL9AtN2ARhEw==
Message-ID: <sashiko-outbox-175819@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht4x) Reject incomplete heater command
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261017205234.1084949-1-pocj8ur4in@gmail.com>
References: <20261017205234.1084949-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 20:54:27 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> heater_enable_store() treats a zero return from i2c_master_send() as
> success. It updates the heater state and returns count, so another
> attempt to enable the heater fails with -EBUSY.
>=20
> i2c-virtio can return zero when the first message fails. Require
> SHT4X_CMD_LEN before updating the heater state, as sht4x_probe()
> already does for the reset command.
>=20
> Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017205234.1084=
949-1-pocj8ur4in@gmail.com?part=3D1

