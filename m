Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5437AA83
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898712; cv=none; b=B0yJM/z5oIyBaTP9qGOa3JGLkLrnXK/lRII0x/fABjWuwitOdJkZ+KLJ7rdaaOIBYVad23wMt3ftGAEPwTbPNbsY1MWhuMSm05Qf69EioR0yXlhgU3RMN+WA9O4lpYSdBmHBVsadmmxGCazO+LJmr/mw+W6F/fFbzi9CCsN8jxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898712; c=relaxed/simple;
	bh=h8+SAwEYrFn9Ethz3oBwAYbt03cOWmvT6nOZ63jESVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ihclFT9t2LLxfuDzoFskMcJgY39bTSEsqkc3rVyF9o4PaAzPXX6xb2ToR3mlTN5zmdf95ZVr2E5WoRxzuJebqzqrRfkGBI2R5Z0/zsxYrP4O/+0r3bP0EZ/RkZhAkQCUIBqlyx5UNErQgnyIv9z0Q8Of6CbygM0jGQZELJW/gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcq8mJlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcq8mJlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C62B1F000E9;
	Fri, 28 Aug 2026 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787898710;
	bh=SzKKgNejd9LhS5CzCk7YQQBxqfDz474O0WX3EdKAhf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hcq8mJlzaaMWrs+JsrJdiye8FLpG8GC43WPyXkEAq4z97U6RJOVijnPfOsQbV1iLP
	 TrNY7ydeMZ8QnD1U9qUtgAefF8vk35JtOr6ebMy4AeHUBvC9dgkxdXkW7BjVK9Wepy
	 /CuXsWH+BrnwWW+td6cmvRPswnVNCPeUbEUS/BewvlC5dksgDuZEUmQ6G8A9bCL9RN
	 sNLPpOhxCtzsDySoV9P5uY8O6FHCIK2KvjOicI31vOHaNyiPprQ90NE/YiOG9Xj/++
	 732ufZtliJpf4kpGlz+qMi1ZwY1dwskmopiE7lXmExDpOsVIvaZOqBv1qJ4ttWoaKG
	 Y5Ya9mn+5gQfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260828061949.3151191-1-lilinmao@kylinos.cn>
References: <20260828061949.3151191-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:31:50 +0000
Message-Id: <20260828063150.6C62B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Late USB responses to timed-out commands complete newly initialize=
d completions, causing subsequent commands to read stale data.
--

commit d32f451c210791b2b9c123593fe5a6e2e781620f
Author: Linmao Li <lilinmao@kylinos.cn>

hwmon: (corsair-cpro) Remove debugfs entries when probe fails

This commit fixes a use-after-free issue in the corsair-cpro driver. It
ensures that debugfs entries are properly removed if hwmon device
registration fails during probe, preventing dangling pointers when the
debugfs files are later accessed.

Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smt=
p.kernel.org/

> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 8354a002f4c5e..30fe5d8e724c6 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -638,11 +638,13 @@ static int ccp_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
>  							 ccp, &ccp_chip_info, NULL);
>  	if (IS_ERR(ccp->hwmon_dev)) {
>  		ret =3D PTR_ERR(ccp->hwmon_dev);
> -		goto out_hw_close;
> +		goto out_debugfs_remove;
>  	}
> =20
>  	return 0;
> =20
> +out_debugfs_remove:
> +	debugfs_remove_recursive(ccp->debugfs);
>  out_hw_close:
>  	hid_hw_close(hdev);
>  	hid_device_io_stop(hdev);

[Severity: High]
This is a pre-existing issue, but while reviewing the driver I noticed a
potential synchronization problem between commands and responses.

Can late USB responses to timed-out commands complete newly initialized
completions, causing subsequent commands to read stale data?

For example, when a command is sent:

drivers/hwmon/corsair-cpro.c:send_usb_cmd() {
	...
	spin_lock_bh(&ccp->wait_input_report_lock);
	reinit_completion(&ccp->wait_input_report);
	spin_unlock_bh(&ccp->wait_input_report_lock);
	...
}

And when a response arrives:

drivers/hwmon/corsair-cpro.c:ccp_raw_event() {
	...
	spin_lock(&ccp->wait_input_report_lock);
	if (!completion_done(&ccp->wait_input_report)) {
		memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
		ccp->buffer_recv_size =3D size;
		complete_all(&ccp->wait_input_report);
	}
	spin_unlock(&ccp->wait_input_report_lock);
	...
}

If a USB command is sent but the device is slow, the completion wait
might time out. If a subsequent command is then sent, reinit_completion()
is called. This opens a window where a late response from the first
command will be accepted.

Because the protocol lacks sequence IDs, the late response would complete
the newly initialized wait and copy its stale data to ccp->buffer. The new
command would then immediately read this stale data. This could lead to
permanent desynchronization of the command/response queue, resulting in
incorrect sensor readings (such as reading the wrong channel's temperature
or returning garbage data).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828061949.3151=
191-1-lilinmao@kylinos.cn?part=3D1
