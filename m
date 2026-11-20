Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143163;
	b=29wGR3a1vTqSAwy4uruKFFH3RsoP2xPYqLdrQ8uux7XDdtHZPunnbdTV8S9WiSctegMY
	 iA3KrYQZBQtDa+MukGGtrfYw7ifhWcWROXM/tXP2QAapxa0taZjJOQPhQyXe+tkr61I4Y
	 K6PajMWK49R39CW6/dPbdWY274Yvd9JQE0kOjdKpbWq813HY1yp1Ov+BV/3tS5DfHzRuO
	 Br3tuao53mSsi/IV76PvHy9fBIWUwS5joexCeaMmWhWTgocP19/YCd7GnRCfZU+BFhEZB
	 0j0Nts9Bndtzy/+bitATwl3D9JCBoiB3EV+gZvCLjYeQkFgujCWqBXLOT73iSmPMIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vKkAPLDCV4t/3Kt6ZQNdQ0TQVpvGZSU6e3zkiD450V8=;
	b=bODvy+xukUv7r6RgN4W4j6caqo0rYanzwVMbePVNg+Or8ziF8d5OgjdSFQNc9CY2QrPO
	 C1r8LUACuOqs8xD7WrvpSQlFUKLdroi0NTZhrtHPiqC7Jg/gTnxS+oODFA2dqCi7U0NYc
	 G9RbvjS3t5iH058ct0zTuaf6CsuUYHm7X1AgyMjFvnIKeIaJfXWUP8haa82Lrc/ytowU7
	 uznxC0n7ItN9I/YV9nqTPCCB6181t2v+xR1JHVWM5kTtNu3jme/SWDipjIYo4aA1Rmgvr
	 BT9flIDsF0nU5I4LiSUxX8KVsIkWsGDk8MPc4cpj5y+FZS/Il8q6qFwBEi4+t8beAUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZzAOq0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2E606A333
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZzAOq0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1651F000C4;
	Fri, 20 Nov 2026 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795143163;
	bh=vKkAPLDCV4t/3Kt6ZQNdQ0TQVpvGZSU6e3zkiD450V8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZzAOq0LFBPI/Hs84zPOnyqFaJ83NZrU5WObwGQdTrJApdtJn26rjuoAL5DCz90tE
	 1Qydotjm7e+jhm4PhJwkufFJ0qdLeIfRug7bEn7EvfelOKGRjDkd3ORhZG7pIGmUPy
	 WxAJoVdVWyjOtEFPWg4NypPf4nxaSbET+uqrph4v9H9w/9vSfJ0GWyipUjh/oqC6OX
	 IVMfdrJXCPsIl7uVkWNmI5r+2WhSrm5Sc9oCD2gKRbJWp+/m/N+Za4Ti0nH+i6OPvE
	 +zKOyqDNhFpzD8PyxsyHC3BOJL9NB8S6GugRasK25N6CdZjE7MuIOcZ8fTgxonFiQ7
	 78ke/DDWB9tuQ==
Message-ID: <sashiko-outbox-224385@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus) Clear only CML command and data
 faults during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Korn" <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261120024416.338876-2-akorn@google.com>
References: <20261120024416.338876-1-akorn@google.com>
 <20261120024416.338876-2-akorn@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:52:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> During driver initialization, register capability probing, and SMBALERT
> mask setup, pmbus_core and the generic pmbus driver send CLEAR_FAULTS
> (0x03) to clear any communication or command faults triggered while
> probing unsupported commands or out-of-range page/register operands.
> However, CLEAR_FAULTS unconditionally clears all latched fault status
> bits across the device, including hardware power fault registers such as
> STATUS_WORD, STATUS_VOUT, STATUS_IOUT, and STATUS_MFR_SPECIFIC. As a
> result, a BMC reboot or driver re-probe erases pre-existing voltage
> regulator fault telemetry before monitoring or diagnostic tools can
> inspect it.
>=20
> Simply omitting fault clearing during probe is not viable because
> probing unsupported commands asserts PB_CML_FAULT_INVALID_COMMAND in
> STATUS_CML (causing pmbus_check_status_cml() to fail subsequent checks
> with -EIO), and probing out-of-range PMBUS_PAGE or PMBUS_SMBALERT_MASK
> [ ... ]
> clean probing with no -EIO regressions, preservation of non-CML status
> faults across re-binds, and fallback when writing PMBUS_STATUS_CML is
> NACKed.
>=20
> Signed-off-by: Arthur Korn <akorn@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120024416.3388=
76-1-akorn@google.com?part=3D2

