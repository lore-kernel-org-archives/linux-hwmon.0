Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B553C342F;
	Tue, 22 Sep 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069908; cv=none; b=qoPFdcmo0Q1sB3UzcZnhhwql0jG7CYIi7RpyiDF3RtKcaImDiGoSFspxQMtDG0SiGojhuuLIm/FX3vVbsjOLSmJ+uIGrkNONd0K00RQLso3pB6NBvyZdosyDryJx7m8Dq6zPIpLhAkJGh+Hq+nH61nQxaCu9c+qlbiHjH+HovNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069908; c=relaxed/simple;
	bh=RCM/mjbAfk/jiF6/kXxZqm9dR6us4X5d6rjjtZZ5oCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iAVJSpZTDzy8CmpZsbYTpTSaDfFArwAVukhKVdLx5dTN+jVmKSn237Grsj7pRyLNKWRbBXJK8zczT0/0ZgHh0iyceq3VJ8YEwddWeheP08PP/M9RmonQfwDOnunKFHHOjz1tyFrd+Kuu3+Ud0ziUTESBj9f2vQ5jkQljnMdC9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht05+LYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht05+LYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1791F000FF;
	Tue, 22 Sep 2026 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069907;
	bh=RCM/mjbAfk/jiF6/kXxZqm9dR6us4X5d6rjjtZZ5oCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ht05+LYq9Jtbs7pgY135h5vHwfAy1zfg+miLyXtXypdf+gNHQLYkbrjMqOd/fa4qz
	 c/xDDPruZOVW7F3fYH9iy7EuIzg0hXvwaDA4pWjQkHSTGQcBIOf35UojmbYpbptkoE
	 SJvAtu+vZhZPVVuBCPrwHgO5Xv4nXHk1Nn1xUTn6Gcwki/K0s2YR1cStyY2gV63q06
	 Zd2eR5R/LhF+mtG4JnKGc3N+lM26xDEVp6Bu5FB0f8aLPLxVR9Wu/nM0YMUDCD+dnP
	 khpW8T0fNIa8SNjJpecckHSpaoCT02+zQZnXCExknDgIHWluE77B+tbmi7bG9gJ97U
	 ZHORpCjHfYeZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:38:26 +0000
Message-Id: <20260922093827.2B1791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
>=20
> Describe it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-topic-asus=
_ec-v2-0-0bd923d1b853@oss.qualcomm.com?part=3D3

