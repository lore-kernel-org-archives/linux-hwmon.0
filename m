Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D5394E91
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 06:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714341; cv=none; b=Q6LQOR36wSnKWD8pvjRewQs7z1W0l9FTtWPFz4mw2Pjisww3yautPTNHlWbDPAdvx/Q1xEQ5B5un8sqWy84u8iiGRzxF0Q8kGWCq40HeVJ4GwmQkj+VdU6Z1QS5Hdbz3JenblDL9P7G9YhsKV2sSlllL0Fiyh2vTovYRe5Pflq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714341; c=relaxed/simple;
	bh=ZFD6+fcLzWmNTia1hkgqM3jV7PtNNrAJ3z5rRboaEH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NR5/VJ1cdcBmySnIHGtIy0LHpLGRJTrUg68zUKWwqMmAfVTm97RFJ7he1kMbmfSJrFJEyOy14kVAfl0oRzgPeERkwQd+YNLN+MGTMQTI1ty69obyMinqAM7I4l6azR0h9FhsAlrN4Yv6iruPz/fUu2BvR2skWLvIpAb0NSOPvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FE71F000E9;
	Mon, 29 Jun 2026 06:25:39 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 29/32] hwmon: Stop using 32-bit MSR interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Juergen Gross" <jgross@suse.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629060526.3638272-30-jgross@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-30-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 06:25:38 +0000
Message-Id: <20260629062539.B5FE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The 32-bit MSR interface rdmsr() is planned to be removed. Use the
> related 64-bit variant instead.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629060526.3638=
272-1-jgross@suse.com?part=3D29

