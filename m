Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A732B105
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132178; cv=none; b=SegbFvzLNKl8wchA8TeHixm6bMwb9vLExrwdm1RvAsFcRg0vsujTzdrVeaTLmJbmHYcT64FIxJ9Lp9xJtkARNgljLtbo3ht1ExjKY3BVaThrxXGeRpBwE9J2IuXrwBbor/f36afwuRJfpcejCgE+KWJQRZJpFH4UwQHKp9+2nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132178; c=relaxed/simple;
	bh=lQJ+HyZ5VlpwQz+W5f8tp7Wck8CRrcuiZ2HiXDnlXbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FsjpTtiro5hk7sSEw5M/djvtCEP/b8WBnRkH519NnqhjVkRSVn5KFp+VY/uxcvUfGrZMe3/UfR4Yu59gfi2TVQfhtfe8Epab0grFHPOAtlI/epOGLqEI/yB/u25D1LVvQTPPdpq4w/0slX1MMYuxvY8S4O06Uwx9TgS6CWQ25pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRt/XaCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRt/XaCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666261F000FF;
	Wed, 23 Sep 2026 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132176;
	bh=lQJ+HyZ5VlpwQz+W5f8tp7Wck8CRrcuiZ2HiXDnlXbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRt/XaCCugr7XQeQKJQjhukiAuAKPo/+X3OWq1KqIoJ/dDJOlCNgELh5dtZwjWdTq
	 8DdJjwVumnhCC/8Wlo1z7ywnd1xpS76vaneT+wfAVNbQkpfJfjyX/E7NxH7zIqd/Ig
	 Q53AjsJ//xDlm8t/OlubbfGsnbRcxD5Yc87q8gcT9RAsO6WxvW6Kq6Lgtih6drBXjZ
	 D1L8f1ALaf7Ztnd+nHDa7gDxGCl+bmCY3WiejMFIugIvPtBfvQGZLW3VJ4BBQZcfay
	 HqGcoz6o0Rh8t2RFGiZzQDEGcRdLGFzm6O+KVrPqZsQSSM8pvV9j1MFq0n4Kq931gV
	 70vRvlsY3Vtiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: pmbus: ibm-cffps: avoid format truncation
 warnings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Zateev" <hackerowskiy@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260923024827.56445-1-hackerowskiy@gmail.com>
References: <20260923024827.56445-1-hackerowskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 02:56:16 +0000
Message-Id: <20260923025616.666261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Building with W=3D1 reports format truncation warnings when formatting
> the firmware version values for debugfs.
>=20
> The SMBus helpers return the byte and word values as int, so the
> compiler cannot infer that the formatted values fit into the small
> temporary buffers. Cast the values to u8 and u16 before formatting
> them.
>=20
> This avoids the -Wformat-truncation warnings while keeping the existing
> output format unchanged.
>=20
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923024827.5644=
5-1-hackerowskiy@gmail.com?part=3D1

