Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73A47DD50;
	Mon,  5 Oct 2026 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204045; cv=none; b=TaV2xfxT+KZgr2dYnqbG/FiwzZosmrLQJPvLOOE3hVk0/6p4s5N959GF4XpMps2OmYkaMaG66+2lIm4OeBbpid0DrQ4e/3WIB6ZgglDWCHiBwGc58meWeNFcEE2hUro35DN9v68lmDx2o25D2oZT/xS+FYH0vdykm9ikP0B/kZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204045; c=relaxed/simple;
	bh=33lrfht0CmO7PWY7sj7KH3qPPz9DeAFcXL2cxN8iap8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ARw9ePYAdPi+Sv85FVHdyKAVvqvng65XHL5rytzfI7ashQACJYkEgHKxjgF+G5gpBvdxESzDNhj2mT2I73PtHIlfhgsod39HXZPDRIl/R2eEF9f6PXIXDutCa0twiEkZ6799R4QkmkFwQaPvQTyR79K0Tv9QddneMTC8Zi0nAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcpXgSMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcpXgSMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9121F000FF;
	Mon,  5 Oct 2026 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204043;
	bh=33lrfht0CmO7PWY7sj7KH3qPPz9DeAFcXL2cxN8iap8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcpXgSMzp5rDi0MNwA9SEodwZLshMTHBP2g2TnHEz3j9wHS5vBQ1Q/gP45sM/ADtk
	 rpY52BnGs9Ron9XswhQZg5hpJR6ZAUWmADQH/WITwShutCoQySnPI+o12VB9nAlTqN
	 26lMRVwIThUrQkOem90L3TCxpX5mVsamFnpZx0otzwdzGIQEph7lOz1U+sKfOdBDRF
	 ve3VayxkIAj3jqpX+lZKjiLhtbMT+JwE4dzQbQvNl/MZ33ZHJGaPHR7uh+Bk/JNX3n
	 f4Bj/y2Y3t0rz1uCrTL0Has2Ymw6jcqnUb7289oDxJc0MBSFhZE3ki3Y7I4F0CQ4T6
	 LRHeYSQWE+zhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:40:43 +0000
Message-Id: <20261005124043.5E9121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D7

