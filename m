Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624246;
	b=j8UgH0l4nMMCTG7Iw7kqGlH+NtiE6a5scGtCkb27veKMjVAGfwPxSQsvUBFgUsfnoRjI
	 3CCWzR1mr+o+IZKhCdDEk2jyHpJOuVeu0u85D4gF/ap/DKMFCUOlqliIKZ0ZFCEHQg2P/
	 mLYNNi8Lg02HxV3gNfg9l1VOlx6xeSiweLwf9l4PM9iUCx4Q2fWkAxs73KI2Z2GOPtEPh
	 kN2FZ1haLI+i9gNUnDauyjkJ1BGyso35/HbSbbExruI5mEt4YN+yEVP8Ux3iOYKVLPaW7
	 NTDkrjhZ9Nk/gEpN+TWL1BmN1wNx+3xHoaUyC3IEfgtAtnExVtg3En0BVcdolrn02Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L17xWJ9n7X39+oXcBElJYokWuLQDlzO3Mc0D/GetuOo=;
	b=JjwU02BtdOzvC2W0XSXLhttz8PwmtFrwCTtuMe5+0W44IoSCh8GY/o5ISuLQDKElmyv8
	 i2h8QHUG82YlK9zikyI/TqCr631q82OeU33705dSJ85FgKkfXiDxjXWGYibOz+/zoj89v
	 KiIDR3pOEgz872PA1y+wb1CLMYTN0TEcREP8Cbrh7JLMfKk2gFGEuXlmE9f6MnrDxh+FE
	 kLbDfv1Z2jagNThqmEUr1eiTOp1ddyRvaWHiolBrxmLviu7mDrtRcs4+25b2ehiulTzHJ
	 fEDXs4tmsAPncsMrOnayWFCKOrXcFqWT3Sfc/CsGevoWJyKEAoBMcJhyJJ5VqTFNazA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BUT8u/HX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8720B606A327
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUT8u/HX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9FF1F000CA;
	Wed, 25 Nov 2026 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795624246;
	bh=L17xWJ9n7X39+oXcBElJYokWuLQDlzO3Mc0D/GetuOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUT8u/HXblwx8nqn5cOO/+lRYGJRqyAbk08r7himrkSKXQhq9gbHDs+C4vWsn6QpG
	 Rx5gxYkrly06jN226qPT8O5Y7/4PWdwAvvMVkIqdmsQkeeNmJIPNOP01MbSizE49Oc
	 eoXakKLo9lzMyic2GGH8oDkJQ7gVEWT8wLsS/ZudFCacTOvTofrfwQK3/0XPX++O6c
	 yW/LzhCxtaxug5dcVIbTzKPYm6126GSVYwKSqYkmq/U5+/hoKLpoi6QNMeZtYyo5Mn
	 46qbtfGcMgJKAelJcuphUrS/i7XzodpuL1qJnTZAcFnC4tO32Fp5AoaJP2vuTay/oS
	 XX3jrl2I3M7Wg==
Message-ID: <sashiko-outbox-233753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 0/3] Add RP1 PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:30:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125162453.2357=
3-1-andrea.porta@suse.com
