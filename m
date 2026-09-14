Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F73F20ED
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372317; cv=none; b=otCbVCLq/JOCw42XFRwCnNn1x3KfOa33fJ0YTzHrd/Nj576po+0GwicyvQseJwyaew6in4cRfE912agdyLMPUwu6mXDg33gvjgiYxlk2lHI6YCAT6dfO+GTVLyQGWfBRdyebrtjlWRZifR+e9Zd62KpCIbAUE8PGHX+uWAKLX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372317; c=relaxed/simple;
	bh=XnWsGXeOIen70I36vOJk+cy0sGrIhIjtabOX8+xzptk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PKNxtjIIoCspB1h06WSq4VFr44+BJA5l5Xr4ZKvvhgU6VRMxhRLoryS1CI38k/eC5HEb8sVYjBZTVGp6i+2kwIwgqot7iSCNrVJNhoYUJLguHDkZCJ/dwvdghDY/5m/PcehtRYBvBIk6gXIjnDDv0X2tkAhaHz7crJWERcuGC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpgOOdUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpgOOdUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B0A1F000FF;
	Mon, 14 Sep 2026 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372315;
	bh=XnWsGXeOIen70I36vOJk+cy0sGrIhIjtabOX8+xzptk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpgOOdUUU+LSOmvSoWhyZst8xjDT2F2jSu/eEVmEG5Vh2CkIoLgU8ZIgbsBsaQVKR
	 YXznmC8scDRLv7qmNLlHRIURuLTlGSXmbJFbRpiDMWwukzcshokn1dQylIRUWAw0Y2
	 q/qPwh5cbQ1rIPcazqjMdzyCYS8fWZGSTJA5iacyQ5lh/SSgbZpLDSZYEnNKHePsyK
	 tTqfyTbdlgXv2QHdvFUXiO7milW/9tmDhjqcPDS7XOY9UP/iEtY7cC4SiQfO2+xuOO
	 5ouyJXJEFi8XexZsOvIOa3AxRvcjYGtmbf3sMJK6PdpmTkWPO7puGZJ/PLdlayO5Jc
	 5V/erOp5wr9sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Add support for ADPM12300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
References: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:51:55 +0000
Message-Id: <20260914075155.B9B0A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 3000W. Uses PMBus.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-dev_adpm12=
300-v1-1-15fc8143d457@analog.com?part=3D1

