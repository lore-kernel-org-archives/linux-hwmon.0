Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468280;
	b=o/Zd5NpfBl857h+NTAFXj8GmiYOw6kX55mU4Lf56Kw26ZOruosovmbHY0WjWBRP7Fz+M
	 pfjwq55AzXh0mYvzQeH97JKyIWBEpvNJs4veyeaWFYwhH/Dl4GqxoNEWtNcauE4ZGLjnB
	 FUoHbDG+UY5RX50BNF4S4DF2aCiWfVn6eY0T7/dpGlqFLle3uw3EoBMKCMn8ToM/VIrsU
	 Mt8gmw66MsACMScCp3IvkFhopeJMkbvZyzZxYY3D1S3bMnotJXjxIgjbOZ9u8sIZwh7LV
	 bRE1aeCaVtKCZ9t/tx91926oHPDQvqFNHXzdPXg273/dXTjQcYZvn/1jGmJSHx3YjRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hGXRiURpnzktJeuCe40zoWYlEFcfh5jLUpLTKF1IqAk=;
	b=0nZDKsR7uJPhugy18Ut14yuCWYk4GKc0yH/kKG9UnRTiUancfftKaMEeF3LUD26j/RgQ
	 I1gdw7CMhH5cloqO1KmIj6SxlgOsmUyHM0ZNv4QLoG7rSYZk48lrKGXaIxuFJBEMOU95K
	 C0Iebizl9zt7UzrMaiSfTsc9OfnTtVOB9c/CJPDssTxvobnRvF556HkFT7MdSQKVg2w1H
	 BOxrxNf7OweaO2c+ZtxMulW2maMt9qG40DicIGrwo0Gv6zBmsB2n5s/QdJuag1IhArkYQ
	 1SQTM+JNEZ1Ebe2D1OjREqXVqxIU/IwhAami8GWB+mNArAJeMUUdQh2ikPpq796eQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pz02frMD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A320606A31E;
	Mon, 23 Nov 2026 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pz02frMD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35921F000C6;
	Mon, 23 Nov 2026 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468280;
	bh=hGXRiURpnzktJeuCe40zoWYlEFcfh5jLUpLTKF1IqAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pz02frMDebY/u73mECnCsWaG2kTANE55sRNobnN6WNRtbpR0Wtqp0bHMG66kCaSh0
	 Cmud8ud1+baTP3MAPIQ6ijGL+sEBNaLV3U9RinRy7clWtzKPA4SZ4zq0K6rwsUZqCL
	 RRNPFgOKaFFKJa0g7WUHH9/K4bysoB4TnfzJItHvN0b4RPsUIppRY7IC2tqYTOsPEy
	 oaPu0hVn4hi3uWCuuPCEroCHvTcFTcUgBAe2JsbexKZGx+NcsD2bfw/79T40cVw7xz
	 PqBAC6ecNMfLyaMpPH1QBA2UJHUwdF9pNG4ZQpP13eS+60RVFgyWS5SqToaArBVEA9
	 MHgb/JcnBT0nQ==
Message-ID: <sashiko-outbox-230064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 00/12] hwmon: Add Qualcomm SPMI BCL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 21:11:19 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 12-patch series:

- Patches 1 and 3-12: no issues found.
- Patch 2 ("hwmon: Add Qualcomm PMIC BCL driver"): 5 potential issues (3
  Medium, 2 Low)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qcom-bcl-h=
wmon-v5-0-747d5383d538@oss.qualcomm.com
