Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446544BAA0E
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184929; cv=none; b=bfpwosK7lxanAOCP8Vw60xvA8PyH0lOi6G3/zFkwQPWIAve1YwlLWeXhrF9FkjeJR19m1QEiPdr3XV/v1tHTDtrbHRBAk3W7RqHKjKeqt4QLGVzuS/gfSqWnV4QZaKgRcHoipMRJhi3RNLJucHpOQrJfsNJbt0FtWidVMB5q+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184929; c=relaxed/simple;
	bh=wY8w3iwhf0YDr8qK7N6uXPsFFzBjiWtCPhtDSZQhO0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QsIg3YVVBBi5WeHH9Qt15sR3rne3c2r8S9OKhwQVuCLydRXFyx512zcRGbHfPqPxDXUN0/6IL0ph451hBq4YJi/ajabRW0xOp6cK8x+EB5PJenC9S3gqHuo6MTEtjMCE6gO/wPU63RO90XlqeWtaRw4sAE+mT52em6M7WVSsvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqvRPlvs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqvRPlvs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3551F00A3D;
	Mon, 31 Aug 2026 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184926;
	bh=wY8w3iwhf0YDr8qK7N6uXPsFFzBjiWtCPhtDSZQhO0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqvRPlvsxhLJeXB8+2MjBZmWxJZalv6PlRLJ8DlGvI2P9btH/w5FO3exFwz6GRMSm
	 m+7hazmaz/93wm3EvCVLfuEP6inanHmwT+2+6ae1dkAMk2vAaUxAdjHpGONsQ/fG6v
	 eKMB4DbH2ZLVxoeVHqX4ObJBtzLG9RHcLmLsYtOAj45X1/VfVCCJENYOjv6+aWgYrF
	 yWgIxWdInVHUgRqjzOENnnH9ROgObh/5VP7+qHAemFo7dOHp/x6yqt/F9s5Q5gWpa3
	 C3zbxeEyR9G6M/aaKQ6jtWu0jsHXG/Lrpyl8z/KYYeOImgS2Ado3KH3Svr8eCZpyPX
	 IGtqweVFrDkYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] hwmon: (dell-smm) Add Dell Latitude
 7530 to fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-66-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-66-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:02:06 +0000
Message-Id: <20260831140206.8C3551F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Armin Wolf <W_Armin@gmx.de>
>=20
> [ Upstream commit 5a1aba28f6c79f4bbb7a5361063225030ecd36f3 ]
>=20
> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
>=20
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Link: https://lore.kernel.org/r/20260610180141.311503-1-W_Armin@gmx.de
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-66-sashal@kernel.org?part=3D1

