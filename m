Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242239;
	b=F1OpTPnPN8RIVXBPBeMpcu8M5QZc/UiMEPPTaqrRLlbwBD7x1fnBP+FfSuzOTq/shCCK
	 01Br7amLvnB373l17rrGOr6hpcluWfnB4fMNxKWtcm0L5S+vZ8FNDT7EZzQmDKrlKGPtz
	 5HoKd00oiLmjqjfT5KjH/s29LaNTaQBPJjPU1/ikDo5QmSYbzwZiP9f4CxrcMtfutPrE7
	 WgvIboOO1rSQj8yJDkFw0ciK7d8WOWI4qq5LorNKFxBfu9nJfdFFrKjabOuFDgDLXy+a3
	 S/dY78Y33xOPY8LQIMhQXXUP5msVBKNdlmgn1VzuTBTtmv5G+Q7XP6KfS3i2/BqyNYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yB6YyF5dowl3JVWeooO4KqCpldD2+uqDaDflU32NvLI=;
	b=QoSdNgfwnPcnFCp81hfNaekyrgG33TXTgT6o0a/y/epil1jbe+TDPS6ClX+W5/k2PK2e
	 1+Y0ZspPcGa0N27MtuJU0bZfMDAKVEoEj3Nj1iNLUFNVOAoyfF1PhMs6IDatrBaWLOz7/
	 YPsodjahaAKsFAcSHyRlCHA83EXv30csLtG0egvjUCyZtnbwacGyhtzagSIp2BkHFRwKB
	 qvDjdHyrwZU6Q34eaW/NlhSqB54dfxXR0VKZPbBLUMpkg3xfMJPT1cIikwhW0MvkTMy5r
	 ovCAlwl48UeTI7ODFe5ru6X3v2YRGY3tsC8KTsR70J4EiGYY1J8w01zC70+rGjWI+0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eESC1nrN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FE606C72D
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eESC1nrN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6181F0089F;
	Mon,  9 Nov 2026 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242238;
	bh=yB6YyF5dowl3JVWeooO4KqCpldD2+uqDaDflU32NvLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eESC1nrN4IpiHbMfkQScnVKnkf4TUL7tujsVE+4nJOKBPDsHgaufevdql1EnAGxVE
	 iPmHMnGdJVg4wJcJHkuA3O8F3murFMcssz42vytjQcRvJKxP5uPmE38g6WV2TASMxE
	 uP4Evsw/IF806r4yVmdm8v4sMC0XhXnD49nvBNqZ778tbMtXrfWmYmTZ9fiAQMTIEQ
	 WtT0OmWGMrKq7cNilWfl32VEPl3dK7ZGCsiZ3q3WKA4XVSJuvS3CD6St0gU9iWLrvR
	 GzOhFs7wPiNmK/AwNKDoFJWtHc3gIDUxXlxhDQrNrhg7kHQpKAxqElpyHHaz+L9MX0
	 V2YULJ/Mggc2A==
Message-ID: <sashiko-outbox-205240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Restore manual fan control after
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109163328.61787-1-tomasz@bojanowski.me>
References: <20261109163328.61787-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 16:37:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On MSI boards with NCT6687D-R, the BIOS restores automatic fan control
> on resume from S3. The manual mode and duty cycle set through
> pwmN_enable and pwmN are lost, and pwmN_enable reports 2.
>=20
> Remember the channels switched to manual mode through sysfs and their
> duty cycle, and restore them on resume if the EC switched them back to
> automatic mode. Other channels are not touched.
>=20
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61): with pwm16_enable set
> to 1 and pwm16 to 153, pwm16_enable reads 2 after resume from S3 without
> this patch. With this patch it stays 1 and the fan returns to the manual
> duty cycle.
>=20
> Fixes: 5410a1257e26 ("hwmon: (nct6683) Add fan control support for MSI bo=
ards with NCT6687D-R")
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109163328.6178=
7-1-tomasz@bojanowski.me?part=3D1

