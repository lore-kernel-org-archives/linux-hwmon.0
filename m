Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B4479877
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522302; cv=none; b=oiLPywoDMKVXRHtHYoTQNgKyhd9poEROjzTzmx5/Zy6HZsxXEQpDtkApPOTGj2rPPiF3gxvyBLYLEelPEBiiI7ZBCPDs8c2QNAZNrCn14Ix3LLGbxWYdtHvHrCc7yO1kU7JDl+IgTY4+MGrqZd9xapwAi9b6Vf6Yar3nXwDLY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522302; c=relaxed/simple;
	bh=GvLsNH+Cc4jh0iO5qgv/z9TU9BZMymH3KmXxzHUOICA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cf2qvZES28n4Avvpe2tnoGYvvTNTFA8+RF5wA453f49jhn/yhibujJgdne2zoFpvxna2F9B+rarVDdK/zy6+3pql7y2/dmfZXOxuQD80c/yX7Mb4fR0J+o7EkD7L9K4QuImug9tW0N1LxheO+PO1CtburYRLmfJL4b7jAzee2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUh5Ubyl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUh5Ubyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27861F00A3E;
	Fri,  4 Sep 2026 11:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788522301;
	bh=zpdOXnUqXIEWzUx8N4vJCyU5KBtEtUu3J3VcCk4Nxuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUh5UbylKjG5856eRUXtE1jOBW+SoyAMUeLKNY/MD83LdwwdTgsUmgigDcnNAGIou
	 9czH/SFhyZB07QdUgxd/NHx3/WkjLUfv++9zzfjBP7f1cReLo7YHCWpg5Tfb4rM1iq
	 eRkeb3Q4ZrhdWKx9lfd12f5z4ZuarDFAHv7K0xUwZzQnVE/Iu/thnurlLVUw/7mcYi
	 tz9KC0E5FXcNVdCSxbaRSU5L40ajFSLvQipZRN9bihU+fyckY+JoxEkCrjW4KwAgRK
	 L2nLiYbdnle74WajvFL6Wg+NhDN2mEK9lF1xTnMZs5seiTqnLDkXnl20UNuJrMbExe
	 fdtem5HFL/x3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260904114249.26515-1-hemanth.selam@gmail.com>
References: <20260904114249.26515-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 11:45:00 +0000
Message-Id: <20260904114500.E27861F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904114249.2651=
5-1-hemanth.selam@gmail.com?part=3D1

