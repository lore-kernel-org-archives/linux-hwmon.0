Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496938;
	b=DPkLPi6tmM/xW2TBkT0jOVWQsJjSC3GQjjK/Hqns72QLf/2t0d33/01ceE0SdjH2EPYL
	 qfX/cUXyN8BdujVYDATjotcqkhvVRG99U+20g1zKmE5sLOJjWihZvbY3WLrHlinVEIyib
	 jfvIOc44MmRFqMSP06FhiWzY5aDIwI4ct364lORrN61O0YO3LOWfYZSXzgyWMmHcCqlw2
	 3PEalgJbLON9x09yR8pCosmugkbsSdW7qE7uXcwIRyXLvaCK0We10KtnqiDUEjzDvCJry
	 PeXpMiUW3pV51P3i3RElymiddFb+tzbnMpjlZZyxWZ0feR3E3jpTWdVFzkGB6xN7lGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+5efyEzPAwYQIUnBQjmBpTH2qNTR95GLqe42sQTQC94=;
	b=XhI7NWO29C4l/KMQdiC7W5cfJ36aLxwYcxQosLl8yVdGtOsOBZ6RWF+3D+0mOREUkIXc
	 UqTnz2qzzN7vG+BVOrz0mNmb27d8QL+Whso++tCpggfqyxyVS5OztN2YhkBOlW7nljCo2
	 257vXJPZOn9n3vtur5qv1jLyw3o7u+saDC7LIVvn8XNqabhLZZPtFbbKnPGvrMJb0Cs++
	 NOBsv2Lf93l5oZdPA+HlM0zv3OMy+vn+FZ6vKVlMMaAlJycbuWuRtfXEFqHwMTqp8NEKF
	 CTGMHkOfuIYfzz9o80vx4kOKP2lhPtJ3A8Lzhb8MBKfDGAqolU/o8f046ovR1GtKAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhvjtM6u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE2606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhvjtM6u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F1F1F000C4;
	Tue, 20 Oct 2026 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792496938;
	bh=+5efyEzPAwYQIUnBQjmBpTH2qNTR95GLqe42sQTQC94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HhvjtM6uTjdDGNeoiukzCL0TfRbO7QFva4pW9F977K9zUgmN1wvd+ECYwpibIF8Nz
	 YNRJMXbcGvp/u6cwl2MspdFgIz7OzivS6geEPToNS9HwGV2sl5XNsUo7UJLiEF97ft
	 fPEY9RQ91qRj2biMEEaLp0GwyuUZzo8hf4oTZ3OMmy3bL91ZJpHaNZ2S4vBgS8Soce
	 nVk2q8J2fqIi/38q8l0CnjayaZWEP34nZamIWns65qf4KGYpocSCMB7lBdWgZxH+We
	 1f/P/P5tBXmPn0kBumlKWazu0xKsslpKgOI/6l+cOq965F9bBrK8XipnReR/g5zl5x
	 V58+ak/YC1wbA==
Message-ID: <sashiko-outbox-178905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc2978: Add support for LT7175
 and LT7176P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-1-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-1-86b9b728b95d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 11:48:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document the compatible strings for the LT7175/LT7175-1 and
> LT7176P/LT7176P-1 PMBus buck regulators newly supported by the
> ltc2978 driver.
>=20
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-upstream-l=
t7175-lt7176p-v1-0-86b9b728b95d@analog.com?part=3D1

