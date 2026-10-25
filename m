Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902167;
	b=WlfHhuOhziP4ngR6syIOwjJ1bfYb2r7YJfWJdgEhkdAcAM8hCyrAa7CDSPJQw1iqc+EC
	 +Kj4cTd2IeyUqEytq/0l2/OA5sMp7wHjFBySc8A+a5jtX0R9GRHJt+gmSMFc5KbB3ubMP
	 TzACakiFo9Bw63ed1ael7HuVVCL6vApZayteWAmoAtZAaGPQwD6Cv4TCTZ8pBtcevmeAX
	 bPMqdCZ7XYnAROx6m+TrplxOVzXmK62XcFytuF/033x35zeIY4CO7Kxk/b8p24TsqVqEP
	 7tSMpavtwhlomNi7FKed7xozscInkj5356tiHK1FvTspz7vyy18wq+9G8VJGH8AlOsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A9nt9vq10sWhS1iObAThLSb2o1Zg7PGhaVxpqc1+IGo=;
	b=IlVgvvhCJaYRmPt1BDEuQiJrQAkWPOzemFd7UXvxlp9KAQc8KeFll/N8FTqwBmL8sb8n
	 ijq3gTTEbJzIUk9kMDW4p1YA1JIh0w4wg5wpCMquDwl7GGWZx9rCxgzigKDcXwn9m6nVT
	 /AF4yeElcqLzdICucjBRgCtLrMgB42YYGKg1O5pc7xx6ECe+B36K2nEILnQ8v3r/Mq0We
	 +yDxmCqFXpqnCps36hhuHKDM7IToSFHK/F5xUVubE33Lf7RHc4OzvPeLPPTtK8f62LNUl
	 XaOTWzjkn0XGf/neEo7Jn3Qh6jnqYT28ZnLhFs3aoKBtBkDjocvqfU0vG3H3+9Hc8mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJUJzCm2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AD5606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJUJzCm2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DAB1F01825;
	Sun, 25 Oct 2026 04:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792902167;
	bh=A9nt9vq10sWhS1iObAThLSb2o1Zg7PGhaVxpqc1+IGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJUJzCm2AsFh65slz9uVX0Ndb7bH1RQB95Af8kSHzn9i19ODIshVPMcIyKhS05VLu
	 unO/ccuRM9IVkoMUcfcU6P0otVgVQXgLqnNv58PnhwZZoLEtAnDSweV66AT/R6ARGj
	 MyQjyTLpiLIUSOBRssvRU04C8IOYybuTgF8P2euqli2rrO2VHEWF8+dER0PHFSJu6L
	 /ye4f+jVAGwrb4d2xy11d8njEdnO2JOA7NDG9ah+vmPHkp0wX5P8qqnLJ2VufxavXy
	 ftu0a5Ss92EOcViiFtLIf/1FWlse2401LocOgw9s7gWoLOcj9ZjmbThKs5sBewSN+7
	 2D5Et0kjks5+g==
Message-ID: <sashiko-outbox-184062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 26/31] hwmon: (pmbus/q54sj108a2) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-26-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-26-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:22:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data() in
> q54sj108a2_debugfs_read() and q54sj108a2_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D26

