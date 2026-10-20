Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486721;
	b=WMtmczxd/P5juVduHKISxMAFaBXDMU46rFG1wRT7xAFpAtIN0Awz/l9nvcTL+WEM3byW
	 UPVNOcDnuNYLVXQVcaEGb20ipaAdTrp47FGoe+7F/4vllm9yANYV0lnVO7cLp5G0Lk7uK
	 NNUdMwjS8E9Jz+BHfjGaQ0Zoa++uvY7MxToxt+8WQh1w8WUdGkb8ciTnA67yKcYF45se+
	 VfyBRtr02Cswek8gxeAEn70oAQ4WTY+M5E1nbnFA7m/aajaeCU/VT97Pnmvt4E9AEsp3X
	 YZPKKqUA5B7C5nI5jp0Ogrp6P44Ra/ia93kKLM9vVLYHiIyYPXsbTeel1ZWKauehFDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YBDaKNMNkmx7NipBOCfYsVUKGDSXqUqcIl9ykeOKmq0=;
	b=GJjX5GnOHbAVbr1ma4HCrR1ken7vrRsoTb28NLlwKuUweJx+WppKWYW1AbnfcvwmlVEN
	 yOBi+qTpU7JN5tRpl9BpEGaMAhcav0aXnM6n5m3nktezwn+ImRT/Hsc52rk954Y+ZynJQ
	 zHTBlDCBixmBUV0rKOf+RJx/+dnytGAmvaK2646zPrCEXoXyItgmM7lAzWJdnAirbTxuQ
	 VB+R5bILCv5TWWBu/jYiWF4VAR0/eqoKWvFvMiZ9HgJQ7Qkdy2yp5a4kW0DQc76WLP78F
	 RvniA6cl8isSiFI3gf7yI4Xz7C9M8yCpc44XKFpgCFl/GE/bxDV4151gbCvzN8Y9iRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ku9CZ6E+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3D606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ku9CZ6E+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC861F000C4;
	Tue, 20 Oct 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486720;
	bh=YBDaKNMNkmx7NipBOCfYsVUKGDSXqUqcIl9ykeOKmq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ku9CZ6E+8VsxRwV1yY2vtONirH+DHu91ijrRNbvMNB/XFZUBaERyuZlPdvEUIgcyn
	 K82Vc9vRWOU7L6Wc5Bt7hWGkQvxTDqV3brC5Y14RpH46oAGLq4wf35feXFtL0ntHxX
	 UroDBxUYe6Tw1WNcBcdz97PuStKX2LLbG2gtL5gLvVwNI1skLfMzBaebboLviO3f5w
	 ymWXB1hoDc/SspImDAVkFIBzyRdC62slOxs+5Nn7Fo3Z1yGj5b2BLoPR/mOoQ2lxLh
	 0TyizmmcT31TzSaYAHjMqP7o4jdLmCJIwcwvXh6qHaFwInzHrexJ7TD/5amdFzn0wh
	 8Ga60oTGb+YLA==
Message-ID: <sashiko-outbox-178666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-4-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-4-3396c3a08251@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:58:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
>=20
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
>=20
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
>=20
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND; only its over-voltage
> fault is an analog comparison at the feedback pin. The documentation
> describes both.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v2-0-3396c3a08251@nexthop.ai?part=3D4

