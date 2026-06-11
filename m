Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD832248A8
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157304; cv=none; b=XVSxoq8Ootlw25CPuRGQmNf/ExNoz5H0jjAiQZyJClPbzRBvvyoezyvOMlleW4stRG+aJVssIDBM3lFjQtW8hvT5RDKEzMkn7byQ2RFwg5tPG128d9kvjmjkV5+qfIpZ0NXGP6VMLgLNxREk9pV/KVpKDt+TPre8jMTgYjGSNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157304; c=relaxed/simple;
	bh=qnn7zj9qcWvOsX7tT9BOUqk5PpChpQ99NZvdjwgpMRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZ5Aq8park6sRsZ05zqGELKqYY/SGNWwANn0Fk6KXuVtOo3WqJs+aL9OifT+T5+3iIipRUmzauHoFCFyJ9l9NIeDLEzL6NPRLhgOsnxYn4iQXNoAwWbbZVeecytLo/u+Dp9IhpAz+KIWZGNHmF7Mtn5x2do7aVnzxsSFro37uS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmMb5LQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmMb5LQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A331F00893;
	Thu, 11 Jun 2026 05:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157303;
	bh=qnn7zj9qcWvOsX7tT9BOUqk5PpChpQ99NZvdjwgpMRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmMb5LQqE1U30MjjOppG+Pf+XDkHFudOoVvwt5fGTX9sBbvvcf2qg6rZB3Gcs3h4U
	 v2kKqlTXaOFdLbBhsmOn8qEL+4I+U6p+Vyozi15VZZGpXoFGX7l8HnQb+JqfnklFcY
	 RxwXHOwnbCEj1yMOTMuUsbRhB/gSnPQnYlgUW/RfOV5HUzBkcusl0IVO1xqD7NLbW4
	 HBmS5scKr3nl8O5dtFRZwU17oBy6zTJqSGO9GLIgoY3J+5gz/zWzpuA1CvRJtKdm2c
	 1IhRdrBVMOuI2QxTzAo5nR9ahTi8GVIiQwLIQTDk+9jFcmNWt/pkbCjizvedCumsrs
	 T4WYU4LqsZmkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
References: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:55:02 +0000
Message-Id: <20260611055503.34A331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Swap the high setting and low setting coefficients in the lm25066_coeff
> table for LM5064, LM5066, and LM5066i. The coefficients were previously
> mapped incorrectly, resulting in inverted current and power scaling.
>=20
> Additionally, dynamically assign the exponent (R) registers inside the
> probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
> exponent is applied (e.g., for LM25056, high setting power exponent
> is -4, but low setting power exponent is -3).
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-lm25066-dr=
iver-fix-v3-1-9d7d4b4e253d@gmail.com?part=3D1

