Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEE4D90C5
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452140; cv=none; b=BqCyIW9EgMkTpdaertov1lENECedc/BuaSmO1+Euk6eqzZbqha13kCV18kts3vXgw84oJeq11OoI1EDEaYFH+x9C9/HdsSaYunM9pA8JojhezQ5DLRbfPGpMRB7j9XQ2au25yGQLmmTehdwwkwD1FWwSns75azJ/3ac3QQmhErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452140; c=relaxed/simple;
	bh=EO2RLJnWr1FLjK596NLWDyiuuKYt4fy0c9B42ffcXQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PvGk/Mc6Ui59r5WubxTkgTNB/jpAJOXutzYjqAaqiLPcz751gzxQB2cGaYLUvHaIr2fGkITTvbpFMkrnqJIhc8Bw8C9o8CkYY9kALm7BJY4L5jspQw3uVw+M73u1a4AyOS6Cu/gjsnP6spxxI6dqJox1fSkM0pgD4a6lD3m/iCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAu6kOho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAu6kOho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90121F00A3D;
	Thu,  3 Sep 2026 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452139;
	bh=EO2RLJnWr1FLjK596NLWDyiuuKYt4fy0c9B42ffcXQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAu6kOhoAyB8u380DDGX7z7JIlBN1tKVkJPP98U96ycZbkx8DFXVfUtDmSrhoxeYH
	 +vIkSAd9x99Adw1P/5h++Z1kJSjmIh7SLGA1KnsdiGeRKtkdbCZmKHdCVmT0kZebuk
	 5jBSeujoOmq3/iyoNRZ3QTSQQxB92wZvUtctCJ4ELzhhIGeRf0OpSpITPlIbe2ZUfv
	 YzUMInVuvcOm4ob44oI+PP4ZASjL1RTg8LvOLmRaf5cNhT4UtIkswDnddeU7EHI097
	 SHUSXwN9LbQNmDCSmpfUhmrJhjW83zw2fwoMYYdeRfmGKtnYXkGXZ+X1taTVHB+EMN
	 uObiWrjt9EseQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Ebner" <manuelebnerli@mailbox.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260903161204.735276-2-manuelebnerli@mailbox.org>
References: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:15:38 +0000
Message-Id: <20260903161538.E90121F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add missing ')'.
>=20
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903161204.7352=
76-2-manuelebnerli@mailbox.org?part=3D1

