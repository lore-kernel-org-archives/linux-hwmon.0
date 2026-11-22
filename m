Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367796;
	b=Bp741aBG396DKHm9rqyDdAh9cPpqeqC1i2rokbRkZKB8yoFZj3eEeoYkHd353oMCDz3f
	 w3puT8QAM6relKkkM0Vp7sJxwMOz6l/d5HPjMHZydnMwyVtgmXOjsfN/6ZJS16AaDm3aC
	 qLhhmNsZGLwJH8SaoBVB0C0Wads27XZhE8+1Y9GPn3mp4KRzAR6lAsQJawU/9tsYqgmj6
	 cEHTMVvG9fbpQffMEdk8Z4H6ldlna7gGNKt9D3nBqtbD2pelHZ/IDVXotHFgCc/16gnhA
	 2+C7Tfs8AVjuFI+AHfHY5ZhkQNkDVbQH4aW9vMGDH7l+UL1IxfQao5HbS8zLEFSUuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oMD92u/C1bWsq9wh8D9YjBwKugbp5ZzvFsSNM887Sv0=;
	b=4BosbUntE65JZx9p+/xVK0dek0pRs+X63RxnHYULt+972WGxqMAg84omPm/xm0RwrG9c
	 yBajkT9JxlDb7Et2QAQTRAuC6CGuF3JzQ7rNCphKpErBIHBm54RIaWtHI1/4SEo8gDhp3
	 NrCudE6TAWr2DEgDj7ZgfBEBHV7fo/oEFIq+740yONFIo7g6dJCgbbhsQG8YpTO2OGMKT
	 W2TzoM6er6HZz0ZVeDk0CaQjD/5dmIveuqZqBpvDH0boE11/at5929/AkNdD6RHyUF9Hh
	 ZNaC1QqMh6ZeREK+LXI77s3tLs9Y1oCawwOFZVVbp/NihN+OOcEqccVwqn5fe1F3DYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmuOSmX7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6A606A336
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmuOSmX7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FD41F000CA;
	Sun, 22 Nov 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367795;
	bh=oMD92u/C1bWsq9wh8D9YjBwKugbp5ZzvFsSNM887Sv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmuOSmX7799OsFqNKhn0yzpZkGx7j4g//RQm3q8VTi3LvQq+rbuco1qPnJEf8RuDo
	 PFPHAPeJ55uz6kAL1YLTkaNe15qRW7utiH+Q3k3EMCa5EAKItxF7IkW79heIoGQ/7i
	 DMun3lStEwpvGkcO7yR8bN59wCJTKgD0hDR7DSCrKYSLhMxlyzDlCc35sctr6xD3/a
	 ptwd4pAXD6KfKixrDSwR1gNG1EFGwQNhYDX+X0N87tyz+vbBUVdLjJfMdIJ7HclN5V
	 YB19TKg1p83TYFvl7Dqqe/0oIG/FOl1maQUFtMdXZt5JPcwcVrRXugTDoSfFBksco2
	 BoDMPGwrZAbog==
Message-ID: <sashiko-outbox-228129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] hwmon: (pmbus) Add PMBUS_FORCE_PAGE_CHANGE flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261122170949.3059743-1-fradensky@nvidia.com>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 17:16:34 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122170949.3059=
743-1-fradensky@nvidia.com
