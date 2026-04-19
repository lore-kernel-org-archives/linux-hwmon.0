Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF4148850
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776624084; cv=none; b=XmaDvBYK0uLbe9qTqRxYgdTW7OyrCP83pMlUXSfVylLxfL87r4GsaKmjbXHsbn9IqpvDqpkGekNt0f5Ff5PRXQ4XTFaNfga/aGb/pDc3zyLLMBuhrXtJ4KmJOShqr0hVjrkjJAZM5Aaj9IdsYUqEbCrwQ7yn3uVNLukBN104n1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776624084; c=relaxed/simple;
	bh=3VfefR1RpKDup9/TK64eEO31dKUTs6r/iAcGoRYngVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KJjceTbIxZcOmG1OZeVzNUQkEGZ08JUCBdQ1O5u5BVuzuXfMjkweyfFRqw+szyWsc3TE6UrAqvZOKzO0QYg/Ru+DwNj0jwwFffRpA/IIYpj4v0OQnS5az20mIL6kE02EbvymBFVP5uAUmi9E+oGwJ8n96kYFErsm1TeqP5VsH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWF+9Ypt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWF+9Ypt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF87C2BCAF;
	Sun, 19 Apr 2026 18:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776624084;
	bh=3VfefR1RpKDup9/TK64eEO31dKUTs6r/iAcGoRYngVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZWF+9YptJiGtO3vxq5SfPICe1fe9foX3BfLfDhQOKeHTA33yjNLSB0nw3hi7JT9aT
	 s7deF8a6X3VGYAxZoq1n6pHzBZjnqvTWgwL/lzMRwbEp0XQ0jBTNjZs0BWL7+wGapQ
	 7avvQNjf9SuYBUFqHHjNoi15tjx3yytKlbPb78QIkp/6Hn8gzkzLzns/arNU4LUeS2
	 nl4mLJtN/ZRvbXrcNGzzhMrpU/nu/CSl1mhCVxV9fT+1KidU2aWJco5QqQWcvgkL35
	 iEMKcKiDbg0LbhJrFeJjf7sLZWfdFjx9tpchv+5GaVzoxuABmykWTPS1Opu+Wr856Q
	 BitLShRSbETiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/14] thermal/core: Remove node pointer parameter
 parameter when registering a tz
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-6-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-6-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:41:23 +0000
Message-Id: <20260419184123.CAF87C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [Medium] Commit subject incorrectly states the patch modifies a thermal z=
one registration function
- [Low] Obsolete kernel-doc comment after parameter removal
--

commit 2fc21aeabe9b7d0fc7c089083c8917e91802ab1b
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/core: Remove node pointer parameter parameter when registering a tz

This commit removes the device_node pointer parameter from the core thermal
cooling device registration function, since OF variants are now available.

> thermal/core: Remove node pointer parameter parameter when registering a =
tz

This isn't a bug, but there's a typo (parameter parameter) in the subject
line.

Additionally, does the subject incorrectly describe the changes? It mentions
registering a tz (thermal zone), but the function being modified is
__thermal_cooling_device_register, which registers a cooling device.

> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 26231acea3829..2f5d214d51a10 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1042,7 +1042,6 @@ void thermal_cooling_device_init_complete(struct th=
ermal_cooling_device *cdev)
> =20
>  /**
>   * __thermal_cooling_device_register() - register a new thermal cooling =
device
> - * @np:		a pointer to a device tree node.
>   * @type:	the thermal cooling device type.
>   * @devdata:	device private data.
>   * @ops:	standard thermal cooling devices callbacks.

Does this code leave an obsolete description in the kernel-doc?

Since the device tree node pointer parameter is being removed, the paragraph
explaining it further down in the comment block seems stale:

drivers/thermal/thermal_core.c:__thermal_cooling_device_register() {
...
 * This interface function adds a new thermal cooling device (fan/processor=
/...)
 * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind i=
tself
 * to all the thermal zone devices registered at the same time.
 * It also gives the opportunity to link the cooling device to a device tree
 * node, so that it can be bound to a thermal zone created out of device tr=
ee.
 *
 * Return: a pointer to the created struct thermal_cooling_device or an
...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D5
