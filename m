Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBB1FBEA8
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674901; cv=none; b=KQLVxjAS6SYYmdmNgvgAEoWrmyzOS6lk+G2UJSFUSdTJtB8nV2NkseLK7sksibVHOcPJnimTrPgrmyA4wccS01vvqL+KI9LtW9jlcE9RCCUyPEaBvSdyl5/cn8s2hPnDy02/B6i4Pt2SXV2xpaRquVEUGU8HKsSEUmNnYivvpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674901; c=relaxed/simple;
	bh=DMi6AELZF+HAQh9cpiVhmL0nf4k/QOqDzC1L1xcbbzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fpuYZu0Uwwb9JhydQysJ1iY7hjOjzO4X5NcExlYpAcU45F40QVhLKoCEgQh6DfersnsSMXJ6BSSzHaIId5E7UFUTTQ+LeiUo/BgciKGJccw0/gqKfwazJu9RfHouqJfWC+Xp4TQi2NWvJfPOxGvZlBaFGqHsmTXn3nInPNQxMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC2CqvqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC2CqvqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D796B1F000E9;
	Sun,  2 Aug 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785674900;
	bh=UtzLtO/NIlh0xmrRowplWRWxL+ib81LOzKlalrEOtv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZC2CqvqPSRdfLRaIJhhHNa77pTp6vfB8K/N15l2glU2icwr+xHbjkAbp4VV3POeq4
	 bXLZ5zGCwTpV6acFd9AnaY6gNBSqpxJUqVPR8Y1Oi18Q8vaCTGp1LQT+ERWmud0eEg
	 z3qj2YbmUoYtOCFGEb1/52rLz9ViiiBrkf7p5uyaaHMagVAX5HozwPuAQN+d3qJiLS
	 6bvDBZ/nCKLKf8NRLaV7k1Bxo8Bs2hoMJ/1lOOTBBjLMeaOJRV72DWujrIu5XUA1mY
	 IDMgaNDawLD4PX2sXLPAhpKmBzAH5RcN99rAWNM/Jev18LnUrJUoPE4W+9Fq47i/q2
	 TfNF28Q1PfOuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260802123653.19532-1-ali@iusegentoo.com>
References: <20260802123653.19532-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:48:19 +0000
Message-Id: <20260802124819.D796B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared `priv->cmd_buffer` is modified concurrently by process =
context and interrupt/softirq context without synchronization, leading to d=
ata races and hardware state machine corruption.
- [Medium] Missing null termination for USB-provided strings allows an out-=
of-bounds read in debugfs.
--

--- Patch [1]: [PATCH] hwmon: (corsair-psu) serialize debugfs access agains=
t hwmon ---
commit 99da3eb40b38c5c1f4427842c0633cb5ade4ac3c
Author: Ali Ahmet Memis <ali@iusegentoo.com>

hwmon: (corsair-psu) serialize debugfs access against hwmon

This commit adds guard(hwmon_lock)(priv->hwmon_dev) to debugfs read
operations to serialize them against other hwmon subsystem calls. The hwmon
core serializes its own callers, but the debugfs files call
corsairpsu_get_value() directly.

Link: https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roec=
k-us.net/
Link: https://lore.kernel.org/all/agR9YW7hGTJ_l7ms@monster.localdomain/

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58a..24100519cd834 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this sequence lead to data corruption?

Looking at corsairpsu_usb_cmd(), the completion is reinitialized before
the command is transmitted:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ...
	reinit_completion(&priv->wait_completion);

	ret =3D hid_hw_output_report(priv->hdev, priv->cmd_buffer, CMD_BUFFER_SIZE=
);
    ...
}

If a delayed or spurious HID report arrives during this window,
corsairpsu_raw_event() will see completion_done() as false:

drivers/hwmon/corsair-psu.c:corsairpsu_raw_event() {
    ...
	if (completion_done(&priv->wait_completion))
		return 0;

	memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
	complete(&priv->wait_completion);
    ...
}

Will this asynchronous overwrite corrupt the shared cmd_buffer while it is
being transmitted via hid_hw_output_report(), and cause the driver to proce=
ss
a delayed reply as the answer to the new command?

[Severity: Medium]
This is a pre-existing issue, but does this copy guarantee null termination
for string fields?

When populating string fields like priv->vendor, 24 bytes (REPLY_SIZE) are
copied directly from the USB response:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ...
	if (data)
		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);

	return 0;
}

If a non-compliant or malicious USB device provides exactly 24 non-null
characters, there won't be a null terminator.

When the debugfs file is read later, could this result in an out-of-bounds
read that leaks adjacent kernel memory to userspace?

drivers/hwmon/corsair-psu.c:vendor_show() {
    ...
	seq_printf(seqf, "%s\n", priv->vendor);

	return 0;
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802123653.1953=
2-1-ali@iusegentoo.com?part=3D1
