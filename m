Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261B1A267
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781942153; cv=none; b=M2Vca7y3Si9WSGIV71BghWj4jtjgrVas6UEj/JP9NuCUfCjXoNq2sySbexwxvMS5CqrIwPfPKcep5438u+HeTUPDc8H+9z2cXReSm5iFUALR1MmjN0Hnhe9/gHp8QpHvptd4foXNB9t3EnE1zUx6+rhJ4f8bIhQiGgyjLhzgaVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781942153; c=relaxed/simple;
	bh=2Rsilpwk6KHwVtLI9Zu3QvzDBwqLkrR7IZ54Axg22S8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I1WgRT9tqNo3XfPUyjGNW8G8uZtFKb8JHz1zIXqXNESexcdROOam3BH8Q+O0HpyNmD9eXHZl8lrCGEw5wYJ77HA2OjxBb7eusxdxUsNdvQ3XIdvtEMOfL5POarVoWYhhp2Kl5ra9IyDu2Lu4wcbIJYlN36KYPZhJ71XNFgI0uOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyVtxrNE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyVtxrNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46B71F000E9;
	Sat, 20 Jun 2026 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781942152;
	bh=2Rsilpwk6KHwVtLI9Zu3QvzDBwqLkrR7IZ54Axg22S8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QyVtxrNENus2oWaqrwdn1Qj6HU3usXOTI5GxmuR7zdj1/Usvn0uvq2tJSv+G0I08X
	 XQCQvBr+aZvvGyd1YAAzOjMgOTbiWFw3i7SjixQP7tGZKQMxRtpuajh621cyefjr2B
	 gYayaYcUiM7JruJtQSYV9W1dK4rSscc7I18bc6AD+cYRH34L8ufJzapGxSHPZYo+EJ
	 NY6hAIOVzVdlaUS3/3dX0/Vqe1R1KZftM3u3jtMcT1UOq81DiklGcn4xDlwIoaMOKA
	 ubcGOod+18ilxV4mKdDQ0rAepewa5XN1SYwleipDV146qPxGC7JdOUSrK1SfU1oWRy
	 w3+xfuS5K50lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) honor vrm_version in
 pmbus_data2reg_vid()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
References: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 07:55:51 +0000
Message-Id: <20260620075551.E46B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> pmbus_data2reg_vid() hardcoded the VR11 encoding regardless of the
> vrm_version configured by the driver, while pmbus_reg2data_vid()
> already switched on it. Any driver that selects a non-VR11 VID mode
> and exposes a regulator (or hwmon vout setter) sent dangerously
> wrong codes to PMBUS_VOUT_COMMAND -- e.g. an nvidia195mv part asked
> for 200 mV got the VR11 clamp to 500 mV encoded as 0xB2, which the
> chip interprets as 1080 mV.
>=20
> Mirror pmbus_reg2data_vid() so writes round-trip with reads.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620-pmbus-data=
2reg-vid-v1-1-5518030432c4@nexthop.ai?part=3D1

